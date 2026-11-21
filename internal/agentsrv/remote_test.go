package agentsrv

import (
	"bytes"
	"crypto/rand"
	"encoding/binary"
	"errors"
	"fmt"
	"io"
	"net"
	"os"
	"path/filepath"
	"reflect"
	"slices"
	"strings"
	"testing"
	"time"

	"github.com/danielbodart/quoin/internal/galleyask"
	"github.com/danielbodart/quoin/internal/grant"
	"github.com/danielbodart/quoin/internal/sudomsg"
	"github.com/danielbodart/quoin/internal/sudoq"
	"github.com/danielbodart/quoin/peer"
	"golang.org/x/crypto/ssh"
)

// rightSecret is the one secret the fake presence helper passes.
const rightSecret = "hunter2"

// presented is what the fake presence helper was sent.
type presented struct {
	version byte
	secret  string
}

// presence serves a fake presence helper at path, as quoin-presence
// answers: a version byte, a uint16 length and the secret in, 'P' or 'F'
// out, then close. Each request goes to h.secrets.
func (h *harness) presence(path string) string {
	h.t.Helper()
	ln, err := net.Listen("unix", path)
	if err != nil {
		h.t.Fatal(err)
	}
	h.t.Cleanup(func() { ln.Close() })
	go func() {
		for {
			c, err := ln.Accept()
			if err != nil {
				return
			}
			var head [3]byte
			if _, err := io.ReadFull(c, head[:]); err == nil {
				secret := make([]byte, binary.BigEndian.Uint16(head[1:]))
				if _, err := io.ReadFull(c, secret); err == nil {
					h.secrets <- presented{head[0], string(secret)}
					reply := byte('F')
					if head[0] == presenceVersion && string(secret) == rightSecret {
						reply = 'P'
					}
					c.Write([]byte{reply})
				}
			}
			c.Close()
		}
	}()
	return path
}

// presentedNothing fails the test if the presence helper was asked.
func (h *harness) presentedNothing() {
	h.t.Helper()
	select {
	case p := <-h.secrets:
		h.t.Fatalf("the presence helper was sent %q", p.secret)
	default:
	}
}

// sudoCall is a quoin-sudo request in flight: done is nil once it answers
// allow, an error once it answers refuse or fails; answer is what it
// answered, set before done.
type sudoCall struct {
	done   chan error
	answer *sudomsg.Answer
}

var errRefusedAnswer = errors.New("answered refuse")

// sudoAsync sends a quoin-sudo request for key and msg. Its reply is read
// as the gate reads it: the answer and a signature by key over msg and the
// answer.
func (c *client) sudoAsync(key ssh.PublicKey, msg []byte) *sudoCall {
	call := &sudoCall{done: make(chan error, 1)}
	go func() {
		b, err := c.Extension(sudomsg.Extension, ssh.Marshal(struct{ Key, Msg []byte }{key.Marshal(), msg}))
		if err == nil {
			call.answer, err = readReply(key, msg, b)
		}
		if err == nil && call.answer.Decision != sudomsg.Allow {
			err = errRefusedAnswer
		}
		call.done <- err
	}()
	return call
}

func readReply(key ssh.PublicKey, msg, b []byte) (*sudomsg.Answer, error) {
	var r struct {
		Type           byte
		Answer, SigRaw []byte
	}
	if err := ssh.Unmarshal(b, &r); err != nil {
		return nil, err
	}
	if r.Type != 6 {
		return nil, fmt.Errorf("a reply of type %d", r.Type)
	}
	var sig ssh.Signature
	if err := ssh.Unmarshal(r.SigRaw, &sig); err != nil {
		return nil, err
	}
	if err := key.Verify(sudomsg.Signed(msg, r.Answer), &sig); err != nil {
		return nil, err
	}
	return sudomsg.ParseAnswer(r.Answer)
}

// sudoMessage is a remote sudo of systemctl stop sshd.service, with the
// server's chain and no danger, asked as a question, for hosts.
func sudoMessage(t *testing.T, hosts ...ssh.PublicKey) []byte {
	t.Helper()
	s := sudoSubject(serverChain())
	s.Danger, s.Env = nil, nil
	return sudoMessageFor(t, s, hosts...)
}

// forwarded is claude running ssh -A to host, whose forwarded channel
// connects to the agent.
func (h *harness) forwarded(host ssh.Signer) *client {
	h.t.Helper()
	c := h.dial(claude(100))
	if err := c.bind(h.t, host, []byte("sid"), true); err != nil {
		h.t.Fatal(err)
	}
	return c
}

func serverChain() []peer.Link {
	return []peer.Link{
		{Pid: 4242, PPid: 4241, Start: 900, UID: 1000, Comm: "bash", Cmdline: []string{"bash", "-c", "sudo systemctl stop sshd.service"}},
		{Pid: 4241, PPid: 764, Start: 800, UID: 1000, Comm: ".claude-unwrapp", Cmdline: []string{"claude"}},
		{Pid: 764, PPid: 761, Start: 700, UID: 1000, Comm: "sshd-session", Cmdline: []string{"sshd-session: dan@notty"}},
		{Pid: 761, PPid: 692, Start: 690, Comm: "sshd-session", Cmdline: []string{"sshd-session: dan [priv]"}},
		{Pid: 692, PPid: 1, Start: 100, Comm: "sshd", Cmdline: []string{"sshd: sshd -D [listener]"}},
		{Pid: 1, Start: 1, Comm: "systemd", Cmdline: []string{"/sbin/init"}},
	}
}

func sudoSubject(chain []peer.Link) sudoq.Subject {
	return sudoq.Subject{
		Argv: []string{"/run/current-system/sw/bin/systemctl", "stop", "sshd.service"},
		User: "dan", RunAs: "root", Cwd: "/home/dan",
		Danger: []string{"touches a unit that guards this machine"}, Env: []string{"LD_PRELOAD=/tmp/x.so"},
		Chain: peer.FromLinks(chain),
	}
}

// asQuestion is a gate's question: Allow or Refuse, no presence check.
func asQuestion(m *sudomsg.Message) { m.Decision, m.Presence = sudomsg.Question, sudomsg.PresenceNone }

// sudoMessageFor is s asked as a question, for hosts.
func sudoMessageFor(t *testing.T, s sudoq.Subject, hosts ...ssh.PublicKey) []byte {
	t.Helper()
	return sudoMessageWith(t, s, asQuestion, hosts...)
}

