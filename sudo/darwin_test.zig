//! The darwin plugin from outside, built to take every chain for remote:
//! open, quoin_sudo_armed (the PAM module's question) and accept, against
//! a test agent on a socket that holds a real nistp256 key. An armed sudo
//! is approved by a good signature from a listed key and by nothing else;
//! a sudo it does not arm for is stock.

const std = @import("std");
const plugin = @import("plugin");
const c = @import("abi").c;
const agent = @import("agent");
const sudomsg = @import("sudomsg");
const config = @import("config");
const testing = std.testing;
const Ec = std.crypto.sign.ecdsa.EcdsaP256Sha256;

const agent_name = "quoin-sudo-test-agent.sock";

// ---- sudo's side ----

var said: [600]u8 = undefined;
var said_len: usize = 0;

fn printf(kind: c_int, fmt: [*c]const u8, ...) callconv(.c) c_int {
    _ = .{ kind, fmt };
    var ap = @cVaStart();
    defer @cVaEnd(&ap);
    const s = std.mem.span(@cVaArg(&ap, [*:0]const u8));
    said_len = @min(s.len, said.len);
    @memcpy(said[0..said_len], s[0..said_len]);
    return 0;
}

fn arr(a: anytype) [*c]const [*c]u8 {
    return @ptrCast(a);
}

var strings: [10][1024]u8 = undefined;

fn z(i: usize, comptime fmt: []const u8, args: anytype) [*:0]const u8 {
    return std.fmt.bufPrintZ(&strings[i], fmt, args) catch unreachable; // proven: each fits in 1024
}

var group_buf: [64]u32 = undefined;
var groups_text: [512]u8 = undefined;

/// This process as the invoking user: no setgroups is needed to drop to it.
const Me = struct { user: [*:0]const u8, uid: [*:0]const u8, gid: [*:0]const u8, groups: [*:0]const u8, option: [*:0]const u8, keys: [*:0]const u8, sock: [*:0]const u8 };

fn me() !Me {
    const n = c.getgroups(group_buf.len, &group_buf);
    try testing.expect(n >= 0);
    var len: usize = 0;
    for (group_buf[0..@intCast(n)], 0..) |g, i| {
        len += (try std.fmt.bufPrint(groups_text[len..], "{s}{d}", .{ if (i > 0) "," else "", g })).len;
    }
    const uid = c.getuid();
    var cwd: [std.fs.max_path_bytes]u8 = undefined;
    const here = try std.fs.cwd().realpath(".", &cwd);
    return .{
        .user = z(0, "user=tester{d}", .{uid}),
        .uid = z(1, "uid={d}", .{uid}),
        .gid = z(2, "gid={d}", .{c.getegid()}),
        .groups = z(3, "groups={s}", .{groups_text[0..len]}),
        .option = z(4, "user=tester{d}", .{uid}),
        .keys = z(5, "keys={s}/quoin-sudo-test-keys", .{here}),
        .sock = z(6, "SSH_AUTH_SOCK={s}/" ++ agent_name, .{here}),
    };
}

const Case = struct {
    tty: bool = false,
    other_user: bool = false,
    remote: bool = true,
    sock: enum { ok, none, relative } = .ok,
    list: bool = false,
};

/// user_info outlives open, as sudo keeps it for the whole sudo: the plugin
/// reads it again in accept.
var info: [6:null]?[*:0]const u8 = undefined;

fn open(m: Me, cs: Case) c_int {
    var errstr: [*c]const u8 = null;
    const none = [_:null]?[*:0]const u8{};
    const sudo_l = [_:null]?[*:0]const u8{ "sudo", "-l" };
    const sudo_id = [_:null]?[*:0]const u8{ "sudo", "id", "-un" };
    const user: [*:0]const u8 = if (cs.other_user) "user=someone-else" else m.user;
    info = .{ user, m.uid, m.gid, m.groups, "cwd=/the/cwd", if (cs.tty) "tty=/dev/ttys000" else null };
    const on = [_:null]?[*:0]const u8{ m.option, "remote", m.keys };
    const off = [_:null]?[*:0]const u8{ m.option, m.keys };
    const env_ok = [_:null]?[*:0]const u8{ "PATH=/usr/bin", m.sock };
    const env_none = [_:null]?[*:0]const u8{"PATH=/usr/bin"};
    const env_rel = [_:null]?[*:0]const u8{ "PATH=/usr/bin", "SSH_AUTH_SOCK=agent.sock" };
    const envp = switch (cs.sock) {
        .ok => arr(&env_ok),
        .none => arr(&env_none),
        .relative => arr(&env_rel),
    };
    return plugin.quoin_audit.open.?(c.SUDO_API_VERSION_MAJOR << 16, null, printf, arr(&none), arr(&info), if (cs.list) 2 else 1, if (cs.list) arr(&sudo_l) else arr(&sudo_id), envp, if (cs.remote) arr(&on) else arr(&off), &errstr);
}

