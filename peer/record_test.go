package peer

import (
	"bytes"
	"encoding/binary"
	"os"
	"path/filepath"
	"reflect"
	"strings"
	"testing"
)

// zigLink is the 'k' record of the plugin's approval golden in
// sudo/testdata/wire, the bytes the Zig writes for a link.
func zigLink(t *testing.T) []byte {
	t.Helper()
	b, err := os.ReadFile(filepath.Join("..", "sudo", "testdata", "wire", "approval.req"))
	if err != nil {
		t.Fatal(err)
	}
	for b = b[10:]; len(b) >= 5; {
		tag, n := b[0], binary.BigEndian.Uint32(b[1:])
		rec := b[5 : 5+n]
		if tag == 'k' {
			return rec
		}
		b = b[5+n:]
	}
	t.Fatal("no 'k' record in approval.req")
	return nil
}

func TestALinkRecordIsTheBytesThePluginWritesAndReadsBackAsItsLink(t *testing.T) {
	want := Link{Pid: 7, PPid: 8, Start: 0x0102030405060708, UID: 1000, Comm: "bash", Cmdline: []string{"bash", "-c", "x"}}
	zig := zigLink(t)
	l, err := ParseRecord(zig)
	if err != nil {
		t.Fatal(err)
	}
	if !reflect.DeepEqual(l, want) {
		t.Errorf("read %+v", l)
	}
	if got := want.AppendRecord([]byte("x")); !bytes.Equal(got, append([]byte("x"), zig...)) {
		t.Errorf("wrote %x\nwant  %x", got[1:], zig)
	}
}

func TestALinkRecordKeepsAnEmptyLastArgumentAndReadsNoCommandLineAsNil(t *testing.T) {
	for _, l := range []Link{
		{Pid: 1, Comm: "x", Cmdline: []string{"a", ""}},
		{Pid: 2, Comm: "y"},
		{Pid: 3, TTY: 34816, UID: 1000, Comm: strings.Repeat("c", MaxComm), Cmdline: []string{strings.Repeat("a", MaxCmdline)}},
	} {
		got, err := ParseRecord(l.AppendRecord(nil))
		if err != nil || !reflect.DeepEqual(got, l) {
			t.Errorf("%+v read back as %+v, %v", l, got, err)
		}
	}
}

func TestALinkRecordCutShortFollowedByMoreOrPastItsLimitsIsRefused(t *testing.T) {
	good := Link{Pid: 7, Comm: "bash", Cmdline: []string{"bash"}}.AppendRecord(nil)
	for name, b := range map[string][]byte{
		"empty":              nil,
		"no lengths":         good[:recordHead],
		"comm cut short":     good[:recordHead+3],
		"no cmdline length":  good[:recordHead+2+4],
		"cmdline cut short":  good[:len(good)-1],
		"trailing bytes":     append(bytes.Clone(good), 0),
		"a comm of 65 bytes": Link{Comm: strings.Repeat("c", MaxComm+1)}.AppendRecord(nil),
		"a long cmdline":     Link{Comm: "x", Cmdline: []string{strings.Repeat("a", MaxCmdline+1)}}.AppendRecord(nil),
	} {
		if l, err := ParseRecord(b); err == nil {
			t.Errorf("%s: read %+v", name, l)
		}
	}
}
