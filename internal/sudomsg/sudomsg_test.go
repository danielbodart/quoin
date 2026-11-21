package sudomsg

import (
	"bytes"
	"crypto/ed25519"
	"encoding/binary"
	"errors"
	"flag"
	"os"
	"path/filepath"
	"reflect"
	"slices"
	"strings"
	"testing"

	"github.com/danielbodart/quoin/peer"
	"golang.org/x/crypto/ssh"
)

var update = flag.Bool("update", false, "rewrite the golden files")

func hostKey(t testing.TB, seed byte) []byte {
	t.Helper()
	pub, err := ssh.NewPublicKey(ed25519.NewKeyFromSeed(bytes.Repeat([]byte{seed}, ed25519.SeedSize)).Public())
	if err != nil {
		t.Fatal(err)
	}
	return pub.Marshal()
}

// windowKey is the key whose window example is asked inside.
func windowKey(t testing.TB) []byte { return hostKey(t, 9) }

// example is a claude's sudo under an ssh login, its chain leaf first,
// with every field: a question a rule asked inside a window, which no gate
// sends all at once.
func example(t testing.TB) *Message {
	return &Message{
		Nonce:    bytes.Repeat([]byte{0xab}, NonceSize),
		HostKeys: [][]byte{hostKey(t, 1), hostKey(t, 2)},
		User:     "dan",
		RunAs:    "root",
		Cwd:      "/home/dan",
		Argv:     []string{"/run/current-system/sw/bin/systemctl", "stop", "sshd.service"},
		Danger:   []string{"touches a unit that guards this machine"},
		Env:      []string{"LD_PRELOAD=/tmp/x.so"},
		Links: []peer.Link{
			{Pid: 4242, PPid: 4241, Start: 9000, UID: 1000, TTY: 0, Comm: "bash", Cmdline: []string{"bash", "-c", "sudo systemctl stop sshd.service"}},
			{Pid: 4241, PPid: 764, Start: 8000, UID: 1000, Comm: ".claude-unwrapp", Cmdline: []string{"claude"}},
			{Pid: 764, PPid: 761, Start: 7000, UID: 1000, Comm: "sshd-session", Cmdline: []string{"sshd-session: dan@notty"}},
			{Pid: 761, PPid: 692, Start: 6900, Comm: "sshd-session", Cmdline: []string{"sshd-session: dan [priv]"}},
			{Pid: 692, PPid: 1, Start: 100, Comm: "sshd", Cmdline: []string{"sshd: /nix/store/sshd -D -f /etc/ssh/sshd_config [listener]"}},
			{Pid: 1, Start: 1, Comm: "systemd", Cmdline: []string{"/run/current-system/systemd/lib/systemd/systemd"}},
		},
		Decision:  Question,
		Presence:  PresenceNone,
		Rule:      &Rule{Pattern: "systemctl stop *", Source: "project rule"},
		WindowKey: windowKey(t),
	}
}

// dialog is example asked as a dialog that may open an hour's window, with
// no rule and no window key.
func dialog(t testing.TB) *Message {
	m := example(t)
	m.Decision, m.Presence, m.Rule, m.Window, m.WindowKey = Dialog, Required, nil, 3600, nil
	return m
}

// golden is b checked against, or with -update written to, testdata/name.
func golden(t *testing.T, name string, b []byte) []byte {
	t.Helper()
	path := filepath.Join("testdata", name)
	if *update {
		if err := os.WriteFile(path, b, 0o644); err != nil {
			t.Fatal(err)
		}
	}
	want, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(b, want) {
		t.Fatalf("%s: got\n%x\nwant\n%x", name, b, want)
	}
	return want
}

func TestTheMessageEncodesToTheGoldenBytesAndParsesBackFieldForField(t *testing.T) {
	for name, m := range map[string]*Message{"message.bin": example(t), "message-dialog.bin": dialog(t)} {
		b, err := m.Marshal()
		if err != nil {
			t.Fatal(err)
		}
		want := golden(t, name, b)
		if !bytes.HasPrefix(b, []byte("\x00\x00\x00\x0dquoin-sudo-v1")) {
			t.Errorf("%s: starts %x", name, b[:17])
		}
		back, err := Parse(want)
		if err != nil {
			t.Fatal(err)
		}
		if !reflect.DeepEqual(back, m) {
			t.Errorf("%s: parsed %+v", name, back)
		}
	}
}

