//! Remote mode's ssh-agent client: the first identity among the listed keys
//! answers the gate's message in the quoin-sudo@quoin extension. Nothing
//! falls back to a plain sign.

const std = @import("std");
const fd = @import("fd");

/// OpenSSH's agent message limit.
pub const max_frame = 256 * 1024;

const failure = 5;
const success = 6;
const request_identities = 11;
const identities_answer = 12;
const sign_response = 14;
const extension = 27;
const extension_failure = 28;

/// The agent extension a remote sudo is asked through.
pub const extension_name = "quoin-sudo@quoin";

/// SSH wire encoding: uint32 big-endian, string as uint32 length then bytes.
pub const Reader = struct {
    b: []const u8,

    pub fn byte(r: *Reader) ?u8 {
        if (r.b.len < 1) return null;
        defer r.b = r.b[1..];
        return r.b[0];
    }

    pub fn int(r: *Reader) ?u32 {
        if (r.b.len < 4) return null;
        defer r.b = r.b[4..];
        return std.mem.readInt(u32, r.b[0..4], .big);
    }

    pub fn string(r: *Reader) ?[]const u8 {
        const n = r.int() orelse return null;
        if (n > r.b.len) return null;
        defer r.b = r.b[n..];
        return r.b[0..n];
    }

    pub fn done(r: Reader) bool {
        return r.b.len == 0;
    }
};

/// Whether `keys` is exactly `uint32 n, string blob × n` with n ≥ 1 and no
/// blob empty.
pub fn validKeys(keys: []const u8) bool {
    var r: Reader = .{ .b = keys };
    const n = r.int() orelse return false;
    if (n == 0) return false;
    for (0..n) |_| {
        const k = r.string() orelse return false;
        if (k.len == 0) return false;
    }
    return r.done();
}

/// The listed key byte-equal to `blob`, as a slice of `keys`.
fn listed(keys: []const u8, blob: []const u8) ?[]const u8 {
    var r: Reader = .{ .b = keys };
    const n = r.int() orelse return null;
    for (0..n) |_| {
        const k = r.string() orelse return null;
        if (std.mem.eql(u8, k, blob)) return k;
    }
    return null;
}

const hung_up = "the forwarded agent hung up";
const garbage = "the forwarded agent sent garbage";

/// One agent frame into `buf`: u32be length, then that many bytes.
fn frame(s: fd.Sock, buf: *[max_frame]u8) error{ HungUp, Garbage }![]u8 {
    var h: [4]u8 = undefined;
    if ((s.recvFull(&h) catch return error.HungUp) != h.len) return error.HungUp;
    const len = std.mem.readInt(u32, &h, .big);
    if (len == 0 or len > max_frame) return error.Garbage;
    const body = buf[0..len];
    if ((s.recvFull(body) catch return error.HungUp) != len) return error.HungUp;
    return body;
}

fn frameWhy(e: error{ HungUp, Garbage }) []const u8 {
    return switch (e) {
        error.HungUp => hung_up,
        error.Garbage => garbage,
    };
}

/// The first identity of the agent on `s` that is among `keys`
/// (validKeys), as a slice of `keys`, or why there is none.
fn identity(s: fd.Sock, keys: []const u8, buf: *[max_frame]u8) union(enum) { key: []const u8, failed: []const u8 } {
    s.sendAll(&.{ 0, 0, 0, 1, request_identities }) catch return .{ .failed = hung_up };
    var r: Reader = .{ .b = frame(s, buf) catch |e| return .{ .failed = frameWhy(e) } };
    switch (r.byte() orelse return .{ .failed = garbage }) {
        identities_answer => {},
        failure => return .{ .failed = "the forwarded agent failed" },
        else => return .{ .failed = garbage },
    }
    const n = r.int() orelse return .{ .failed = garbage };
    var key: ?[]const u8 = null;
    for (0..n) |_| {
        const blob = r.string() orelse return .{ .failed = garbage };
        _ = r.string() orelse return .{ .failed = garbage };
        if (key == null) key = listed(keys, blob);
    }
    if (!r.done()) return .{ .failed = garbage };
    return .{ .key = key orelse return .{ .failed = "no listed key in the forwarded agent" } };
}

