// Package sudomsg is the message a remote sudo sends the forwarded agent,
// built by quoin-sudo's gate and read by quoin-signer, and the answer the
// signer sends back, signed together with the message.
//
// It carries what the question is made of, the command, who runs it, the
// danger and environment lines and the remote process chain, so the signer
// shows a remote sudo as the host would show a local one, from bytes the
// gate read as root and the agent signs whole.
//
// After the magic, the nonce and the host keys comes one string of named
// fields, each a key and a value, in ascending order of name. A field may
// be added without a new magic: a reader drops one it does not know, unless
// its key is marked critical with a "!", when it refuses the whole message
// naming it. Every field this package knows is critical, since each is
// part of what is approved; only a field a signer could leave unshown
// without changing what the person approves may go unmarked.
//
// An unmarked field is no downgrade: the gate alone writes the message and
// checks the signature over its own bytes, so nothing between can strip a
// field, and a signer that drops one asks what it asked before the field
// was made. A field must be critical when anything else is left out or
// relaxed because it is there, as the chain, danger and env replaced the
// level and reasons the first layout carried.
//
// The fields are one string so that a signer from before them, which reads
// the magic as its own and that string as the user, finds nothing after it
// and refuses the message rather than asking something else.
//
// The message goes in the agent extension Extension. The signer answers
// with an Answer, its magic and then fields by the same rules, and signs
// Signed: the message verbatim, then the answer. So the signed bytes start
// with the message's magic, which the signer never signs on a plain sign.
// New answers are new fields, never a new magic.
package sudomsg

import (
	"bytes"
	"encoding/binary"
	"errors"
	"fmt"
	"slices"
	"strings"

	"github.com/danielbodart/quoin/peer"
	"golang.org/x/crypto/ssh"
)

const (
	Magic     = "quoin-sudo-v1"
	NonceSize = 32
	// Extension is the agent extension a remote sudo is asked through.
	Extension = "quoin-sudo@quoin"
	// MaxSize is OpenSSH's agent message limit.
	MaxSize = 256 << 10
	// MaxFields is the most fields a message has, known or not, and
	// MaxKey the longest key, its mark included.
	MaxFields = 32
	MaxKey    = 64
	// Critical marks a key as one a reader that does not know it must
	// refuse.
	Critical = "!"
	// AnswerMagic starts an answer.
	AnswerMagic = "quoin-sudo-answer-v1"
	// MaxHops is the most hops an answer names, the signer's most session
	// binds.
	MaxHops = 16
)

// Room is the most bytes a message may take in an extension request whose
// key blob is longest bytes: MaxSize less the request's type, the
// extension's name, the key blob and the message's length.
func Room(longest int) int {
	return MaxSize - (1 + 4 + len(Extension) + 4 + longest + 4)
}

// The fields, by name. Each is critical; chain, cut, danger, env, rule and
// window-key are left out when empty.
const (
	FieldArgv      = "argv"       // the command, a list
	FieldChain     = "chain"      // the chain, leaf first, a list of peer records
	FieldCut       = "cut"        // empty: command lines were left out of the chain
	FieldCwd       = "cwd"        // where it runs
	FieldDanger    = "danger"     // the danger lines, a list
	FieldDecision  = "decision"   // how it is asked: "dialog" or "question"
	FieldEnv       = "env"        // the variables outside the allowlist, a list
	FieldPresence  = "presence"   // "required" or "none"
	FieldRule      = "rule"       // the rule that asked: its pattern, then its source
	FieldRunAs     = "runas"      // as whom it runs
	FieldUser      = "user"       // who runs it
	FieldWindow    = "window"     // the most seconds of window, a uint32; 0 is none
	FieldWindowKey = "window-key" // the key blob whose window made it a question
)

// The answer's fields, each critical and always there: decision, presence
// and window, by the names above, and hops.
const (
	FieldHops = "hops" // the binds, a list of a host key blob and a forwarded byte
)

