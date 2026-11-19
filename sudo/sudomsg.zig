//! internal/sudomsg's Message, built in Zig for the darwin plugin, which
//! has no Go gate: byte for byte as Marshal and MarshalWithin write it, so
//! quoin-signer reads it as it reads the Linux gate's. The shared golden,
//! testdata/sudomsg/message.bin, is the Go package's own, which its tests
//! hold this copy to.
//!
//! After the magic, the nonce and the host keys comes one string of named
//! fields, key then value, in ascending order of name, each marked
//! critical with a "!": see the Go package for why and for the rule on
//! fields to come.

const std = @import("std");

pub const magic = "quoin-sudo-v1";
pub const nonce_size = 32;
/// OpenSSH's agent message limit, as Go's MaxSize.
pub const max_size = 256 << 10;

/// The limits of the chain, peer.MaxLinks, MaxComm and MaxCmdline.
pub const max_links = 16;
pub const max_comm = 64;
pub const max_cmdline = 4096;

/// A link of the chain, as peer.Link.AppendRecord writes it: the command
/// line NUL-joined, with no NUL after the last argument.
pub const Link = struct {
    pid: u32,
    ppid: u32,
    start: u64,
    uid: u32,
    tty: u32 = 0,
    comm: []const u8,
    cmdline: []const u8 = "",
};

/// The command, who runs it, as whom and where, the danger and environment
/// lines and the chain, leaf first. The darwin build has no danger
/// catalogue yet, so danger and env are empty there.
pub const Message = struct {
    nonce: *const [nonce_size]u8,
    host_keys: []const []const u8,
    user: []const u8,
    run_as: []const u8,
    cwd: []const u8,
    argv: []const []const u8,
    danger: []const []const u8 = &.{},
    env: []const []const u8 = &.{},
    truncated: bool = false,
    links: []const Link = &.{},
};

pub const Error = error{ NoHostKeys, NoCommand, Links, TooLong };

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

    /// Starts a string whose length is filled in by end.
    fn begin(w: *Writer) Error!usize {
        const at = w.at;
        try w.int(0);
        return at;
    }

    fn end(w: *Writer, at: usize) void {
        std.mem.writeInt(u32, w.out[at..][0..4], @intCast(w.at - at - 4), .big);
    }

    fn be(w: *Writer, comptime T: type, v: T) Error!void {
        if (w.out.len - w.at < @sizeOf(T)) return error.TooLong;
        std.mem.writeInt(T, w.out[w.at..][0..@sizeOf(T)], v, .big);
        w.at += @sizeOf(T);
    }

    fn short(w: *Writer, b: []const u8) Error!void {
        try w.be(u16, @intCast(b.len));
        if (w.out.len - w.at < b.len) return error.TooLong;
        @memcpy(w.out[w.at..][0..b.len], b);
        w.at += b.len;
    }

    /// A link's record as a string: its length, then pid, ppid, start,
    /// uid, tty, comm and the command line, or none when `blank`.
    fn link(w: *Writer, l: Link, blank: bool) Error!void {
        const cmdline = if (blank) "" else l.cmdline;
        try w.int(4 + 4 + 8 + 4 + 4 + 2 + l.comm.len + 2 + cmdline.len);
        try w.be(u32, l.pid);
        try w.be(u32, l.ppid);
        try w.be(u64, l.start);
        try w.be(u32, l.uid);
        try w.be(u32, l.tty);
        try w.short(l.comm);
        try w.short(cmdline);
    }
};

/// The message's bytes in `out`, as Message.Marshal: refused with no host
/// key, no command, a chain Go's Parse would refuse, or more than max_size
/// or `out` holds.
pub fn marshal(m: Message, out: []u8) Error![]u8 {
    return write(m, m.links.len, m.truncated, out);
}

/// marshal held to `limit` bytes, as Message.MarshalWithin: over it, the
/// chain's command lines are left out one at a time from the top of the
/// chain down, and cut set, until it fits. The command, danger and env
/// lines are never cut; what does not fit with every command line out is
/// error.TooLong.
pub fn marshalWithin(m: Message, limit: usize, out: []u8) Error![]u8 {
    const room = out[0..@min(out.len, limit)];
    var blank_from = m.links.len;
    var truncated = m.truncated;
    while (true) {
        if (write(m, blank_from, truncated, room)) |b| return b else |e| if (e != error.TooLong) return e;
        while (blank_from > 0 and m.links[blank_from - 1].cmdline.len == 0) blank_from -= 1;
        if (blank_from == 0) return error.TooLong;
        blank_from -= 1;
        truncated = true;
    }
}

