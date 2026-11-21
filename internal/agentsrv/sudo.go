package agentsrv

import (
	"bytes"
	"context"
	"crypto/rand"
	"encoding/binary"
	"encoding/hex"
	"errors"
	"fmt"
	"io"
	"net"
	"os"
	"path/filepath"
	"slices"
	"time"

	"github.com/danielbodart/quoin/internal/galleyask"
	"github.com/danielbodart/quoin/internal/sudomsg"
	"github.com/danielbodart/quoin/internal/sudoq"
	"github.com/danielbodart/quoin/peer"
	"golang.org/x/crypto/ssh"
)

const (
	// agentSuccess opens a quoin-sudo reply: the answer, then the
	// signature.
	agentSuccess = 6
	// presenceVersion opens a request to the presence helper: then a
	// uint16 length and the secret, at most maxSecret bytes. It answers
	// 'P', a pass, or 'F'.
	presenceVersion = 1
	maxSecret       = 1023
	// wrongLine opens a dialog asked again after a wrong secret, as the
	// gate's.
	wrongLine = "Wrong password, try again"
)

// sudo answers a quoin-sudo@quoin request, a key blob and a remote sudo's
// message: refused unasked unless the message parses strictly, its binds
// allow it and this agent holds the key; else asked as its host would ask
// it, and answered with an answer record signed with the message. A person
// who refuses gets a signed refusal; anything else is a failure.
func (c *conn) sudo(contents []byte) ([]byte, error) {
	req, err := c.sudoRequest(contents)
	if err != nil {
		c.s.Log.Warn("refused", "reason", err.Error(), "chain", c.r.Chain, "anchor", c.r.Anchor)
		return nil, errRefused
	}
	c.describeSudo(req)
	v := c.decideSudo(req)
	if !v.sign && (v.source != "galley" || v.err != nil) {
		c.record(req, v)
		return nil, errRefused
	}
	reply, err := c.answerSudo(req, v)
	if err != nil {
		v = verdict{source: v.source, err: err, answer: v.answer}
		c.record(req, v)
		c.s.Log.Error("sign failed", "key", req.keyFP, "err", err.Error())
		return nil, err
	}
	c.record(req, v)
	return reply, nil
}

// sudoRequest reads the request and runs every check that refuses it
// unasked.
func (c *conn) sudoRequest(contents []byte) (*request, error) {
	r := &reader{b: contents}
	blob, raw := r.bytes(), r.bytes()
	if err := r.end(); err != nil {
		return nil, errors.New("remote sudo: not a key and a message")
	}
	key, err := ssh.ParsePublicKey(blob)
	if err != nil {
		return nil, fmt.Errorf("remote sudo: the key: %w", err)
	}
	m, err := sudomsg.Parse(raw)
	if err != nil {
		return nil, fmt.Errorf("remote sudo: %w", err)
	}
	subject, err := sudoq.FromMessage(m)
	if err != nil {
		return nil, fmt.Errorf("remote sudo: %w", err)
	}
	req := &request{class: classRemoteSudo, sudo: m, raw: raw, subject: &subject}
	if err := c.sudoBound(req); err != nil {
		return nil, err
	}
	// The gate takes neither answer, so neither is asked.
	if m.Decision == sudomsg.Question && m.Presence == sudomsg.Required {
		return nil, errors.New("remote sudo: a question that requires presence")
	}
	if m.WindowKey != nil && !bytes.Equal(m.WindowKey, blob) {
		return nil, errors.New("remote sudo: another key's window")
	}
	var ok bool
	if req.key, ok = c.find(key); !ok {
		return nil, fmt.Errorf("remote sudo: not a key this agent holds: %s", ssh.FingerprintSHA256(key))
	}
	return req, nil
}

// sudoBound checks the connection's binds. With a bind, the last forwards
// and names one of the message's host keys. With none, every host key the
// message names is this machine's own and the process that connected is a
// mosey client: this machine's sudo in a mosey session attached from a
// local terminal, whose relay sends no bind. Its gate alone could have made
// the nonce, for a sudo running here as the user. Relayed by anything else
// with no bind (an ssh -A that sends none, another forwarder) it may come
// from far off, so it is refused.
func (c *conn) sudoBound(req *request) error {
	m := req.sudo
	if len(c.binds) == 0 {
		if !c.ownHost(m.HostKeys) {
			return errors.New("remote sudo on an unbound connection")
		}
		if !moseyClient(c.r) {
			return errors.New("this host's sudo on an unbound connection, not from a mosey client")
		}
		return nil
	}
	last := c.binds[len(c.binds)-1]
	if !last.fwd {
		return errors.New("remote sudo on a connection that is not forwarded")
	}
	bound := last.hostKey.Marshal()
	if !slices.ContainsFunc(m.HostKeys, func(k []byte) bool { return bytes.Equal(k, bound) }) {
		return fmt.Errorf("remote sudo bound to %s, not one of the message's host keys", ssh.FingerprintSHA256(last.hostKey))
	}
	req.host, req.fwd = last.hostKey, true
	return nil
}

