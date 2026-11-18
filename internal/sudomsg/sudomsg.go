// Package sudomsg is the message a remote sudo asks the forwarded agent to
// sign: built by quoin-sudo's gate and read by quoin-signer.
//
// There are two. quoin-sudo-v1 carries the command and a level with its
// reasons, worked out at the gate. quoin-sudo-v2 carries what the question
// is made of instead, the danger and environment lines and the remote
// process chain, so the signer shows a remote sudo as the host would show a
// local one, from bytes the gate read as root and the agent signs whole.
// Version tells them apart; a signer reads both until every gate sends v2.
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
	MagicV2   = "quoin-sudo-v2"
	NonceSize = 32
	// MaxSize is OpenSSH's agent message limit.
	MaxSize = 256 << 10
)

// The versions: a Message's zero Version is V1.
const (
	V1 = 1
	V2 = 2
)

// FlagCmdlinesCut is v2's flag that command lines were left out of the
// chain to fit; any other bit is malformed.
const FlagCmdlinesCut = 1

var (
	prefix   = lengthPrefixed(Magic)
	prefixV2 = lengthPrefixed(MagicV2)
)

func lengthPrefixed(s string) string {
	return string(binary.BigEndian.AppendUint32(nil, uint32(len(s)))) + s
}

type Message struct {
	// Version is V1, or zero for V1, or V2.
	Version  int
	Nonce    []byte
	HostKeys [][]byte
	User     string
	RunAs    string
	Cwd      string
	Argv     []string

	// Level and Reasons are v1's alone.
	Level   string
	Reasons []string

	// Danger, Env, Truncated and Links are v2's alone: the danger lines,
	// the variables outside the allowlist, whether command lines were left
	// out of the chain to fit, and the chain, leaf first, at most
	// peer.MaxLinks. A link's Sid and Cgroup are not carried.
	Danger    []string
	Env       []string
	Truncated bool
	Links     []peer.Link
}

var (
	errMalformed = errors.New("not a well-formed quoin-sudo message")
	ErrTooLong   = fmt.Errorf("over the agent's limit of %d bytes", MaxSize)
)

// HasMagic is whether b starts with either version's length-prefixed
// magic, as no userauth request or SSHSIG blob does.
func HasMagic(b []byte) bool {
	return bytes.HasPrefix(b, []byte(prefix)) || bytes.HasPrefix(b, []byte(prefixV2))
}

func validLevel(l string) bool {
	return l == "" || l == "warning" || l == "danger"
}

func (m *Message) v2() bool { return m.Version == V2 }

func (m *Message) Marshal() ([]byte, error) {
	if len(m.Nonce) != NonceSize {
		return nil, fmt.Errorf("a nonce of %d bytes", len(m.Nonce))
	}
	if len(m.HostKeys) == 0 {
		return nil, errors.New("no host keys")
	}
	switch m.Version {
	case 0, V1:
		if m.Danger != nil || m.Env != nil || m.Truncated || m.Links != nil {
			return nil, errors.New("v2's fields in a v1 message")
		}
		if !validLevel(m.Level) {
			return nil, fmt.Errorf("level %q", m.Level)
		}
	case V2:
		if m.Level != "" || m.Reasons != nil {
			return nil, errors.New("v1's level or reasons in a v2 message")
		}
		if err := validLinks(m.Links); err != nil {
			return nil, err
		}
	default:
		return nil, fmt.Errorf("version %d", m.Version)
	}
	b := []byte(prefix)
	if m.v2() {
		b = []byte(prefixV2)
	}
	b = appendString(b, m.Nonce)
	b = appendList(b, m.HostKeys)
	b = appendString(b, []byte(m.User))
	b = appendString(b, []byte(m.RunAs))
	b = appendString(b, []byte(m.Cwd))
	b = appendList(b, byteSlices(m.Argv))
	if m.v2() {
		b = appendList(b, byteSlices(m.Danger))
		b = appendList(b, byteSlices(m.Env))
		var flags uint32
		if m.Truncated {
			flags |= FlagCmdlinesCut
		}
		b = binary.BigEndian.AppendUint32(b, flags)
		b = binary.BigEndian.AppendUint32(b, uint32(len(m.Links)))
		for _, l := range m.Links {
			b = appendString(b, l.AppendRecord(nil))
		}
	} else {
		b = appendString(b, []byte(m.Level))
		b = appendList(b, byteSlices(m.Reasons))
	}
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
// MaxSize. A v2 message over it has its chain's command lines left out one
// at a time, from the top of the chain down, each blanked in m and
// Truncated set, until it fits; Argv, Danger and Env are never touched.
// What still does not fit with every command line out is ErrTooLong, as
// is a v1 message over limit.
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
		if !m.v2() || i < 0 {
			return nil, ErrTooLong
		}
		m.Links[i].Cmdline = nil
		m.Truncated = true
	}
}

// Parse reads b strictly, as v1 or v2 by its magic, and sets Version:
// every field present, a nonce of exactly NonceSize bytes, at least one
// host key and each a public key blob, nothing after the last field and no
// more than MaxSize in all. A v1 level is a known one; a v2 flags word has
// no unknown bit, and its chain at most peer.MaxLinks records, each read
// as peer.ParseRecord reads it.
func Parse(b []byte) (*Message, error) {
	if len(b) > MaxSize {
		return nil, errMalformed
	}
	m := &Message{}
	switch {
	case bytes.HasPrefix(b, []byte(prefix)):
		m.Version, b = V1, b[len(prefix):]
	case bytes.HasPrefix(b, []byte(prefixV2)):
		m.Version, b = V2, b[len(prefixV2):]
	default:
		return nil, errMalformed
	}
	r := &reader{b: b}
	m.Nonce = r.bytes()
	m.HostKeys = r.list()
	m.User = string(r.bytes())
	m.RunAs = string(r.bytes())
	m.Cwd = string(r.bytes())
	m.Argv = r.strings()
	if m.v2() {
		m.Danger = r.strings()
		m.Env = r.strings()
		flags := r.uint32()
		if flags&^FlagCmdlinesCut != 0 {
			return nil, errMalformed
		}
		m.Truncated = flags&FlagCmdlinesCut != 0
		n := r.uint32()
		if n > peer.MaxLinks {
			return nil, errMalformed
		}
		for i := uint32(0); i < n && r.err == nil; i++ {
			rec := r.bytes()
			if r.err != nil {
				break
			}
			l, err := peer.ParseRecord(rec)
			if err != nil {
				return nil, fmt.Errorf("%w: a link: %v", errMalformed, err)
			}
			m.Links = append(m.Links, l)
		}
	} else {
		m.Level = string(r.bytes())
		m.Reasons = r.strings()
	}
	if r.err != nil || len(r.b) != 0 {
		return nil, errMalformed
	}
	if len(m.Nonce) != NonceSize || len(m.HostKeys) == 0 || !validLevel(m.Level) {
		return nil, errMalformed
	}
	for _, k := range m.HostKeys {
		if _, err := ssh.ParsePublicKey(k); err != nil {
			return nil, fmt.Errorf("%w: a host key: %v", errMalformed, err)
		}
	}
	return m, nil
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