fn accept() c_int {
    var errstr: [*c]const u8 = null;
    const command = [_:null]?[*:0]const u8{ "command=/usr/bin/id", "runas_user=root" };
    const argv = [_:null]?[*:0]const u8{ "id", "-un" };
    const envp = [_:null]?[*:0]const u8{"PATH=/usr/bin"};
    return plugin.quoin_audit.accept.?("sudoers", c.SUDO_POLICY_PLUGIN, arr(&command), arr(&argv), arr(&envp), &errstr);
}

fn close() void {
    plugin.quoin_audit.close.?(0, 0);
}

// ---- the agent's side ----

const Answer = enum { sign, refuse, hang_up, garbage, wrong_key, unlisted };

var listed_kp: Ec.KeyPair = undefined;
var other_kp: Ec.KeyPair = undefined;

fn sshString(out: []u8, at: *usize, b: []const u8) void {
    std.mem.writeInt(u32, out[at.*..][0..4], @intCast(b.len), .big);
    @memcpy(out[at.* + 4 ..][0..b.len], b);
    at.* += 4 + b.len;
}

fn blob(out: []u8, kp: Ec.KeyPair) []u8 {
    var at: usize = 0;
    sshString(out, &at, "ecdsa-sha2-nistp256");
    sshString(out, &at, "nistp256");
    sshString(out, &at, &kp.public_key.toUncompressedSec1());
    return out[0..at];
}

fn mpint(out: []u8, at: *usize, half: []const u8) void {
    var v = half;
    while (v.len > 1 and v[0] == 0) v = v[1..];
    var m: [33]u8 = undefined;
    var n = v.len;
    if (v[0] & 0x80 != 0) {
        m[0] = 0;
        @memcpy(m[1 .. 1 + v.len], v);
        n += 1;
    } else @memcpy(m[0..v.len], v);
    sshString(out, at, m[0..n]);
}

/// One agent connection: identities, then the sign request answered as
/// `answer` says; the message it was asked to sign kept.
const Agent = struct {
    listener: std.posix.socket_t,
    answer: Answer,
    thread: std.Thread = undefined,
    message: [8192]u8 = undefined,
    message_len: usize = 0,

    fn start(a: *Agent) !void {
        a.thread = try std.Thread.spawn(.{}, serve, .{a});
    }

    fn frame(conn: std.posix.socket_t, buf: []u8) ?[]u8 {
        var h: [4]u8 = undefined;
        if (readFull(conn, &h) != 4) return null;
        const len = std.mem.readInt(u32, &h, .big);
        if (len > buf.len or readFull(conn, buf[0..len]) != len) return null;
        return buf[0..len];
    }

    fn send(conn: std.posix.socket_t, body: []const u8) void {
        var h: [4]u8 = undefined;
        std.mem.writeInt(u32, &h, @intCast(body.len), .big);
        _ = std.posix.write(conn, &h) catch return;
        _ = std.posix.write(conn, body) catch return;
    }

    fn serve(a: *Agent) void {
        const conn = std.posix.accept(a.listener, null, null, 0) catch return;
        defer std.posix.close(conn);
        var buf: [16384]u8 = undefined;
        _ = frame(conn, &buf) orelse return;
        var ids: [256]u8 = undefined;
        var at: usize = 0;
        ids[0] = 12;
        at = 1;
        std.mem.writeInt(u32, ids[at..][0..4], 1, .big);
        at += 4;
        var kb: [128]u8 = undefined;
        sshString(&ids, &at, blob(&kb, if (a.answer == .unlisted) other_kp else listed_kp));
        sshString(&ids, &at, "test key");
        send(conn, ids[0..at]);
        const req = frame(conn, &buf) orelse return;
        var r: agent.Reader = .{ .b = req[1..] };
        _ = r.string();
        const msg = r.string() orelse return;
        @memcpy(a.message[0..msg.len], msg);
        a.message_len = msg.len;
        switch (a.answer) {
            .hang_up, .unlisted => return,
            .refuse => send(conn, &.{5}),
            .garbage => send(conn, &.{ 14, 0, 0 }),
            .sign, .wrong_key => {
                const kp = if (a.answer == .sign) listed_kp else other_kp;
                const sig = kp.sign(msg, null) catch return;
                var inner: [80]u8 = undefined;
                var ia: usize = 0;
                mpint(&inner, &ia, &sig.r);
                mpint(&inner, &ia, &sig.s);
                var sb: [160]u8 = undefined;
                var sa: usize = 0;
                sshString(&sb, &sa, "ecdsa-sha2-nistp256");
                sshString(&sb, &sa, inner[0..ia]);
                var resp: [200]u8 = undefined;
                resp[0] = 14;
                var ra: usize = 1;
                sshString(&resp, &ra, sb[0..sa]);
                send(conn, resp[0..ra]);
            },
        }
    }
};

