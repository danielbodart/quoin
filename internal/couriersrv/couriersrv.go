// Package couriersrv is quoin-courier's service: it carries a project's
// policy file between the user's home, which only the user's own processes
// may read and write, and the root-run verifiers (the signer and the sudo
// gate), which may not. It runs as the user, with no network, and answers
// only the system units it is told to.
//
// It is trusted for one thing, which project a process is in: an anchor's
// working directory, up to the nearest policy file. It cannot forge one, since
// every reader verifies the signature against root's allowed signers, and it
// writes only a file whose signature already verifies.
//
// The wire, its requests, responses and client, is the public courier
// package's, which every peer imports too.
package couriersrv

import (
	"bufio"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"io/fs"
	"log/slog"
	"net"
	"os"
	"path/filepath"
	"runtime/debug"
	"strconv"
	"strings"
	"syscall"
	"time"

	"github.com/danielbodart/quoin/courier"
	"github.com/danielbodart/quoin/peer"
	"github.com/danielbodart/quoin/projpolicy"
	"golang.org/x/sys/unix"
)

// Server answers the courier's socket.
type Server struct {
	Name string // the policy file's name, as the config's fileName
	Home string // the user's home: what Find is bounded at and namespaces are named from
	UID  int    // the user's uid, which every anchor must be

	// Signers reads the allowed signers afresh for each write.
	Signers func() (*projpolicy.AllowedSigners, error)
	// Peers maps each system unit served to its user's uid: a peer must be
	// that uid, in that unit's cgroup.
	Peers map[string]int
	Log   *slog.Logger

	who        func(*net.UnixConn) (*peer.Requester, error)
	unitCgroup func(unit string) (uint64, error)
}

func (s *Server) defaults() {
	if s.who == nil {
		s.who = peer.FromConn
	}
	if s.unitCgroup == nil {
		s.unitCgroup = func(unit string) (uint64, error) {
			var st unix.Stat_t
			if err := unix.Stat(filepath.Join("/sys/fs/cgroup/system.slice", unit), &st); err != nil {
				return 0, err
			}
			return st.Ino, nil
		}
	}
}

func (s *Server) Serve(ln *net.UnixListener) error {
	s.defaults()
	for {
		c, err := ln.AcceptUnix()
		if err != nil {
			return err
		}
		go s.serve(c)
	}
}

func (s *Server) serve(c *net.UnixConn) {
	defer c.Close()
	defer func() {
		if p := recover(); p != nil {
			s.Log.Error("connection panicked", "panic", fmt.Sprint(p), "stack", string(debug.Stack()))
		}
	}()
	unit, pid, err := s.checkPeer(c)
	if err != nil {
		s.Log.Warn("refused", "reason", err.Error())
		reply(c, courier.Response{Error: "refused: " + err.Error()})
		return
	}
	var req courier.Request
	dec := json.NewDecoder(bufio.NewReader(io.LimitReader(c, courier.MaxRequest)))
	dec.DisallowUnknownFields()
	if err := dec.Decode(&req); err != nil {
		s.Log.Warn("refused", "peer", unit, "peer_pid", pid, "reason", "request: "+err.Error())
		reply(c, courier.Response{Error: "request: " + err.Error()})
		return
	}
	var resp courier.Response
	switch req.Op {
	case courier.OpRead:
		resp, err = s.read(req)
		attrs := []any{"peer", unit, "peer_pid", pid, "pid", req.Pid, "start", req.Start, "root", resp.Root, "digest", resp.Digest}
		if err != nil {
			s.Log.Warn("read", append(attrs, "outcome", "refuse", "err", err.Error())...)
		} else {
			s.Log.Info("read", append(attrs, "outcome", "ok", "signed", resp.Sig != nil)...)
		}
	case courier.OpWrite:
		resp, err = s.write(req)
		attrs := []any{"peer", unit, "peer_pid", pid, "root", req.Root, "old", req.OldDigest, "digest", projpolicy.Digest(req.Bytes)}
		if err != nil {
			s.Log.Warn("write", append(attrs, "outcome", "refuse", "err", err.Error())...)
		} else {
			s.Log.Info("write", append(attrs, "outcome", "written")...)
		}
	default:
		err = fmt.Errorf("unknown op %q", req.Op)
		s.Log.Warn("refused", "peer", unit, "peer_pid", pid, "reason", err.Error())
	}
	if err != nil {
		resp = courier.Response{Error: err.Error()}
	}
	reply(c, resp)
}

