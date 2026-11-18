package sudomsg

import (
	"bytes"
	"encoding/binary"
	"errors"
	"os"
	"path/filepath"
	"reflect"
	"slices"
	"strings"
	"testing"

	"github.com/danielbodart/quoin/peer"
)

func exampleV2(t testing.TB) *Message {
	return &Message{
		Version:  V2,
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
	}
}

func TestTheV2MessageEncodesToTheGoldenBytesAndParsesBackFieldForField(t *testing.T) {
	b, err := exampleV2(t).Marshal()
	if err != nil {
		t.Fatal(err)
	}
	path := filepath.Join("testdata", "message-v2.bin")
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
		t.Fatalf("got\n%x\nwant\n%x", b, want)
	}
	if !bytes.HasPrefix(b, []byte("\x00\x00\x00\x0dquoin-sudo-v2")) {
		t.Errorf("starts %x", b[:17])
	}
	m, err := Parse(want)
	if err != nil {
		t.Fatal(err)
	}
	if !reflect.DeepEqual(m, exampleV2(t)) {
		t.Errorf("parsed %+v", m)
	}
}

func TestTheZigCopyOfTheV2GoldenIsThisPackages(t *testing.T) {
	ours, err := os.ReadFile(filepath.Join("testdata", "message-v2.bin"))
	if err != nil {
		t.Fatal(err)
	}
	zigs, err := os.ReadFile(filepath.Join("..", "..", "sudo", "testdata", "sudomsg", "message-v2.bin"))
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(ours, zigs) {
		t.Fatal("sudo/testdata/sudomsg/message-v2.bin is not internal/sudomsg/testdata/message-v2.bin: copy it")
	}
}

func TestAV1MessageStillParsesAsV1(t *testing.T) {
	b, err := os.ReadFile(filepath.Join("testdata", "message.bin"))
	if err != nil {
		t.Fatal(err)
	}
	m, err := Parse(b)
	if err != nil {
		t.Fatal(err)
	}
	if m.Version != V1 || m.Level != "danger" || m.Links != nil || m.Danger != nil {
		t.Errorf("parsed %+v", m)
	}
	m.Version = 0
	if again, err := m.Marshal(); err != nil || !bytes.Equal(again, b) {
		t.Errorf("a zero Version marshals as %x, %v", again, err)
	}
}

// encV2 writes m's fields as v2 lays them out, with flags and the links'
// records given, so a test can write what Marshal never would.
func encV2(m *Message, flags uint32, links [][]byte) []byte {
	b := []byte(prefixV2)
	b = appendString(b, m.Nonce)
	b = appendList(b, m.HostKeys)
	b = appendString(b, []byte(m.User))
	b = appendString(b, []byte(m.RunAs))
	b = appendString(b, []byte(m.Cwd))
	b = appendList(b, byteSlices(m.Argv))
	b = appendList(b, byteSlices(m.Danger))
	b = appendList(b, byteSlices(m.Env))
	b = binary.BigEndian.AppendUint32(b, flags)
	return appendList(b, links)
}

func records(links []peer.Link) [][]byte {
	var recs [][]byte
	for _, l := range links {
		recs = append(recs, l.AppendRecord(nil))
	}
	return recs
}

func TestAV2MessageThatDoesNotParseStrictlyIsRefused(t *testing.T) {
	m := exampleV2(t)
	good := encV2(m, 0, records(m.Links))
	if _, err := Parse(good); err != nil {
		t.Fatalf("the hand-made message: %v", err)
	}
	seventeen := records(slices.Concat(m.Links, m.Links, m.Links)[:peer.MaxLinks+1])
	for name, b := range map[string][]byte{
		"an unknown flag":       encV2(m, 2, records(m.Links)),
		"a high flag":           encV2(m, 1<<31, records(m.Links)),
		"17 links":              encV2(m, 0, seventeen),
		"a link cut short":      encV2(m, 0, [][]byte{records(m.Links)[0][:10]}),
		"a link with more":      encV2(m, 0, [][]byte{append(records(m.Links)[0], 0)}),
		"a comm past its limit": encV2(m, 0, [][]byte{peer.Link{Comm: strings.Repeat("c", peer.MaxComm+1)}.AppendRecord(nil)}),
		"no flags":              good[:len(encV2(m, 0, nil))-8],
		"a missing link":        good[:len(good)-len(records(m.Links)[5])-4],
		"trailing bytes":        append(bytes.Clone(good), 0),
		"a short nonce": func() []byte {
			m := exampleV2(t)
			m.Nonce = m.Nonce[:31]
			return encV2(m, 0, nil)
		}(),
		"no host keys": func() []byte {
			m := exampleV2(t)
			m.HostKeys = nil
			return encV2(m, 0, nil)
		}(),
		"v1's body": func() []byte {
			b, err := example(t).Marshal()
			if err != nil {
				t.Fatal(err)
			}
			return append([]byte(prefixV2), b[len(prefix):]...)
		}(),
	} {
		if m, err := Parse(b); err == nil {
			t.Errorf("%s: parsed %+v", name, m)
		}
	}
	if m, err := Parse(encV2(m, FlagCmdlinesCut, nil)); err != nil || !m.Truncated || m.Links != nil {
		t.Errorf("the cut flag with no links: %+v, %v", m, err)
	}
}

