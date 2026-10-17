package agentsrv

import (
	"context"
	"errors"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/danielbodart/quoin/courier"
	"github.com/danielbodart/quoin/peer"
	"golang.org/x/crypto/ssh"
)

func allowGitHub(s *Server) { s.Hosts = map[string]Rule{"github.com": Allow} }

// login binds c to host, direct or forwarded, and asks for a userauth sign.
func (h *harness) login(r *peer.Requester, host ssh.Signer, fwd bool) <-chan error {
	h.t.Helper()
	c := h.dial(r)
	if err := c.bind(h.t, host, []byte("sid"), fwd); err != nil {
		h.t.Fatal(err)
	}
	return c.signAsync(h.key(0), userauthData([]byte("sid"), h.key(0), nil))
}

func TestAnAllowedHostSignsAClaudesLoginWithoutAsking(t *testing.T) {
	h := newHarness(t, 1, allowGitHub)
	if err := wait(t, h.login(claude(100), h.github, false)); err != nil {
		t.Fatal(err)
	}
	h.nothingAsked()
	if !strings.Contains(h.log.String(), `"source":"host"`) {
		t.Errorf("logged %s", h.log)
	}
}

func TestAHostSetToAskOrUnlistedIsAsked(t *testing.T) {
	for _, hosts := range []map[string]Rule{nil, {"github.com": Ask}, {"gitlab.com": Allow}} {
		h := newHarness(t, 1, func(s *Server) { s.Hosts = hosts })
		done := h.login(claude(100), h.github, false)
		a := h.next()
		if !a.q.Grantable || a.q.Title != "ssh to github.com" {
			t.Errorf("%v: asked %+v", hosts, a.q)
		}
		a.reply <- answered{}
		if err := wait(t, done); err == nil {
			t.Errorf("%v: a refused sign was made", hosts)
		}
	}
}

func TestAHostRuleNeverCoversAForwardedSign(t *testing.T) {
	h := newHarness(t, 1, allowGitHub)
	for _, r := range []*peer.Requester{claude(100), tab()} {
		done := h.login(r, h.github, true)
		a := h.next()
		if !strings.Contains(a.q.Text, "\nforwarded\n") {
			t.Errorf("asked %+v", a.q)
		}
		a.reply <- answered{}
		if err := wait(t, done); err == nil {
			t.Error("a refused forwarded sign was made")
		}
	}
}