// sudoMessageWith is s for hosts, a dialog with presence required and no
// window as sudoq makes it, then as decide sets it.
func sudoMessageWith(t *testing.T, s sudoq.Subject, decide func(*sudomsg.Message), hosts ...ssh.PublicKey) []byte {
	t.Helper()
	var blobs [][]byte
	for _, h := range hosts {
		blobs = append(blobs, h.Marshal())
	}
	m := sudoq.Message(s, bytes.Repeat([]byte{7}, sudomsg.NonceSize), blobs)
	if decide != nil {
		decide(m)
	}
	b, err := m.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	return b
}

// dialogMessage is the server's sudo of systemctl stop sshd.service, a
// dialog with window seconds of window, for hosts.
func dialogMessage(t *testing.T, window uint32, hosts ...ssh.PublicKey) []byte {
	t.Helper()
	s := sudoSubject(serverChain())
	s.Danger, s.Env = nil, nil
	return sudoMessageWith(t, s, func(m *sudomsg.Message) { m.Window = window }, hosts...)
}

// checked fails the test unless msg, parsed, takes answer signed by key
// as the gate does.
func checked(t *testing.T, name string, msg []byte, a *sudomsg.Answer, key ssh.PublicKey) {
	t.Helper()
	m, err := sudomsg.Parse(msg)
	if err != nil {
		t.Fatal(err)
	}
	if err := m.Check(a, key.Marshal()); err != nil {
		t.Errorf("%s: the gate would not take %+v: %v", name, a, err)
	}
}

func appendString(b []byte, s string) []byte {
	return append(binary.BigEndian.AppendUint32(b, uint32(len(s))), s...)
}

// fieldsAt is where msg's fields string starts: after the magic, the
// nonce and the host keys.
func fieldsAt(t *testing.T, msg []byte) int {
	t.Helper()
	at := 4 + len(sudomsg.Magic)
	at += 4 + int(binary.BigEndian.Uint32(msg[at:]))
	n := int(binary.BigEndian.Uint32(msg[at:]))
	at += 4
	for range n {
		at += 4 + int(binary.BigEndian.Uint32(msg[at:]))
	}
	if int(binary.BigEndian.Uint32(msg[at:])) != len(msg)-at-4 {
		t.Fatal("the fields string is not last")
	}
	return at
}

// withField is msg with one more field, key and value, after its others.
func withField(t *testing.T, msg []byte, key, value string) []byte {
	t.Helper()
	at := fieldsAt(t, msg)
	b := slices.Clone(msg)
	b = appendString(b, key)
	b = appendString(b, value)
	binary.BigEndian.PutUint32(b[at:], uint32(len(b)-at-4))
	return b
}

// withoutField is msg with its field key left out.
func withoutField(t *testing.T, msg []byte, key string) []byte {
	t.Helper()
	at := fieldsAt(t, msg)
	var f []byte
	found := false
	for r := msg[at+4:]; len(r) > 0; {
		k := r[4 : 4+binary.BigEndian.Uint32(r)]
		r = r[4+len(k):]
		v := r[4 : 4+binary.BigEndian.Uint32(r)]
		r = r[4+len(v):]
		if string(k) == key {
			found = true
			continue
		}
		f = appendString(appendString(f, string(k)), string(v))
	}
	if !found {
		t.Fatalf("no field %q", key)
	}
	return appendString(slices.Clone(msg[:at]), string(f))
}

func TestARemoteSudoIsAskedOnlyWhenForwardedAndBoundToOneOfItsHostKeys(t *testing.T) {
	h := newHarness(t, 1, nil)
	msg := sudoMessage(t, hostKey(t).PublicKey(), h.server.PublicKey())

	refused := func(name string, c *client) {
		t.Helper()
		if err := wait(t, c.sudoAsync(h.key(0), msg).done); err == nil {
			t.Errorf("%s: allowed", name)
		}
		h.nothingAsked()
	}
	refused("unbound", h.dial(claude(100)))
	direct := h.dial(claude(100))
	if err := direct.bind(t, h.server, []byte("sid"), false); err != nil {
		t.Fatal(err)
	}
	refused("a direct bind", direct)
	refused("bound to another host", h.forwarded(h.github))
	lastDirect := h.forwarded(h.server)
	if err := lastDirect.bind(t, h.server, []byte("onward"), false); err != nil {
		t.Fatal(err)
	}
	refused("a forwarded bind followed by a direct one", lastDirect)
	log := h.log.String()
	for _, w := range []string{
		`"reason":"remote sudo bound to ` + ssh.FingerprintSHA256(h.github.PublicKey()),
		`"reason":"remote sudo on a connection that is not forwarded"`,
		`"reason":"remote sudo on an unbound connection"`,
	} {
		if !strings.Contains(log, w) {
			t.Errorf("the journal lacks %s:\n%s", w, log)
		}
	}

	call := h.forwarded(h.server).sudoAsync(h.key(0), msg)
	h.next().reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	checked(t, "bound", msg, call.answer, h.key(0))
}

func TestAPlainSignOverAQuoinSudoMessageIsRefusedUnasked(t *testing.T) {
	h := newHarness(t, 1, nil)
	h.s.HostKeys = ownHostKeys(t, h.server.PublicKey())
	h.loginSigner.Store(true)
	for name, c := range map[string]*client{
		"forwarded and bound to its host": h.forwarded(h.server),
		"this machine's, from mosey":      h.relayed(),
	} {
		h.refusedUnasked(t, name, c.signAsync(h.key(0), sudoMessage(t, h.server.PublicKey())))
		h.refusedUnasked(t, name+", a dialog", c.signAsync(h.key(0), dialogMessage(t, 0, h.server.PublicKey())))
	}
	h.refusedUnasked(t, "the magic alone", h.forwarded(h.server).signAsync(h.key(0), appendString(nil, sudomsg.Magic)))
	if n := strings.Count(h.log.String(), `"reason":"a quoin-sudo message is answered only through quoin-sudo@quoin"`); n != 5 {
		t.Errorf("%d refusals in the journal:\n%s", n, h.log.String())
	}
	h.presentedNothing()
}

