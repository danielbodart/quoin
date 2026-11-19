package agentsrv

import (
	"bytes"
	"crypto/rand"
	"encoding/binary"
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

// sudoMessage is a remote sudo of systemctl stop sshd.service, with the
// server's chain and no danger, for hosts.
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

func TestARemoteSudoSignIsAskedOnlyWhenForwardedAndBoundToOneOfItsHostKeys(t *testing.T) {
	h := newHarness(t, 1, nil)
	msg := sudoMessage(t, hostKey(t).PublicKey(), h.server.PublicKey())

	refused := func(name string, c *client) {
		t.Helper()
		if err := wait(t, c.signAsync(h.key(0), msg)); err == nil {
			t.Errorf("%s: signed", name)
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
	if !strings.Contains(h.log.String(), "remote sudo bound to "+ssh.FingerprintSHA256(h.github.PublicKey())) {
		t.Errorf("the journal lacks the reason:\n%s", h.log.String())
	}

	done := h.forwarded(h.server).signAsync(h.key(0), msg)
	h.next().reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, done); err != nil {
		t.Fatal(err)
	}
}

func appendString(b []byte, s string) []byte {
	return append(binary.BigEndian.AppendUint32(b, uint32(len(s))), s...)
}

func TestARemoteSudoMessageThatDoesNotParseStrictlyIsRefused(t *testing.T) {
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
		"a short nonce":  append(head(nonce[1:], []string{blob}), fields...),
		"no host keys":   append(head(nonce, nil), fields...),
		"a bad key blob": append(head(nonce, []string{blob, "junk"}), fields...),
		"cut short":      good[:len(good)-1],
		"trailing bytes": append(bytes.Clone(good), 0),
		"argv unmarked":  withField(t, good, "argv", ""),
		"an old gate's":  old,
	} {
		if err := wait(t, h.forwarded(h.server).signAsync(h.key(0), msg)); err == nil {
			t.Errorf("%s: signed", name)
		}
		h.nothingAsked()
	}
	done := h.forwarded(h.server).signAsync(h.key(0), good)
	h.next().reply <- answered{}
	if err := wait(t, done); err == nil {
		t.Error("a refused remote sudo was signed")
	}
}

func TestARemoteSudoSignIsNeverSilentNorGranted(t *testing.T) {
	h := newHarness(t, 1, nil)
	msg := sudoMessage(t, h.github.PublicKey())
	ask := func(name string, c *client, answer answered) {
		t.Helper()
		done := c.signAsync(h.key(0), msg)
		a := h.next()
		if a.q.Grantable || a.q.Password || a.q.Allow != "Allow" {
			t.Errorf("%s: asked %+v", name, a.q)
		}
		a.reply <- answer
		if err := wait(t, done); (err == nil) != answer.a.Allowed {
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

func sudoMessageFor(t *testing.T, s sudoq.Subject, hosts ...ssh.PublicKey) []byte {
	t.Helper()
	var blobs [][]byte
	for _, h := range hosts {
		blobs = append(blobs, h.Marshal())
	}
	b, err := sudoq.Message(s, bytes.Repeat([]byte{7}, sudomsg.NonceSize), blobs).Marshal()
	if err != nil {
		t.Fatal(err)
	}
	return b
}

func TestARemoteSudoIsAskedAsItsHostWouldAskItWithThisMachineOnlyFromHere(t *testing.T) {
	h := newHarness(t, 1, nil)
	fp := ssh.FingerprintSHA256(h.key(0))
	s := sudoSubject(serverChain())
	done := h.forwarded(h.github).signAsync(h.key(0), sudoMessageFor(t, s, h.github.PublicKey()))
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
	if err := wait(t, done); err != nil {
		t.Fatal(err)
	}
	log := h.log.String()
	for _, w := range []string{`"remote_chain":[{"Pid":4242`, `"sshd-session: dan@notty"`, `"class":"remote sudo"`, `"nonce":"0707`, `"danger":["touches a unit that guards this machine"]`,
		`"env":["LD_PRELOAD=/tmp/x.so"]`, `"cmdlines_left_out":false`, `"chain":[{"Pid":103`, `"outcome":"sign"`} {
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
		done := c.signAsync(h.key(0), sudoMessageFor(t, tc.s, h.github.PublicKey()))
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
		wait(t, done)
	}
}

// withField is msg with one more field, key and value, after its others.
func withField(t *testing.T, msg []byte, key, value string) []byte {
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
	b := slices.Clone(msg)
	b = binary.BigEndian.AppendUint32(b, uint32(len(key)))
	b = append(b, key...)
	b = binary.BigEndian.AppendUint32(b, uint32(len(value)))
	b = append(b, value...)
	binary.BigEndian.PutUint32(b[at:], uint32(len(b)-at-4))
	return b
}

func TestARemoteSudoWithAFieldThisSignerDoesNotKnowIsAskedWithoutItUnlessItIsCritical(t *testing.T) {
	h := newHarness(t, 1, nil)
	good := sudoMessageFor(t, sudoSubject(serverChain()), h.github.PublicKey())
	done := h.forwarded(h.github).signAsync(h.key(0), good)
	plain := h.next()
	plain.reply <- answered{}
	wait(t, done)
	done = h.forwarded(h.github).signAsync(h.key(0), withField(t, good, "zz-note", "shown nowhere"))
	a := h.next()
	if a.q.Text != plain.q.Text || a.q.Title != plain.q.Title || a.q.Level != plain.q.Level || !reflect.DeepEqual(a.q.Chain, plain.q.Chain) {
		t.Errorf("asked\n%+v\nnot as\n%+v", a.q, plain.q)
	}
	a.reply <- answered{a: galleyask.Answer{Allowed: true}}
	if err := wait(t, done); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(h.log.String(), `"fields_ignored":["zz-note"]`) {
		t.Errorf("the journal does not name the ignored field:\n%s", h.log.String())
	}
	if err := wait(t, h.forwarded(h.github).signAsync(h.key(0), withField(t, good, "!zz-note", "x"))); err == nil {
		t.Error("a critical field this signer does not know was signed")
	}
	h.nothingAsked()
	if !strings.Contains(h.log.String(), `a critical field this signer does not know: \"zz-note\"`) {
		t.Errorf("the journal lacks the reason:\n%s", h.log.String())
	}
}