// moseyClient is whether r, the process that connected, is a mosey
// client by its name, as the sudo plugin knows mosey: "mosey", or
// nixpkgs' ".mosey-wrapped". A process of the user may take the name;
// what it keeps out is a relay from another machine with no bind.
func moseyClient(r *peer.Requester) bool {
	if len(r.Chain) == 0 {
		return false
	}
	comm := r.Chain[0].Comm
	return comm == "mosey" || comm == ".mosey-wrapped"
}

// ownHost is whether keys is not empty and every one of them is one of
// this machine's host keys. A message naming another host as well may be
// that host's, so it is not this machine's alone.
func (c *conn) ownHost(keys [][]byte) bool {
	own := c.ownHostKeys()
	if len(own) == 0 || len(keys) == 0 {
		return false
	}
	for _, k := range keys {
		if !slices.ContainsFunc(own, func(o []byte) bool { return bytes.Equal(o, k) }) {
			return false
		}
	}
	return true
}

// ownHostKeys are this machine's public host key blobs, read from
// HostKeys at each request as the sudo gate reads them at each sudo; a
// file that does not read or parse is left out.
func (c *conn) ownHostKeys() [][]byte {
	if c.s.HostKeys == "" {
		return nil
	}
	paths, err := filepath.Glob(c.s.HostKeys)
	if err != nil {
		c.s.Log.Warn("host keys unreadable", "glob", c.s.HostKeys, "err", err.Error())
		return nil
	}
	var keys [][]byte
	for _, p := range paths {
		b, err := os.ReadFile(p)
		if err != nil {
			c.s.Log.Warn("host key unreadable", "path", p, "err", err.Error())
			continue
		}
		k, _, _, _, err := ssh.ParseAuthorizedKey(b)
		if err != nil {
			c.s.Log.Warn("host key skipped", "path", p, "err", err.Error())
			continue
		}
		keys = append(keys, k.Marshal())
	}
	return keys
}

// describeSudo names the key, the host and the hosts it was reached
// through, from the binds and the known hosts file. With no bind it is this
// machine's own sudo, asked as its gate would ask it: no host, no
// "from here: " lines, no key line.
func (c *conn) describeSudo(req *request) {
	pub, _ := ssh.NewPublicKey(req.key.Signer.Public())
	req.keyFP = ssh.FingerprintSHA256(pub)
	if req.host == nil {
		req.dest = "this host"
		return
	}
	req.dest = c.hostName(req.host)
	for _, b := range c.binds[:len(c.binds)-1] {
		req.via = append(req.via, c.hostName(b.hostKey))
	}
}

// sudoQuestion is the question from sudoq, as the host would ask it, its
// title "on B via A". A dialog takes the secret, and offers a window when
// the message does; after a wrong secret it opens with wrongLine.
func (c *conn) sudoQuestion(req *request, wrong bool) galleyask.Question {
	m := req.sudo
	dialog := m.Decision == sudomsg.Dialog
	var o sudoq.Options
	if req.host != nil {
		o = sudoq.Options{Host: req.dest, Via: req.via, Here: c.r,
			Footer: []string{fmt.Sprintf("key %s (%s)", req.keyFP, galleyask.Clean(req.key.Comment))}}
	}
	if wrong && dialog {
		o.Lead = []string{wrongLine, ""}
	}
	q := sudoq.Question(*req.subject, o)
	q.Password = dialog
	q.Grantable = dialog && m.Window > 0
	return q
}

// decideSudo asks until answered. A dialog's secret goes to the presence
// helper: a wrong one asks again, one that is empty or will not go asks
// again as the gate's dialog does. No pass is kept: every dialog asks the
// helper.
func (c *conn) decideSudo(req *request) verdict {
	dialog := req.sudo.Decision == sudomsg.Dialog
	for {
		req.question = c.sudoQuestion(req, req.wrong > 0)
		v := c.ask(req)
		secret := v.answer.Password
		v.answer.Password = nil
		if !v.sign || !dialog {
			clear(secret)
			return v
		}
		if len(secret) == 0 || len(secret) > maxSecret || bytes.ContainsAny(secret, "\x00\n") {
			clear(secret)
			continue
		}
		pass, err := c.present(secret)
		clear(secret)
		if err != nil {
			return verdict{source: "presence", err: err, answer: v.answer}
		}
		if pass {
			v.source = "presence"
			return v
		}
		req.wrong++
	}
}