/// Whether `sig` is an SSH signature: string format, string blob.
fn isSignature(sig: []const u8) bool {
    var inner: Reader = .{ .b = sig };
    _ = inner.string() orelse return false;
    _ = inner.string() orelse return false;
    return inner.done();
}

pub const Answered = union(enum) {
    /// `key` is a slice of the listed keys; `answer` the signer's answer
    /// and `signature` its signature over the message then the answer,
    /// string format | string blob, each a slice of the frame buffer.
    answered: struct { key: []const u8, answer: []const u8, signature: []const u8 },
    /// Printable ASCII, for the 'f' record.
    failed: []const u8,
};

/// Asks the agent on `s` for its identities and puts `message` to the
/// first one that is among `keys` (validKeys) in the quoin-sudo@quoin
/// extension: byte 27, string name, string key blob, string message. Only
/// SSH_AGENT_SUCCESS, string answer, string signature, is an answer; a
/// stock agent, which knows no such extension, fails it, and nothing
/// falls back to a plain sign. No timeout: a person answers on the client.
pub fn ask(s: fd.Sock, keys: []const u8, message: []const u8, buf: *[max_frame]u8) Answered {
    const k = switch (identity(s, keys, buf)) {
        .key => |k| k,
        .failed => |why| return .{ .failed = why },
    };
    const len = 1 + 4 + extension_name.len + 4 + k.len + 4 + message.len;
    if (len > max_frame) return .{ .failed = "message too long for the agent" };
    var head: [9 + extension_name.len + 4]u8 = undefined;
    std.mem.writeInt(u32, head[0..4], @intCast(len), .big);
    head[4] = extension;
    std.mem.writeInt(u32, head[5..9], extension_name.len, .big);
    @memcpy(head[9..][0..extension_name.len], extension_name);
    std.mem.writeInt(u32, head[9 + extension_name.len ..][0..4], @intCast(k.len), .big);
    var mlen: [4]u8 = undefined;
    std.mem.writeInt(u32, &mlen, @intCast(message.len), .big);
    for ([_][]const u8{ &head, k, &mlen, message }) |part| s.sendAll(part) catch return .{ .failed = hung_up };

    var r: Reader = .{ .b = frame(s, buf) catch |e| return .{ .failed = frameWhy(e) } };
    switch (r.byte() orelse return .{ .failed = garbage }) {
        success => {},
        failure, extension_failure => return .{ .failed = "the forwarded agent refused" },
        else => return .{ .failed = garbage },
    }
    const answer = r.string() orelse return .{ .failed = garbage };
    const sig = r.string() orelse return .{ .failed = garbage };
    if (!r.done() or !isSignature(sig)) return .{ .failed = garbage };
    return .{ .answered = .{ .key = k, .answer = answer, .signature = sig } };
}

const testing = std.testing;

fn put(out: []u8, at: *usize, b: []const u8) void {
    @memcpy(out[at.*..][0..b.len], b);
    at.* += b.len;
}

fn putInt(out: []u8, at: *usize, v: u32) void {
    std.mem.writeInt(u32, out[at.*..][0..4], v, .big);
    at.* += 4;
}

fn putString(out: []u8, at: *usize, b: []const u8) void {
    putInt(out, at, @intCast(b.len));
    put(out, at, b);
}

/// A frame of `kind` and the strings `parts`; an identities answer counts
/// its key and comment pairs first.
fn testFrame(out: []u8, kind: u8, parts: []const []const u8) []u8 {
    var at: usize = 4;
    out[at] = kind;
    at += 1;
    if (kind == identities_answer) putInt(out, &at, @intCast(parts.len / 2));
    for (parts) |p| putString(out, &at, p);
    std.mem.writeInt(u32, out[0..4], @intCast(at - 4), .big);
    return out[0..at];
}

