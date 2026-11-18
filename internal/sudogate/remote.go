package sudogate

import (
	"bytes"
	"crypto/rand"
	"encoding/hex"
	"errors"
	"os"
	"path/filepath"

	"github.com/danielbodart/quoin/internal/sudomsg"
	"github.com/danielbodart/quoin/internal/sudoq"
	"golang.org/x/crypto/ssh"
)

// challenge is a remote 'A' answered with 'M': the message the forwarded
// agent is to sign, its nonce unspent until the first 'S'.
type challenge struct {
	a      *sudoReq
	msg    *sudomsg.Message
	raw    []byte
	listed []ssh.PublicKey
}

func (s *session) approveRemote(req *request) {
	a, err := s.g.describe(req)
	if err != nil {
		s.g.Log.Warn("refused", "reason", err.Error(), "pid", s.peer.Pid)
		s.reply(replyNo, "bad request")
		return
	}
	listed := s.g.RemoteKeys
	if len(listed) == 0 {
		s.record(a, "refuse", "remote sudo is off", []any{"remote", true})
		s.reply(replyNo, "remote sudo is off on this host")
		return
	}
	hosts := s.g.ownHostKeys()
	if len(hosts) == 0 {
		s.record(a, "refuse", "no host keys", []any{"remote", true})
		s.reply(replyNo, "no host keys in /etc/ssh")
		return
	}
	nonce := make([]byte, sudomsg.NonceSize)
	if _, err := rand.Read(nonce); err != nil {
		s.record(a, "refuse", "nonce", []any{"remote", true, "err", err.Error()})
		s.reply(replyNo, "no nonce")
		return
	}
	m := sudoq.Message(a.subject(), nonce, hosts)
	blobs := make([][]byte, len(listed))
	longest := 0
	for i, k := range listed {
		blobs[i] = k.Marshal()
		longest = max(longest, len(blobs[i]))
	}
	// The agent's sign request is the message, the key blob and flags,
	// after its type byte and length: the message's room is what is left.
	raw, err := m.MarshalWithin(sudomsg.MaxSize - (1 + 4 + longest + 4 + 4))
	if err != nil {
		s.record(a, "refuse", "message", []any{"remote", true, "err", err.Error()})
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

func (s *session) sign(req *request) {
	c := s.challenge
	s.challenge = nil
	if req.failed != nil {
		msg := "quoin-sudo: " + *req.failed
		s.recordRemote(c, "refuse", "agent", "", []any{"reason", *req.failed})
		s.reply(replyNo, msg[:min(len(msg), maxMessage)])
		return
	}
	var key ssh.PublicKey
	for _, k := range c.listed {
		if bytes.Equal(k.Marshal(), req.pub) {
			key = k
		}
	}
	if key == nil {
		s.recordRemote(c, "refuse", "not a listed key", "", nil)
		s.reply(replyNo, "quoin-sudo: not a listed key")
		return
	}
	fp := ssh.FingerprintSHA256(key)
	var sig ssh.Signature
	if err := ssh.Unmarshal(req.sig, &sig); err != nil || key.Verify(c.raw, &sig) != nil {
		s.recordRemote(c, "refuse", "signature did not verify", fp, nil)
		s.reply(replyNo, "signature did not verify")
		return
	}
	s.recordRemote(c, "allow", "signature", fp, nil)
	s.reply(replyYes, "")
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
	attrs := []any{
		"remote", true, "chain", c.a.r.Chain, "pid", s.peer.Pid,
		"nonce", hex.EncodeToString(m.Nonce), "host_keys", hosts, "user", m.User, "runas", m.RunAs,
		"cwd", m.Cwd, "argv", m.Argv, "version", m.Version, "level", c.a.level(), "danger", m.Danger, "env", m.Env,
		"cmdlines_left_out", m.Truncated, "truncated", c.a.truncated,
		"key", keyFP, "outcome", outcome, "source", source,
	}
	s.g.Log.Info("decision", append(attrs, extra...)...)
}
