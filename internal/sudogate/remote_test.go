package sudogate

import (
	"bytes"
	"crypto/ecdsa"
	"crypto/ed25519"
	"crypto/elliptic"
	"crypto/rand"
	"encoding/binary"
	"io"
	"os"
	"path/filepath"
	"reflect"
	"slices"
	"strings"
	"testing"
	"time"

	"github.com/danielbodart/quoin/internal/sudomsg"
	"github.com/danielbodart/quoin/internal/sudoq"
	"github.com/danielbodart/quoin/peer"
	"golang.org/x/crypto/ssh"
)

func agentKey(t *testing.T) ssh.Signer {
	t.Helper()
	k, err := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
	if err != nil {
		t.Fatal(err)
	}
	s, err := ssh.NewSignerFromSigner(k)
	if err != nil {
		t.Fatal(err)
	}
	return s
}

func edKey(t *testing.T) ssh.PublicKey {
	t.Helper()
	pub, _, err := ed25519.GenerateKey(rand.Reader)
	if err != nil {
		t.Fatal(err)
	}
	k, err := ssh.NewPublicKey(pub)
	if err != nil {
		t.Fatal(err)
	}
	return k
}

func (h *harness) write(name, content string) {
	h.t.Helper()
	if err := os.WriteFile(filepath.Join(h.dir, name), []byte(content), 0o644); err != nil {
		h.t.Fatal(err)
	}
}

func authorized(k ssh.PublicKey) string {
	return string(ssh.MarshalAuthorizedKey(k))
}

// remote sets up remote mode with the listed keys and two host keys, which
// it returns.
func (h *harness) remote(listed ...ssh.Signer) []ssh.PublicKey {
	h.t.Helper()
	h.g.RemoteKeys = nil
	for _, k := range listed {
		h.g.RemoteKeys = append(h.g.RemoteKeys, k.PublicKey())
	}
	hosts := []ssh.PublicKey{edKey(h.t), edKey(h.t)}
	h.write("ssh_host_ed25519_key.pub", authorized(hosts[0]))
	h.write("ssh_host_rsa_key.pub", authorized(hosts[1]))
	return hosts
}

// remoteSudo is a client that has checked in as a remote sudo.
func (h *harness) remoteSudo(pid int) *client {
	h.t.Helper()
	c := h.dial(peer.Proc{UID: 0, Pid: pid, Start: uint64(pid) * 10, PPid: 200})
	c.send(frame(kindCheckIn, record('m', nil)))
	c.want(replyYes, "")
	return c
}

// sshd is a remote sudo's parent bash under sshd-session.
func sshd() []peer.Link {
	return []peer.Link{
		{Pid: 401, PPid: 400, Start: 401, UID: 1000, Comm: "bash", Cmdline: []string{"bash", "-c", "sudo x"}},
		{Pid: 400, PPid: 399, Start: 400, UID: 1000, Comm: "sshd-session", Cmdline: []string{"sshd-session: dan@notty"}},
		{Pid: 399, PPid: 1, Start: 399, UID: 0, Comm: "sshd-session", Cmdline: []string{"sshd-session: dan [priv]"}},
		{Pid: 1, Start: 1, Comm: "systemd", Cmdline: []string{"/sbin/init"}},
	}
}

func remoteCmd(unit string) sudoCmd {
	return sudoCmd{
		links: sshd(), program: bin + "systemctl", argv: []string{"systemctl", "restart", unit},
		info: []string{"runas_user=root", "cwd=/home/dan/src"}, userInfo: []string{"cwd=/home/dan"}, remote: true,
	}
}

type challengeReply struct {
	raw  []byte
	msg  *sudomsg.Message
	keys [][]byte
}

func (c *client) readMessage() challengeReply {
	c.t.Helper()
	var h [5]byte
	if _, err := io.ReadFull(c.c, h[:]); err != nil {
		c.t.Fatal(err)
	}
	if h[0] != replyMessage {
		c.t.Fatalf("got %q, not 'M'", h[0])
	}
	body := make([]byte, binary.BigEndian.Uint32(h[1:]))
	if _, err := io.ReadFull(c.c, body); err != nil {
		c.t.Fatal(err)
	}
	var head struct {
		Msg  []byte
		N    uint32
		Rest []byte `ssh:"rest"`
	}
	if err := ssh.Unmarshal(body, &head); err != nil {
		c.t.Fatal(err)
	}
	r := challengeReply{raw: head.Msg}
	rest := head.Rest
	for range head.N {
		var k struct {
			K    []byte
			Rest []byte `ssh:"rest"`
		}
		if err := ssh.Unmarshal(rest, &k); err != nil {
			c.t.Fatal(err)
		}
		r.keys = append(r.keys, k.K)
		rest = k.Rest
	}
	if len(rest) != 0 {
		c.t.Fatalf("%d bytes after the keys", len(rest))
	}
	m, err := sudomsg.Parse(head.Msg)
	if err != nil {
		c.t.Fatal(err)
	}
	r.msg = m
	return r
}