func TestARemoteSudoMessageThatDoesNotParseStrictlyIsRefusedUnasked(t *testing.T) {
	h := newHarness(t, 1, nil)
	h.loginSigner.Store(true)
	host := h.server.PublicKey()
	good := sudoMessage(t, host)
	head := func(nonce string, hosts []string) []byte {
		b := appendString(nil, sudomsg.Magic)
		b = appendString(b, nonce)
		b = binary.BigEndian.AppendUint32(b, uint32(len(hosts)))
		for _, k := range hosts {
			b = appendString(b, k)
		}
		return b
	}
	nonce := strings.Repeat("n", sudomsg.NonceSize)
	blob := string(host.Marshal())
	fields := good[len(head(nonce, []string{blob})):]
	// An old gate's message: the user, runas and cwd strings, argv, a
	// level and its reasons, where the fields now are.
	old := head(nonce, []string{blob})
	for _, s := range []string{"dan", "root", "/"} {
		old = appendString(old, s)
	}
	old = binary.BigEndian.AppendUint32(old, 1)
	old = appendString(old, "/bin/id")
	old = appendString(old, "")
	old = binary.BigEndian.AppendUint32(old, 0)
	for name, msg := range map[string][]byte{
		"a short nonce":   append(head(nonce[1:], []string{blob}), fields...),
		"no host keys":    append(head(nonce, nil), fields...),
		"a bad key blob":  append(head(nonce, []string{blob, "junk"}), fields...),
		"cut short":       good[:len(good)-1],
		"trailing bytes":  append(bytes.Clone(good), 0),
		"argv unmarked":   withField(t, good, "argv", ""),
		"an old gate's":   old,
		"no decision":     withoutField(t, good, "!decision"),
		"no presence":     withoutField(t, good, "!presence"),
		"no window":       withoutField(t, good, "!window"),
		"before decision": withoutField(t, withoutField(t, withoutField(t, good, "!decision"), "!presence"), "!window"),
		"a plain sign's":  make([]byte, 32),
	} {
		if err := wait(t, h.forwarded(h.server).sudoAsync(h.key(0), msg).done); err == nil {
			t.Errorf("%s: allowed", name)
		}
		h.nothingAsked()
	}
	for name, contents := range map[string][]byte{
		"a key that does not parse": ssh.Marshal(struct{ Key, Msg []byte }{[]byte("junk"), good}),
		"trailing bytes":            append(ssh.Marshal(struct{ Key, Msg []byte }{h.key(0).Marshal(), good}), 0),
		"no message":                ssh.Marshal(struct{ Key []byte }{h.key(0).Marshal()}),
	} {
		if _, err := h.forwarded(h.server).Extension(sudomsg.Extension, contents); err == nil {
			t.Errorf("%s: answered", name)
		}
		h.nothingAsked()
	}
	if !strings.Contains(h.log.String(), `no field \"decision\"`) {
		t.Errorf("the journal lacks the reason:\n%s", h.log.String())
	}
	call := h.forwarded(h.server).sudoAsync(h.key(0), good)
	h.next().reply <- answered{}
	if err := wait(t, call.done); err == nil {
		t.Error("a refused remote sudo was allowed")
	}
}

func TestARemoteSudoForAKeyThisAgentDoesNotHoldIsRefusedUnasked(t *testing.T) {
	h := newHarness(t, 1, nil)
	other := hostKey(t).PublicKey()
	if err := wait(t, h.forwarded(h.server).sudoAsync(other, sudoMessage(t, h.server.PublicKey())).done); err == nil {
		t.Error("allowed")
	}
	h.nothingAsked()
	if !strings.Contains(h.log.String(), `"reason":"remote sudo: not a key this agent holds: `+ssh.FingerprintSHA256(other)) {
		t.Errorf("the journal lacks the reason:\n%s", h.log.String())
	}
}

func TestARemoteSudoIsNeverSilentNorGranted(t *testing.T) {
	h := newHarness(t, 1, nil)
	msg := sudoMessage(t, h.github.PublicKey())
	ask := func(name string, c *client, answer answered) {
		t.Helper()
		call := c.sudoAsync(h.key(0), msg)
		a := h.next()
		if a.q.Grantable || a.q.Password || a.q.Allow != "Allow" {
			t.Errorf("%s: asked %+v", name, a.q)
		}
		a.reply <- answer
		if err := wait(t, call.done); (err == nil) != answer.a.Allowed {
			t.Errorf("%s: %v", name, err)
		}
	}
	h.loginSigner.Store(true)
	ask("a login signer's main process", h.forwarded(h.github), answered{})
	h.loginSigner.Store(false)

	tabConn := h.dial(tab())
	if err := tabConn.bind(t, h.github, []byte("sid"), true); err != nil {
		t.Fatal(err)
	}
	ask("a terminal chain", tabConn, answered{})

	r := claude(100)
	h.s.Grants.Grant(grant.Key{
		Anchor: grant.Anchor{Pid: r.Anchor.Pid, Start: r.Anchor.Start},
		Host:   ssh.FingerprintSHA256(h.github.PublicKey()), KeyFP: ssh.FingerprintSHA256(h.key(0)), Fwd: true,
	}, grant.Now()+time.Hour)
	ask("under a live grant", h.forwarded(h.github), answered{})

	ask("an Allow for 15 minutes", h.forwarded(h.github), allowFor(15*time.Minute))
	ask("after that Allow", h.forwarded(h.github), answered{})
}

