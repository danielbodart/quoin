package sudogate

import (
	"bytes"
	"os"
	"path/filepath"
	"slices"
	"testing"

	"github.com/danielbodart/quoin/peer"
)

// golden is one of the wire's golden files in sudo/testdata/wire, which the
// Zig's wire tests embed too: what the Zig frames as a .req, the gate must
// read as the request it means, and a .reply the gate writes, the Zig must
// read, so a tag, limit or reply byte changed on one side alone fails go
// test and zig build test, not only the VM tests.
func golden(t *testing.T, name string) []byte {
	t.Helper()
	b, err := os.ReadFile(filepath.Join("..", "..", "sudo", "testdata", "wire", name))
	if err != nil {
		t.Fatal(err)
	}
	return b
}

func readGolden(t *testing.T, name string) *request {
	t.Helper()
	req, err := readRequest(bytes.NewReader(golden(t, name)))
	if err != nil {
		t.Fatalf("%s: %v", name, err)
	}
	return req
}

func TestGoldenRequestsReadAsTheZigMeansThem(t *testing.T) {
	if r := readGolden(t, "check-in.req"); r.kind != kindCheckIn || r.remote {
		t.Errorf("check-in: %+v", r)
	}
	if r := readGolden(t, "check-in-remote.req"); r.kind != kindCheckIn || !r.remote {
		t.Errorf("check-in-remote: %+v", r)
	}
	if r := readGolden(t, "did-check-in.req"); r.kind != kindParent {
		t.Errorf("did-check-in: %+v", r)
	}
	if r := readGolden(t, "verify-ok.req"); r.kind != kindVerify || !bytes.Equal(r.verified, []byte{1}) {
		t.Errorf("verify-ok: %+v", r)
	}
	if r := readGolden(t, "signature.req"); r.kind != kindSign || string(r.pub) != "kb" || string(r.sig) != "sig" || r.failed != nil {
		t.Errorf("signature: %+v", r)
	}
	if r := readGolden(t, "sign-failed.req"); r.kind != kindSign || r.failed == nil || *r.failed != "why?" || r.pub != nil {
		t.Errorf("sign-failed: %+v", r)
	}
	link := peer.Link{Pid: 7, PPid: 8, Start: 0x0102030405060708, UID: 1000, Comm: "bash", Cmdline: []string{"bash", "-c", "x"}}
	for _, name := range []string{"approval.req", "approval-remote.req"} {
		r := readGolden(t, name)
		if r.kind != kindApproval || len(r.links) != 1 || !linkEqual(r.links[0], link) ||
			!slices.Equal(r.user, []string{"user=dan", "uid=1000"}) || !slices.Equal(r.argv, []string{"id"}) ||
			r.settings != nil || r.command != nil || r.envp != nil || r.truncated || r.remote != (name == "approval-remote.req") {
			t.Errorf("%s: %+v", name, r)
		}
	}
}

func linkEqual(a, b peer.Link) bool {
	return a.Pid == b.Pid && a.PPid == b.PPid && a.Start == b.Start && a.UID == b.UID && a.TTY == b.TTY &&
		a.Comm == b.Comm && slices.Equal(a.Cmdline, b.Cmdline)
}

func TestGoldenRepliesAreWhatTheGateWrites(t *testing.T) {
	for _, c := range []struct {
		name string
		kind byte
		msg  string
	}{
		{"yes.reply", replyYes, "quoin-sudo: ok"},
		{"no.reply", replyNo, ""},
		{"password.reply", replyPassword, "hunter2"},
	} {
		var b bytes.Buffer
		if err := writeReply(&b, c.kind, []byte(c.msg)); err != nil {
			t.Fatal(err)
		}
		if !bytes.Equal(b.Bytes(), golden(t, c.name)) {
			t.Errorf("%s: wrote %q", c.name, b.Bytes())
		}
	}
	var b bytes.Buffer
	if err := writeMessage(&b, []byte("msg"), [][]byte{[]byte("kb")}); err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(b.Bytes(), golden(t, "message.reply")) {
		t.Errorf("message.reply: wrote %q", b.Bytes())
	}
}