// answer is the 'S' for ans to the message raw, signed by k as the
// signer signs it: the message, then the answer.
func answer(t *testing.T, k ssh.Signer, raw []byte, ans sudomsg.Answer) []byte {
	t.Helper()
	b, err := ans.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	return answerBytes(t, k, raw, b)
}

func answerBytes(t *testing.T, k ssh.Signer, raw, ans []byte) []byte {
	t.Helper()
	sig, err := k.Sign(rand.Reader, sudomsg.Signed(raw, ans))
	if err != nil {
		t.Fatal(err)
	}
	return frame(kindSign, record('p', k.PublicKey().Marshal()), record('n', ans), record('g', ssh.Marshal(sig)))
}

var verifiedAllow = sudomsg.Answer{Decision: sudomsg.Allow, Presence: sudomsg.Verified}

// signed is k's allow, presence verified, of the message raw.
func signed(t *testing.T, k ssh.Signer, raw []byte) []byte {
	t.Helper()
	return answer(t, k, raw, verifiedAllow)
}

func failed(reason string) []byte {
	return frame(kindSign, record('f', []byte(reason)))
}

func TestTheMessageNamesEveryHostKeyAndTheResolvedCommand(t *testing.T) {
	h := newHarness(t)
	k := agentKey(t)
	hosts := h.remote(k)
	c := h.remoteSudo(500)
	cmd := remoteCmd("foo")
	cmd.argv = []string{"restart-alias", "restart", "foo"}
	c.send(approval(cmd))
	r := c.readMessage()
	want := &sudomsg.Message{
		Nonce:    r.msg.Nonce,
		HostKeys: [][]byte{hosts[0].Marshal(), hosts[1].Marshal()},
		User:     "dan", RunAs: "root", Cwd: "/home/dan/src",
		Argv:     []string{bin + "systemctl", "restart", "foo"},
		Links:    sshd(),
		Decision: sudomsg.Dialog, Presence: sudomsg.Required, Window: 86400,
	}
	if !reflect.DeepEqual(r.msg, want) {
		t.Errorf("got %+v\nwant %+v", r.msg, want)
	}
	if len(r.keys) != 1 || !bytes.Equal(r.keys[0], k.PublicKey().Marshal()) {
		t.Errorf("listed %x", r.keys)
	}
	h.none()

	c = h.remoteSudo(501)
	cmd.info = []string{"runas_user=lp"}
	c.send(approval(cmd))
	if m := c.readMessage().msg; m.Cwd != "/home/dan" || m.RunAs != "lp" {
		t.Errorf("without command_info cwd: %+v", m)
	}
}

func TestARemoteAIsClassifiedAsALocalOne(t *testing.T) {
	h := newHarness(t)
	h.remote(agentKey(t))
	for _, tc := range []struct {
		cmd    sudoCmd
		level  string
		danger []string
		env    []string
	}{
		{remoteCmd("foo"), "normal", nil, nil},
		{remoteCmd("sshd.service"), "danger", []string{"touches a unit that guards this machine"}, nil},
		{func() sudoCmd { c := remoteCmd("foo"); c.links = cut; return c }(), "warning", nil, nil},
		{func() sudoCmd {
			c := remoteCmd("foo")
			c.envp = []string{"PATH=/bin", "LD_PRELOAD=/tmp/x.so"}
			return c
		}(), "normal", nil, []string{"LD_PRELOAD=/tmp/x.so"}},
		{func() sudoCmd { c := remoteCmd("foo"); c.program = "/home/dan/bin/systemctl"; return c }(), "danger", []string{"runs /home/dan/bin/systemctl, outside the root-owned directories"}, nil},
	} {
		c := h.remoteSudo(500)
		c.send(approval(tc.cmd))
		m := c.readMessage().msg
		s, err := sudoq.FromMessage(m)
		if err != nil {
			t.Fatal(err)
		}
		if sudoq.Level(s) != tc.level || !slices.Equal(m.Danger, tc.danger) || !slices.Equal(m.Env, tc.env) || !reflect.DeepEqual(m.Links, tc.cmd.links) {
			t.Errorf("%s %q: level %q danger %q env %q links %+v", tc.cmd.program, tc.cmd.argv, sudoq.Level(s), m.Danger, m.Env, m.Links)
		}
	}
	h.none()
}