/// Links from `blank_from` up are written with no command line. The fields
/// go in ascending order of name, as Parse requires, and chain, cut,
/// danger and env only when there is something in them.
fn write(m: Message, blank_from: usize, truncated: bool, out: []u8) Error![]u8 {
    if (m.host_keys.len == 0) return error.NoHostKeys;
    if (m.argv.len == 0) return error.NoCommand;
    if (m.links.len > max_links) return error.Links;
    for (m.links) |l| if (l.comm.len > max_comm or l.cmdline.len > max_cmdline) return error.Links;
    var w: Writer = .{ .out = out[0..@min(out.len, max_size)] };
    try w.string(magic);
    try w.string(m.nonce);
    try w.list(m.host_keys);
    const fields = try w.begin();
    try w.string("!argv");
    var v = try w.begin();
    try w.list(m.argv);
    w.end(v);
    if (m.links.len > 0) {
        try w.string("!chain");
        v = try w.begin();
        try w.int(m.links.len);
        for (m.links, 0..) |l, i| try w.link(l, i >= blank_from);
        w.end(v);
    }
    if (truncated) {
        try w.string("!cut");
        try w.string("");
    }
    try w.string("!cwd");
    try w.string(m.cwd);
    if (m.danger.len > 0) {
        try w.string("!danger");
        v = try w.begin();
        try w.list(m.danger);
        w.end(v);
    }
    if (m.env.len > 0) {
        try w.string("!env");
        v = try w.begin();
        try w.list(m.env);
        w.end(v);
    }
    try w.string("!runas");
    try w.string(m.run_as);
    try w.string("!user");
    try w.string(m.user);
    w.end(fields);
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

const example_nonce: [nonce_size]u8 = @splat(0xab);

/// Go's example: the chain of a claude's sudo under an ssh login.
fn example(keys: *[2][64]u8) Message {
    const S = struct {
        var host_keys: [2][]const u8 = undefined;
    };
    S.host_keys = .{ hostKey(&keys[0], 1), hostKey(&keys[1], 2) };
    return .{
        .nonce = &example_nonce,
        .host_keys = &S.host_keys,
        .user = "dan",
        .run_as = "root",
        .cwd = "/home/dan",
        .argv = &.{ "/run/current-system/sw/bin/systemctl", "stop", "sshd.service" },
        .danger = &.{"touches a unit that guards this machine"},
        .env = &.{"LD_PRELOAD=/tmp/x.so"},
        .links = &.{
            .{ .pid = 4242, .ppid = 4241, .start = 9000, .uid = 1000, .comm = "bash", .cmdline = "bash\x00-c\x00sudo systemctl stop sshd.service" },
            .{ .pid = 4241, .ppid = 764, .start = 8000, .uid = 1000, .comm = ".claude-unwrapp", .cmdline = "claude" },
            .{ .pid = 764, .ppid = 761, .start = 7000, .uid = 1000, .comm = "sshd-session", .cmdline = "sshd-session: dan@notty" },
            .{ .pid = 761, .ppid = 692, .start = 6900, .uid = 0, .comm = "sshd-session", .cmdline = "sshd-session: dan [priv]" },
            .{ .pid = 692, .ppid = 1, .start = 100, .uid = 0, .comm = "sshd", .cmdline = "sshd: /nix/store/sshd -D -f /etc/ssh/sshd_config [listener]" },
            .{ .pid = 1, .ppid = 0, .start = 1, .uid = 0, .comm = "systemd", .cmdline = "/run/current-system/systemd/lib/systemd/systemd" },
        },
    };
}

test "the message is Go's golden bytes for Go's example" {
    var keys: [2][64]u8 = undefined;
    var out: [2048]u8 = undefined;
    const got = try marshal(example(&keys), &out);
    try testing.expectEqualSlices(u8, @embedFile("testdata/sudomsg/message.bin"), got);
    try testing.expectEqualStrings("\x00\x00\x00\x0dquoin-sudo-v1", got[0..17]);
}

test "marshalWithin leaves command lines out from the top of the chain down until it fits, and says so with cut" {
    var keys: [2][64]u8 = undefined;
    const m = example(&keys);
    var full_buf: [2048]u8 = undefined;
    const full = try marshal(m, &full_buf);
    var out: [2048]u8 = undefined;
    try testing.expectEqualSlices(u8, full, try marshalWithin(m, full.len, &out));

    var links: [6]Link = undefined;
    @memcpy(&links, m.links);
    var cut = m;
    cut.links = &links;
    cut.truncated = true;
    var want_buf: [2048]u8 = undefined;
    for (0..links.len) |n| {
        links[links.len - 1 - n].cmdline = "";
        const want = try marshal(cut, &want_buf);
        try testing.expectEqualSlices(u8, want, try marshalWithin(m, want.len, &out));
        try testing.expect(std.mem.indexOf(u8, want, "\x00\x00\x00\x04!cut\x00\x00\x00\x00") != null);
    }
    const bare = try marshal(cut, &want_buf);
    try testing.expectError(error.TooLong, marshalWithin(m, bare.len - 1, &out));
}

test "a message with no host key, no command, more than 16 links, or a comm or command line past its limit is refused" {
    var keys: [2][64]u8 = undefined;
    const m = example(&keys);
    var out: [2048]u8 = undefined;
    var none = m;
    none.host_keys = &.{};
    try testing.expectError(error.NoHostKeys, marshal(none, &out));
    var bare = m;
    bare.argv = &.{};
    try testing.expectError(error.NoCommand, marshal(bare, &out));
    const many: [max_links + 1]Link = @splat(m.links[0]);
    var long = m;
    long.links = &many;
    try testing.expectError(error.Links, marshal(long, &out));
    try testing.expectError(error.Links, marshalWithin(long, out.len, &out));
    var comm: [1]Link = .{m.links[0]};
    comm[0].comm = "c" ** (max_comm + 1);
    var wide = m;
    wide.links = &comm;
    try testing.expectError(error.Links, marshal(wide, &out));
    var cmd: [1]Link = .{m.links[0]};
    cmd[0].cmdline = "a" ** (max_cmdline + 1);
    wide.links = &cmd;
    try testing.expectError(error.Links, marshal(wide, &out));
    cmd[0].cmdline = "a" ** max_cmdline;
    var big: [8192]u8 = undefined;
    _ = try marshal(wide, &big);
}
