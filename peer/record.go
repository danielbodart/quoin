package peer

import (
	"encoding/binary"
	"errors"
	"fmt"
	"strings"
)

// The limits of a link's record: a chain of at most MaxLinks, a comm of at
// most MaxComm bytes and a command line of at most MaxCmdline.
const (
	MaxLinks   = 16
	MaxComm    = 64
	MaxCmdline = 4096
)

// recordHead is pid, ppid, start, uid and tty.
const recordHead = 4 + 4 + 8 + 4 + 4

// AppendRecord appends l as quoin-sudo's plugin sends a link to its gate:
// pid u32, ppid u32, start u64, uid u32, tty u32, then comm and the
// command line, NUL-joined with no trailing NUL, each after its u16
// length, all big-endian. Sid and Cgroup are not in it. A comm or command
// line past its limit makes a record ParseRecord refuses; keeping within
// them is the caller's.
func (l Link) AppendRecord(b []byte) []byte {
	be := binary.BigEndian
	b = be.AppendUint32(b, uint32(l.Pid))
	b = be.AppendUint32(b, uint32(l.PPid))
	b = be.AppendUint64(b, l.Start)
	b = be.AppendUint32(b, uint32(l.UID))
	b = be.AppendUint32(b, l.TTY)
	b = be.AppendUint16(b, uint16(len(l.Comm)))
	b = append(b, l.Comm...)
	cmdline := strings.Join(l.Cmdline, "\x00")
	b = be.AppendUint16(b, uint16(len(cmdline)))
	return append(b, cmdline...)
}

// ParseRecord reads one record AppendRecord wrote, strictly: nothing cut
// short, nothing after the command line, and comm and command line within
// their limits. An empty command line is a nil Cmdline.
func ParseRecord(b []byte) (Link, error) {
	if len(b) < recordHead+2 {
		return Link{}, errors.New("a link cut short")
	}
	be := binary.BigEndian
	l := Link{
		Pid: int(be.Uint32(b)), PPid: int(be.Uint32(b[4:])), Start: be.Uint64(b[8:]),
		UID: int(be.Uint32(b[16:])), TTY: be.Uint32(b[20:]),
	}
	b = b[recordHead:]
	comm, b, ok := cut16(b)
	if !ok {
		return Link{}, errors.New("a link's comm cut short")
	}
	cmdline, b, ok := cut16(b)
	if !ok || len(b) != 0 {
		return Link{}, errors.New("a link's cmdline cut short or followed by more")
	}
	if len(comm) > MaxComm || len(cmdline) > MaxCmdline {
		return Link{}, fmt.Errorf("a comm of %d bytes or a cmdline of %d", len(comm), len(cmdline))
	}
	l.Comm = string(comm)
	if len(cmdline) > 0 {
		l.Cmdline = strings.Split(string(cmdline), "\x00")
	}
	return l, nil
}

func cut16(b []byte) (field, rest []byte, ok bool) {
	if len(b) < 2 {
		return nil, nil, false
	}
	n := int(binary.BigEndian.Uint16(b))
	if n > len(b)-2 {
		return nil, nil, false
	}
	return b[2 : 2+n], b[2+n:], true
}