func TestASignatureFromAListedKeyIsYes(t *testing.T) {
	h := newHarness(t)
	other, k := agentKey(t), agentKey(t)
	h.remote(other, k)
	c := h.remoteSudo(500)
	c.send(approval(remoteCmd("foo")))
	r := c.readMessage()
	c.send(signed(t, k, r.raw))
	c.want(replyYes, "")
	log := h.log.String()
	for _, want := range []string{`"outcome":"allow"`, `"key":"` + ssh.FingerprintSHA256(k.PublicKey()) + `"`, `"runas":"root"`, `"cwd":"/home/dan/src"`,
		`"level":"normal"`, `"cmdlines_left_out":false`, `"chain":[{"Pid":401`} {
		if !strings.Contains(log, want) {
			t.Errorf("the journal lacks %s:\n%s", want, log)
		}
	}
}

func TestAnUnlistedKeyOrABadSignatureIsNo(t *testing.T) {
	h := newHarness(t)
	k := agentKey(t)
	h.remote(k)
	c := h.remoteSudo(500)
	c.send(approval(remoteCmd("foo")))
	r := c.readMessage()
	c.send(signed(t, agentKey(t), r.raw))
	c.want(replyNo, "quoin-sudo: not a listed key")

	c = h.remoteSudo(501)
	c.send(approval(remoteCmd("foo")))
	r = c.readMessage()
	c.send(signed(t, k, append(r.raw, 0)))
	c.want(replyNo, "signature did not verify")

	c = h.remoteSudo(502)
	c.send(approval(remoteCmd("foo")))
	c.readMessage()
	c.send(frame(kindSign, record('p', k.PublicKey().Marshal()), record('n', nil), record('g', []byte("junk"))))
	c.want(replyNo, "signature did not verify")

	// A plain sign of the message, as a stock agent makes, signs no
	// answer.
	c = h.remoteSudo(503)
	c.send(approval(remoteCmd("foo")))
	r = c.readMessage()
	ans, _ := verifiedAllow.Marshal()
	sig, err := k.Sign(rand.Reader, r.raw)
	if err != nil {
		t.Fatal(err)
	}
	c.send(frame(kindSign, record('p', k.PublicKey().Marshal()), record('n', ans), record('g', ssh.Marshal(sig))))
	c.want(replyNo, "signature did not verify")
}

func TestAnFRecordIsNoWithItsReason(t *testing.T) {
	h := newHarness(t)
	h.remote(agentKey(t))
	c := h.remoteSudo(500)
	c.send(approval(remoteCmd("foo")))
	c.readMessage()
	c.send(failed("no listed key in the forwarded agent"))
	c.want(replyNo, "quoin-sudo: no listed key in the forwarded agent")

	c = h.remoteSudo(501)
	c.send(approval(remoteCmd("foo")))
	c.readMessage()
	c.send(failed(strings.Repeat("x", maxMessage)))
	if k, m := c.read(); k != replyNo || len(m) != maxMessage || !strings.HasPrefix(m, "quoin-sudo: xxx") {
		t.Errorf("got %q %d bytes", k, len(m))
	}
}

func TestTheNonceIsSpentOnceAndDiesWithTheCheckIn(t *testing.T) {
	h := newHarness(t)
	k := agentKey(t)
	h.remote(k)
	c := h.remoteSudo(500)
	c.send(signed(t, k, []byte("anything")))
	c.want(replyNo, "")
	c.send(approval(remoteCmd("foo")))
	r := c.readMessage()
	c.send(failed("agent refused"))
	c.want(replyNo, "quoin-sudo: agent refused")
	c.send(signed(t, k, r.raw))
	c.want(replyNo, "")

	c = h.remoteSudo(501)
	c.send(approval(remoteCmd("foo")))
	r = c.readMessage()
	c.send(signed(t, k, r.raw))
	c.want(replyYes, "")
	c.send(signed(t, k, r.raw))
	c.want(replyNo, "")

	c = h.remoteSudo(502)
	c.send(signed(t, k, r.raw))
	c.want(replyNo, "")
	c.send(approval(remoteCmd("foo")))
	fresh := c.readMessage()
	if bytes.Equal(fresh.msg.Nonce, r.msg.Nonce) {
		t.Fatal("a nonce was made twice")
	}
	c.send(signed(t, k, r.raw))
	c.want(replyNo, "signature did not verify")
}

