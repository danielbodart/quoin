package sudoq

import (
	"bytes"
	"crypto/ed25519"
	"encoding/json"
	"os"
	"path/filepath"
	"reflect"
	"strings"
	"testing"

	"github.com/danielbodart/quoin/internal/galleyask"
	"github.com/danielbodart/quoin/internal/sudomsg"
	"github.com/danielbodart/quoin/peer"
	"golang.org/x/crypto/ssh"
)

const systemctl = "/run/current-system/sw/bin/systemctl"

func hostKey(t *testing.T) []byte {
	t.Helper()
	pub, err := ssh.NewPublicKey(ed25519.NewKeyFromSeed(bytes.Repeat([]byte{1}, ed25519.SeedSize)).Public())
	if err != nil {
		t.Fatal(err)
	}
	return pub.Marshal()
}

// links are the chain as the gate has it from the plugin's records, which
// carry no Sid or Cgroup.
func links(ls ...peer.Link) []peer.Link {
	for i := range ls {
		ls[i].Sid, ls[i].Cgroup = 0, ""
	}
	return ls
}

// fixture is one of galleyask's chains read from /proc under Claude Code.
func fixture(t *testing.T, name string) []peer.Link {
	t.Helper()
	b, err := os.ReadFile(filepath.Join("..", "galleyask", "testdata", "chains", name+".json"))
	if err != nil {
		t.Fatal(err)
	}
	var ls []peer.Link
	if err := json.Unmarshal(b, &ls); err != nil {
		t.Fatal(err)
	}
	return links(ls...)
}

// server is a sudo's chain on a host it was ssh'd to: bash under claude
// under the login's sshd-session pair.
func server() []peer.Link {
	return links(
		peer.Link{Pid: 4242, PPid: 4241, Start: 900, UID: 1000, Comm: "bash", Cmdline: []string{"bash", "-c", "sudo systemctl restart foo"}},
		peer.Link{Pid: 4241, PPid: 764, Start: 800, UID: 1000, Comm: ".claude-unwrapp", Cmdline: []string{"claude"}},
		peer.Link{Pid: 764, PPid: 761, Start: 700, UID: 1000, Comm: "sshd-session", Cmdline: []string{"sshd-session: dan@notty"}},
		peer.Link{Pid: 761, PPid: 692, Start: 690, Comm: "sshd-session", Cmdline: []string{"sshd-session: dan [priv]"}},
		peer.Link{Pid: 692, PPid: 1, Start: 100, Comm: "sshd", Cmdline: []string{"sshd: /nix/store/x-openssh/bin/sshd -D [listener]"}},
		peer.Link{Pid: 1, Start: 1, Comm: "systemd", Cmdline: []string{"/run/current-system/systemd/lib/systemd/systemd"}},
	)
}

// here is the asking chain on the signer's machine: an ssh under a claude
// whose names appear nowhere in any subject.
func here() *peer.Requester {
	return peer.FromLinks([]peer.Link{
		{Pid: 9002, PPid: 9001, Start: 30, UID: 1000, Comm: "ssh", Cmdline: []string{"ssh", "-A", "server", "zz-local-only-arg"}},
		{Pid: 9001, PPid: 1, Start: 20, UID: 1000, Comm: "zz-local-claude", Cmdline: []string{"zz-local-claude"}},
		{Pid: 1, Start: 1, Comm: "systemd", Cmdline: []string{"/sbin/init"}},
	})
}

func subjects(t *testing.T) map[string]Subject {
	base := func() Subject {
		return Subject{
			Argv: []string{systemctl, "restart", "foo"}, User: "dan", RunAs: "root", Cwd: "/home/dan",
			Chain: peer.FromLinks(server()),
		}
	}
	with := func(f func(*Subject)) Subject {
		s := base()
		f(&s)
		return s
	}
	return map[string]Subject{
		"plain": base(),
		"danger": with(func(s *Subject) {
			s.Argv = []string{systemctl, "stop", "sshd.service"}
			s.Danger = []string{"touches a unit that guards this machine", "runs /tmp/x, outside the root-owned directories"}
		}),
		"variables": with(func(s *Subject) { s.Env = []string{"LD_PRELOAD=/tmp/x.so", "FOO=" + strings.Repeat("y", 200)} }),
		"cut": with(func(s *Subject) {
			s.Chain = peer.FromLinks(server()[:2])
		}),
		"no chain": with(func(s *Subject) { s.Chain = peer.FromLinks(nil) }),
		"systemd --user": with(func(s *Subject) {
			s.Chain = peer.FromLinks(links(server()[0], peer.Link{Pid: 4241, PPid: 1, Start: 50, UID: 1000, Comm: "systemd"}, server()[5]))
		}),
		"truncated": with(func(s *Subject) { s.Truncated = true }),
		"control characters": with(func(s *Subject) {
			s.Argv = []string{systemctl, "restart", "foo\x1b[2J"}
			s.Cwd = "/tmp/‮x"
			s.Danger = []string{"bad\nline"}
		}),
		"a long script": with(func(s *Subject) {
			s.Argv = []string{"/run/current-system/sw/bin/bash", "-c", strings.Repeat("echo hello && ", 20) + "true"}
		}),
		"sudo-deep":   with(func(s *Subject) { s.Chain = peer.FromLinks(fixture(t, "sudo-deep")) }),
		"sudo-direct": with(func(s *Subject) { s.Chain = peer.FromLinks(fixture(t, "sudo-direct")) }),
	}
}