func reply(c *net.UnixConn, r courier.Response) {
	b, _ := json.Marshal(r)
	_, _ = c.Write(append(b, '\n'))
}

// checkPeer is the unit the peer runs in, which must be one served, as its
// user's uid: the uid alone would let any process of the signer's or the
// gate's user in, and the cgroup alone any user a unit could run as.
func (s *Server) checkPeer(c *net.UnixConn) (string, int, error) {
	r, err := s.who(c)
	if err != nil {
		return "", 0, err
	}
	pid := 0
	if len(r.Chain) > 0 {
		pid = r.Chain[0].Pid
	}
	if r.CgroupID == 0 {
		return "", pid, fmt.Errorf("peer pid %d's cgroup cannot be read", pid)
	}
	for unit, uid := range s.Peers {
		ino, err := s.unitCgroup(unit)
		if err != nil || ino != r.CgroupID {
			continue
		}
		if r.PeerUID != uid {
			return unit, pid, fmt.Errorf("peer pid %d in %s is uid %d, not %d", pid, unit, r.PeerUID, uid)
		}
		return unit, pid, nil
	}
	cg := ""
	if len(r.Chain) > 0 {
		cg = r.Chain[0].Cgroup
	}
	return "", pid, fmt.Errorf("peer pid %d (uid %d) is in %s, not a unit this courier serves", pid, r.PeerUID, cg)
}

// read is the policy file above the anchor's working directory.
func (s *Server) read(req courier.Request) (courier.Response, error) {
	dir := filepath.Join("/proc", strconv.Itoa(req.Pid))
	if req.Pid <= 0 || req.Start == 0 {
		return courier.Response{}, errors.New("read needs the anchor's pid and start")
	}
	if !peer.Alive(req.Pid, req.Start) {
		return courier.Response{}, fmt.Errorf("pid %d is not the process that started at %d", req.Pid, req.Start)
	}
	var st syscall.Stat_t
	if err := syscall.Stat(dir, &st); err != nil {
		return courier.Response{}, err
	}
	if int(st.Uid) != s.UID {
		return courier.Response{}, fmt.Errorf("pid %d is uid %d's, not %d's", req.Pid, st.Uid, s.UID)
	}
	if err := sameRoot(filepath.Join(dir, "root")); err != nil {
		return courier.Response{}, fmt.Errorf("pid %d: %w", req.Pid, err)
	}
	cwd, err := os.Readlink(filepath.Join(dir, "cwd"))
	if err != nil {
		return courier.Response{}, err
	}
	if !peer.Alive(req.Pid, req.Start) {
		return courier.Response{}, fmt.Errorf("pid %d exited while it was read", req.Pid)
	}
	if strings.HasSuffix(cwd, " (deleted)") || !filepath.IsAbs(cwd) {
		return courier.Response{}, fmt.Errorf("pid %d's working directory %q is gone", req.Pid, cwd)
	}
	root, err := projpolicy.Find(cwd, s.Home, s.Name)
	if errors.Is(err, projpolicy.ErrNotFound) {
		// No file yet: the project is the repository the anchor is in, if
		// it is in one, where a first rule would be written.
		if root = gitRoot(cwd, s.Home); root == "" {
			return courier.Response{}, nil
		}
		ns, err := projpolicy.Namespace(root, s.Home)
		if err != nil {
			return courier.Response{}, err
		}
		return courier.Response{Root: root, Namespace: ns}, nil
	}
	if err != nil {
		return courier.Response{}, err
	}
	ns, err := projpolicy.Namespace(root, s.Home)
	if err != nil {
		return courier.Response{}, err
	}
	path := filepath.Join(root, s.Name)
	b, err := projpolicy.ReadFile(path)
	if err != nil {
		return courier.Response{}, err
	}
	sig, err := projpolicy.ReadFile(path + projpolicy.SigSuffix)
	if err != nil && !errors.Is(err, fs.ErrNotExist) {
		return courier.Response{}, err
	}
	return courier.Response{Root: root, Namespace: ns, Bytes: b, Sig: sig, Digest: projpolicy.Digest(b)}, nil
}

// gitRoot is the nearest directory from dir up to home, both included,
// holding .git (a repository's directory, or a worktree's file), or "".
func gitRoot(dir, home string) string {
	dir, home = filepath.Clean(dir), filepath.Clean(home)
	if dir != home && !strings.HasPrefix(dir, strings.TrimSuffix(home, "/")+"/") {
		return ""
	}
	for d := dir; ; d = filepath.Dir(d) {
		if st, err := os.Lstat(filepath.Join(d, ".git")); err == nil && (st.IsDir() || st.Mode().IsRegular()) {
			return d
		}
		if d == home || d == "/" {
			return ""
		}
	}
}

