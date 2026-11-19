// Package sudomsg is the message a remote sudo asks the forwarded agent to
// sign: built by quoin-sudo's gate and read by quoin-signer.
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
package sudomsg

import (
	"bytes"
	"encoding/binary"
	"errors"
	"fmt"
	"strings"

	"github.com/danielbodart/quoin/peer"
	"golang.org/x/crypto/ssh"
)

const (
	Magic     = "quoin-sudo-v1"
	NonceSize = 32
	// MaxSize is OpenSSH's agent message limit.
	MaxSize = 256 << 10
	// MaxFields is the most fields a message has, known or not, and
	// MaxKey the longest key, its mark included.
	MaxFields = 32
	MaxKey    = 64
	// Critical marks a key as one a reader that does not know it must
	// refuse.
	Critical = "!"
)

// The fields, by name. Each is critical; chain, cut, danger and env are
// left out when empty.
const (
	FieldArgv   = "argv"   // the command, a list
	FieldChain  = "chain"  // the chain, leaf first, a list of peer records
	FieldCut    = "cut"    // empty: command lines were left out of the chain
	FieldCwd    = "cwd"    // where it runs
	FieldDanger = "danger" // the danger lines, a list
	FieldEnv    = "env"    // the variables outside the allowlist, a list
	FieldRunAs  = "runas"  // as whom it runs
	FieldUser   = "user"   // who runs it
)

var known = map[string]bool{
	FieldArgv: true, FieldChain: true, FieldCut: true, FieldCwd: true,
	FieldDanger: true, FieldEnv: true, FieldRunAs: true, FieldUser: true,
}

var prefix = lengthPrefixed(Magic)

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
	// Ignored names the unmarked fields Parse did not know and dropped.
	// Marshal writes none.
	Ignored []string
}

var (
	errMalformed = errors.New("not a well-formed quoin-sudo message")
	ErrTooLong   = fmt.Errorf("over the agent's limit of %d bytes", MaxSize)
)

// CriticalError is a message with a field marked critical that this reader
// does not know, which it must not ask without.
type CriticalError struct{ Key string }

func (e *CriticalError) Error() string {
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
	if len(m.Env) > 0 {
		field(FieldEnv, appendList(nil, byteSlices(m.Env)))
	}
	field(FieldRunAs, []byte(m.RunAs))
	field(FieldUser, []byte(m.User))
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
// set, until it fits; Argv, Danger and Env are never touched. What still
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
// its value read as its kind, with nothing left over; argv, cwd, runas and
// user must be there. An unknown field marked critical is a *CriticalError
// naming it; one unmarked is dropped and named in Ignored.
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
	r := &reader{b: f}
	seen := map[string]bool{}
	var last string
	var critical *CriticalError
	for n := 0; len(r.b) > 0; n++ {
		key, value := string(r.bytes()), r.bytes()
		if r.err != nil || n == MaxFields {
			return errMalformed
		}
		name, marked := strings.CutPrefix(key, Critical)
		if !validName(name) || len(key) > MaxKey || (n > 0 && name <= last) {
			return fmt.Errorf("%w: field %q", errMalformed, key)
		}
		last = name
		if !known[name] {
			if !marked {
				m.Ignored = append(m.Ignored, name)
			} else if critical == nil {
				critical = &CriticalError{Key: name}
			}
			continue
		}
		if !marked {
			return fmt.Errorf("%w: field %q is critical", errMalformed, name)
		}
		seen[name] = true
		if err := m.setField(name, value); err != nil {
			return fmt.Errorf("%w: field %q", errMalformed, name)
		}
	}
	if critical != nil {
		return critical
	}
	for _, name := range []string{FieldArgv, FieldCwd, FieldRunAs, FieldUser} {
		if !seen[name] {
			return fmt.Errorf("%w: no field %q", errMalformed, name)
		}
	}
	return nil
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
// entry for argv, chain, danger and env, nothing for cut, any bytes for
// the rest.
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
	}
	if r.err != nil || len(r.b) != 0 {
		return errMalformed
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