func TestMarshalRefusesAV2MessageParseWould(t *testing.T) {
	for name, f := range map[string]func(*Message){
		"17 links":           func(m *Message) { m.Links = slices.Concat(m.Links, m.Links, m.Links)[:peer.MaxLinks+1] },
		"a long comm":        func(m *Message) { m.Links[0].Comm = strings.Repeat("c", peer.MaxComm+1) },
		"a long cmdline":     func(m *Message) { m.Links[0].Cmdline = []string{strings.Repeat("a", 4000), strings.Repeat("b", 96)} },
		"a NUL in an arg":    func(m *Message) { m.Links[0].Cmdline = []string{"a\x00b"} },
		"v1's level":         func(m *Message) { m.Level = "danger" },
		"v1's reasons":       func(m *Message) { m.Reasons = []string{"x"} },
		"an unknown version": func(m *Message) { m.Version = 3 },
	} {
		m := exampleV2(t)
		f(m)
		if _, err := m.Marshal(); err == nil {
			t.Errorf("%s: marshalled", name)
		}
	}
	for name, f := range map[string]func(*Message){
		"links":     func(m *Message) { m.Links = []peer.Link{{Pid: 1}} },
		"danger":    func(m *Message) { m.Danger = []string{"x"} },
		"env":       func(m *Message) { m.Env = []string{"x"} },
		"truncated": func(m *Message) { m.Truncated = true },
	} {
		m := example(t)
		f(m)
		if _, err := m.Marshal(); err == nil {
			t.Errorf("v1 with %s: marshalled", name)
		}
	}
	m := exampleV2(t)
	m.Links[0].Cmdline = []string{strings.Repeat("a", 4000), strings.Repeat("b", 95)}
	if _, err := m.Marshal(); err != nil {
		t.Errorf("a cmdline of exactly %d bytes: %v", peer.MaxCmdline, err)
	}
}

func TestMarshalWithinLeavesOutCommandLinesFromTheTopOfTheChainUntilItFits(t *testing.T) {
	m := exampleV2(t)
	whole, err := m.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	if b, err := m.MarshalWithin(len(whole)); err != nil || !bytes.Equal(b, whole) || m.Truncated {
		t.Fatalf("what fits is cut: %v %v", err, m.Truncated)
	}
	top := len(m.Links) - 1
	topLen := len(strings.Join(m.Links[top].Cmdline, "\x00"))
	b, err := m.MarshalWithin(len(whole) - 1)
	if err != nil {
		t.Fatal(err)
	}
	if len(b) != len(whole)-topLen || !m.Truncated || m.Links[top].Cmdline != nil || m.Links[top-1].Cmdline == nil {
		t.Errorf("one byte over left out %d bytes, links %+v", len(whole)-len(b), m.Links)
	}
	back, err := Parse(b)
	if err != nil || !reflect.DeepEqual(back, m) {
		t.Errorf("parsed back %+v, %v", back, err)
	}

	m = exampleV2(t)
	keep := exampleV2(t)
	b, err = m.MarshalWithin(len(whole) - topLen - 1)
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
	m := exampleV2(t)
	for i := range m.Links {
		m.Links[i].Cmdline = nil
	}
	bare, err := m.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	m = exampleV2(t)
	if _, err := m.MarshalWithin(len(bare) - 1); !errors.Is(err, ErrTooLong) {
		t.Errorf("got %v", err)
	}
	m = exampleV2(t)
	m.Argv = append(m.Argv, strings.Repeat("x", MaxSize))
	if _, err := m.MarshalWithin(MaxSize); !errors.Is(err, ErrTooLong) {
		t.Errorf("an argv past the limit: %v", err)
	}
	m = exampleV2(t)
	m.Env = []string{strings.Repeat("x", MaxSize-len(bare)+len(exampleV2(t).Env[0]))}
	if b, err := m.MarshalWithin(MaxSize + 100); err != nil || len(b) != MaxSize || !m.Truncated {
		t.Errorf("a limit past MaxSize: %d bytes, %v", len(b), err)
	}
	v1 := example(t)
	b, err := v1.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	if _, err := v1.MarshalWithin(len(b) - 1); !errors.Is(err, ErrTooLong) {
		t.Errorf("v1 over its limit: %v", err)
	}
}