func TestRemoteModeIsOffWithNoKeys(t *testing.T) {
	h := newHarness(t)
	h.remote()
	c := h.remoteSudo(500)
	c.send(approval(remoteCmd("foo")))
	c.want(replyNo, "remote sudo is off on this host")

	k := agentKey(t)
	h.remote(k)
	c = h.remoteSudo(502)
	c.send(approval(remoteCmd("foo")))
	if r := c.readMessage(); len(r.keys) != 1 || !bytes.Equal(r.keys[0], k.PublicKey().Marshal()) {
		t.Errorf("listed %x", r.keys)
	}

	os.Remove(filepath.Join(h.dir, "ssh_host_ed25519_key.pub"))
	os.Remove(filepath.Join(h.dir, "ssh_host_rsa_key.pub"))
	c = h.remoteSudo(503)
	c.send(approval(remoteCmd("foo")))
	c.want(replyNo, "no host keys in /etc/ssh")
	h.none()
}

func TestAVOnARemoteCheckInAndAnAWhoseModeDiffersFromItsCAreRefused(t *testing.T) {
	h := newHarness(t)
	k := agentKey(t)
	h.remote(k)
	c := h.remoteSudo(500)
	c.send(verified(true))
	c.want(replyNo, "")
	local := remoteCmd("foo")
	local.remote = false
	c.send(approval(local))
	c.want(replyNo, "")
	c.send(approval(remoteCmd("foo")))
	c.want(replyNo, "")

	c = h.sudo(501)
	c.send(approval(remoteCmd("foo")))
	c.want(replyNo, "")
	c.send(signed(t, k, []byte("x")))
	c.want(replyNo, "")

	c = h.sudo(502)
	c.send(approval(restart(claude(100), "foo")))
	h.next().reply <- password("pw", 0, 900)
	c.want(replyPassword, "pw")
	c.send(signed(t, k, []byte("x")))
	c.want(replyNo, "")
	h.none()
}

func TestARemoteCommandOverTheAgentLimitIsRefused(t *testing.T) {
	h := newHarness(t)
	h.remote(agentKey(t))
	c := h.remoteSudo(500)
	cmd := remoteCmd("foo")
	cmd.argv = append(cmd.argv, strings.Repeat("x", sudomsg.MaxSize))
	c.send(approval(cmd))
	c.want(replyNo, "command too long for the gate")
}

func TestARemoteMessageWhoseExtensionRequestIsOverTheAgentLimitIsRefused(t *testing.T) {
	h := newHarness(t)
	k := agentKey(t)
	h.remote(k)
	c := h.remoteSudo(500)
	c.send(approval(remoteCmd("foo")))
	base := len(c.readMessage().raw)
	// The request is its type, the extension's name, the key blob and the
	// message, each string with its length.
	room := sudomsg.MaxSize - (1 + 4 + len(sudomsg.Extension) + 4 + len(k.PublicKey().Marshal()) + 4) - base - 4
	cmdlines := 0
	for _, l := range sshd() {
		cmdlines += len(strings.Join(l.Cmdline, "\x00"))
	}
	// Leaving any out adds the cut field, its key and empty value, so k
	// left out from the top save saved[k] bytes.
	cut := 4 + len("!cut") + 4
	saved := []int{0}
	for i := len(sshd()) - 1; i >= 0; i-- {
		saved = append(saved, saved[len(saved)-1]+len(strings.Join(sshd()[i].Cmdline, "\x00")))
	}
	for k := 1; k < len(saved); k++ {
		saved[k] -= cut
	}
	if saved[1] >= 1 || saved[2] < 1 || cmdlines-cut != saved[4] {
		t.Fatalf("the chain no longer makes the cases below: %v", saved)
	}
	for _, tc := range []struct {
		n       int
		fits    bool
		leftOut int
	}{{room, true, 0}, {room + 1, true, 2}, {room + saved[2], true, 2}, {room + saved[2] + 1, true, 3},
		{room + saved[3] + 1, true, 4}, {room + saved[4], true, 4}, {room + saved[4] + 1, false, 0}} {
		c := h.remoteSudo(501)
		cmd := remoteCmd("foo")
		cmd.argv = append(cmd.argv, strings.Repeat("x", tc.n))
		c.send(approval(cmd))
		if !tc.fits {
			c.want(replyNo, "command too long for the gate")
			continue
		}
		r := c.readMessage()
		var out int
		for _, l := range r.msg.Links {
			if l.Cmdline == nil {
				out++
			}
		}
		for i, l := range r.msg.Links {
			if (l.Cmdline == nil) != (i >= len(r.msg.Links)-out) {
				t.Errorf("%d over: link %d's command line left out before one above it", tc.n-room, i)
			}
		}
		if out != tc.leftOut || r.msg.Truncated != (out > 0) || len(r.msg.Argv) != 4 || len(r.msg.Argv[3]) != tc.n {
			t.Errorf("%d over: %d command lines left out, truncated %v", tc.n-room, out, r.msg.Truncated)
		}
	}
}