fn readFull(f: std.posix.socket_t, buf: []u8) usize {
    var done: usize = 0;
    while (done < buf.len) {
        const n = std.posix.read(f, buf[done..]) catch return done;
        if (n == 0) return done;
        done += n;
    }
    return done;
}

fn listen() !std.posix.socket_t {
    std.posix.unlink(agent_name) catch {};
    const s = try std.posix.socket(std.posix.AF.UNIX, std.posix.SOCK.STREAM, 0);
    const addr = try std.net.Address.initUnix(agent_name);
    try std.posix.bind(s, &addr.any, addr.getOsSockLen());
    try std.posix.listen(s, 1);
    return s;
}

// ---- the fixture ----

fn writeFile(path: []const u8, body: []const u8) !void {
    const f = try std.fs.cwd().createFile(path, .{});
    defer f.close();
    try f.writeAll(body);
}

fn keyLine(out: []u8, kp: Ec.KeyPair) ![]u8 {
    var kb: [128]u8 = undefined;
    const b = blob(&kb, kp);
    var enc: [200]u8 = undefined;
    return std.fmt.bufPrint(out, "ecdsa-sha2-nistp256 {s} listed\n", .{std.base64.standard.Encoder.encode(&enc, b)});
}

/// The listed key, two host keys in quoin-sudo-test-host (b named after a,
/// so name order is a then b) and an empty log.
fn fixture() !void {
    listed_kp = Ec.KeyPair.generate();
    other_kp = Ec.KeyPair.generate();
    var lb: [300]u8 = undefined;
    try writeFile("quoin-sudo-test-keys", try keyLine(&lb, listed_kp));
    std.fs.cwd().deleteTree(config.host_keys_dir) catch {};
    try std.fs.cwd().makePath(config.host_keys_dir);
    var hb: [300]u8 = undefined;
    try writeFile(config.host_keys_dir ++ "/ssh_host_ecdsa_key.pub", try keyLine(&hb, Ec.KeyPair.generate()));
    try writeFile(config.host_keys_dir ++ "/ssh_host_ed25519_key.pub", "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7wrGycGisT+fHX2DD9ohFP+IzDJOQ4cqprClYHszBR host\n");
    try writeFile(config.host_keys_dir ++ "/ssh_host_bad_key.pub", "not a key\n");
    try writeFile(config.host_keys_dir ++ "/other.pub", "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7wrGycGisT+fHX2DD9ohFP+IzDJOQ4cqprClYHszBR other\n");
    try writeFile(config.log_path, "");
}

fn lastRecord(buf: []u8) ![]const u8 {
    const all = try std.fs.cwd().readFile(config.log_path, buf);
    const trimmed = std.mem.trimRight(u8, all, "\n");
    return trimmed[(if (std.mem.lastIndexOfScalar(u8, trimmed, '\n')) |i| i + 1 else 0)..];
}

/// One armed sudo against an agent answering `answer`: accept's result,
/// what sudo was told and the decision record.
fn armedSudo(answer: Answer) !struct { accepted: c_int, agent: *Agent } {
    const m = try me();
    const l = try listen();
    const a = try testing.allocator.create(Agent);
    a.* = .{ .listener = l, .answer = answer };
    try a.start();
    said_len = 0;
    try testing.expectEqual(@as(c_int, 1), open(m, .{}));
    try testing.expectEqual(@as(c_int, 1), plugin.quoin_sudo_armed());
    const got = accept();
    close();
    a.thread.join();
    std.posix.close(l);
    std.posix.unlink(agent_name) catch {};
    return .{ .accepted = got, .agent = a };
}