// zigCopies are the goldens the Zig mirror holds itself to.
var zigCopies = []string{"message.bin", "message-dialog.bin", "answer.bin", "answer-cases.bin"}

// The Zig mirror builds the message and reads the answer, held to copies
// of this package's goldens in sudo/testdata/sudomsg, inside the Zig
// package's root where its tests can embed them. Each copy is this one,
// byte for byte.
func TestTheZigCopiesOfTheGoldensAreThisPackages(t *testing.T) {
	for _, name := range zigCopies {
		ours, err := os.ReadFile(filepath.Join("testdata", name))
		if err != nil {
			t.Fatal(err)
		}
		zigs, err := os.ReadFile(filepath.Join("..", "..", "sudo", "testdata", "sudomsg", name))
		if err != nil {
			t.Fatal(err)
		}
		if !bytes.Equal(ours, zigs) {
			t.Errorf("sudo/testdata/sudomsg/%s is not internal/sudomsg/testdata/%s: copy it", name, name)
		}
	}
}

// signerBeforeFields is how quoin-signer read a quoin-sudo-v1 message
// before it had fields: user, runas and cwd strings, argv, a level and its
// reasons, nothing after. A signer that old is still on a laptop until it
// is rebuilt, and it must refuse what a gate sends now rather than ask it
// as something else.
func signerBeforeFields(b []byte) error {
	if !HasMagic(b) {
		return errMalformed
	}
	r := &reader{b: b[len(prefix):]}
	nonce, hosts := r.bytes(), r.list()
	r.bytes() // user
	r.bytes() // runas
	r.bytes() // cwd
	r.list()  // argv
	level := string(r.bytes())
	r.list() // reasons
	if r.err != nil || len(r.b) != 0 || len(nonce) != NonceSize || len(hosts) == 0 {
		return errMalformed
	}
	if level != "" && level != "warning" && level != "danger" {
		return errMalformed
	}
	return nil
}

func TestASignerFromBeforeFieldsRefusesEveryMessage(t *testing.T) {
	cut := example(t)
	cut.Truncated = true
	bare := example(t)
	bare.Danger, bare.Env, bare.Links = nil, nil, nil
	for name, m := range map[string]*Message{"the example": example(t), "cut": cut, "only what is required": bare} {
		b, err := m.Marshal()
		if err != nil {
			t.Fatal(err)
		}
		if signerBeforeFields(b) == nil {
			t.Errorf("%s: an old signer would ask it", name)
		}
	}
	old := []byte(prefix)
	old = appendString(old, bytes.Repeat([]byte{1}, NonceSize))
	old = appendList(old, [][]byte{hostKey(t, 1)})
	for range 3 {
		old = appendString(old, []byte("x"))
	}
	old = appendList(old, [][]byte{[]byte("/bin/true")})
	old = appendString(old, nil)
	old = appendList(old, nil)
	if err := signerBeforeFields(old); err != nil {
		t.Fatalf("the old reader refuses its own message: %v", err)
	}
	if m, err := Parse(old); err == nil {
		t.Errorf("an old gate's message parses: %+v", m)
	}
}

// enc writes fields as given, each a key and its value, after example's
// head, so a test can write what Marshal never would.
func enc(t testing.TB, kv ...string) []byte {
	var f []byte
	for i := 0; i < len(kv); i += 2 {
		f = appendString(f, []byte(kv[i]))
		f = appendString(f, []byte(kv[i+1]))
	}
	m := example(t)
	b := []byte(prefix)
	b = appendString(b, m.Nonce)
	b = appendList(b, m.HostKeys)
	return appendString(b, f)
}

func list(ss ...string) string { return string(appendList(nil, byteSlices(ss))) }