/// A test agent on a unix socket: reads one request, answers with the next
/// canned reply, and records what it was sent.
const TestAgent = struct {
    listener: std.posix.socket_t,
    path: []const u8,
    replies: []const []const u8,
    thread: std.Thread = undefined,
    got: [2][1024]u8 = undefined,
    got_len: [2]usize = .{ 0, 0 },

    fn start(path: []const u8, replies: []const []const u8) !*TestAgent {
        std.posix.unlink(path) catch |err| std.debug.assert(err == error.FileNotFound);
        const l = try std.posix.socket(std.posix.AF.UNIX, std.posix.SOCK.STREAM | std.posix.SOCK.CLOEXEC, 0);
        const addr = try std.net.Address.initUnix(path);
        try std.posix.bind(l, &addr.any, addr.getOsSockLen());
        try std.posix.listen(l, 1);
        const a = try testing.allocator.create(TestAgent);
        a.* = .{ .listener = l, .path = path, .replies = replies };
        a.thread = try std.Thread.spawn(.{}, serve, .{a});
        return a;
    }

    fn serve(a: *TestAgent) void {
        const conn = std.posix.accept(a.listener, null, null, std.posix.SOCK.CLOEXEC) catch return;
        defer std.posix.close(conn);
        for (a.replies, 0..) |reply, i| {
            var h: [4]u8 = undefined;
            if (readFull(conn, &h) != 4) return;
            const len = std.mem.readInt(u32, &h, .big);
            if (len > a.got[i].len or readFull(conn, a.got[i][0..len]) != len) return;
            a.got_len[i] = len;
            _ = std.posix.write(conn, reply) catch return;
        }
    }

    fn readFull(f: std.posix.socket_t, buf: []u8) usize {
        var done: usize = 0;
        while (done < buf.len) {
            const n = std.posix.read(f, buf[done..]) catch return done;
            if (n == 0) return done;
            done += n;
        }
        return done;
    }

    fn stop(a: *TestAgent) void {
        a.thread.join();
        std.posix.close(a.listener);
        std.posix.unlink(a.path) catch |err| std.debug.panic("unlink: {}", .{err});
        testing.allocator.destroy(a);
    }
};

var test_buf: [max_frame]u8 = undefined;

fn listedKeys(out: []u8, keys: []const []const u8) []u8 {
    var at: usize = 0;
    putInt(out, &at, @intCast(keys.len));
    for (keys) |k| putString(out, &at, k);
    return out[0..at];
}

test "the listed keys parse only as a count of at least one and non-empty blobs" {
    var kb: [128]u8 = undefined;
    try testing.expect(validKeys(listedKeys(&kb, &.{ "a", "b" })));
    try testing.expect(!validKeys(listedKeys(&kb, &.{})));
    try testing.expect(!validKeys(listedKeys(&kb, &.{""})));
    try testing.expect(!validKeys("\x00\x00\x00\x01\x00\x00\x00\x02a"));
    try testing.expect(!validKeys("\x00\x00\x00\x01\x00\x00\x00\x01ab"));
}

fn askWith(replies: []const []const u8, keys: []const u8) !struct { Answered, *TestAgent } {
    const a = try TestAgent.start("agent-test.sock", replies);
    const s = try fd.connectUnix("agent-test.sock");
    defer s.close();
    return .{ ask(s, keys, "the message", &test_buf), a };
}

/// An SSH signature, string format and string blob.
fn testSignature(out: []u8) []u8 {
    var at: usize = 0;
    putString(out, &at, "ssh-ed25519");
    putString(out, &at, "sigbytes");
    return out[0..at];
}

