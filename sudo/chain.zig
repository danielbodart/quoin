//! The chain above sudo, read as root: from /proc on Linux, from
//! sysctl(KERN_PROC_PID) on macOS, which has no /proc.

const std = @import("std");
const builtin = @import("builtin");
const fd = @import("fd");
const darwin = builtin.os.tag == .macos;

pub const max_links = 16;
pub const max_cmdline = 4096;

pub const Link = struct {
    pid: u32 = 0,
    ppid: u32 = 0,
    start: u64 = 0,
    uid: u32 = 0,
    tty: u32 = 0,
    comm_buf: [64]u8 = undefined,
    comm_len: u8 = 0,
    cmdline_buf: [max_cmdline]u8 = undefined,
    cmdline_len: u16 = 0,

    pub fn comm(self: *const Link) []const u8 {
        return self.comm_buf[0..self.comm_len];
    }

    /// NUL-separated, with no NUL after the last argument.
    pub fn cmdline(self: *const Link) []const u8 {
        return self.cmdline_buf[0..self.cmdline_len];
    }
};

/// Fills `links` from `pid` upwards; the number read.
pub fn walk(pid: u32, links: *[max_links]Link) usize {
    var n: usize = 0;
    var next = pid;
    while (n < max_links) {
        if (!read(next, &links[n])) break;
        n += 1;
        if (next == 1) break;
        next = links[n - 1].ppid;
    }
    return n;
}

/// An ssh login: a link named sshd-session running as `uid` whose parent
/// is a uid-0 sshd-session. Not what arms remote mode, which is who serves
/// SSH_AUTH_SOCK (isForwarder), but what keeps a login's sudo from asking
/// the host's own galley when it is not armed.
pub fn sshLogin(links: []const Link, uid: u32) bool {
    if (links.len < 2) return false;
    for (links[0 .. links.len - 1], links[1..]) |l, parent| {
        if (l.uid == uid and std.mem.eql(u8, l.comm(), "sshd-session") and
            parent.uid == 0 and std.mem.eql(u8, parent.comm(), "sshd-session")) return true;
    }
    return false;
}

/// A mosey session: a link of `uid`'s that is mosey's spawner, `mosey
/// --serve=spawner`. Its comm is "exe", since mosey starts it from
/// /proc/self/exe, so it is known by its argv: argv[0] is the path
/// os.Executable gave the launcher, whose basename is mosey's.
pub fn moseySession(links: []const Link, uid: u32) bool {
    for (links) |*l| {
        if (l.uid != uid) continue;
        var args = std.mem.splitScalar(u8, l.cmdline(), 0);
        if (!isMosey(std.fs.path.basename(args.first()))) continue;
        while (args.next()) |a| if (std.mem.eql(u8, a, "--serve=spawner")) return true;
    }
    return false;
}

fn isMosey(base: []const u8) bool {
    return std.mem.eql(u8, base, "mosey") or std.mem.eql(u8, base, ".mosey-wrapped");
}

/// Whether the program at `exe_path` is one that serves a forwarded agent:
/// OpenSSH's sshd-session (sshd before OpenSSH 9.8), and mosey, which may
/// be the user's own (~/.local/bin/mosey, mosey's D7), so where it lives is
/// not asked; nixpkgs' wrapper renames it .mosey-wrapped.
pub fn isForwarder(exe_path: []const u8) bool {
    const base = std.fs.path.basename(exe_path);
    return std.mem.eql(u8, base, "sshd-session") or std.mem.eql(u8, base, "sshd") or isMosey(base);
}

pub const max_exe_path = 4096;

/// The path of the program `pid` runs, read as root: /proc/<pid>/exe on
/// Linux, which only root reads for a process that is not dumpable, as
/// sshd-session is not; proc_pidpath on macOS. Null when it cannot be
/// read, does not fit, or is a deleted file.
pub fn exePath(pid: u32, buf: *[max_exe_path]u8) ?[]const u8 {
    const p: []const u8 = if (darwin) blk: {
        const c = @import("abi").c;
        const n = c.proc_pidpath(@intCast(pid), buf, buf.len);
        if (n <= 0) return null;
        break :blk buf[0..@intCast(n)];
    } else blk: {
        var path: [32]u8 = undefined;
        const linux = std.os.linux;
        const rc = linux.readlink(procPath(&path, pid, "exe"), buf, buf.len);
        if (linux.E.init(rc) != .SUCCESS or rc == 0 or rc >= buf.len) return null;
        break :blk buf[0..rc];
    };
    if (std.mem.endsWith(u8, p, " (deleted)")) return null;
    return p;
}