// Decision and Presence are the values of the message's decision and
// presence fields; Allow, Refuse, Verified and PresenceNone the answer's.
const (
	Dialog       = "dialog"   // a presence check, which may open a window
	Question     = "question" // Allow or Refuse
	Required     = "required"
	PresenceNone = "none"
	Allow        = "allow"
	Refuse       = "refuse"
	Verified     = "verified"
)

var known = map[string]bool{
	FieldArgv: true, FieldChain: true, FieldCut: true, FieldCwd: true,
	FieldDanger: true, FieldDecision: true, FieldEnv: true, FieldPresence: true,
	FieldRule: true, FieldRunAs: true, FieldUser: true, FieldWindow: true,
	FieldWindowKey: true,
}

var knownAnswer = map[string]bool{
	FieldDecision: true, FieldHops: true, FieldPresence: true, FieldWindow: true,
}

var (
	prefix       = lengthPrefixed(Magic)
	answerPrefix = lengthPrefixed(AnswerMagic)
)

func lengthPrefixed(s string) string {
	return string(binary.BigEndian.AppendUint32(nil, uint32(len(s)))) + s
}

type Message struct {
	Nonce    []byte
	HostKeys [][]byte
	User     string
	RunAs    string
	Cwd      string
	Argv     []string
	// Danger are the danger lines, Env the variables outside the
	// allowlist.
	Danger []string
	Env    []string
	// Truncated is whether command lines were left out of the chain to
	// fit; Links is the chain, leaf first, at most peer.MaxLinks. A link's
	// Sid and Cgroup are not carried.
	Truncated bool
	Links     []peer.Link
	// Decision is Dialog, a presence check that may open a window, or
	// Question, Allow or Refuse with none. Presence is Required when the
	// answer must say a person was checked, else PresenceNone.
	Decision string
	Presence string
	// Rule is the rule that asked; nil is none.
	Rule *Rule
	// Window is the most seconds the answer may open a window for; 0 opens
	// none.
	Window uint32
	// WindowKey is the key blob of the window that made it a question,
	// the one key whose answer counts; nil is none.
	WindowKey []byte
	// Ignored names the unmarked fields Parse did not know and dropped.
	// Marshal writes none.
	Ignored []string
}

// Rule is a rule that asked: its pattern and where it came from, as the
// question says it.
type Rule struct {
	Pattern, Source string
}

var (
	errMalformed       = errors.New("not a well-formed quoin-sudo message")
	errMalformedAnswer = errors.New("not a well-formed quoin-sudo answer")
	ErrTooLong         = fmt.Errorf("over the agent's limit of %d bytes", MaxSize)
)

// CriticalError is a message with a field marked critical that this reader
// does not know, which it must not ask without; or, with Answer, such an
// answer, which it must not take.
type CriticalError struct {
	Key    string
	Answer bool
}

func (e *CriticalError) Error() string {
	if e.Answer {
		return fmt.Sprintf("a quoin-sudo answer with a critical field this reader does not know: %q", e.Key)
	}
	return fmt.Sprintf("a quoin-sudo message with a critical field this signer does not know: %q", e.Key)
}

// HasMagic is whether b starts with the length-prefixed magic, as no
// userauth request or SSHSIG blob does.
func HasMagic(b []byte) bool {
	return bytes.HasPrefix(b, []byte(prefix))
}

