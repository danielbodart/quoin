package sudogate

import (
	"crypto/rand"
	"encoding/hex"
	"errors"
	"os"
	"path/filepath"
	"time"

	"github.com/danielbodart/quoin/internal/sudomsg"
	"github.com/danielbodart/quoin/internal/sudoq"
	"golang.org/x/crypto/ssh"
)

// challenge is a remote 'A' answered with 'M': the message the forwarded
// agent is to answer, its nonce unspent until the first 'S'.
type challenge struct {
	a      *sudoReq
	msg    *sudomsg.Message
	raw    []byte
	listed []ssh.PublicKey
}

// askRemote sends what approve decided for a through the forwarded agent:
// the message, with the decision, the presence it requires and the most
// window it offers, in an 'M' with the keys whose answer counts. An ask
// rule's question takes any listed key; a window's, only its opener's.
func (s *session) askRemote(a *sudoReq) {
	listed := s.g.RemoteKeys
	if len(listed) == 0 {
		s.record(a, "refuse", "remote sudo is off", nil)
		s.reply(replyNo, "remote sudo is off on this host")
		return
	}
	hosts := s.g.ownHostKeys()
	if len(hosts) == 0 {
		s.record(a, "refuse", "no host keys", nil)
		s.reply(replyNo, "no host keys in /etc/ssh")
		return
	}
	nonce := make([]byte, sudomsg.NonceSize)
	if _, err := rand.Read(nonce); err != nil {
		s.record(a, "refuse", "nonce", []any{"err", err.Error()})
		s.reply(replyNo, "no nonce")
		return
	}
	m := sudoq.Message(a.subject(), nonce, hosts)
	switch w := s.g.window(a); {
	case a.rule != nil:
		m.Decision, m.Presence = sudomsg.Question, sudomsg.PresenceNone
	case w != nil && opener(listed, w.key) != nil:
		m.Decision, m.Presence, m.WindowKey = sudomsg.Question, sudomsg.PresenceNone, []byte(w.key)
		listed = []ssh.PublicKey{opener(listed, w.key)}
	case a.grantable():
		m.Window = uint32(maxWindow / time.Second)
	}
	blobs := make([][]byte, len(listed))
	longest := 0
	for i, k := range listed {
		blobs[i] = k.Marshal()
		longest = max(longest, len(blobs[i]))
	}
	// The agent's extension request is its name, the key blob and the
	// message, after its type byte: the message's room is what is left.
	raw, err := m.MarshalWithin(sudomsg.Room(longest))
	if err != nil {
		s.record(a, "refuse", "message", []any{"err", err.Error()})
		if errors.Is(err, sudomsg.ErrTooLong) {
			s.reply(replyNo, "command too long for the gate")
		} else {
			s.reply(replyNo, "bad request")
		}
		return
	}
	c := &challenge{a: a, msg: m, raw: raw, listed: listed}
	if err := writeMessage(s.c, raw, blobs); err != nil {
		s.recordRemote(c, "refuse", "message", "", []any{"err", err.Error()})
		s.reply(replyNo, "too many remote keys for the gate")
		return
	}
	s.challenge = c
	s.recordRemote(c, "pending", "message", "", nil)
}

// opener is the listed key whose blob is key, or nil.
func opener(listed []ssh.PublicKey, key string) ssh.PublicKey {
	for _, k := range listed {
		if string(k.Marshal()) == key {
			return k
		}
	}
	return nil
}