const Stat = struct { comm: []const u8, ppid: u32, tty: u32, start: u64 };

const read = if (darwin) readSysctl else readProc;

/// macOS: the process's kinfo_proc, read twice, its start time the check
/// that the pid was not reused between the reads, and its arguments,
/// KERN_PROCARGS2, read between them. The real uid, as Linux takes
/// status's first Uid. Arguments that cannot be read, as a zombie's, leave
/// the command line empty, not the link out.
fn readSysctl(pid: u32, l: *Link) bool {
    const c = @import("abi").c;
    var kp: c.struct_kinfo_proc = undefined;
    if (!kinfo(c, pid, &kp)) return false;
    const comm = std.mem.sliceTo(&kp.kp_proc.p_comm, 0);
    l.pid = pid;
    l.ppid = @bitCast(kp.kp_eproc.e_ppid);
    l.uid = kp.kp_eproc.e_pcred.p_ruid;
    l.tty = if (kp.kp_eproc.e_tdev == -1) 0 else @bitCast(kp.kp_eproc.e_tdev);
    const t = kp.kp_proc.p_un.__p_starttime;
    l.start = @as(u64, @intCast(t.tv_sec)) * 1_000_000 + @as(u64, @intCast(t.tv_usec));
    l.comm_len = @intCast(@min(comm.len, l.comm_buf.len));
    @memcpy(l.comm_buf[0..l.comm_len], comm[0..l.comm_len]);
    l.cmdline_len = @intCast(procArgs(c, pid, &l.cmdline_buf).len);
    var again: c.struct_kinfo_proc = undefined;
    if (!kinfo(c, pid, &again)) return false;
    const t2 = again.kp_proc.p_un.__p_starttime;
    return t2.tv_sec == t.tv_sec and t2.tv_usec == t.tv_usec;
}

/// KERN_PROCARGS2 holds argv and the environment, which together ARG_MAX
/// bounds, after the exec path; ps sizes its buffer by KERN_ARGMAX too.
var procargs_buf: [(1 << 20) + (64 << 10)]u8 = undefined;

/// `pid`'s argv, as parseProcArgs joins it into `out`; empty when the
/// sysctl fails.
fn procArgs(comptime c: type, pid: u32, out: *[max_cmdline]u8) []const u8 {
    var mib = [3]c_int{ c.CTL_KERN, c.KERN_PROCARGS2, @intCast(pid) };
    var len: usize = procargs_buf.len;
    if (c.sysctl(&mib, mib.len, &procargs_buf, &len, null, 0) != 0) return out[0..0];
    return parseProcArgs(procargs_buf[0..@min(len, procargs_buf.len)], out);
}

/// KERN_PROCARGS2's argv as /proc/<pid>/cmdline reads on Linux: NUL-joined
/// with no NUL after the last argument, cut at `out`'s size. The buffer is
/// a native int argc, the exec path NUL-terminated, NUL padding, then argc
/// NUL-terminated arguments and the environment, which is not read. A
/// buffer that ends early gives the arguments it holds, a last one cut
/// short included; one too short for argc gives none.
pub fn parseProcArgs(buf: []const u8, out: *[max_cmdline]u8) []const u8 {
    if (buf.len < @sizeOf(c_int)) return out[0..0];
    const argc = std.mem.readInt(c_int, buf[0..@sizeOf(c_int)], builtin.cpu.arch.endian());
    if (argc <= 0) return out[0..0];
    var at: usize = @sizeOf(c_int);
    at = std.mem.indexOfScalarPos(u8, buf, at, 0) orelse return out[0..0];
    while (at < buf.len and buf[at] == 0) at += 1;
    var n: usize = 0;
    var left: usize = @intCast(argc);
    while (left > 0 and at < buf.len) : (left -= 1) {
        const end = std.mem.indexOfScalarPos(u8, buf, at, 0) orelse buf.len;
        if (n > 0) {
            if (n == out.len) break;
            out[n] = 0;
            n += 1;
        }
        const take = @min(end - at, out.len - n);
        @memcpy(out[n..][0..take], buf[at..][0..take]);
        n += take;
        at = end + 1;
    }
    return out[0..n];
}

fn kinfo(comptime c: type, pid: u32, kp: *c.struct_kinfo_proc) bool {
    var mib = [4]c_int{ c.CTL_KERN, c.KERN_PROC, c.KERN_PROC_PID, @intCast(pid) };
    var len: usize = @sizeOf(c.struct_kinfo_proc);
    return c.sysctl(&mib, mib.len, kp, &len, null, 0) == 0 and len == @sizeOf(c.struct_kinfo_proc);
}

