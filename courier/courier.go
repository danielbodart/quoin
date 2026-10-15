// Package courier is the courier's wire, both ends of it: the request and
// response quoin-courier answers on its socket, and the client every peer
// calls it with. The courier carries a project's policy file between the
// user's home, which only the user's own processes may read and write, and
// the root-run verifiers, which may not; the server is quoin's own, and
// imports these types as its peers do, so the two move in lock step.
//
// The wire is one JSON request and one JSON response, a line each, per
// connection; bytes travel as base64, as encoding/json writes []byte.
package courier

import (
	"bufio"
	"context"
	"encoding/json"
	"errors"
	"io"
	"net"
	"time"
)

// Request is one operation.
//
//	{"op": "read", "pid": P, "start": S}
//	{"op": "write", "root": R, "oldDigest": D, "bytes": B, "sig": G}
type Request struct {
	Op string `json:"op"`

	// read: the anchor, a process of the user's, and its start time from
	// /proc/<pid>/stat, so a reused pid is refused.
	Pid   int    `json:"pid,omitempty"`
	Start uint64 `json:"start,omitempty"`

	// write: the project's directory, the digest of the file the new one
	// replaces ("" for none), and the new file and its signature.
	Root      string `json:"root,omitempty"`
	OldDigest string `json:"oldDigest,omitempty"`
	Bytes     []byte `json:"bytes,omitempty"`
	Sig       []byte `json:"sig,omitempty"`
}

// Response answers a Request. Error is set alone when it failed. A read
// that found no policy file has no Digest, and a Root only when the anchor
// is in a git repository under the home: where the file would be.
type Response struct {
	Error     string `json:"error,omitempty"`
	Root      string `json:"root,omitempty"`
	Namespace string `json:"namespace,omitempty"`
	Bytes     []byte `json:"bytes,omitempty"`
	Sig       []byte `json:"sig,omitempty"`
	Digest    string `json:"digest,omitempty"`
}

const (
	OpRead  = "read"
	OpWrite = "write"

	// MaxRequest bounds a request, which the server reads no more of, and
	// twice it a response, which the client reads no more of.
	MaxRequest = 4 << 20
)

// ErrChanged is a write whose oldDigest is not the file's: it changed since
// it was read, and the write is refused rather than lose that change. The
// server's error wraps it; across the wire it is its text.
var ErrChanged = errors.New("the policy file changed since it was read")

// Call sends one request to the courier at socket and returns its answer;
// a Response with Error set is returned as an error. It waits as long as
// the courier takes, until ctx is done, which ends the call where it is.
func Call(ctx context.Context, socket string, req Request) (*Response, error) {
	var d net.Dialer
	c, err := d.DialContext(ctx, "unix", socket)
	if err != nil {
		return nil, err
	}
	defer c.Close()
	defer context.AfterFunc(ctx, func() { _ = c.SetDeadline(time.Unix(1, 0)) })()
	b, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}
	// A refused peer is answered before its request is read, and the
	// courier hangs up, so a failed write still reads the answer.
	_, werr := c.Write(append(b, '\n'))
	var resp Response
	if err := json.NewDecoder(bufio.NewReader(io.LimitReader(c, 2*MaxRequest))).Decode(&resp); err != nil {
		if werr != nil {
			return nil, werr
		}
		return nil, err
	}
	if resp.Error != "" {
		return nil, errors.New(resp.Error)
	}
	return &resp, nil
}

// Read asks the courier for the policy file above pid's working directory.
func Read(ctx context.Context, socket string, pid int, start uint64) (*Response, error) {
	return Call(ctx, socket, Request{Op: OpRead, Pid: pid, Start: start})
}

// Write asks the courier to replace root's policy file, if it is still old.
func Write(ctx context.Context, socket, root, oldDigest string, bytes, sig []byte) (*Response, error) {
	return Call(ctx, socket, Request{Op: OpWrite, Root: root, OldDigest: oldDigest, Bytes: bytes, Sig: sig})
}
