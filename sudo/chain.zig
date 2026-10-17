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

/// Remote: a link named sshd-session running as `uid` whose parent is a
/// uid-0 sshd-session.
pub fn remote(links: []const Link, uid: u32) bool {
    if (links.len < 2) return false;
    for (links[0 .. links.len - 1], links[1..]) |l, parent| {
        if (l.uid == uid and std.mem.eql(u8, l.comm(), "sshd-session") and
            parent.uid == 0 and std.mem.eql(u8, parent.comm(), "sshd-session")) return true;
    }
    return false;
}

const Stat = struct { comm: []const u8, ppid: u32, tty: u32, start: u64 };

const read = if (darwin) readSysctl else readProc;

/// macOS: the process's kinfo_proc, read twice, its start time the check
/// that the pid was not reused between the reads. The real uid, as Linux
/// takes status's first Uid; no cmdline, which only the Linux gate shows.
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
    l.cmdline_len = 0;
    var again: c.struct_kinfo_proc = undefined;
    if (!kinfo(c, pid, &again)) return false;
    const t2 = again.kp_proc.p_un.__p_starttime;
    return t2.tv_sec == t.tv_sec and t2.tv_usec == t.tv_usec;
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

test "a user's sshd-session under root's is remote, and nothing else is" {
    const remote_chain = [_]Link{ link("bash", 1000), link("sshd-session", 1000), link("sshd-session", 0), link("sshd", 0) };
    try testing.expect(remote(&remote_chain, 1000));
    try testing.expect(!remote(&remote_chain, 1001));
    const detached = [_]Link{ link("sh", 1000), link("systemd", 0) };
    try testing.expect(!remote(&detached, 1000));
    const both_user = [_]Link{ link("sshd-session", 1000), link("sshd-session", 1000) };
    try testing.expect(!remote(&both_user, 1000));
}