func (m *Message) Marshal() ([]byte, error) {
	if len(m.Nonce) != NonceSize {
		return nil, fmt.Errorf("a nonce of %d bytes", len(m.Nonce))
	}
	if len(m.HostKeys) == 0 {
		return nil, errors.New("no host keys")
	}
	if len(m.Argv) == 0 {
		return nil, errors.New("no command")
	}
	if err := validLinks(m.Links); err != nil {
		return nil, err
	}
	if m.Decision != Dialog && m.Decision != Question {
		return nil, fmt.Errorf("a decision of %q", m.Decision)
	}
	if m.Presence != Required && m.Presence != PresenceNone {
		return nil, fmt.Errorf("a presence of %q", m.Presence)
	}
	if m.WindowKey != nil {
		if _, err := ssh.ParsePublicKey(m.WindowKey); err != nil {
			return nil, fmt.Errorf("a window key: %v", err)
		}
	}
	var f []byte
	field := func(name string, v []byte) {
		f = appendString(f, []byte(Critical+name))
		f = appendString(f, v)
	}
	field(FieldArgv, appendList(nil, byteSlices(m.Argv)))
	if len(m.Links) > 0 {
		recs := make([][]byte, len(m.Links))
		for i, l := range m.Links {
			recs[i] = l.AppendRecord(nil)
		}
		field(FieldChain, appendList(nil, recs))
	}
	if m.Truncated {
		field(FieldCut, nil)
	}
	field(FieldCwd, []byte(m.Cwd))
	if len(m.Danger) > 0 {
		field(FieldDanger, appendList(nil, byteSlices(m.Danger)))
	}
	field(FieldDecision, []byte(m.Decision))
	if len(m.Env) > 0 {
		field(FieldEnv, appendList(nil, byteSlices(m.Env)))
	}
	field(FieldPresence, []byte(m.Presence))
	if m.Rule != nil {
		field(FieldRule, appendString(appendString(nil, []byte(m.Rule.Pattern)), []byte(m.Rule.Source)))
	}
	field(FieldRunAs, []byte(m.RunAs))
	field(FieldUser, []byte(m.User))
	field(FieldWindow, binary.BigEndian.AppendUint32(nil, m.Window))
	if m.WindowKey != nil {
		field(FieldWindowKey, m.WindowKey)
	}
	b := []byte(prefix)
	b = appendString(b, m.Nonce)
	b = appendList(b, m.HostKeys)
	b = appendString(b, f)
	if len(b) > MaxSize {
		return nil, ErrTooLong
	}
	return b, nil
}

// validLinks refuses a chain Parse would: more than peer.MaxLinks, or a
// link whose comm or command line is past its limit, or whose command line
// has a NUL inside an argument, which its record could not keep apart.
func validLinks(links []peer.Link) error {
	if len(links) > peer.MaxLinks {
		return fmt.Errorf("%d links", len(links))
	}
	for _, l := range links {
		n := max(len(l.Cmdline)-1, 0)
		for _, a := range l.Cmdline {
			n += len(a)
			if strings.IndexByte(a, 0) >= 0 {
				return fmt.Errorf("pid %d: a NUL in an argument", l.Pid)
			}
		}
		if len(l.Comm) > peer.MaxComm || n > peer.MaxCmdline {
			return fmt.Errorf("pid %d: a comm of %d bytes or a cmdline of %d", l.Pid, len(l.Comm), n)
		}
	}
	return nil
}

// MarshalWithin is Marshal held to limit bytes, and never more than
// MaxSize. A message over it has its chain's command lines left out one at
// a time, from the top of the chain down, each blanked in m and Truncated
// set, until it fits; no other field is ever touched. What still
// does not fit with every command line out is ErrTooLong.
func (m *Message) MarshalWithin(limit int) ([]byte, error) {
	limit = min(limit, MaxSize)
	i := len(m.Links) - 1
	for {
		b, err := m.Marshal()
		if err != nil && !errors.Is(err, ErrTooLong) {
			return nil, err
		}
		if err == nil && len(b) <= limit {
			return b, nil
		}
		for i >= 0 && len(m.Links[i].Cmdline) == 0 {
			i--
		}
		if i < 0 {
			return nil, ErrTooLong
		}
		m.Links[i].Cmdline = nil
		m.Truncated = true
	}
}