func TestAnMReplyOverItsLimitIsNo(t *testing.T) {
	h := newHarness(t)
	h.remote()
	for range 25000 {
		h.g.RemoteKeys = append(h.g.RemoteKeys, edKey(t))
	}
	c := h.remoteSudo(500)
	c.send(approval(remoteCmd("foo")))
	c.want(replyNo, "too many remote keys for the gate")
}

func TestAMalformedRemoteFrameClosesTheConnection(t *testing.T) {
	h := newHarness(t)
	k := agentKey(t)
	h.remote(k)
	for name, req := range map[string][]byte{
		"'m' with a body in 'C'": frame(kindCheckIn, record('m', []byte{1})),
		"'m' twice in 'C'":       frame(kindCheckIn, record('m', nil), record('m', nil)),
		"another record in 'C'":  frame(kindCheckIn, record('t', nil)),
		"version 1":              append([]byte(magic), 1, kindCheckIn, 0, 0, 0, 0),
	} {
		c := h.dial(peer.Proc{UID: 0, Pid: 500, Start: 5000})
		c.send(req)
		if n, err := c.c.Read(make([]byte, 1)); err != io.EOF {
			t.Errorf("%s: read %d, %v", name, n, err)
		}
	}
	sig := record('g', []byte("sig"))
	pub := record('p', k.PublicKey().Marshal())
	ans := record('n', []byte("answer"))
	for name, req := range map[string][]byte{
		"'f' with 'p'":       frame(kindSign, record('f', []byte("x")), pub),
		"'f' with 'n'":       frame(kindSign, ans, record('f', []byte("x"))),
		"'p' without 'g'":    frame(kindSign, pub, ans),
		"'p' and 'g' alone":  frame(kindSign, pub, sig),
		"'n' twice":          frame(kindSign, pub, ans, ans, sig),
		"'g' twice":          frame(kindSign, pub, ans, sig, sig),
		"an empty 'S'":       frame(kindSign),
		"an unprintable 'f'": frame(kindSign, record('f', []byte("a\nb"))),
		"a long 'f'":         frame(kindSign, record('f', bytes.Repeat([]byte("x"), maxMessage+1))),
		"'m' in 'A' twice":   frame(kindApproval, record('c', []byte("command=/bin/x")), record('m', nil), record('m', nil)),
	} {
		c := h.remoteSudo(501)
		if name != "'m' in 'A' twice" {
			c.send(approval(remoteCmd("foo")))
			c.readMessage()
		}
		c.send(req)
		if n, err := c.c.Read(make([]byte, 1)); err != io.EOF {
			t.Errorf("%s: read %d, %v", name, n, err)
		}
	}
}

func TestARemoteDialogOffersAWindowOnlyWhereALocalOneWould(t *testing.T) {
	h := newHarness(t)
	h.remote(agentKey(t))
	cutCmd := remoteCmd("foo")
	cutCmd.links = cut
	for _, tc := range []struct {
		cmd    sudoCmd
		window uint32
	}{{remoteCmd("foo"), 86400}, {remoteCmd("sshd.service"), 0}, {cutCmd, 0}} {
		c := h.remoteSudo(500)
		c.send(approval(tc.cmd))
		m := c.readMessage().msg
		if m.Decision != sudomsg.Dialog || m.Presence != sudomsg.Required || m.Window != tc.window || m.WindowKey != nil || m.Rule != nil {
			t.Errorf("%q: %s %s window %d", tc.cmd.argv, m.Decision, m.Presence, m.Window)
		}
	}
}