// sign takes the agent's answer to the challenge: signed by a listed key
// over the message the gate sent, then the answer; parsed strictly; and
// held by the message to what was asked. A dialog's window opens for the
// signing key.
func (s *session) sign(req *request) {
	c := s.challenge
	s.challenge = nil
	if req.failed != nil {
		msg := "quoin-sudo: " + *req.failed
		s.recordRemote(c, "refuse", "agent", "", []any{"reason", *req.failed})
		s.reply(replyNo, msg[:min(len(msg), maxMessage)])
		return
	}
	key := opener(c.listed, string(req.pub))
	if key == nil {
		s.recordRemote(c, "refuse", "not a listed key", "", nil)
		s.reply(replyNo, "quoin-sudo: not a listed key")
		return
	}
	fp := ssh.FingerprintSHA256(key)
	var sig ssh.Signature
	if err := ssh.Unmarshal(req.sig, &sig); err != nil || key.Verify(sudomsg.Signed(c.raw, req.answer), &sig) != nil {
		s.recordRemote(c, "refuse", "signature did not verify", fp, nil)
		s.reply(replyNo, "signature did not verify")
		return
	}
	ans, err := sudomsg.ParseAnswer(req.answer)
	if err != nil {
		s.recordRemote(c, "refuse", "answer", fp, []any{"err", err.Error()})
		s.reply(replyNo, "quoin-sudo: not an answer the gate takes")
		return
	}
	got := []any{"answered", ans.Decision, "presence", ans.Presence, "window", ans.Window, "hops", len(ans.Hops)}
	if ans.Decision == sudomsg.Refuse {
		// The person's refusal, in the local words: Cancel on a dialog,
		// Refuse on a question.
		why := "refused"
		if c.msg.Decision == sudomsg.Dialog {
			why = "cancelled"
		}
		s.recordRemote(c, "refuse", "signer", fp, got)
		s.reply(replyNo, why)
		return
	}
	if err := c.msg.Check(ans, req.pub); err != nil {
		s.recordRemote(c, "refuse", "answer", fp, append(got, "err", err.Error()))
		s.reply(replyNo, "quoin-sudo: "+err.Error())
		return
	}
	a := c.a
	if ans.Window == 0 || !a.grantable() {
		s.recordRemote(c, "allow", "signature", fp, got)
		s.reply(replyYes, "")
		return
	}
	now := s.g.now()
	until := now + time.Duration(ans.Window)*time.Second
	s.g.open(proc{a.r.Anchor.Pid, a.r.Anchor.Start}, window{until: until, key: string(req.pub)})
	at := time.Now().Add(until - now).Format("15:04")
	s.recordRemote(c, "allow", "signature", fp, append(got, "window_until", at))
	s.reply(replyYes, "quoin-sudo: password remembered for this claude until "+at)
}

// ownHostKeys are this host's public host key blobs.
func (g *Gate) ownHostKeys() [][]byte {
	paths, _ := filepath.Glob(g.hostKeys)
	var keys [][]byte
	for _, p := range paths {
		b, err := os.ReadFile(p)
		if err != nil {
			g.Log.Warn("host key unreadable", "path", p, "err", err.Error())
			continue
		}
		k, _, _, _, err := ssh.ParseAuthorizedKey(b)
		if err != nil {
			g.Log.Warn("host key skipped", "path", p, "err", err.Error())
			continue
		}
		keys = append(keys, k.Marshal())
	}
	return keys
}

func (s *session) recordRemote(c *challenge, outcome, source, keyFP string, extra []any) {
	m := c.msg
	hosts := make([]string, len(m.HostKeys))
	for i, h := range m.HostKeys {
		if k, err := ssh.ParsePublicKey(h); err == nil {
			hosts[i] = ssh.FingerprintSHA256(k)
		}
	}
	var opened string
	if k, err := ssh.ParsePublicKey(m.WindowKey); err == nil {
		opened = ssh.FingerprintSHA256(k)
	}
	attrs := []any{
		"remote", true, "chain", c.a.r.Chain, "pid", s.peer.Pid,
		"decision", m.Decision, "requires", m.Presence, "offered", m.Window, "window_key", opened,
		"nonce", hex.EncodeToString(m.Nonce), "host_keys", hosts, "user", m.User, "runas", m.RunAs,
		"cwd", m.Cwd, "argv", m.Argv, "level", c.a.level(), "danger", m.Danger, "env", m.Env,
		"cmdlines_left_out", m.Truncated, "truncated", c.a.truncated,
		"key", keyFP, "outcome", outcome, "source", source,
	}
	if c.a.rule != nil {
		attrs = append(attrs, "rule_source", c.a.rule.source)
		attrs = append(attrs, c.a.rule.attrs()...)
	}
	s.g.Log.Info("decision", append(attrs, extra...)...)
}