// required is the fields every message has, by key and value.
func required() []string {
	return []string{
		"!argv", list("/bin/true"), "!cwd", "/", "!decision", Dialog, "!presence", Required,
		"!runas", "root", "!user", "dan", "!window", "\x00\x00\x00\x00",
	}
}

// without is kv without the field named name.
func without(kv []string, name string) []string {
	for i := 0; i < len(kv); i += 2 {
		if strings.TrimPrefix(kv[i], Critical) == name {
			return slices.Delete(slices.Clone(kv), i, i+2)
		}
	}
	panic(name)
}

// replaced is kv with the field named name's key and value set.
func replaced(kv []string, name, key, value string) []string {
	for i := 0; i < len(kv); i += 2 {
		if strings.TrimPrefix(kv[i], Critical) == name {
			return slices.Replace(slices.Clone(kv), i, i+2, key, value)
		}
	}
	panic(name)
}

// with is required's fields with kv placed in name order.
func with(kv ...string) []string {
	out := required()
	for i := 0; i < len(kv); i += 2 {
		name := strings.TrimPrefix(kv[i], Critical)
		at := len(out)
		for j := 0; j < len(out); j += 2 {
			if strings.TrimPrefix(out[j], Critical) > name {
				at = j
				break
			}
		}
		out = slices.Insert(out, at, kv[i], kv[i+1])
	}
	return out
}

func TestAnUnknownFieldIsDroppedUnlessItIsMarkedCritical(t *testing.T) {
	for name, kv := range map[string][]string{
		"first":  with("aardvark", "x"),
		"among":  with("color", "x"),
		"last":   with("zebra", "x"),
		"empty":  with("note", ""),
		"twice":  with("color", "x", "zebra", "y"),
		"hyphen": with("source-host", "x"),
	} {
		m, err := Parse(enc(t, kv...))
		if err != nil {
			t.Errorf("%s: %v", name, err)
			continue
		}
		plain, err := Parse(enc(t, required()...))
		if err != nil {
			t.Fatal(err)
		}
		if len(m.Ignored) == 0 {
			t.Errorf("%s: nothing named as ignored", name)
		}
		m.Ignored = nil
		if !reflect.DeepEqual(m, plain) {
			t.Errorf("%s: changed the message: %+v", name, m)
		}
	}
	m, err := Parse(enc(t, with("color", "x", "zebra", "y")...))
	if err != nil || !reflect.DeepEqual(m.Ignored, []string{"color", "zebra"}) {
		t.Errorf("ignored %v, %v", m.Ignored, err)
	}
	for _, key := range []string{"!aardvark", "!color", "!zebra"} {
		_, err := Parse(enc(t, with(key, "x")...))
		var critical *CriticalError
		if !errors.As(err, &critical) || critical.Key != strings.TrimPrefix(key, Critical) {
			t.Errorf("%s: got %v", key, err)
		}
	}
	_, err = Parse(enc(t, with("!color", "x", "!zebra", "y")...))
	var critical *CriticalError
	if !errors.As(err, &critical) || critical.Key != "color" {
		t.Errorf("two critical: got %v", err)
	}
}