fn readProc(pid: u32, l: *Link) bool {
    var path: [32]u8 = undefined;
    var stat_buf: [1024]u8 = undefined;
    var status_buf: [4096]u8 = undefined;

    const st = parseStat(fd.readFile(procPath(&path, pid, "stat"), &stat_buf) orelse return false) orelse return false;
    l.pid = pid;
    l.ppid = st.ppid;
    l.tty = st.tty;
    l.start = st.start;
    l.comm_len = @intCast(@min(st.comm.len, l.comm_buf.len));
    @memcpy(l.comm_buf[0..l.comm_len], st.comm[0..l.comm_len]);

    l.uid = parseUid(fd.readFile(procPath(&path, pid, "status"), &status_buf) orelse return false) orelse return false;

    var cmd = fd.readFile(procPath(&path, pid, "cmdline"), &l.cmdline_buf) orelse return false;
    if (cmd.len > 0 and cmd[cmd.len - 1] == 0) cmd = cmd[0 .. cmd.len - 1];
    l.cmdline_len = @intCast(cmd.len);

    const again = parseStat(fd.readFile(procPath(&path, pid, "stat"), &stat_buf) orelse return false) orelse return false;
    return again.start == l.start;
}

fn procPath(buf: *[32]u8, pid: u32, name: []const u8) [*:0]const u8 {
    return std.fmt.bufPrintZ(buf, "/proc/{d}/{s}", .{ pid, name }) catch unreachable; // proven: "/proc/" ++ 10 digits ++ "/cmdline" fits in 32
}

/// /proc/<pid>/stat: comm between the first '(' and the last ')', then
/// ppid, tty_nr and starttime among the fields after it.
pub fn parseStat(b: []const u8) ?Stat {
    const lp = std.mem.indexOfScalar(u8, b, '(') orelse return null;
    const rp = std.mem.lastIndexOfScalar(u8, b, ')') orelse return null;
    if (rp < lp) return null;
    var fields = std.mem.tokenizeAny(u8, b[rp + 1 ..], " \n");
    var f: [20][]const u8 = undefined;
    for (&f) |*x| x.* = fields.next() orelse return null;
    const tty = std.fmt.parseInt(i32, f[4], 10) catch return null;
    return .{
        .comm = b[lp + 1 .. rp],
        .ppid = std.fmt.parseInt(u32, f[1], 10) catch return null,
        .tty = @bitCast(tty),
        .start = std.fmt.parseInt(u64, f[19], 10) catch return null,
    };
}

/// The real uid from /proc/<pid>/status.
pub fn parseUid(b: []const u8) ?u32 {
    var lines = std.mem.splitScalar(u8, b, '\n');
    while (lines.next()) |line| {
        if (!std.mem.startsWith(u8, line, "Uid:")) continue;
        var f = std.mem.tokenizeAny(u8, line[4..], " \t");
        return std.fmt.parseInt(u32, f.next() orelse return null, 10) catch null;
    }
    return null;
}

const testing = std.testing;

/// The parent of this process, as the plugin walks from sudo's.
pub fn parentPid() u32 {
    return @intCast(if (darwin) std.c.getppid() else std.os.linux.getppid());
}

test "the walk starts at the given pid and follows the ppids" {
    var links: [max_links]Link = undefined;
    const n = walk(parentPid(), &links);
    try testing.expect(n >= 1);
    try testing.expectEqual(parentPid(), links[0].pid);
    for (links[1..n], links[0 .. n - 1]) |l, child| try testing.expectEqual(child.ppid, l.pid);
}

test "a stat whose comm holds spaces and parentheses parses" {
    const st = parseStat("42 (a) b (c)) S 7 42 42 34816 42 0 0 0 0 0 0 0 0 0 20 0 1 0 12345 0 0\n").?;
    try testing.expectEqualStrings("a) b (c)", st.comm);
    try testing.expectEqual(@as(u32, 7), st.ppid);
    try testing.expectEqual(@as(u32, 34816), st.tty);
    try testing.expectEqual(@as(u64, 12345), st.start);
}

test "a short or garbled stat or status is refused" {
    try testing.expect(parseStat("42 (a) S 7") == null);
    try testing.expect(parseStat("42 a) S (") == null);
    try testing.expect(parseUid("Name:\tx\nGid:\t0\n") == null);
    try testing.expectEqual(@as(?u32, 1000), parseUid("Name:\tx\nUid:\t1000\t1000\t1000\t1000\n"));
}

