//! fd.zig for macOS: the forwarded agent's connection, as the same
//! generation-checked handles, over libc. No SO_PEERCRED and no gate: the
//! darwin plugin connects only to the agent, and reads files through std.

const std = @import("std");
const c = std.c;

pub const Error = error{ TableFull, Closed, Sys };

const capacity = 4;
const free: i32 = -1;

const Slot = struct {
    raw: i32 = free,
    gen: u32 = 0,
};

var slots: [capacity]Slot = @splat(.{});

fn live(slot: u8, gen: u32) *Slot {
    const s = &slots[slot];
    if (s.raw < 0 or s.gen != gen) @panic("stale descriptor handle");
    return s;
}

fn adopt(raw: i32) Error!Sock {
    for (&slots, 0..) |*s, i| {
        if (s.raw == free) {
            s.raw = raw;
            return .{ .slot = @intCast(i), .gen = s.gen };
        }
    }
    _ = c.close(raw);
    return error.TableFull;
}

fn interrupted() bool {
    return c._errno().* == @intFromEnum(c.E.INTR);
}

/// A connected unix stream socket.
pub const Sock = struct {
    slot: u8,
    gen: u32,

    fn raw(self: Sock) i32 {
        return live(self.slot, self.gen).raw;
    }

    pub fn isLive(self: Sock) bool {
        const s = &slots[self.slot];
        return s.raw >= 0 and s.gen == self.gen;
    }

    pub fn close(self: Sock) void {
        const s = live(self.slot, self.gen);
        _ = c.close(s.raw);
        s.raw = free;
        s.gen +%= 1;
    }

    /// Sends all of `bytes`. The socket was made SO_NOSIGPIPE, macOS's
    /// MSG_NOSIGNAL: an agent that has gone is an error here, never a
    /// SIGPIPE.
    pub fn sendAll(self: Sock, bytes: []const u8) Error!void {
        var done: usize = 0;
        while (done < bytes.len) {
            const rc = c.send(self.raw(), bytes[done..].ptr, bytes.len - done, 0);
            if (rc >= 0) {
                done += @intCast(rc);
            } else if (!interrupted()) return error.Sys;
        }
    }

    /// Reads until `buf` is full or the peer closes; the count read.
    pub fn recvFull(self: Sock, buf: []u8) Error!usize {
        var done: usize = 0;
        while (done < buf.len) {
            const rc = c.read(self.raw(), buf[done..].ptr, buf.len - done);
            if (rc > 0) {
                done += @intCast(rc);
            } else if (rc == 0) {
                return done;
            } else if (!interrupted()) return error.Sys;
        }
        return done;
    }
};

/// Connects to the unix socket at `path`, close-on-exec and SO_NOSIGPIPE.
/// Nothing on it is bounded in time: an agent that is not there refuses the
/// connect, and one that goes ends a send or read with an error or EOF.
pub fn connectUnix(path: []const u8) Error!Sock {
    var addr: c.sockaddr.un = .{ .path = @splat(0) };
    if (path.len >= addr.path.len) return error.Sys;
    @memcpy(addr.path[0..path.len], path);
    const rc = c.socket(c.AF.UNIX, c.SOCK.STREAM, 0);
    if (rc < 0) return error.Sys;
    const sock = try adopt(rc);
    errdefer sock.close();
    const s = live(sock.slot, sock.gen);
    if (c.fcntl(s.raw, c.F.SETFD, @as(c_int, c.FD_CLOEXEC)) != 0) return error.Sys;
    const on: c_int = 1;
    if (c.setsockopt(s.raw, c.SOL.SOCKET, c.SO.NOSIGPIPE, std.mem.asBytes(&on), @sizeOf(c_int)) != 0) return error.Sys;
    while (c.connect(s.raw, @ptrCast(&addr), @sizeOf(c.sockaddr.un)) != 0) {
        if (!interrupted()) return error.Sys;
    }
    return sock;
}

test "a closed handle is no longer live, and its slot is reused under a new generation" {
    var fds: [2]c.fd_t = undefined;
    try std.testing.expectEqual(@as(c_int, 0), c.socketpair(c.AF.UNIX, c.SOCK.STREAM, 0, &fds));
    defer _ = c.close(fds[1]);
    const a = try adopt(fds[0]);
    a.close();
    try std.testing.expect(!a.isLive());
    var more: [2]c.fd_t = undefined;
    try std.testing.expectEqual(@as(c_int, 0), c.socketpair(c.AF.UNIX, c.SOCK.STREAM, 0, &more));
    defer _ = c.close(more[1]);
    const b = try adopt(more[0]);
    defer b.close();
    try std.testing.expectEqual(a.slot, b.slot);
    try std.testing.expect(!a.isLive() and b.isLive());
}

test "a connect to a socket no one listens on is refused, and a send to one that went is an error, not SIGPIPE" {
    std.posix.unlink("fd-test.sock") catch |err| std.debug.assert(err == error.FileNotFound);
    defer std.posix.unlink("fd-test.sock") catch |err| std.debug.panic("unlink: {}", .{err});
    const addr = try std.net.Address.initUnix("fd-test.sock");
    const l = try std.posix.socket(c.AF.UNIX, c.SOCK.STREAM, 0);
    try std.posix.bind(l, &addr.any, addr.getOsSockLen());
    try std.posix.listen(l, 1);
    const s = try connectUnix("fd-test.sock");
    defer s.close();
    const conn = try std.posix.accept(l, null, null, 0);
    std.posix.close(conn);
    std.posix.close(l);
    var b: [1]u8 = undefined;
    try std.testing.expectEqual(@as(usize, 0), try s.recvFull(&b));
    var big: [65536]u8 = @splat(0);
    try std.testing.expectError(error.Sys, s.sendAll(&big));
    try std.testing.expectError(error.Sys, connectUnix("fd-test.sock"));
}