func TestAMessageThatDoesNotParseStrictlyIsRefused(t *testing.T) {
	good, err := example(t).Marshal()
	if err != nil {
		t.Fatal(err)
	}
	head := func(f func(*Message)) []byte {
		m := example(t)
		f(m)
		b := []byte(prefix)
		b = appendString(b, m.Nonce)
		b = appendList(b, m.HostKeys)
		return appendString(b, good[len(good)-fieldsLen(good):])
	}
	rec := example(t).Links[0].AppendRecord(nil)
	many := make([]string, 0, 2*(MaxFields+1))
	for i := range MaxFields + 1 {
		many = append(many, "z"+strings.Repeat("a", i), "")
	}
	for name, b := range map[string][]byte{
		"a short nonce":         head(func(m *Message) { m.Nonce = m.Nonce[:31] }),
		"a long nonce":          head(func(m *Message) { m.Nonce = append(m.Nonce, 0) }),
		"no host keys":          head(func(m *Message) { m.HostKeys = nil }),
		"a bad key blob":        head(func(m *Message) { m.HostKeys[1] = []byte("\x00\x00\x00\x07ssh-rsa") }),
		"no fields string":      good[:len(good)-fieldsLen(good)-4],
		"a fields string short": good[:len(good)-1],
		"trailing bytes":        append(bytes.Clone(good), 0),
		"another magic":         append([]byte("\x00\x00\x00\x0dquoin-sudo-v2"), good[17:]...),
		"empty":                 nil,
		"no argv":               enc(t, without(required(), "argv")...),
		"no cwd":                enc(t, without(required(), "cwd")...),
		"no decision":           enc(t, without(required(), "decision")...),
		"no presence":           enc(t, without(required(), "presence")...),
		"no runas":              enc(t, without(required(), "runas")...),
		"no user":               enc(t, without(required(), "user")...),
		"no window":             enc(t, without(required(), "window")...),
		"an empty argv":         enc(t, replaced(required(), "argv", "!argv", list())...),
		"argv unmarked":         enc(t, replaced(required(), "argv", "argv", list("/bin/true"))...),
		"user unmarked":         enc(t, replaced(required(), "user", "user", "dan")...),
		"decision unmarked":     enc(t, replaced(required(), "decision", "decision", Dialog)...),
		"another decision":      enc(t, replaced(required(), "decision", "!decision", "allow")...),
		"an empty decision":     enc(t, replaced(required(), "decision", "!decision", "")...),
		"another presence":      enc(t, replaced(required(), "presence", "!presence", Verified)...),
		"a short window":        enc(t, replaced(required(), "window", "!window", "\x00\x00\x00")...),
		"a long window":         enc(t, replaced(required(), "window", "!window", "\x00\x00\x00\x00\x00")...),
		"a rule with one":       enc(t, with("!rule", string(appendString(nil, []byte("x"))))...),
		"a rule with more":      enc(t, with("!rule", string(appendString(appendString(nil, []byte("x")), []byte("y")))+"z")...),
		"a bad window key":      enc(t, with("!window-key", "\x00\x00\x00\x07ssh-rsa")...),
		"an empty window key":   enc(t, with("!window-key", "")...),
		"out of order":          enc(t, slices.Concat(required()[2:4], required()[:2], required()[4:])...),
		"a field twice":         enc(t, slices.Concat(required()[:2], required())...),
		"marked and not":        enc(t, with("color", "x", "!color", "y")...),
		"a key with capitals":   enc(t, with("Color", "x")...),
		"a key with a space":    enc(t, with("co lor", "x")...),
		"an empty key":          enc(t, slices.Concat([]string{"", ""}, required())...),
		"a bare mark":           enc(t, slices.Concat([]string{"!", ""}, required())...),
		"a key past MaxKey":     enc(t, with("z"+strings.Repeat("a", MaxKey), "")...),
		"a field cut short":     enc(t, slices.Replace(required(), 1, 2, list("/bin/true")[:6])...),
		"argv with more":        enc(t, slices.Replace(required(), 1, 2, list("/bin/true")+"x")...),
		"cut with a value":      enc(t, with("!cut", "x")...),
		"an empty danger":       enc(t, with("!danger", list())...),
		"an empty env":          enc(t, with("!env", list())...),
		"an empty chain":        enc(t, with("!chain", list())...),
		"17 links":              enc(t, with("!chain", string(appendList(nil, slices.Repeat([][]byte{rec}, peer.MaxLinks+1))))...),
		"a link cut short":      enc(t, with("!chain", string(appendList(nil, [][]byte{rec[:10]})))...),
		"a link with more":      enc(t, with("!chain", string(appendList(nil, [][]byte{append(slices.Clone(rec), 0)})))...),
		"more than MaxFields":   enc(t, slices.Concat(required(), many[:2*(MaxFields-len(required())/2+1)])...),
	} {
		if m, err := Parse(b); err == nil {
			t.Errorf("%s: parsed %+v", name, m)
		}
	}
	if _, err := Parse(enc(t, slices.Concat(required(), many[:2*(MaxFields-len(required())/2)])...)); err != nil {
		t.Errorf("exactly MaxFields: %v", err)
	}
	if m, err := Parse(enc(t, with("!rule", string(appendString(appendString(nil, nil), nil)))...)); err != nil || m.Rule == nil || *m.Rule != (Rule{}) {
		t.Errorf("a rule of two empty strings: %+v, %v", m, err)
	}
	if m, err := Parse(enc(t, with("!cut", "")...)); err != nil || !m.Truncated || m.Links != nil {
		t.Errorf("cut with no chain: %+v, %v", m, err)
	}
}