// Parse reads b strictly: the magic, a nonce of exactly NonceSize bytes,
// at least one host key and each a public key blob, then the fields, with
// nothing after them and no more than MaxSize in all.
//
// The fields are at most MaxFields, each key at most MaxKey bytes, an
// optional mark and then a name of lower case letters, digits and hyphens,
// in strictly ascending order of name. A known field must be marked and
// its value read as its kind, with nothing left over; argv, cwd, decision,
// presence, runas, user and window must be there. An unknown field marked
// critical is a *CriticalError naming it; one unmarked is dropped and named
// in Ignored.
func Parse(b []byte) (*Message, error) {
	if len(b) > MaxSize || !HasMagic(b) {
		return nil, errMalformed
	}
	r := &reader{b: b[len(prefix):]}
	m := &Message{Nonce: r.bytes(), HostKeys: r.list()}
	f := r.bytes()
	if r.err != nil || len(r.b) != 0 {
		return nil, errMalformed
	}
	if len(m.Nonce) != NonceSize || len(m.HostKeys) == 0 {
		return nil, errMalformed
	}
	for _, k := range m.HostKeys {
		if _, err := ssh.ParsePublicKey(k); err != nil {
			return nil, fmt.Errorf("%w: a host key: %v", errMalformed, err)
		}
	}
	if err := m.readFields(f); err != nil {
		return nil, err
	}
	return m, nil
}

func (m *Message) readFields(f []byte) error {
	ignored, err := readFields(f, errMalformed, known, m.setField,
		FieldArgv, FieldCwd, FieldDecision, FieldPresence, FieldRunAs, FieldUser, FieldWindow)
	m.Ignored = ignored
	return err
}

// readFields reads f's fields by the rules Parse gives, each known one by
// set, and refuses f without every one of required, wrapping malformed. It
// returns the unmarked fields it dropped.
func readFields(f []byte, malformed error, known map[string]bool, set func(name string, value []byte) error, required ...string) ([]string, error) {
	r := &reader{b: f}
	seen := map[string]bool{}
	var last string
	var ignored []string
	var critical *CriticalError
	for n := 0; len(r.b) > 0; n++ {
		key, value := string(r.bytes()), r.bytes()
		if r.err != nil || n == MaxFields {
			return nil, malformed
		}
		name, marked := strings.CutPrefix(key, Critical)
		if !validName(name) || len(key) > MaxKey || (n > 0 && name <= last) {
			return nil, fmt.Errorf("%w: field %q", malformed, key)
		}
		last = name
		if !known[name] {
			if !marked {
				ignored = append(ignored, name)
			} else if critical == nil {
				critical = &CriticalError{Key: name}
			}
			continue
		}
		if !marked {
			return nil, fmt.Errorf("%w: field %q is critical", malformed, name)
		}
		seen[name] = true
		if err := set(name, value); err != nil {
			return nil, fmt.Errorf("%w: field %q", malformed, name)
		}
	}
	if critical != nil {
		return nil, critical
	}
	for _, name := range required {
		if !seen[name] {
			return nil, fmt.Errorf("%w: no field %q", malformed, name)
		}
	}
	return ignored, nil
}

func validName(s string) bool {
	if s == "" {
		return false
	}
	for _, c := range []byte(s) {
		if !('a' <= c && c <= 'z' || '0' <= c && c <= '9' || c == '-') {
			return false
		}
	}
	return true
}

// setField reads a known field's value into m: a list with at least one
// entry for argv, chain, danger and env, nothing for cut, one of its values
// for decision and presence, two strings for rule, a uint32 for window, a
// public key blob for window-key, any bytes for the rest.
func (m *Message) setField(name string, value []byte) error {
	r := &reader{b: value}
	switch name {
	case FieldArgv, FieldDanger, FieldEnv:
		l := r.strings()
		if len(l) == 0 {
			return errMalformed
		}
		switch name {
		case FieldArgv:
			m.Argv = l
		case FieldDanger:
			m.Danger = l
		default:
			m.Env = l
		}
	case FieldChain:
		recs := r.list()
		if r.err != nil || len(recs) == 0 || len(recs) > peer.MaxLinks {
			return errMalformed
		}
		for _, rec := range recs {
			l, err := peer.ParseRecord(rec)
			if err != nil {
				return err
			}
			m.Links = append(m.Links, l)
		}
	case FieldCut:
		m.Truncated = true
	case FieldCwd:
		m.Cwd, r.b = string(value), nil
	case FieldRunAs:
		m.RunAs, r.b = string(value), nil
	case FieldUser:
		m.User, r.b = string(value), nil
	case FieldDecision:
		m.Decision, r.b = string(value), nil
		if m.Decision != Dialog && m.Decision != Question {
			return errMalformed
		}
	case FieldPresence:
		m.Presence, r.b = string(value), nil
		if m.Presence != Required && m.Presence != PresenceNone {
			return errMalformed
		}
	case FieldRule:
		m.Rule = &Rule{Pattern: string(r.bytes()), Source: string(r.bytes())}
	case FieldWindow:
		m.Window = r.uint32()
	case FieldWindowKey:
		if _, err := ssh.ParsePublicKey(value); err != nil {
			return err
		}
		m.WindowKey, r.b = value, nil
	}
	if r.err != nil || len(r.b) != 0 {
		return errMalformed
	}
	return nil
}