// present asks the presence helper whether secret is the user's. A
// requester that hangs up ends it.
func (c *conn) present(secret []byte) (bool, error) {
	if c.s.Presence == "" {
		return false, errors.New("no presence helper")
	}
	var d net.Dialer
	pc, err := d.DialContext(c.here, "unix", c.s.Presence)
	if err != nil {
		return false, fmt.Errorf("the presence helper: %w", err)
	}
	defer pc.Close()
	defer context.AfterFunc(c.here, func() { pc.Close() })()
	b := make([]byte, 3+len(secret))
	b[0] = presenceVersion
	binary.BigEndian.PutUint16(b[1:], uint16(len(secret)))
	copy(b[3:], secret)
	_, err = pc.Write(b)
	clear(b)
	if err != nil {
		return false, fmt.Errorf("the presence helper: %w", err)
	}
	var reply [1]byte
	if _, err := io.ReadFull(pc, reply[:]); err != nil {
		return false, fmt.Errorf("the presence helper: %w", err)
	}
	switch reply[0] {
	case 'P':
		return true, nil
	case 'F':
		return false, nil
	}
	return false, fmt.Errorf("the presence helper answered %q", reply[0])
}

// answerSudo is the reply: the answer, what the person chose, and the
// signature over the message and the answer. Allowed, a dialog's presence
// is verified, and its window the one chosen, at most the message's; a
// question's presence is none and its window 0. The hops are the binds,
// none on an unbound connection.
func (c *conn) answerSudo(req *request, v verdict) ([]byte, error) {
	m := req.sudo
	a := &sudomsg.Answer{Decision: sudomsg.Refuse, Presence: sudomsg.PresenceNone}
	for _, b := range c.binds {
		a.Hops = append(a.Hops, sudomsg.Hop{HostKey: b.hostKey.Marshal(), Forwarded: b.fwd})
	}
	if v.sign {
		a.Decision = sudomsg.Allow
		if m.Decision == sudomsg.Dialog {
			a.Presence = sudomsg.Verified
			a.Window = uint32(min(v.answer.For/time.Second, time.Duration(m.Window)))
		}
	}
	req.answer = a
	ab, err := a.Marshal()
	if err != nil {
		return nil, err
	}
	signer, err := ssh.NewSignerFromSigner(req.key.Signer)
	if err != nil {
		return nil, err
	}
	sig, err := signer.Sign(rand.Reader, sudomsg.Signed(req.raw, ab))
	if err != nil {
		return nil, err
	}
	return ssh.Marshal(struct {
		Type      byte
		Answer    []byte
		Signature []byte
	}{agentSuccess, ab, ssh.Marshal(sig)}), nil
}

// sudoAttrs are a remote sudo's for the journal: the message's fields,
// the route and what was answered.
func sudoAttrs(req *request) []any {
	m := req.sudo
	attrs := []any{"user", m.User, "runas", m.RunAs, "cwd", m.Cwd,
		"argv", m.Argv, "nonce", hex.EncodeToString(m.Nonce),
		"danger", m.Danger, "env", m.Env, "level", req.question.Level,
		"remote_chain", req.subject.Chain.Chain, "remote_cut", req.subject.Chain.Cut,
		"cmdlines_left_out", m.Truncated, "fields_ignored", m.Ignored,
		"host_keys", fingerprints(m.HostKeys),
		"decision", m.Decision, "presence", m.Presence, "window", m.Window,
		"secrets_wrong", req.wrong}
	if m.Rule != nil {
		attrs = append(attrs, "rule", m.Rule.Pattern, "rule_source", m.Rule.Source)
	}
	if m.WindowKey != nil {
		attrs = append(attrs, "window_key", fingerprints([][]byte{m.WindowKey})[0])
	}
	if req.host == nil {
		attrs = append(attrs, "via", "unbound relay")
	} else if len(req.via) > 0 {
		attrs = append(attrs, "through", req.via)
	}
	if a := req.answer; a != nil {
		hops := make([][]byte, len(a.Hops))
		for i, h := range a.Hops {
			hops[i] = h.HostKey
		}
		attrs = append(attrs, "answer", a.Decision, "answer_presence", a.Presence,
			"answer_window", a.Window, "hops", fingerprints(hops))
	}
	return attrs
}