// fieldsLen is the length of the fields string that ends b.
func fieldsLen(b []byte) int {
	r := &reader{b: b[len(prefix):]}
	r.bytes()
	r.list()
	return int(r.uint32())
}

func TestMarshalRefusesWhatParseWould(t *testing.T) {
	for name, f := range map[string]func(*Message){
		"a short nonce":       func(m *Message) { m.Nonce = m.Nonce[:1] },
		"no host keys":        func(m *Message) { m.HostKeys = nil },
		"no command":          func(m *Message) { m.Argv = nil },
		"too long":            func(m *Message) { m.Argv = append(m.Argv, strings.Repeat("x", MaxSize)) },
		"17 links":            func(m *Message) { m.Links = slices.Concat(m.Links, m.Links, m.Links)[:peer.MaxLinks+1] },
		"a long comm":         func(m *Message) { m.Links[0].Comm = strings.Repeat("c", peer.MaxComm+1) },
		"a long cmdline":      func(m *Message) { m.Links[0].Cmdline = []string{strings.Repeat("a", 4000), strings.Repeat("b", 96)} },
		"a NUL in an arg":     func(m *Message) { m.Links[0].Cmdline = []string{"a\x00b"} },
		"no decision":         func(m *Message) { m.Decision = "" },
		"an allow":            func(m *Message) { m.Decision = Allow },
		"no presence":         func(m *Message) { m.Presence = "" },
		"verified":            func(m *Message) { m.Presence = Verified },
		"a bad window key":    func(m *Message) { m.WindowKey = []byte("\x00\x00\x00\x07ssh-rsa") },
		"an empty window key": func(m *Message) { m.WindowKey = []byte{} },
	} {
		m := example(t)
		f(m)
		if _, err := m.Marshal(); err == nil {
			t.Errorf("%s: marshalled", name)
		}
	}
	m := example(t)
	m.Argv = []string{strings.Repeat("x", MaxSize)}
	if _, err := m.Marshal(); !errors.Is(err, ErrTooLong) {
		t.Errorf("got %v", err)
	}
	m = example(t)
	m.Links[0].Cmdline = []string{strings.Repeat("a", 4000), strings.Repeat("b", 95)}
	if _, err := m.Marshal(); err != nil {
		t.Errorf("a cmdline of exactly %d bytes: %v", peer.MaxCmdline, err)
	}
}

func TestMarshalLeavesOutWhatIsEmptyAndParseReadsItBackEmpty(t *testing.T) {
	m := example(t)
	m.Danger, m.Env, m.Links, m.Rule, m.WindowKey = nil, nil, nil, nil, nil
	b, err := m.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	for _, key := range []string{"!chain", "!cut", "!danger", "!env", "!rule", "!window-key"} {
		if bytes.Contains(b, []byte(key)) {
			t.Errorf("%s written", key)
		}
	}
	back, err := Parse(b)
	if err != nil || !reflect.DeepEqual(back, m) {
		t.Errorf("parsed back %+v, %v", back, err)
	}
}