// Answer is what the signer answers a message with.
type Answer struct {
	// Decision is Allow or Refuse.
	Decision string
	// Hops are the connection's session binds, the first from the
	// signer's machine; none is a connection with no bind.
	Hops []Hop
	// Presence is Verified when the signer checked a person, else
	// PresenceNone.
	Presence string
	// Window is the seconds of window the person chose; 0 is none.
	Window uint32
	// Ignored names the unmarked fields ParseAnswer did not know and
	// dropped. Marshal writes none.
	Ignored []string
}

// Hop is a session bind: the host key it names and whether it forwards.
type Hop struct {
	HostKey   []byte
	Forwarded bool
}

// Marshal is the answer's bytes: the magic, then its fields, each critical,
// in ascending order of name, each hop a string of its host key blob and
// a forwarded byte, 0 or 1. It refuses what ParseAnswer would.
func (a *Answer) Marshal() ([]byte, error) {
	if a.Decision != Allow && a.Decision != Refuse {
		return nil, fmt.Errorf("a decision of %q", a.Decision)
	}
	if a.Presence != Verified && a.Presence != PresenceNone {
		return nil, fmt.Errorf("a presence of %q", a.Presence)
	}
	if len(a.Hops) > MaxHops {
		return nil, fmt.Errorf("%d hops", len(a.Hops))
	}
	hops := make([][]byte, len(a.Hops))
	for i, h := range a.Hops {
		if len(h.HostKey) == 0 {
			return nil, fmt.Errorf("hop %d: no host key", i)
		}
		fwd := byte(0)
		if h.Forwarded {
			fwd = 1
		}
		hops[i] = append(appendString(nil, h.HostKey), fwd)
	}
	var f []byte
	field := func(name string, v []byte) {
		f = appendString(f, []byte(Critical+name))
		f = appendString(f, v)
	}
	field(FieldDecision, []byte(a.Decision))
	field(FieldHops, appendList(nil, hops))
	field(FieldPresence, []byte(a.Presence))
	field(FieldWindow, binary.BigEndian.AppendUint32(nil, a.Window))
	b := appendString([]byte(answerPrefix), f)
	if len(b) > MaxSize {
		return nil, ErrTooLong
	}
	return b, nil
}

// ParseAnswer reads b strictly: the answer's magic, then one string of
// fields by Parse's rules, with nothing after it and no more than MaxSize
// in all. Decision, hops, presence and window must be there, each marked
// and read as its kind: decision Allow or Refuse, presence Verified or
// PresenceNone, window a uint32, hops at most MaxHops, each a host key blob
// that is not empty and a forwarded byte, 0 or 1, with nothing after.
func ParseAnswer(b []byte) (*Answer, error) {
	if len(b) > MaxSize || !bytes.HasPrefix(b, []byte(answerPrefix)) {
		return nil, errMalformedAnswer
	}
	r := &reader{b: b[len(answerPrefix):]}
	f := r.bytes()
	if r.err != nil || len(r.b) != 0 {
		return nil, errMalformedAnswer
	}
	a := &Answer{}
	ignored, err := readFields(f, errMalformedAnswer, knownAnswer, a.setField, FieldDecision, FieldHops, FieldPresence, FieldWindow)
	if c := (*CriticalError)(nil); errors.As(err, &c) {
		c.Answer = true
	}
	if err != nil {
		return nil, err
	}
	a.Ignored = ignored
	return a, nil
}