func TestAnAnswerCountsOnlyAsTheMessageAskedIt(t *testing.T) {
	h := newHarness(t)
	k := agentKey(t)
	hosts := h.remote(k)
	other := edKey(t).Marshal()
	for _, tc := range []struct {
		name string
		ans  sudomsg.Answer
		kind byte
		msg  string
	}{
		{"cancelled", sudomsg.Answer{Decision: sudomsg.Refuse, Presence: sudomsg.Verified}, replyNo, "cancelled"},
		{"no presence", sudomsg.Answer{Decision: sudomsg.Allow, Presence: sudomsg.PresenceNone}, replyNo, "quoin-sudo: presence was required and not verified"},
		{"a longer window", sudomsg.Answer{Decision: sudomsg.Allow, Presence: sudomsg.Verified, Window: 86401}, replyNo, "quoin-sudo: a window of 86401s, over the 86400s offered"},
		{"another host last", sudomsg.Answer{Decision: sudomsg.Allow, Presence: sudomsg.Verified,
			Hops: []sudomsg.Hop{{HostKey: hosts[1].Marshal(), Forwarded: true}, {HostKey: other}}}, replyNo, "quoin-sudo: the last hop is not this host"},
		{"this host last", sudomsg.Answer{Decision: sudomsg.Allow, Presence: sudomsg.Verified,
			Hops: []sudomsg.Hop{{HostKey: other, Forwarded: true}, {HostKey: hosts[1].Marshal(), Forwarded: true}}}, replyYes, ""},
		{"no hops", verifiedAllow, replyYes, ""},
	} {
		c := h.remoteSudo(500)
		c.send(approval(remoteCmd("foo")))
		c.send(answer(t, k, c.readMessage().raw, tc.ans))
		if kind, msg := c.read(); kind != tc.kind || msg != tc.msg {
			t.Errorf("%s: got %q %q", tc.name, kind, msg)
		}
	}
	good, _ := verifiedAllow.Marshal()
	for name, b := range map[string][]byte{
		"not an answer":   []byte("junk"),
		"something after": append(slices.Clone(good), 0),
		"a critical field it does not know": []byte("\x00\x00\x00\x14quoin-sudo-answer-v1" +
			"\x00\x00\x00\x0c\x00\x00\x00\x04!zzz\x00\x00\x00\x00"),
	} {
		c := h.remoteSudo(500)
		c.send(approval(remoteCmd("foo")))
		c.send(answerBytes(t, k, c.readMessage().raw, b))
		if kind, msg := c.read(); kind != replyNo || msg != "quoin-sudo: not an answer the gate takes" {
			t.Errorf("%s: got %q %q", name, kind, msg)
		}
	}
	if !strings.Contains(h.log.String(), `critical field this reader does not know: \"zzz\"`) {
		t.Errorf("the journal does not name the field:\n%s", h.log.String())
	}
}

// remoteWindow runs a remote sudo from the claude with pid through a
// dialog k answers with a window of d.
func (h *harness) remoteWindow(pid int, k ssh.Signer, d time.Duration) {
	h.t.Helper()
	c := h.remoteSudo(pid + 50)
	cmd := remoteCmd("open")
	cmd.links, cmd.argv = claude(pid), []string{"systemctl", "start", "open"}
	c.send(approval(cmd))
	ans := verifiedAllow
	ans.Window = uint32(d / time.Second)
	c.send(answer(h.t, k, c.readMessage().raw, ans))
	if kind, msg := c.read(); kind != replyYes || !strings.HasPrefix(msg, "quoin-sudo: password remembered for this claude until ") {
		h.t.Fatalf("got %q %q", kind, msg)
	}
}

func remoteFrom(pid int, unit string) sudoCmd {
	cmd := remoteCmd(unit)
	cmd.links = claude(pid)
	return cmd
}