func TestMarshalWithinLeavesOutCommandLinesFromTheTopOfTheChainUntilItFits(t *testing.T) {
	m := example(t)
	whole, err := m.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	if b, err := m.MarshalWithin(len(whole)); err != nil || !bytes.Equal(b, whole) || m.Truncated {
		t.Fatalf("what fits is cut: %v %v", err, m.Truncated)
	}
	top := len(m.Links) - 1
	topLen := len(strings.Join(m.Links[top].Cmdline, "\x00"))
	cutField := 4 + len("!cut") + 4
	b, err := m.MarshalWithin(len(whole) - 1)
	if err != nil {
		t.Fatal(err)
	}
	if len(b) != len(whole)-topLen+cutField || !m.Truncated || m.Links[top].Cmdline != nil || m.Links[top-1].Cmdline == nil {
		t.Errorf("one byte over left out %d bytes, links %+v", len(whole)-len(b), m.Links)
	}
	back, err := Parse(b)
	if err != nil || !reflect.DeepEqual(back, m) {
		t.Errorf("parsed back %+v, %v", back, err)
	}

	m = example(t)
	keep := example(t)
	b, err = m.MarshalWithin(len(whole) - topLen + cutField - 1)
	if err != nil {
		t.Fatal(err)
	}
	if m.Links[top].Cmdline != nil || m.Links[top-1].Cmdline != nil || m.Links[top-2].Cmdline == nil {
		t.Errorf("two left out from the top: %+v", m.Links)
	}
	if !reflect.DeepEqual(m.Argv, keep.Argv) || !reflect.DeepEqual(m.Danger, keep.Danger) || !reflect.DeepEqual(m.Env, keep.Env) {
		t.Errorf("argv, danger or env touched: %+v", m)
	}
	if !HasMagic(b) {
		t.Error("no magic")
	}
}

func TestMarshalWithinIsTooLongWhenNoCommandLineIsLeftToLeaveOut(t *testing.T) {
	m := example(t)
	for i := range m.Links {
		m.Links[i].Cmdline = nil
	}
	m.Truncated = true
	bare, err := m.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	m = example(t)
	if _, err := m.MarshalWithin(len(bare) - 1); !errors.Is(err, ErrTooLong) {
		t.Errorf("got %v", err)
	}
	m = example(t)
	m.Argv = append(m.Argv, strings.Repeat("x", MaxSize))
	if _, err := m.MarshalWithin(MaxSize); !errors.Is(err, ErrTooLong) {
		t.Errorf("an argv past the limit: %v", err)
	}
	m = example(t)
	m.Env = []string{strings.Repeat("x", MaxSize-len(bare)+len(example(t).Env[0]))}
	if b, err := m.MarshalWithin(MaxSize + 100); err != nil || len(b) != MaxSize || !m.Truncated {
		t.Errorf("a limit past MaxSize: %d bytes, %v", len(b), err)
	}
}

func TestOnlyTheLengthPrefixedMagicHasIt(t *testing.T) {
	for _, b := range []string{"quoin-sudo-v1", "\x00\x00\x00\x0equoin-sudo-v1", "SSHSIG", "\x00\x00\x00\x0dquoin-sudo-v", "\x00\x00\x00\x0dquoin-sudo-v2"} {
		if HasMagic([]byte(b)) {
			t.Errorf("%q has the magic", b)
		}
	}
	if !HasMagic([]byte("\x00\x00\x00\x0dquoin-sudo-v1")) {
		t.Error("the magic alone has no magic")
	}
}

func FuzzNoRemoteSudoMessageCrashesTheParser(f *testing.F) {
	good, err := example(f).Marshal()
	if err != nil {
		f.Fatal(err)
	}
	f.Add(good)
	f.Add(enc(f, with("color", "x")...))
	f.Add(enc(f, with("!color", "x")...))
	f.Add([]byte(prefix))
	f.Add(binary.BigEndian.AppendUint32([]byte(prefix), NonceSize))
	f.Add(append([]byte(prefix), 0xff, 0xff, 0xff, 0xff))
	f.Fuzz(func(t *testing.T, b []byte) {
		m, err := Parse(b)
		if err != nil || len(m.Ignored) > 0 {
			return
		}
		again, err := m.Marshal()
		if err != nil || !bytes.Equal(again, b) {
			t.Fatalf("parsed %x, marshalled %x, %v", b, again, err)
		}
	})
}