func (a *Answer) setField(name string, value []byte) error {
	r := &reader{b: value}
	switch name {
	case FieldDecision:
		a.Decision, r.b = string(value), nil
		if a.Decision != Allow && a.Decision != Refuse {
			return errMalformedAnswer
		}
	case FieldPresence:
		a.Presence, r.b = string(value), nil
		if a.Presence != Verified && a.Presence != PresenceNone {
			return errMalformedAnswer
		}
	case FieldWindow:
		a.Window = r.uint32()
	case FieldHops:
		n := r.uint32()
		if n > MaxHops {
			return errMalformedAnswer
		}
		for range n {
			h := &reader{b: r.bytes()}
			key := h.bytes()
			if len(h.b) != 1 || h.b[0] > 1 || len(key) == 0 || h.err != nil {
				return errMalformedAnswer
			}
			a.Hops = append(a.Hops, Hop{HostKey: key, Forwarded: h.b[0] == 1})
		}
	}
	if r.err != nil || len(r.b) != 0 {
		return errMalformedAnswer
	}
	return nil
}

// Signed is the bytes the signer signs and the gate verifies: message
// verbatim, starting with its magic, then answer.
func Signed(message, answer []byte) []byte {
	return slices.Concat(message, answer)
}

// Check is nil when a, signed with key, answers m as the gate takes it:
// key is m's WindowKey when it has one; the decision is Allow; presence is
// Verified when m requires it; the window is at most m's, and above 0 only
// for a dialog with presence verified; and the last hop, when there is
// one, names one of m's host keys. The signature over Signed, and key
// being a listed key, are the caller's to check.
func (m *Message) Check(a *Answer, key []byte) error {
	switch {
	case m.WindowKey != nil && !bytes.Equal(key, m.WindowKey):
		return errors.New("signed with a key that is not the window's")
	case a.Decision != Allow:
		return errors.New("refused")
	case m.Presence == Required && a.Presence != Verified:
		return errors.New("presence was required and not verified")
	case a.Window > m.Window:
		return fmt.Errorf("a window of %ds, over the %ds offered", a.Window, m.Window)
	case a.Window > 0 && (m.Decision != Dialog || a.Presence != Verified):
		return errors.New("a window with no dialog or no presence verified")
	case len(a.Hops) > 0 && !slices.ContainsFunc(m.HostKeys, func(k []byte) bool { return bytes.Equal(k, a.Hops[len(a.Hops)-1].HostKey) }):
		return errors.New("the last hop is not this host")
	}
	return nil
}

func byteSlices(ss []string) [][]byte {
	b := make([][]byte, len(ss))
	for i, s := range ss {
		b[i] = []byte(s)
	}
	return b
}

func appendString(b, s []byte) []byte {
	b = binary.BigEndian.AppendUint32(b, uint32(len(s)))
	return append(b, s...)
}

func appendList(b []byte, l [][]byte) []byte {
	b = binary.BigEndian.AppendUint32(b, uint32(len(l)))
	for _, s := range l {
		b = appendString(b, s)
	}
	return b
}

type reader struct {
	b   []byte
	err error
}

func (r *reader) uint32() uint32 {
	if r.err != nil || len(r.b) < 4 {
		r.err = errMalformed
		return 0
	}
	n := binary.BigEndian.Uint32(r.b)
	r.b = r.b[4:]
	return n
}

func (r *reader) bytes() []byte {
	n := r.uint32()
	if r.err != nil || uint64(n) > uint64(len(r.b)) {
		r.err = errMalformed
		return nil
	}
	s := r.b[:n:n]
	r.b = r.b[n:]
	return s
}

func (r *reader) list() [][]byte {
	n := r.uint32()
	var l [][]byte
	for i := uint32(0); i < n && r.err == nil; i++ {
		l = append(l, r.bytes())
	}
	return l
}

func (r *reader) strings() []string {
	var ss []string
	for _, b := range r.list() {
		ss = append(ss, string(b))
	}
	return ss
}