// remote is s as the signer asks it: through the message's bytes.
func remote(t *testing.T, s Subject, o Options) galleyask.Question {
	t.Helper()
	raw, err := Message(s, bytes.Repeat([]byte{7}, sudomsg.NonceSize), [][]byte{hostKey(t)}).Marshal()
	if err != nil {
		t.Fatal(err)
	}
	m, err := sudomsg.Parse(raw)
	if err != nil {
		t.Fatal(err)
	}
	got, err := FromMessage(m)
	if err != nil {
		t.Fatal(err)
	}
	return Question(got, o)
}

func TestARemoteSudoIsAskedAsTheHostAsksItLocallyButForWhereAndFromWhere(t *testing.T) {
	for name, s := range subjects(t) {
		t.Run(name, func(t *testing.T) {
			local := Question(s, Options{})
			h := here()
			r := remote(t, s, Options{Host: "server", Here: h, Footer: []string{"key SHA256:x (dan@laptop)"}})
			if r.Title != local.Title+" on server" {
				t.Errorf("title %q, local %q", r.Title, local.Title)
			}
			if r.Level != local.Level {
				t.Errorf("level %q, local %q", r.Level, local.Level)
			}
			if !reflect.DeepEqual(r.Chain.Rows, local.Chain.Rows) {
				t.Errorf("rows\n%q\nlocal\n%q", r.Chain.Rows, local.Chain.Rows)
			}
			if r.Chain.Summary != "server: "+local.Chain.Summary {
				t.Errorf("summary %q, local %q", r.Chain.Summary, local.Chain.Summary)
			}
			want := local.Text + "\n\nfrom here: " + galleyask.Summary(h) + "\nkey SHA256:x (dan@laptop)"
			if r.Text != want {
				t.Errorf("text\n%s\nwant\n%s", r.Text, want)
			}
			if r.Password || r.Grantable || r.Allow != "Allow" {
				t.Errorf("%+v", r)
			}
		})
	}
}

func TestTheLocalQuestionReadsAsTheGateHasAlwaysAskedIt(t *testing.T) {
	s := subjects(t)["danger"]
	s.Env = []string{"LD_PRELOAD=/tmp/x.so"}
	s.Chain = peer.FromLinks(server()[:2])
	q := Question(s, Options{Lead: []string{"Wrong password, try again", ""}})
	want := strings.Join([]string{
		"Wrong password, try again", "",
		"touches a unit that guards this machine", "runs /tmp/x, outside the root-owned directories", "",
		"the process chain was cut short", "",
		systemctl + " stop sshd.service",
		"dan as root in /home/dan", "",
		"Run with these variables as well:", "    LD_PRELOAD=/tmp/x.so",
	}, "\n")
	if q.Text != want || q.Title != "sudo systemctl stop sshd.service" || q.Level != "danger" {
		t.Errorf("got %q %q\n%s", q.Title, q.Level, q.Text)
	}
	if q.Chain.Summary != "claude ← sudo systemctl restart foo" {
		t.Errorf("summary %q", q.Chain.Summary)
	}
}

func TestNothingOfTheAskingMachineIsShownButOnItsFromHereLines(t *testing.T) {
	for name, s := range subjects(t) {
		t.Run(name, func(t *testing.T) {
			h := peer.FromLinks(here().Chain[:2])
			q := remote(t, s, Options{Host: "server", Here: h})
			var from int
			for _, line := range strings.Split(q.Text, "\n") {
				if strings.HasPrefix(line, Here) {
					from++
					continue
				}
				if strings.Contains(line, "zz-local") || strings.Contains(line, "9001") {
					t.Errorf("%q names the asking machine", line)
				}
			}
			if from != 2 || !strings.Contains(q.Text, "\nfrom here: the process chain was cut short") {
				t.Errorf("%d from-here lines:\n%s", from, q.Text)
			}
			b, _ := json.Marshal(q.Chain)
			if bytes.Contains(b, []byte("zz-local")) || bytes.Contains(b, []byte("9001")) {
				t.Errorf("the table names the asking machine: %s", b)
			}
		})
	}
}