// sameRoot refuses a process whose root is not this one's: a sandbox's
// working directory is a path in its own tree, which here names something
// else, or nothing.
func sameRoot(path string) error {
	var theirs, ours syscall.Stat_t
	if err := syscall.Stat(path, &theirs); err != nil {
		return err
	}
	if err := syscall.Stat("/", &ours); err != nil {
		return err
	}
	if theirs.Dev != ours.Dev || theirs.Ino != ours.Ino {
		return errors.New("its root is not the host's: it is in a sandbox")
	}
	return nil
}

// write replaces the policy file at root and its signature, if the file is
// still the one oldDigest names, the new one is canonical and its signature
// verifies there. The json is renamed into place before the sig, both from
// temporary files beside them, under an exclusive flock on root.
func (s *Server) write(req courier.Request) (courier.Response, error) {
	root := req.Root
	if !filepath.IsAbs(root) || filepath.Clean(root) != root {
		return courier.Response{}, fmt.Errorf("root %q is not absolute and clean", root)
	}
	if root != s.Home && !strings.HasPrefix(root, strings.TrimSuffix(s.Home, "/")+"/") {
		return courier.Response{}, fmt.Errorf("root %s is not under %s", root, s.Home)
	}
	if req.Bytes == nil || req.Sig == nil {
		return courier.Response{}, errors.New("write needs bytes and sig")
	}
	if !projpolicy.Canonical(req.Bytes) {
		return courier.Response{}, errors.New("the new file is not canonical")
	}
	ns, err := projpolicy.Namespace(root, s.Home)
	if err != nil {
		return courier.Response{}, err
	}
	signers, err := s.Signers()
	if err != nil {
		return courier.Response{}, err
	}
	if _, err := projpolicy.Verify(req.Bytes, req.Sig, ns, signers, "", time.Now()); err != nil {
		return courier.Response{}, fmt.Errorf("the new signature does not verify in %s: %w", ns, err)
	}

	d, err := os.OpenFile(root, os.O_RDONLY|syscall.O_DIRECTORY|syscall.O_NOFOLLOW, 0)
	if err != nil {
		return courier.Response{}, err
	}
	defer d.Close()
	if err := unix.Flock(int(d.Fd()), unix.LOCK_EX); err != nil {
		return courier.Response{}, fmt.Errorf("flock %s: %w", root, err)
	}
	path := filepath.Join(root, s.Name)
	cur, err := projpolicy.ReadFile(path)
	if err != nil && !errors.Is(err, fs.ErrNotExist) {
		return courier.Response{}, err
	}
	if errors.Is(err, fs.ErrNotExist) {
		cur = nil
	}
	if got := projpolicy.Digest(cur); got != req.OldDigest {
		return courier.Response{}, fmt.Errorf("%w: it is %q, not %q", courier.ErrChanged, got, req.OldDigest)
	}
	jsonTmp, err := temp(root, s.Name, req.Bytes)
	if err != nil {
		return courier.Response{}, err
	}
	defer os.Remove(jsonTmp)
	sigTmp, err := temp(root, s.Name+projpolicy.SigSuffix, req.Sig)
	if err != nil {
		return courier.Response{}, err
	}
	defer os.Remove(sigTmp)
	if err := os.Rename(jsonTmp, path); err != nil {
		return courier.Response{}, err
	}
	if err := os.Rename(sigTmp, path+projpolicy.SigSuffix); err != nil {
		return courier.Response{}, err
	}
	if err := d.Sync(); err != nil {
		return courier.Response{}, err
	}
	return courier.Response{Root: root, Namespace: ns, Digest: projpolicy.Digest(req.Bytes)}, nil
}

func temp(dir, name string, b []byte) (string, error) {
	f, err := os.CreateTemp(dir, "."+name+".*")
	if err != nil {
		return "", err
	}
	_, err = f.Write(b)
	if err == nil {
		err = f.Chmod(0o644)
	}
	if err == nil {
		err = f.Sync()
	}
	if cerr := f.Close(); err == nil {
		err = cerr
	}
	if err != nil {
		os.Remove(f.Name())
		return "", err
	}
	return f.Name(), nil
}