test "a good signature from a listed key approves, over the message Go's gate would have built" {
    try fixture();
    const r = try armedSudo(.sign);
    defer testing.allocator.destroy(r.agent);
    try testing.expectEqual(@as(c_int, 1), r.accepted);
    try testing.expectEqual(@as(c_int, 0), plugin.quoin_sudo_armed());
    const msg = r.agent.message[0..r.agent.message_len];
    var rd: agent.Reader = .{ .b = msg };
    try testing.expectEqualStrings(sudomsg.magic, rd.string().?);
    try testing.expectEqual(@as(usize, 32), rd.string().?.len);
    try testing.expectEqual(@as(u32, 2), rd.int().?);
    var first: agent.Reader = .{ .b = rd.string().? };
    try testing.expectEqualStrings("ecdsa-sha2-nistp256", first.string().?);
    var second: agent.Reader = .{ .b = rd.string().? };
    try testing.expectEqualStrings("ssh-ed25519", second.string().?);
    var u: [32]u8 = undefined;
    try testing.expectEqualStrings(try std.fmt.bufPrint(&u, "tester{d}", .{c.getuid()}), rd.string().?);
    try testing.expectEqualStrings("root", rd.string().?);
    try testing.expectEqualStrings("/the/cwd", rd.string().?);
    try testing.expectEqual(@as(u32, 2), rd.int().?);
    try testing.expectEqualStrings("/usr/bin/id", rd.string().?);
    try testing.expectEqualStrings("-un", rd.string().?);
    try testing.expectEqualStrings("", rd.string().?);
    try testing.expectEqual(@as(u32, 0), rd.int().?);
    try testing.expect(rd.done());
    var lb: [8192]u8 = undefined;
    const rec = try lastRecord(&lb);
    try testing.expect(std.mem.indexOf(u8, rec, " outcome=allow source=\"signature\"") != null);
    try testing.expect(std.mem.indexOf(u8, rec, " key=SHA256:") != null);
}

test "a refusal, and every failure once armed, refuses rather than falling back to the password" {
    try fixture();
    const cases = [_]struct { answer: Answer, source: []const u8, told: []const u8 }{
        .{ .answer = .refuse, .source = "source=\"agent\" reason=\"the forwarded agent refused\"", .told = "quoin-sudo: the forwarded agent refused" },
        .{ .answer = .hang_up, .source = "source=\"agent\" reason=\"the forwarded agent hung up\"", .told = "quoin-sudo: the forwarded agent hung up" },
        .{ .answer = .garbage, .source = "source=\"agent\" reason=\"the forwarded agent sent garbage\"", .told = "quoin-sudo: the forwarded agent sent garbage" },
        .{ .answer = .unlisted, .source = "source=\"agent\" reason=\"no listed key in the forwarded agent\"", .told = "quoin-sudo: no listed key in the forwarded agent" },
        .{ .answer = .wrong_key, .source = "source=\"signature did not verify\"", .told = "signature did not verify" },
    };
    for (cases) |cs| {
        const r = try armedSudo(cs.answer);
        defer testing.allocator.destroy(r.agent);
        try testing.expectEqual(@as(c_int, 0), r.accepted);
        try testing.expectEqualStrings(cs.told, said[0..said_len]);
        var lb: [8192]u8 = undefined;
        const rec = try lastRecord(&lb);
        try testing.expect(std.mem.indexOf(u8, rec, " outcome=refuse ") != null);
        if (std.mem.indexOf(u8, rec, cs.source) == null) {
            std.debug.print("record: {s}\nwant: {s}\n", .{ rec, cs.source });
            return error.TestUnexpectedResult;
        }
    }
}

test "an armed sudo whose agent is not there refuses" {
    try fixture();
    const m = try me();
    std.posix.unlink(agent_name) catch {};
    try testing.expectEqual(@as(c_int, 1), open(m, .{}));
    try testing.expectEqual(@as(c_int, 1), plugin.quoin_sudo_armed());
    try testing.expectEqual(@as(c_int, 0), accept());
    close();
    try testing.expectEqualStrings("quoin-sudo: cannot connect to the forwarded agent", said[0..said_len]);
}

test "a sudo the plugin cannot arm for is stock: opened, not armed, accepted, no agent asked" {
    try fixture();
    const m = try me();
    const cases = [_]Case{
        .{ .tty = true },
        .{ .other_user = true },
        .{ .remote = false },
        .{ .sock = .none },
        .{ .sock = .relative },
        .{ .list = true },
    };
    for (cases) |cs| {
        try testing.expectEqual(@as(c_int, 1), open(m, cs));
        try testing.expectEqual(@as(c_int, 0), plugin.quoin_sudo_armed());
        try testing.expectEqual(@as(c_int, 1), accept());
        close();
    }
}

test "remote keys that do not parse leave the sudo stock" {
    try fixture();
    try writeFile("quoin-sudo-test-keys", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQC7 not listable\n");
    const m = try me();
    try testing.expectEqual(@as(c_int, 1), open(m, .{}));
    try testing.expectEqual(@as(c_int, 0), plugin.quoin_sudo_armed());
    try testing.expectEqual(@as(c_int, 1), accept());
    close();
}