func TestARemoteWindowIsAnsweredOnlyByTheKeyThatOpenedIt(t *testing.T) {
	h := newHarness(t)
	k, other := agentKey(t), agentKey(t)
	h.remote(other, k)
	h.remoteWindow(100, k, 15*time.Minute)
	if w := h.g.windows[proc{100, 200}]; w.until != time.Hour+15*time.Minute || w.key != string(k.PublicKey().Marshal()) {
		t.Fatalf("window %+v", w)
	}
	c := h.remoteSudo(500)
	c.send(approval(remoteFrom(100, "foo")))
	r := c.readMessage()
	if m := r.msg; m.Decision != sudomsg.Question || m.Presence != sudomsg.PresenceNone || m.Window != 0 || !bytes.Equal(m.WindowKey, k.PublicKey().Marshal()) {
		t.Fatalf("inside the window %+v", m)
	}
	if len(r.keys) != 1 || !bytes.Equal(r.keys[0], k.PublicKey().Marshal()) {
		t.Fatalf("listed %x", r.keys)
	}
	c.send(answer(t, k, r.raw, sudomsg.Answer{Decision: sudomsg.Allow, Presence: sudomsg.PresenceNone}))
	c.want(replyYes, "")

	// Refuse on the question is "refused", as locally.
	c = h.remoteSudo(505)
	c.send(approval(remoteFrom(100, "foo")))
	c.send(answer(t, k, c.readMessage().raw, sudomsg.Answer{Decision: sudomsg.Refuse, Presence: sudomsg.PresenceNone}))
	c.want(replyNo, "refused")

	c = h.remoteSudo(501)
	c.send(approval(remoteFrom(100, "foo")))
	c.send(answer(t, other, c.readMessage().raw, verifiedAllow))
	c.want(replyNo, "quoin-sudo: not a listed key")

	// A window answer that opens a window of its own is refused.
	c = h.remoteSudo(502)
	c.send(approval(remoteFrom(100, "foo")))
	c.send(answer(t, k, c.readMessage().raw, sudomsg.Answer{Decision: sudomsg.Allow, Presence: sudomsg.Verified, Window: 60}))
	c.want(replyNo, "quoin-sudo: a window of 60s, over the 0s offered")

	// Danger inside the window is the window's question too.
	c = h.remoteSudo(503)
	c.send(approval(remoteFrom(100, "sshd.service")))
	if m := c.readMessage().msg; m.Decision != sudomsg.Question || m.WindowKey == nil || m.Window != 0 {
		t.Errorf("danger inside the window %+v", m)
	}

	// Another claude is not inside it.
	c = h.remoteSudo(504)
	c.send(approval(remoteFrom(300, "foo")))
	if m := c.readMessage().msg; m.Decision != sudomsg.Dialog || m.WindowKey != nil {
		t.Errorf("another claude %+v", m)
	}
}

func TestARemoteWindowsAnswerCountsAfterItEndsAndThenItIsADialog(t *testing.T) {
	h := newHarness(t)
	k := agentKey(t)
	h.remote(k)
	h.remoteWindow(100, k, 15*time.Minute)
	c := h.remoteSudo(500)
	c.send(approval(remoteFrom(100, "foo")))
	r := c.readMessage()
	h.advance(time.Hour)
	c.send(answer(t, k, r.raw, sudomsg.Answer{Decision: sudomsg.Allow, Presence: sudomsg.PresenceNone}))
	c.want(replyYes, "")

	c = h.remoteSudo(501)
	c.send(approval(remoteFrom(100, "foo")))
	if m := c.readMessage().msg; m.Decision != sudomsg.Dialog || m.WindowKey != nil {
		t.Errorf("after the window %+v", m)
	}
}

func TestAWindowOfOneKindNeverCoversASudoOfTheOther(t *testing.T) {
	h := newHarness(t)
	k := agentKey(t)
	h.remote(k)
	h.openWindow(100, 900)
	c := h.remoteSudo(500)
	c.send(approval(remoteFrom(100, "foo")))
	if m := c.readMessage().msg; m.Decision != sudomsg.Dialog || m.Presence != sudomsg.Required {
		t.Errorf("a remote sudo inside a local window %+v", m)
	}

	h = newHarness(t)
	h.remote(k)
	h.remoteWindow(100, k, 15*time.Minute)
	c = h.sudo(500)
	c.send(approval(restart(claude(100), "foo")))
	if a := h.next(); !a.q.Password {
		t.Errorf("a local sudo inside a remote window %+v", a.q)
	}
}