fn link(comm: []const u8, uid: u32) Link {
    var l: Link = .{ .uid = uid };
    @memcpy(l.comm_buf[0..comm.len], comm);
    l.comm_len = @intCast(comm.len);
    return l;
}

test "a user's sshd-session under root's is an ssh login, and nothing else is" {
    const login = [_]Link{ link("bash", 1000), link("sshd-session", 1000), link("sshd-session", 0), link("sshd", 0) };
    try testing.expect(sshLogin(&login, 1000));
    try testing.expect(!sshLogin(&login, 1001));
    const detached = [_]Link{ link("sh", 1000), link("systemd", 0) };
    try testing.expect(!sshLogin(&detached, 1000));
    const both_user = [_]Link{ link("sshd-session", 1000), link("sshd-session", 1000) };
    try testing.expect(!sshLogin(&both_user, 1000));
}

fn withCmdline(comm: []const u8, uid: u32, cmdline: []const u8) Link {
    var l = link(comm, uid);
    @memcpy(l.cmdline_buf[0..cmdline.len], cmdline);
    l.cmdline_len = @intCast(cmdline.len);
    return l;
}

test "a user's mosey --serve=spawner, its comm exe, is a mosey session, and nothing else is" {
    const session = [_]Link{
        withCmdline("bash", 1000, "bash"),
        withCmdline(".claude-unwrapp", 1000, "claude"),
        withCmdline("exe", 1000, "/nix/store/x-mosey/bin/mosey\x00--serve=spawner"),
        withCmdline("systemd", 0, "/run/current-system/systemd/lib/systemd/systemd"),
    };
    try testing.expect(moseySession(&session, 1000));
    try testing.expect(!moseySession(&session, 1001));
    try testing.expect(!sshLogin(&session, 1000));
    const cases = [_]struct { cmdline: []const u8, uid: u32, want: bool }{
        .{ .cmdline = "/home/dan/.local/bin/mosey\x00--serve=spawner", .uid = 1000, .want = true },
        .{ .cmdline = "/nix/store/x-mosey/bin/.mosey-wrapped\x00--serve=spawner", .uid = 1000, .want = true },
        .{ .cmdline = "mosey\x00--serve=spawner", .uid = 1000, .want = true },
        .{ .cmdline = "/nix/store/x-mosey/bin/mosey\x00--serve=spawner", .uid = 1001, .want = false },
        .{ .cmdline = "/nix/store/x-mosey/bin/mosey\x00--serve", .uid = 1000, .want = false },
        .{ .cmdline = "/nix/store/x-mosey/bin/mosey\x00--serve=proto", .uid = 1000, .want = false },
        .{ .cmdline = "/bin/sh\x00--serve=spawner", .uid = 1000, .want = false },
        .{ .cmdline = "--serve=spawner", .uid = 1000, .want = false },
        .{ .cmdline = "/bin/mosey-relay\x00--serve=spawner", .uid = 1000, .want = false },
        .{ .cmdline = "", .uid = 1000, .want = false },
    };
    for (cases) |cs| {
        const one = [_]Link{ withCmdline("sh", 1000, "sh"), withCmdline("exe", cs.uid, cs.cmdline) };
        try testing.expectEqual(cs.want, moseySession(&one, 1000));
    }
}

test "sshd-session, sshd and mosey wherever they live, a user's own included, are forwarders, and nothing else is" {
    for ([_][]const u8{
        "/nix/store/x-openssh-10.6p1/libexec/sshd-session",
        "/usr/sbin/sshd",
        "/nix/store/x-mosey/bin/mosey",
        "/home/dan/.local/bin/mosey",
        "/nix/store/x-mosey/bin/.mosey-wrapped",
    }) |p| try testing.expect(isForwarder(p));
    for ([_][]const u8{
        "/run/current-system/sw/bin/ssh-agent",
        "/nix/store/x-socat/bin/socat",
        "/home/dan/.local/bin/mosey-relay",
        "/home/dan/mosey/bin/exe",
        "/usr/sbin/sshd-session (deleted)",
        "",
        "/",
    }) |p| try testing.expect(!isForwarder(p));
}