func TestAHostRuleNeverCoversAnUnknownHost(t *testing.T) {
	h := newHarness(t, 1, allowGitHub)
	stranger := hostKey(t)
	done := h.login(claude(100), stranger, false)
	a := h.next()
	if a.q.Title != "ssh to unknown host "+ssh.FingerprintSHA256(stranger.PublicKey()) {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- answered{}
	wait(t, done)
}

// A host key known under another name is not github.com's, whatever the
// connection was meant for.
func TestAHostRuleCoversOnlyTheKeyListedUnderItsName(t *testing.T) {
	h := newHarness(t, 1, allowGitHub)
	other := hostKey(t)
	f, err := os.OpenFile(h.s.KnownHosts, os.O_APPEND|os.O_WRONLY, 0)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := f.WriteString("\ngithub.com.evil.example,|1|c2FsdA==|aGFzaA== " + string(ssh.MarshalAuthorizedKey(other.PublicKey()))); err != nil {
		t.Fatal(err)
	}
	f.Close()
	done := h.login(claude(100), other, false)
	a := h.next()
	if !strings.HasPrefix(a.q.Title, "ssh to github.com.evil.example") {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- answered{}
	wait(t, done)
}

func TestAHostRuleNeverCoversACutChain(t *testing.T) {
	h := newHarness(t, 1, allowGitHub)
	done := h.login(links(claude(100).Chain[:4]...), h.github, false)
	a := h.next()
	if a.q.Level != "warning" {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- answered{}
	wait(t, done)
}

// own lists a new host key in the known hosts file as name, one of the
// person's own machines.
func (h *harness) own(name string) ssh.Signer {
	h.t.Helper()
	k := hostKey(h.t)
	f, err := os.OpenFile(h.s.KnownHosts, os.O_APPEND|os.O_WRONLY, 0)
	if err != nil {
		h.t.Fatal(err)
	}
	defer f.Close()
	if _, err := f.WriteString("\n" + name + " " + string(ssh.MarshalAuthorizedKey(k.PublicKey()))); err != nil {
		h.t.Fatal(err)
	}
	return k
}

// through dials as a tab whose ssh forwarded the agent through each of
// hops in turn.
func (h *harness) through(hops ...ssh.Signer) *client {
	h.t.Helper()
	c := h.dial(tab())
	for _, hop := range hops {
		if err := c.bind(h.t, hop, []byte("hop"), true); err != nil {
			h.t.Fatal(err)
		}
	}
	return c
}

// pushFrom logs in to GitHub from the far end of c's forwarded hops.
func (h *harness) pushFrom(c *client) <-chan error {
	h.t.Helper()
	if err := c.bind(h.t, h.github, []byte("sid"), false); err != nil {
		h.t.Fatal(err)
	}
	return c.signAsync(h.key(0), userauthData([]byte("sid"), h.key(0), nil))
}

func gitSignature(t *testing.T) []byte {
	t.Helper()
	b, err := os.ReadFile(filepath.Join("testdata", "sshsig-git.bin"))
	if err != nil {
		t.Fatal(err)
	}
	return b
}

func TestASignForwardedThroughOwnHostsIsJudgedAsADirectOne(t *testing.T) {
	h := newHarness(t, 1, func(s *Server) {
		allowGitHub(s)
		s.ForwardedThrough = []string{"dan-blade", "dan-mac"}
	})
	blade, mac := h.own("dan-blade"), h.own("dan-mac")

	if err := wait(t, h.pushFrom(h.through(blade))); err != nil {
		t.Fatalf("a push from dan-blade: %v", err)
	}
	if err := wait(t, h.pushFrom(h.through(blade, mac))); err != nil {
		t.Fatalf("a push from dan-mac by way of dan-blade: %v", err)
	}
	if err := wait(t, h.through(blade).signAsync(h.key(0), gitSignature(t))); err != nil {
		t.Fatalf("a commit signed on dan-blade: %v", err)
	}
	h.nothingAsked()
	if !strings.Contains(h.log.String(), `"forwarded":true`) {
		t.Errorf("the journal does not say the signs were forwarded:\n%s", h.log)
	}
}

func TestAForwardedSignIsAskedUnlessEveryHopIsOwn(t *testing.T) {
	h := newHarness(t, 1, func(s *Server) {
		allowGitHub(s)
		s.ForwardedThrough = []string{"dan-blade"}
	})
	blade := h.own("dan-blade")
	elsewhere := h.own("elsewhere")
	stranger := hostKey(t)

	asked := func(name string, done <-chan error) {
		t.Helper()
		a := h.next()
		if !strings.Contains(a.q.Text, "\nforwarded\n") {
			t.Errorf("%s: asked %+v", name, a.q)
		}
		a.reply <- answered{}
		if err := wait(t, done); err == nil {
			t.Errorf("%s: a refused sign was made", name)
		}
	}
	asked("a push through a host not listed", h.pushFrom(h.through(elsewhere)))
	asked("a push through an unknown host key", h.pushFrom(h.through(stranger)))
	asked("a push through dan-blade and then a host not listed", h.pushFrom(h.through(blade, elsewhere)))
	asked("a commit signed through a host not listed", h.through(elsewhere).signAsync(h.key(0), gitSignature(t)))
}

func TestOwnHostsWidenNoRuleAndNeverRemoteSudo(t *testing.T) {
	h := newHarness(t, 1, func(s *Server) {
		s.Hosts = map[string]Rule{"github.com": Ask}
		s.ForwardedThrough = []string{"dan-blade"}
	})
	blade := h.own("dan-blade")

	done := h.pushFrom(h.through(blade))
	a := h.next()
	a.reply <- answered{}
	if err := wait(t, done); err == nil {
		t.Error("a push to a host set to ask was made unasked")
	}

	done = h.through(blade).signAsync(h.key(0), sudoMessage(t, "", nil, blade.PublicKey()))
	a = h.next()
	if a.q.Title != "sudo on dan-blade" {
		t.Errorf("asked %+v", a.q)
	}
	a.reply <- answered{}
	if err := wait(t, done); err == nil {
		t.Error("a refused remote sudo was signed")
	}
}

// A forwarded sign's asking program is the ssh here, so the project it
// runs in is not read: only the host's rules can let one through.
func TestAForwardedSignThroughOwnHostsReadsNoProject(t *testing.T) {
	h := newHarness(t, 1, func(s *Server) {
		s.Hosts = nil
		s.ForwardedThrough = []string{"dan-blade"}
		s.Policy = &Policy{}
		s.read = func(context.Context, int, uint64) (*courier.Response, error) {
			t.Error("a forwarded sign read the asking program's project")
			return nil, errors.New("not read")
		}
	})
	blade := h.own("dan-blade")
	done := h.pushFrom(h.through(blade))
	a := h.next()
	a.reply <- answered{}
	if err := wait(t, done); err == nil {
		t.Error("a push to an unlisted host was made unasked")
	}
}
