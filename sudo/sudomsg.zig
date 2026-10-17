//! internal/sudomsg's Message, built in Zig for the darwin plugin, which
//! has no Go gate: quoin-sudo-v1, byte for byte as Marshal writes it, so
//! quoin-signer reads it as it reads the Linux gate's. The shared golden,
//! testdata/sudomsg/message.bin, is the Go package's own, which its tests
//! hold this copy to.

const std = @import("std");

pub const magic = "quoin-sudo-v1";
pub const nonce_size = 32;
/// OpenSSH's agent message limit, as Go's MaxSize.
pub const max_size = 256 << 10;

pub const Message = struct {
    nonce: *const [nonce_size]u8,
    host_keys: []const []const u8,
    user: []const u8,
    run_as: []const u8,
    cwd: []const u8,
    argv: []const []const u8,
    /// "", "warning" or "danger"; the darwin build has no danger catalogue
    /// yet, so "" with no reasons.
    level: []const u8 = "",
    reasons: []const []const u8 = &.{},
};

pub const Error = error{ NoHostKeys, Level, TooLong };

const Writer = struct {
    out: []u8,
    at: usize = 0,

    fn int(w: *Writer, v: usize) Error!void {
        if (v > std.math.maxInt(u32) or w.out.len - w.at < 4) return error.TooLong;
        std.mem.writeInt(u32, w.out[w.at..][0..4], @intCast(v), .big);
        w.at += 4;
    }

    fn string(w: *Writer, b: []const u8) Error!void {
        try w.int(b.len);
        if (w.out.len - w.at < b.len) return error.TooLong;
        @memcpy(w.out[w.at..][0..b.len], b);
        w.at += b.len;
    }

    fn list(w: *Writer, l: []const []const u8) Error!void {
        try w.int(l.len);
        for (l) |s| try w.string(s);
    }
};

/// The message's bytes in `out`, as Message.Marshal: refused with no host
/// key, an unknown level, or more than max_size or `out` holds.
pub fn marshal(m: Message, out: []u8) Error![]u8 {
    if (m.host_keys.len == 0) return error.NoHostKeys;
    if (!(m.level.len == 0 or std.mem.eql(u8, m.level, "warning") or std.mem.eql(u8, m.level, "danger"))) return error.Level;
    var w: Writer = .{ .out = out[0..@min(out.len, max_size)] };
    try w.string(magic);
    try w.string(m.nonce);
    try w.list(m.host_keys);
    try w.string(m.user);
    try w.string(m.run_as);
    try w.string(m.cwd);
    try w.list(m.argv);
    try w.string(m.level);
    try w.list(m.reasons);
    return out[0..w.at];
}

const testing = std.testing;

fn hostKey(out: []u8, seed: u8) []u8 {
    const kp = std.crypto.sign.Ed25519.KeyPair.generateDeterministic(@splat(seed)) catch unreachable; // proven: a fixed seed is a valid one
    var w: Writer = .{ .out = out };
    w.string("ssh-ed25519") catch unreachable; // proven: 51 bytes fit the caller's 64
    w.string(&kp.public_key.toBytes()) catch unreachable; // proven: as above
    return out[0..w.at];
}

test "the message is Go's golden bytes for Go's example" {
    var a: [64]u8 = undefined;
    var b: [64]u8 = undefined;
    const nonce: [nonce_size]u8 = @splat(0xab);
    var out: [1024]u8 = undefined;
    const got = try marshal(.{
        .nonce = &nonce,
        .host_keys = &.{ hostKey(&a, 1), hostKey(&b, 2) },
        .user = "dan",
        .run_as = "root",
        .cwd = "/home/dan",
        .argv = &.{ "/run/current-system/sw/bin/systemctl", "stop", "sshd.service" },
        .level = "danger",
        .reasons = &.{ "touches a unit that guards this machine", "LD_PRELOAD=/tmp/x.so" },
    }, &out);
    try testing.expectEqualSlices(u8, @embedFile("testdata/sudomsg/message.bin"), got);
}

test "no host key, an unknown level and a message over the limit are refused" {
    const nonce: [nonce_size]u8 = @splat(0);
    var out: [256]u8 = undefined;
    var k: [64]u8 = undefined;
    const key = hostKey(&k, 1);
    const base: Message = .{ .nonce = &nonce, .host_keys = &.{key}, .user = "dan", .run_as = "root", .cwd = "/", .argv = &.{"/usr/bin/id"} };
    var none = base;
    none.host_keys = &.{};
    try testing.expectError(error.NoHostKeys, marshal(none, &out));
    var level = base;
    level.level = "normal";
    try testing.expectError(error.Level, marshal(level, &out));
    var long = base;
    long.cwd = "/" ** 200;
    try testing.expectError(error.TooLong, marshal(long, &out));
    const ok = try marshal(base, &out);
    try testing.expectEqualStrings("\x00\x00\x00\x0dquoin-sudo-v1", ok[0..17]);
}