test "the message goes to the first listed identity in the extension, and its answer and signature come back" {
    var kb: [128]u8 = undefined;
    const keys = listedKeys(&kb, &.{ "key-b", "key-c" });
    var ib: [256]u8 = undefined;
    const ids = testFrame(&ib, identities_answer, &.{ "key-a", "comment a", "key-c", "comment c", "key-b", "comment b" });
    var sig: [64]u8 = undefined;
    var rb: [256]u8 = undefined;
    const reply = testFrame(&rb, success, &.{ "the answer", testSignature(&sig) });
    const out, const a = try askWith(&.{ ids, reply }, keys);
    defer a.stop();
    try testing.expectEqualStrings("key-c", out.answered.key);
    try testing.expectEqualStrings("the answer", out.answered.answer);
    try testing.expectEqualSlices(u8, testSignature(&sig), out.answered.signature);
    try testing.expectEqualSlices(u8, &.{request_identities}, a.got[0][0..a.got_len[0]]);
    try testing.expectEqualSlices(u8, "\x1b\x00\x00\x00\x10quoin-sudo@quoin\x00\x00\x00\x05key-c\x00\x00\x00\x0bthe message", a.got[1][0..a.got_len[1]]);
}

test "a stock agent's failure, an extension failure, a sign response, a bad signature, EOF, garbage and no listed identity are each a reason" {
    var kb: [128]u8 = undefined;
    const keys = listedKeys(&kb, &.{"key-b"});
    var ib: [256]u8 = undefined;
    const ids = testFrame(&ib, identities_answer, &.{ "key-b", "" });
    var sig: [64]u8 = undefined;
    var sb: [256]u8 = undefined;
    const sign_resp = testFrame(&sb, sign_response, &.{testSignature(&sig)});
    var bb: [256]u8 = undefined;
    const bad_sig = testFrame(&bb, success, &.{ "the answer", "sigbytes" });
    var nb: [256]u8 = undefined;
    const no_sig = testFrame(&nb, success, &.{"the answer"});
    var ub: [256]u8 = undefined;
    const unlisted = testFrame(&ub, identities_answer, &.{ "key-a", "" });
    const cases = [_]struct { replies: []const []const u8, want: []const u8 }{
        .{ .replies = &.{ ids, "\x00\x00\x00\x01\x05" }, .want = "the forwarded agent refused" },
        .{ .replies = &.{ ids, "\x00\x00\x00\x01\x1c" }, .want = "the forwarded agent refused" },
        .{ .replies = &.{ ids, sign_resp }, .want = garbage },
        .{ .replies = &.{ ids, bad_sig }, .want = garbage },
        .{ .replies = &.{ ids, no_sig }, .want = garbage },
        .{ .replies = &.{ ids, "\x00\x00\x00\x01\x06" }, .want = garbage },
        .{ .replies = &.{ids}, .want = hung_up },
        .{ .replies = &.{}, .want = hung_up },
        .{ .replies = &.{"\x00\x00\x00\x02\x0c"}, .want = hung_up },
        .{ .replies = &.{"\x7f\xff\xff\xff"}, .want = garbage },
        .{ .replies = &.{"\x00\x00\x00\x01\x0e"}, .want = garbage },
        .{ .replies = &.{"\x00\x00\x00\x01\x05"}, .want = "the forwarded agent failed" },
        .{ .replies = &.{unlisted}, .want = "no listed key in the forwarded agent" },
    };
    for (cases) |cs| {
        const out, const a = try askWith(cs.replies, keys);
        a.stop();
        try testing.expectEqualStrings(cs.want, out.failed);
    }
}

test "a message too long for the extension's frame is refused before it is sent" {
    var kb: [128]u8 = undefined;
    const keys = listedKeys(&kb, &.{"key-b"});
    var ib: [256]u8 = undefined;
    const ids = testFrame(&ib, identities_answer, &.{ "key-b", "" });
    const a = try TestAgent.start("agent-test.sock", &.{ids});
    defer a.stop();
    const s = try fd.connectUnix("agent-test.sock");
    defer s.close();
    const big = try testing.allocator.alloc(u8, max_frame - (1 + 4 + extension_name.len + 4 + 5 + 4) + 1);
    defer testing.allocator.free(big);
    try testing.expectEqualStrings("message too long for the agent", ask(s, keys, big, &test_buf).failed);
}