func TestTheAskingChainRaisesANormalLevelToAWarningAndNeverLowersOne(t *testing.T) {
	cutHere := peer.FromLinks(here().Chain[:2])
	for _, c := range []struct {
		subject string
		here    *peer.Requester
		want    string
	}{
		{"plain", here(), "normal"},
		{"plain", cutHere, "warning"},
		{"cut", here(), "warning"},
		{"danger", cutHere, "danger"},
		{"danger", here(), "danger"},
	} {
		if q := remote(t, subjects(t)[c.subject], Options{Host: "h", Here: c.here}); q.Level != c.want {
			t.Errorf("%s, here cut %v: %q", c.subject, c.here.Cut, q.Level)
		}
	}
}

func TestLevelIsDangerThenAWarningForACutOrSessionRootChain(t *testing.T) {
	ss := subjects(t)
	for name, want := range map[string]string{
		"plain": "normal", "danger": "danger", "cut": "warning", "no chain": "warning",
		"systemd --user": "warning", "truncated": "normal", "variables": "normal",
	} {
		if got := Level(ss[name]); got != want {
			t.Errorf("%s: %q, want %q", name, got, want)
		}
	}
	if got := Level(Subject{Argv: []string{"x"}}); got != "warning" {
		t.Errorf("a nil chain: %q", got)
	}
}

func TestATruncatedChainSaysSoAmongTheWarnings(t *testing.T) {
	q := Question(subjects(t)["truncated"], Options{})
	if !strings.HasPrefix(q.Text, TruncatedLine+"\n\n"+systemctl) {
		t.Errorf("text %q", q.Text)
	}
}

func TestOnlyAV2MessageWithACommandIsASubject(t *testing.T) {
	s := subjects(t)["plain"]
	m := Message(s, make([]byte, sudomsg.NonceSize), [][]byte{hostKey(t)})
	m.Argv = nil
	if _, err := FromMessage(m); err == nil {
		t.Error("no command was a subject")
	}
	for _, v := range []int{0, sudomsg.V1} {
		if _, err := FromMessage(&sudomsg.Message{Version: v, Argv: []string{"x"}}); err == nil {
			t.Errorf("version %d was a subject", v)
		}
	}
}

func TestMessageLeavesTheSubjectsChainAloneWhenItsCommandLinesAreLeftOut(t *testing.T) {
	s := subjects(t)["plain"]
	m := Message(s, make([]byte, sudomsg.NonceSize), [][]byte{hostKey(t)})
	whole, err := m.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	if _, err := m.MarshalWithin(len(whole) - 1); err != nil {
		t.Fatal(err)
	}
	if top := s.Chain.Chain[len(s.Chain.Chain)-1]; top.Cmdline == nil || m.Links[len(m.Links)-1].Cmdline != nil {
		t.Errorf("subject's top %+v, message's %+v", top, m.Links[len(m.Links)-1])
	}
	if m.Version != sudomsg.V2 || m.Level != "" || m.Reasons != nil {
		t.Errorf("%+v", m)
	}
}

func TestAV1MessageIsAskedAsSignersAlwaysAskedIt(t *testing.T) {
	m := &sudomsg.Message{
		Version: sudomsg.V1, User: "dan", RunAs: "root", Cwd: "/home/dan",
		Argv: []string{systemctl, "stop", "sshd.service"}, Level: "danger",
		Reasons: []string{"touches a unit that guards this machine"},
	}
	h := here()
	q := Legacy(m, Options{Host: "dan-desktop", Here: h, Footer: []string{"key SHA256:… (dan@dan-blade)"}})
	want := "touches a unit that guards this machine\n\n" + systemctl + " stop sshd.service\ndan as root in /home/dan\nkey SHA256:… (dan@dan-blade)"
	if q.Title != "sudo on dan-desktop" || q.Level != "danger" || q.Text != want || q.Allow != "Allow" ||
		!reflect.DeepEqual(q.Chain, galleyask.Chain(h)) {
		t.Errorf("got %+v", q)
	}
	m.Level, m.Reasons = "", nil
	if q := Legacy(m, Options{Host: "h", Here: peer.FromLinks(h.Chain[:2])}); q.Level != "warning" ||
		!strings.HasPrefix(q.Text, "the process chain was cut short\n\n") {
		t.Errorf("no level, a cut chain here: %q %q", q.Level, q.Text)
	}
}