/// A KERN_PROCARGS2 buffer: argc, the exec path, `pad` NULs, the
/// arguments each NUL-terminated, and an environment.
fn procargs(out: []u8, argc: c_int, exec_path: []const u8, pad: usize, argv: []const []const u8) []u8 {
    std.mem.writeInt(c_int, out[0..@sizeOf(c_int)], argc, builtin.cpu.arch.endian());
    var at: usize = @sizeOf(c_int);
    @memcpy(out[at..][0..exec_path.len], exec_path);
    at += exec_path.len;
    @memset(out[at..][0 .. pad + 1], 0);
    at += pad + 1;
    for (argv) |a| {
        @memcpy(out[at..][0..a.len], a);
        out[at + a.len] = 0;
        at += a.len + 1;
    }
    const env = "PATH=/usr/bin\x00HOME=/Users/dan\x00";
    @memcpy(out[at..][0..env.len], env);
    return out[0 .. at + env.len];
}

test "KERN_PROCARGS2's argv is NUL-joined as Linux's cmdline, past the exec path and its padding, without the environment" {
    var b: [512]u8 = undefined;
    var out: [max_cmdline]u8 = undefined;
    const full = procargs(&b, 3, "/usr/bin/sudo", 6, &.{ "sudo", "id", "-u" });
    try testing.expectEqualStrings("sudo\x00id\x00-u", parseProcArgs(full, &out));
    try testing.expectEqualStrings("sudo\x00id\x00-u", parseProcArgs(procargs(&b, 3, "/usr/bin/sudo", 0, &.{ "sudo", "id", "-u" }), &out));
    try testing.expectEqualStrings("bash", parseProcArgs(procargs(&b, 1, "/bin/bash", 3, &.{"bash"}), &out));
    try testing.expectEqualStrings("a\x00\x00c", parseProcArgs(procargs(&b, 3, "/x", 1, &.{ "a", "", "c" }), &out));
}

test "a KERN_PROCARGS2 buffer with no arguments, a bad argc, or cut short gives what it holds and no more" {
    var b: [512]u8 = undefined;
    var out: [max_cmdline]u8 = undefined;
    try testing.expectEqualStrings("", parseProcArgs(procargs(&b, 0, "/x", 2, &.{}), &out));
    try testing.expectEqualStrings("", parseProcArgs(procargs(&b, -1, "/x", 2, &.{"a"}), &out));
    try testing.expectEqualStrings("", parseProcArgs("", &out));
    try testing.expectEqualStrings("", parseProcArgs(b[0..2], &out));
    const full = procargs(&b, 3, "/usr/bin/sudo", 6, &.{ "sudo", "id", "-u" });
    const sudo_at = @sizeOf(c_int) + "/usr/bin/sudo".len + 7;
    try testing.expectEqualStrings("", parseProcArgs(full[0 .. @sizeOf(c_int) + 4], &out));
    try testing.expectEqualStrings("", parseProcArgs(full[0..sudo_at], &out));
    try testing.expectEqualStrings("su", parseProcArgs(full[0 .. sudo_at + 2], &out));
    try testing.expectEqualStrings("sudo\x00i", parseProcArgs(full[0 .. sudo_at + 6], &out));
    try testing.expectEqualStrings("sudo", parseProcArgs(procargs(&b, 1, "/usr/bin/sudo", 6, &.{ "sudo", "id" }), &out));
}

test "a KERN_PROCARGS2 command line is cut at max_cmdline" {
    const b = try testing.allocator.alloc(u8, 3 * max_cmdline);
    defer testing.allocator.free(b);
    var out: [max_cmdline]u8 = undefined;
    const long = "a" ** (max_cmdline - 2);
    const got = parseProcArgs(procargs(b, 3, "/x", 1, &.{ "sh", long, "tail" }), &out);
    try testing.expectEqual(@as(usize, max_cmdline), got.len);
    try testing.expectEqualStrings("sh\x00" ++ long[0 .. max_cmdline - 3], got);
    const exact = parseProcArgs(procargs(b, 2, "/x", 1, &.{ "sh", "a" ** (max_cmdline - 3) }), &out);
    try testing.expectEqual(@as(usize, max_cmdline), exact.len);
    const one_more = parseProcArgs(procargs(b, 3, "/x", 1, &.{ "sh", "a" ** (max_cmdline - 3), "b" }), &out);
    try testing.expectEqualStrings(exact, one_more);
}

test "exePath is the program a process runs, and null for no such process" {
    var buf: [max_exe_path]u8 = undefined;
    var self_buf: [max_exe_path]u8 = undefined;
    const self = try std.fs.selfExePath(&self_buf);
    const pid: u32 = @intCast(if (darwin) std.c.getpid() else std.os.linux.getpid());
    try testing.expectEqualStrings(self, exePath(pid, &buf).?);
    try testing.expect(exePath(std.math.maxInt(i32), &buf) == null);
}