func TestAnotherForwardedBoundSignIsAskedAllowOnceAndAnUnboundOneRefused(t *testing.T) {
	h := newHarness(t, 1, nil)
	h.loginSigner.Store(true)
	challenge := make([]byte, 32)
	rand.Read(challenge)

	if err := wait(t, h.dial(claude(100)).signAsync(h.key(0), challenge)); err == nil {
		t.Error("an unbound sign was made")
	}
	direct := h.dial(claude(100))
	if err := direct.bind(t, h.github, []byte("sid"), false); err != nil {
		t.Fatal(err)
	}
	if err := wait(t, direct.signAsync(h.key(0), challenge)); err == nil {
		t.Error("a direct bound sign was made")
	}
	h.nothingAsked()

	c := h.forwarded(h.github)
	done := c.signAsync(h.key(0), challenge)
	a := h.next()
	if a.q.Title != "agent signature on github.com" || a.q.Grantable || a.q.Allow != "" ||
		!strings.Contains(a.q.Text, "\nforwarded\nbound to github.com") {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- allowFor(15 * time.Minute)
	if err := wait(t, done); err != nil {
		t.Fatal(err)
	}
	done = c.signAsync(h.key(0), challenge)
	h.next().reply <- answered{}
	if err := wait(t, done); err == nil {
		t.Error("an Allow made a grant")
	}
}

func TestARemoteSudoIsAskedAsItsHostWouldAskItWithThisMachineOnlyFromHere(t *testing.T) {
	h := newHarness(t, 1, nil)
	fp := ssh.FingerprintSHA256(h.key(0))
	s := sudoSubject(serverChain())
	msg := sudoMessageFor(t, s, h.github.PublicKey())
	call := h.forwarded(h.github).sudoAsync(h.key(0), msg)
	a := h.next()
	local := sudoq.Question(s, sudoq.Options{})
	want := local.Text + "\n\nfrom here: " + galleyask.Summary(claude(100)) + "\nkey " + fp + " (dan@test)"
	if a.q.Title != "sudo systemctl stop sshd.service on github.com" || a.q.Level != "danger" || a.q.Text != want {
		t.Errorf("asked %q %q\n%s\nwant\n%s", a.q.Title, a.q.Level, a.q.Text, want)
	}
	if !reflect.DeepEqual(a.q.Chain.Rows, local.Chain.Rows) || a.q.Chain.Summary != "github.com: claude ← sudo systemctl stop sshd.service" {
		t.Errorf("table %+v", a.q.Chain)
	}
	if a.q.Grantable || a.q.Password || a.q.Allow != "Allow" {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	want2 := sudomsg.Answer{Decision: sudomsg.Allow, Presence: sudomsg.PresenceNone,
		Hops: []sudomsg.Hop{{HostKey: h.github.PublicKey().Marshal(), Forwarded: true}}}
	if !reflect.DeepEqual(*call.answer, want2) {
		t.Errorf("answered %+v", call.answer)
	}
	checked(t, "a question", msg, call.answer, h.key(0))
	h.presentedNothing()
	log := h.log.String()
	for _, w := range []string{`"remote_chain":[{"Pid":4242`, `"sshd-session: dan@notty"`, `"class":"remote sudo"`, `"nonce":"0707`, `"danger":["touches a unit that guards this machine"]`,
		`"env":["LD_PRELOAD=/tmp/x.so"]`, `"cmdlines_left_out":false`, `"chain":[{"Pid":103`, `"outcome":"sign"`,
		`"decision":"question"`, `"presence":"none"`, `"window":0`, `"answer":"allow"`, `"answer_presence":"none"`, `"answer_window":0`,
		`"hops":["` + ssh.FingerprintSHA256(h.github.PublicKey()) + `"]`, `"source":"galley"`} {
		if !strings.Contains(log, w) {
			t.Errorf("the journal lacks %s:\n%s", w, log)
		}
	}
}

func TestARemoteSudoIsAWarningWhenEitherChainIsCutAndSaysWhich(t *testing.T) {
	h := newHarness(t, 1, nil)
	plain := sudoSubject(serverChain())
	plain.Danger, plain.Env = nil, nil
	cutThere := plain
	cutThere.Chain = peer.FromLinks(serverChain()[:2])
	for _, tc := range []struct {
		name  string
		s     sudoq.Subject
		here  *peer.Requester
		level string
		lines []string
	}{
		{"neither", plain, claude(100), "normal", nil},
		{"there", cutThere, claude(100), "warning", []string{"the process chain was cut short"}},
		{"here", plain, links(claude(100).Chain[:4]...), "warning", []string{"from here: the process chain was cut short"}},
	} {
		c := h.dial(tc.here)
		if err := c.bind(t, h.github, []byte("sid"), true); err != nil {
			t.Fatal(err)
		}
		call := c.sudoAsync(h.key(0), sudoMessageFor(t, tc.s, h.github.PublicKey()))
		a := h.next()
		text := strings.Split(a.q.Text, "\n")
		for _, l := range tc.lines {
			if !slices.Contains(text, l) {
				t.Errorf("%s: no %q in\n%s", tc.name, l, a.q.Text)
			}
		}
		if a.q.Level != tc.level || (tc.lines == nil && strings.Contains(a.q.Text, "cut short")) {
			t.Errorf("%s: asked %q\n%s", tc.name, a.q.Level, a.q.Text)
		}
		a.reply <- answered{}
		wait(t, call.done)
	}
}

func TestARemoteSudoWithAFieldThisSignerDoesNotKnowIsAskedWithoutItUnlessItIsCritical(t *testing.T) {
	h := newHarness(t, 1, nil)
	good := sudoMessageFor(t, sudoSubject(serverChain()), h.github.PublicKey())
	call := h.forwarded(h.github).sudoAsync(h.key(0), good)
	plain := h.next()
	plain.reply <- answered{}
	wait(t, call.done)
	noted := withField(t, good, "zz-note", "shown nowhere")
	call = h.forwarded(h.github).sudoAsync(h.key(0), noted)
	a := h.next()
	if a.q.Text != plain.q.Text || a.q.Title != plain.q.Title || a.q.Level != plain.q.Level || !reflect.DeepEqual(a.q.Chain, plain.q.Chain) {
		t.Errorf("asked\n%+v\nnot as\n%+v", a.q, plain.q)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	checked(t, "an unmarked field", noted, call.answer, h.key(0))
	if !strings.Contains(h.log.String(), `"fields_ignored":["zz-note"]`) {
		t.Errorf("the journal does not name the ignored field:\n%s", h.log.String())
	}
	if err := wait(t, h.forwarded(h.github).sudoAsync(h.key(0), withField(t, good, "!zz-note", "x")).done); err == nil {
		t.Error("a critical field this signer does not know was allowed")
	}
	h.nothingAsked()
	if !strings.Contains(h.log.String(), `a critical field this signer does not know: \"zz-note\"`) {
		t.Errorf("the journal lacks the reason:\n%s", h.log.String())
	}
}

func TestADialogChecksTheSecretWithThePresenceHelperAndAnswersVerified(t *testing.T) {
	h := newHarness(t, 1, nil)
	msg := dialogMessage(t, 0, h.github.PublicKey())
	call := h.forwarded(h.github).sudoAsync(h.key(0), msg)
	a := h.next()
	if !a.q.Password || a.q.Grantable || a.q.Title != "sudo systemctl stop sshd.service on github.com" ||
		strings.Contains(a.q.Text, wrongLine) {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true, Password: []byte(rightSecret), For: time.Hour}}
	if p := <-h.secrets; p != (presented{presenceVersion, rightSecret}) {
		t.Errorf("the presence helper was sent %+v", p)
	}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	if a := call.answer; a.Presence != sudomsg.Verified || a.Window != 0 || a.Decision != sudomsg.Allow {
		t.Errorf("answered %+v", a)
	}
	checked(t, "a dialog", msg, call.answer, h.key(0))
	log := h.log.String()
	for _, w := range []string{`"decision":"dialog"`, `"presence":"required"`, `"answer_presence":"verified"`, `"source":"presence"`, `"secrets_wrong":0`} {
		if !strings.Contains(log, w) {
			t.Errorf("the journal lacks %s:\n%s", w, log)
		}
	}
	if strings.Contains(log, rightSecret) {
		t.Errorf("the journal has the secret:\n%s", log)
	}
}

func TestADialogOffersAWindowNoLongerThanTheMessagesAndAnswersIt(t *testing.T) {
	h := newHarness(t, 1, nil)
	msg := dialogMessage(t, 3600, h.github.PublicKey())
	for _, tc := range []struct {
		name string
		for_ time.Duration
		want uint32
	}{
		{"once", 0, 0},
		{"15 minutes", 15 * time.Minute, 900},
		{"a day", 24 * time.Hour, 3600},
	} {
		call := h.forwarded(h.github).sudoAsync(h.key(0), msg)
		a := h.next()
		if !a.q.Password || !a.q.Grantable {
			t.Errorf("%s: asked %+v", tc.name, a.q)
		}
		a.reply <- answered{a: galleyask.Answer{Allowed: true, Password: []byte(rightSecret), For: tc.for_}}
		<-h.secrets
		if err := wait(t, call.done); err != nil {
			t.Fatalf("%s: %v", tc.name, err)
		}
		if call.answer.Window != tc.want || call.answer.Presence != sudomsg.Verified {
			t.Errorf("%s: answered %+v", tc.name, call.answer)
		}
		checked(t, tc.name, msg, call.answer, h.key(0))
	}
	if !strings.Contains(h.log.String(), `"window":3600`) || !strings.Contains(h.log.String(), `"answer_window":900`) {
		t.Errorf("the journal:\n%s", h.log.String())
	}
}

func TestAWrongSecretAsksAgainAndNoPassIsKept(t *testing.T) {
	h := newHarness(t, 1, nil)
	msg := dialogMessage(t, 0, h.github.PublicKey())
	c := h.forwarded(h.github)
	call := c.sudoAsync(h.key(0), msg)
	first := h.next()
	first.reply <- answered{a: galleyask.Answer{Allowed: true, Password: []byte("wrong")}}
	if p := <-h.secrets; p.secret != "wrong" {
		t.Errorf("sent %q", p.secret)
	}
	again := h.asked(t, "after a wrong secret", call.done)
	if !again.q.Password || !strings.HasPrefix(again.q.Text, wrongLine+"\n\n") || again.q.Title != first.q.Title {
		t.Errorf("asked again %+v", again.q)
	}
	again.reply <- answered{a: galleyask.Answer{Allowed: true, Password: []byte(rightSecret)}}
	<-h.secrets
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(h.log.String(), `"secrets_wrong":1`) {
		t.Errorf("the journal:\n%s", h.log.String())
	}

	// The next dialog, on the same connection, is checked again.
	call = c.sudoAsync(h.key(0), msg)
	a := h.next()
	if strings.Contains(a.q.Text, wrongLine) {
		t.Errorf("asked %q", a.q.Text)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true, Password: []byte("wrong")}}
	<-h.secrets
	h.next().reply <- answered{}
	if err := wait(t, call.done); !errors.Is(err, errRefusedAnswer) {
		t.Fatalf("got %v, want a refusal", err)
	}
	if a := call.answer; a.Presence != sudomsg.PresenceNone || a.Window != 0 {
		t.Errorf("answered %+v", a)
	}
}

func TestASecretThatCannotGoIsAskedForAgainWithoutTheHelper(t *testing.T) {
	h := newHarness(t, 1, nil)
	msg := dialogMessage(t, 0, h.github.PublicKey())
	call := h.forwarded(h.github).sudoAsync(h.key(0), msg)
	for _, secret := range []string{"", "a\nb", "a\x00b", strings.Repeat("x", maxSecret+1)} {
		h.next().reply <- answered{a: galleyask.Answer{Allowed: true, Password: []byte(secret)}}
	}
	a := h.next()
	if strings.Contains(a.q.Text, wrongLine) {
		t.Errorf("asked %q", a.q.Text)
	}
	h.presentedNothing()
	a.reply <- answered{a: galleyask.Answer{Allowed: true, Password: []byte(rightSecret)}}
	if p := <-h.secrets; p.secret != rightSecret {
		t.Errorf("sent %q", p.secret)
	}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
}

func TestARefusedRemoteSudoIsASignedRefusalTheGateDoesNotTake(t *testing.T) {
	h := newHarness(t, 1, nil)
	for name, msg := range map[string][]byte{
		"a dialog":   dialogMessage(t, 3600, h.github.PublicKey()),
		"a question": sudoMessage(t, h.github.PublicKey()),
	} {
		call := h.forwarded(h.github).sudoAsync(h.key(0), msg)
		h.next().reply <- answered{}
		if err := wait(t, call.done); !errors.Is(err, errRefusedAnswer) {
			t.Fatalf("%s: got %v, want a refusal", name, err)
		}
		want := sudomsg.Answer{Decision: sudomsg.Refuse, Presence: sudomsg.PresenceNone,
			Hops: []sudomsg.Hop{{HostKey: h.github.PublicKey().Marshal(), Forwarded: true}}}
		if !reflect.DeepEqual(*call.answer, want) {
			t.Errorf("%s: answered %+v", name, call.answer)
		}
		m, _ := sudomsg.Parse(msg)
		if m.Check(call.answer, h.key(0).Marshal()) == nil {
			t.Errorf("%s: the gate would take a refusal", name)
		}
	}
	h.presentedNothing()
	if n := strings.Count(h.log.String(), `"outcome":"refuse"`); n != 2 {
		t.Errorf("%d refusals in the journal:\n%s", n, h.log.String())
	}
}

func TestADialogWithNoPresenceHelperIsRefused(t *testing.T) {
	h := newHarness(t, 1, nil)
	msg := dialogMessage(t, 0, h.github.PublicKey())
	for name, path := range map[string]string{
		"none set":    "",
		"none there":  filepath.Join(t.TempDir(), "sock"),
		"a directory": t.TempDir(),
	} {
		h.s.Presence = path
		call := h.forwarded(h.github).sudoAsync(h.key(0), msg)
		h.next().reply <- answered{a: galleyask.Answer{Allowed: true, Password: []byte(rightSecret)}}
		if err := wait(t, call.done); err == nil || errors.Is(err, errRefusedAnswer) {
			t.Errorf("%s: got %v, want a failure", name, err)
		}
	}
	log := h.log.String()
	if !strings.Contains(log, `"err":"no presence helper"`) || strings.Count(log, `"source":"presence"`) != 3 ||
		strings.Contains(log, `"outcome":"sign"`) {
		t.Errorf("the journal:\n%s", log)
	}
}

func TestAQuestionInsideAWindowAnswersPresenceNone(t *testing.T) {
	h := newHarness(t, 2, nil)
	s := sudoSubject(serverChain())
	inWindow := func(key ssh.PublicKey) func(*sudomsg.Message) {
		return func(m *sudomsg.Message) {
			asQuestion(m)
			m.WindowKey = key.Marshal()
		}
	}
	msg := sudoMessageWith(t, s, inWindow(h.key(0)), h.github.PublicKey())
	call := h.forwarded(h.github).sudoAsync(h.key(0), msg)
	a := h.next()
	if a.q.Password || a.q.Grantable || a.q.Allow != "Allow" || a.q.Level != "danger" {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	if a := call.answer; a.Presence != sudomsg.PresenceNone || a.Window != 0 {
		t.Errorf("answered %+v", a)
	}
	checked(t, "in a window", msg, call.answer, h.key(0))
	if !strings.Contains(h.log.String(), `"window_key":"`+ssh.FingerprintSHA256(h.key(0))+`"`) {
		t.Errorf("the journal:\n%s", h.log.String())
	}

	// Neither is an answer the gate takes, so neither is asked.
	for name, msg := range map[string][]byte{
		"another key's window":          sudoMessageWith(t, s, inWindow(h.key(1)), h.github.PublicKey()),
		"a question requiring presence": sudoMessageWith(t, s, func(m *sudomsg.Message) { m.Decision = sudomsg.Question }, h.github.PublicKey()),
	} {
		h.refusedUnasked(t, name, h.forwarded(h.github).sudoAsync(h.key(0), msg).done)
	}
	log := h.log.String()
	for _, w := range []string{`"reason":"remote sudo: another key's window"`, `"reason":"remote sudo: a question that requires presence"`} {
		if !strings.Contains(log, w) {
			t.Errorf("the journal lacks %s:\n%s", w, log)
		}
	}
}

func TestTheRuleThatAskedOpensTheQuestion(t *testing.T) {
	h := newHarness(t, 1, nil)
	rule := &sudomsg.Rule{Pattern: "systemctl stop *", Source: "project rule"}
	s := sudoSubject(serverChain())
	s.Rule = rule
	call := h.forwarded(h.github).sudoAsync(h.key(0), sudoMessageFor(t, s, h.github.PublicKey()))
	a := h.next()
	if !strings.HasPrefix(a.q.Text, "asked, with no password, by the project rule systemctl stop *\n\n") || a.q.Password {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	if log := h.log.String(); !strings.Contains(log, `"rule":"systemctl stop *","rule_source":"project rule"`) {
		t.Errorf("the journal:\n%s", log)
	}
}

func TestTheTitleShowsTheRouteFromTheBinds(t *testing.T) {
	h := newHarness(t, 1, nil)
	blade, desktop := h.own("dan-blade"), h.own("dan-desktop")
	msg := sudoMessage(t, desktop.PublicKey())
	call := h.through(blade, desktop).sudoAsync(h.key(0), msg)
	a := h.next()
	if a.q.Title != "sudo systemctl stop sshd.service on dan-desktop via dan-blade" ||
		a.q.Chain.Summary != "dan-desktop: claude ← sudo systemctl stop sshd.service" {
		t.Errorf("asked %q %q", a.q.Title, a.q.Chain.Summary)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	want := []sudomsg.Hop{{HostKey: blade.PublicKey().Marshal(), Forwarded: true}, {HostKey: desktop.PublicKey().Marshal(), Forwarded: true}}
	if !reflect.DeepEqual(call.answer.Hops, want) {
		t.Errorf("hops %+v", call.answer.Hops)
	}
	checked(t, "through dan-blade", msg, call.answer, h.key(0))
	if log := h.log.String(); !strings.Contains(log, `"through":["dan-blade"]`) || !strings.Contains(log, `"destination":"dan-desktop"`) {
		t.Errorf("the journal:\n%s", log)
	}
}

func TestHangingUpWithdrawsARemoteSudosQuestion(t *testing.T) {
	h := newHarness(t, 1, nil)
	c := h.forwarded(h.github)
	c.sudoAsync(h.key(0), dialogMessage(t, 0, h.github.PublicKey()))
	a := h.next()
	c.c.Close()
	<-a.withdrawn
}

func TestABindAfterOneThatDoesNotForwardIsRefused(t *testing.T) {
	h := newHarness(t, 1, nil)
	c := h.dial(claude(100))
	if err := c.bind(t, h.server, []byte("login"), false); err != nil {
		t.Fatal(err)
	}
	for _, fwd := range []bool{false, true} {
		if err := c.bind(t, h.github, []byte(fmt.Sprint("next", fwd)), fwd); err == nil {
			t.Errorf("forwarding %v: a bind after a login's was kept", fwd)
		}
	}
	if err := c.bind(t, h.server, []byte("login"), false); err == nil {
		t.Error("the login's bind again was kept")
	}
	// The login's bind is still the last: a remote sudo for the host it
	// does not forward to is refused.
	if err := wait(t, c.sudoAsync(h.key(0), sudoMessage(t, h.github.PublicKey())).done); err == nil {
		t.Error("allowed")
	}
	h.nothingAsked()
	if n := strings.Count(h.log.String(), `"err":"a bind after one that does not forward"`); n != 3 {
		t.Errorf("%d refusals in the journal:\n%s", n, h.log.String())
	}
}

func TestASessionIDBoundAgainToAnotherKeyIsRefusedAndToTheSameKeptOnce(t *testing.T) {
	h := newHarness(t, 1, nil)
	c := h.dial(claude(100))
	if err := c.bind(t, h.server, []byte("hop"), true); err != nil {
		t.Fatal(err)
	}
	if err := c.bind(t, h.github, []byte("hop"), true); err == nil {
		t.Error("a session id bound to another key was kept")
	}
	for range maxBinds {
		if err := c.bind(t, h.server, []byte("hop"), true); err != nil {
			t.Fatalf("the same bind again: %v", err)
		}
	}
	// One bind, to the server: asked "on" it, with no "via".
	call := c.sudoAsync(h.key(0), sudoMessage(t, h.server.PublicKey()))
	a := h.next()
	if strings.Contains(a.q.Title, " via ") {
		t.Errorf("asked %q", a.q.Title)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	if len(call.answer.Hops) != 1 {
		t.Errorf("hops %+v", call.answer.Hops)
	}
	if !strings.Contains(h.log.String(), `"err":"a session id already bound to another host key"`) {
		t.Errorf("the journal:\n%s", h.log.String())
	}
}

// ownHostKeys writes keys as this machine's host keys and returns their
// glob, as quoin-signer's /etc/ssh/ssh_host_*_key.pub.
func ownHostKeys(t *testing.T, keys ...ssh.PublicKey) string {
	t.Helper()
	dir := t.TempDir()
	for i, k := range keys {
		p := filepath.Join(dir, fmt.Sprintf("ssh_host_%d_key.pub", i))
		if err := os.WriteFile(p, ssh.MarshalAuthorizedKey(k), 0o644); err != nil {
			t.Fatal(err)
		}
	}
	return filepath.Join(dir, "ssh_host_*_key.pub")
}

// moseyTab is a mosey client named comm, run from a terminal tab: what
// connects to the agent for a mosey session attached from that terminal.
func moseyTab(comm string) *peer.Requester {
	return links(peer.Link{Pid: 40, PPid: 30, Sid: 30, TTY: pts0, Start: 40, Comm: comm, Cmdline: []string{"mosey"}},
		tabShell, kgx, systemdUser, pid1)
}

// relayed is a connection that sends no bind, as a local mosey session's
// agent relay makes, from mosey in a terminal.
func (h *harness) relayed() *client {
	return h.dial(moseyTab("mosey"))
}

// asked is the question a request put, failing the test if it was decided
// without one.
func (h *harness) asked(t *testing.T, name string, done <-chan error) *asked {
	t.Helper()
	select {
	case a := <-h.questions:
		return a
	case err := <-done:
		t.Fatalf("%s: decided unasked: %v", name, err)
		return nil
	}
}

// refusedUnasked fails the test unless a request was refused with no
// question; one it asks is refused, so the test goes on.
func (h *harness) refusedUnasked(t *testing.T, name string, done <-chan error) {
	t.Helper()
	select {
	case a := <-h.questions:
		t.Errorf("%s: asked %q", name, a.q.Title)
		a.reply <- answered{}
		<-done
	case err := <-done:
		if err == nil {
			t.Errorf("%s: allowed", name)
		}
	}
}

func TestASudoOfThisMachineOnAnUnboundConnectionIsAskedAsItsGateAsksALocalSudo(t *testing.T) {
	other := hostKey(t)
	h := newHarness(t, 1, nil)
	h.s.HostKeys = ownHostKeys(t, h.server.PublicKey(), other.PublicKey())
	s := sudoSubject(serverChain())
	for _, tc := range []struct {
		name  string
		from  string
		hosts []ssh.PublicKey
	}{
		{"all its host keys", "mosey", []ssh.PublicKey{h.server.PublicKey(), other.PublicKey()}},
		{"one of them", "mosey", []ssh.PublicKey{other.PublicKey()}},
		{"from nixpkgs' wrapped mosey", ".mosey-wrapped", []ssh.PublicKey{h.server.PublicKey(), other.PublicKey()}},
	} {
		msg := sudoMessageFor(t, s, tc.hosts...)
		call := h.dial(moseyTab(tc.from)).sudoAsync(h.key(0), msg)
		a := h.asked(t, tc.name, call.done)
		local := sudoq.Question(s, sudoq.Options{})
		if a.q.Title != "sudo systemctl stop sshd.service" || a.q.Text != local.Text || a.q.Level != "danger" ||
			!reflect.DeepEqual(a.q.Chain, local.Chain) {
			t.Errorf("%s: asked %q %q\n%s\nwant\n%s", tc.name, a.q.Title, a.q.Level, a.q.Text, local.Text)
		}
		if a.q.Grantable || a.q.Password || a.q.Always || a.q.Diff != nil || a.q.Allow != "Allow" ||
			strings.Contains(a.q.Text, sudoq.Here) {
			t.Errorf("%s: asked %+v", tc.name, a.q)
		}
		a.reply <- answered{a: galleyask.Answer{Allowed: true}}
		if err := wait(t, call.done); err != nil {
			t.Fatalf("%s: %v", tc.name, err)
		}
		if call.answer.Hops != nil {
			t.Errorf("%s: hops %+v", tc.name, call.answer.Hops)
		}
		checked(t, tc.name, msg, call.answer, h.key(0))
	}
	log := h.log.String()
	for _, w := range []string{`"class":"remote sudo"`, `"via":"unbound relay"`, `"forwarded":false`, `"destination":"this host"`,
		`"host_keys":["` + ssh.FingerprintSHA256(other.PublicKey()) + `"]`, `"remote_chain":[{"Pid":4242`, `"outcome":"sign"`,
		`"chain":[{"Pid":40,`, `"hops":[]`} {
		if !strings.Contains(log, w) {
			t.Errorf("the journal lacks %s:\n%s", w, log)
		}
	}
	if strings.Contains(log, `"class":"local sudo"`) {
		t.Errorf("the journal:\n%s", log)
	}
}

// A local mosey session's sudo takes the gate's decision as any other: a
// dialog takes the secret and may offer a window.
func TestASudoOfThisMachineOnAnUnboundConnectionIsADialogWhenTheGateSaysSo(t *testing.T) {
	h := newHarness(t, 1, nil)
	h.s.HostKeys = ownHostKeys(t, h.server.PublicKey())
	msg := dialogMessage(t, 3600, h.server.PublicKey())
	call := h.relayed().sudoAsync(h.key(0), msg)
	a := h.asked(t, "a dialog", call.done)
	if !a.q.Password || !a.q.Grantable || a.q.Title != "sudo systemctl stop sshd.service" {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true, Password: []byte(rightSecret), For: 15 * time.Minute}}
	<-h.secrets
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	if a := call.answer; a.Presence != sudomsg.Verified || a.Window != 900 || a.Hops != nil {
		t.Errorf("answered %+v", a)
	}
	checked(t, "a dialog", msg, call.answer, h.key(0))
}

func TestASudoOfThisMachineOnAnUnboundConnectionIsAskedEveryTime(t *testing.T) {
	h := newHarness(t, 1, nil)
	h.s.HostKeys = ownHostKeys(t, h.server.PublicKey())
	msg := sudoMessage(t, h.server.PublicKey())
	ask := func(name string, answer answered) {
		t.Helper()
		call := h.relayed().sudoAsync(h.key(0), msg)
		a := h.asked(t, name, call.done)
		if a.q.Grantable || a.q.Password || a.q.Always {
			t.Errorf("%s: asked %+v", name, a.q)
		}
		a.reply <- answer
		if err := wait(t, call.done); (err == nil) != answer.a.Allowed {
			t.Errorf("%s: %v", name, err)
		}
	}
	h.loginSigner.Store(true)
	ask("a login signer's main process", answered{})
	h.loginSigner.Store(false)
	r := moseyTab("mosey")
	for _, fwd := range []bool{false, true} {
		h.s.Grants.Grant(grant.Key{
			Anchor: grant.Anchor{Pid: r.Anchor.Pid, Start: r.Anchor.Start},
			Host:   ssh.FingerprintSHA256(h.server.PublicKey()), KeyFP: ssh.FingerprintSHA256(h.key(0)), Fwd: fwd,
		}, grant.Now()+time.Hour)
	}
	ask("under a live grant", answered{})
	ask("an Allow for 15 minutes", allowFor(15*time.Minute))
	ask("after that Allow", answered{})
}

func TestARemoteSudoOnAnUnboundConnectionIsRefusedUnlessItNamesThisMachineAloneFromMosey(t *testing.T) {
	h := newHarness(t, 1, nil)
	h.loginSigner.Store(true)
	own := ownHostKeys(t, h.server.PublicKey())
	garbage := t.TempDir()
	if err := os.WriteFile(filepath.Join(garbage, "ssh_host_ed25519_key.pub"), []byte("not a key\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	this := []ssh.PublicKey{h.server.PublicKey()}
	for _, tc := range []struct {
		name     string
		hostKeys string
		hosts    []ssh.PublicKey
	}{
		{"another host's", own, []ssh.PublicKey{h.github.PublicKey()}},
		{"this machine's and another's", own, []ssh.PublicKey{h.server.PublicKey(), h.github.PublicKey()}},
		{"no host keys set", "", this},
		{"no host keys there", filepath.Join(t.TempDir(), "ssh_host_*_key.pub"), this},
		{"a host key that does not parse", filepath.Join(garbage, "ssh_host_*_key.pub"), this},
		{"a bad glob", "[", this},
	} {
		h.s.HostKeys = tc.hostKeys
		h.refusedUnasked(t, tc.name, h.relayed().sudoAsync(h.key(0), sudoMessage(t, tc.hosts...)).done)
	}
	if n := strings.Count(h.log.String(), `"reason":"remote sudo on an unbound connection"`); n != 6 {
		t.Errorf("%d refusals for an unbound connection in the journal:\n%s", n, h.log.String())
	}

	// This machine's alone, but relayed by what is not a mosey client: an
	// ssh -A that sends no bind, or any other forwarder, may bring it from
	// another machine that knows this one's public host keys.
	h.s.HostKeys = own
	for name, r := range map[string]*peer.Requester{"an ssh": tab(), "a claude": claude(100)} {
		h.refusedUnasked(t, name, h.dial(r).sudoAsync(h.key(0), sudoMessage(t, this...)).done)
	}
	if n := strings.Count(h.log.String(), `"reason":"this host's sudo on an unbound connection, not from a mosey client"`); n != 2 {
		t.Errorf("%d refusals for not mosey in the journal:\n%s", n, h.log.String())
	}
}

func TestThisMachinesHostKeysThatDoNotReadAreLoggedAndLeftOut(t *testing.T) {
	h := newHarness(t, 1, nil)
	dir := t.TempDir()
	good := filepath.Join(dir, "ssh_host_ed25519_key.pub")
	if err := os.WriteFile(good, ssh.MarshalAuthorizedKey(h.server.PublicKey()), 0o644); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(dir, "ssh_host_rsa_key.pub"), []byte("not a key\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	unreadable := filepath.Join(dir, "ssh_host_ecdsa_key.pub")
	if err := os.WriteFile(unreadable, ssh.MarshalAuthorizedKey(h.github.PublicKey()), 0o000); err != nil {
		t.Fatal(err)
	}
	if _, err := os.ReadFile(unreadable); err == nil {
		t.Skip("a file of mode 0 reads here, as root")
	}
	h.s.HostKeys = filepath.Join(dir, "ssh_host_*_key.pub")

	// The key that reads is this machine's: its sudo is asked.
	call := h.relayed().sudoAsync(h.key(0), sudoMessage(t, h.server.PublicKey()))
	h.asked(t, "the key that reads", call.done).reply <- answered{}
	wait(t, call.done)
	// The unreadable one is left out, so a message naming it is not this
	// machine's alone.
	h.refusedUnasked(t, "naming an unreadable host key",
		h.relayed().sudoAsync(h.key(0), sudoMessage(t, h.server.PublicKey(), h.github.PublicKey())).done)
	h.s.HostKeys = "["
	h.refusedUnasked(t, "a bad glob", h.relayed().sudoAsync(h.key(0), sudoMessage(t, h.server.PublicKey())).done)
	log := h.log.String()
	for _, w := range []string{
		`"msg":"host key unreadable","path":"` + unreadable + `"`,
		`"msg":"host key skipped","path":"` + filepath.Join(dir, "ssh_host_rsa_key.pub") + `"`,
		`"msg":"host keys unreadable","glob":"["`,
	} {
		if !strings.Contains(log, w) {
			t.Errorf("the journal lacks %s:\n%s", w, log)
		}
	}
}

func TestThisMachinesHostKeysChangeNothingOnABoundConnection(t *testing.T) {
	h := newHarness(t, 1, nil)
	h.s.HostKeys = ownHostKeys(t, h.github.PublicKey())
	msg := sudoMessage(t, h.github.PublicKey())

	direct := h.dial(claude(100))
	if err := direct.bind(t, h.github, []byte("sid"), false); err != nil {
		t.Fatal(err)
	}
	if err := wait(t, direct.sudoAsync(h.key(0), msg).done); err == nil {
		t.Error("a direct bind: allowed")
	}
	if err := wait(t, h.forwarded(h.server).sudoAsync(h.key(0), msg).done); err == nil {
		t.Error("bound to another host: allowed")
	}
	h.nothingAsked()

	call := h.forwarded(h.github).sudoAsync(h.key(0), msg)
	a := h.next()
	if a.q.Title != "sudo systemctl stop sshd.service on github.com" || !strings.Contains(a.q.Text, sudoq.Here) {
		t.Errorf("asked %q\n%s", a.q.Title, a.q.Text)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, call.done); err != nil {
		t.Fatal(err)
	}
	if log := h.log.String(); !strings.Contains(log, `"class":"remote sudo"`) || strings.Contains(log, `"via"`) {
		t.Errorf("the journal:\n%s", log)
	}
}
