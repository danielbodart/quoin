//! quoin_audit for macOS: remote mode, in sudo's own process. There is no
//! gate daemon to ask -- remote mode reads no rules -- so the plugin does
//! the gate's remote half (internal/sudogate/remote.go) itself, in the same
//! order and with the same outcomes as the Linux plugin and gate:
//!
//!   open      arms, as Linux checks in: the gated user, not -l or -v, no
//!             tty, a chain under sshd, `remote`, a usable SSH_AUTH_SOCK,
//!             and listed keys that parse. Any miss is stock sudo.
//!   PAM       quoin_sudo_pam.so, sufficient in sudo_local, skips the
//!             password only for a sudo this plugin armed, as the Linux
//!             helper does for one that checked in.
//!   accept    builds quoin-sudo-v1 from sudoers' command_info, has the
//!             forwarded agent sign it as the invoking user, and verifies
//!             the signature against the listed keys. Anything but a good
//!             signature from a listed key -- a refusal, an agent that
//!             cannot be reached, hangs up or answers garbage, no listed
//!             key, a bad signature -- refuses, as the gate does.
//!
//! Nothing waits on a timer: the agent is asked as long as sudo's caller
//! waits. sudo.conf: `Plugin quoin_audit <so> user=<forUser> remote
//! keys=<file>`, the file the listed keys' authorized_keys lines.

const std = @import("std");
const abi = @import("abi");
const c = abi.c;
const fd = @import("fd");
const chain = @import("chain");
const agent = @import("agent");
const ids = @import("ids");
const args = @import("args");
const sshkey = @import("sshkey");
const sudomsg = @import("sudomsg");
const config = @import("config");

const CArray = [*c]const [*c]const u8;

const max_keys = 16;
const max_blob = 1024;
const max_argv = 4096;

var say_fn: c.sudo_printf_t = null;
var gated_user: ?[*:0]const u8 = null;
var user_info: CArray = null;
var armed = false;
var agent_path_buf: [104]u8 = undefined;
var agent_path: []const u8 = "";

var links: [chain.max_links]chain.Link = undefined;
var keys_buf: [4 + max_keys * (4 + max_blob)]u8 = undefined;
var keys: []const u8 = "";
var host_buf: [max_keys][max_blob]u8 = undefined;
var host_keys: [max_keys][]const u8 = undefined;
var argv_words: [max_argv][]const u8 = undefined;
var message_buf: [sudomsg.max_size]u8 = undefined;
var agent_buf: [agent.max_frame]u8 = undefined;
var user_groups: [ids.max_groups]u32 = undefined;

pub export var quoin_audit: c.struct_audit_plugin = .{
    .type = c.SUDO_AUDIT_PLUGIN,
    .version = abi.api_version,
    .open = open,
    .close = close,
    .accept = accept,
};

/// For quoin_sudo_pam.so, in this same sudo: 1 when open armed this sudo.
/// The PAM module finds it with dlopen(RTLD_NOLOAD), so a plugin that is
/// not loaded is a password, not a skip.
pub export fn quoin_sudo_armed() c_int {
    return @intFromBool(armed);
}

fn say(msg: []const u8) void {
    var buf: [1024:0]u8 = undefined;
    const n = @min(msg.len, buf.len);
    @memcpy(buf[0..n], msg[0..n]);
    buf[n] = 0;
    if (say_fn) |f| _ = f(c.SUDO_CONV_ERROR_MSG, "%s\n", &buf);
}

/// The value of `key=` in a sudo array.
fn lookup(a: CArray, key: []const u8) ?[*:0]const u8 {
    if (a == null) return null;
    var i: usize = 0;
    while (a[i]) |entry| : (i += 1) {
        const e = std.mem.span(@as([*:0]const u8, entry));
        if (e.len > key.len and e[key.len] == '=' and std.mem.startsWith(u8, e, key)) return entry + key.len + 1;
    }
    return null;
}

fn has(a: CArray, word: []const u8) bool {
    if (a == null) return false;
    var i: usize = 0;
    while (a[i]) |entry| : (i += 1) {
        if (std.mem.eql(u8, std.mem.span(@as([*:0]const u8, entry)), word)) return true;
    }
    return false;
}

fn number(a: CArray, key: []const u8) ?u32 {
    return std.fmt.parseInt(u32, std.mem.span(lookup(a, key) orelse return null), 10) catch null;
}

/// Linux's gating test: the gated user, no tty, a chain under sshd.
fn remoteGated(user: [*:0]const u8) bool {
    const name = lookup(user_info, "user") orelse return false;
    if (!std.mem.eql(u8, std.mem.span(name), std.mem.span(user))) return false;
    if (lookup(user_info, "tty") != null) return false;
    const uid = number(user_info, "uid") orelse return false;
    const n = chain.walk(chain.parentPid(), &links);
    return config.force_remote or chain.remote(links[0..n], uid);
}

fn keepAgentPath(user_env: CArray) bool {
    const p = std.mem.span(lookup(user_env, "SSH_AUTH_SOCK") orelse return false);
    if (p.len == 0 or p[0] != '/' or p.len >= agent_path_buf.len) return false;
    @memcpy(agent_path_buf[0..p.len], p);
    agent_path = agent_path_buf[0..p.len];
    return true;
}

/// The listed keys from `path`, in agent.validKeys' form.
fn loadKeys(path: [*:0]const u8) bool {
    var text: [64 << 10]u8 = undefined;
    const body = std.fs.cwd().readFile(std.mem.span(path), &text) catch return false;
    keys = sshkey.listed(body, &keys_buf) orelse return false;
    return true;
}

fn open(
    version: c_uint,
    conversation: c.sudo_conv_t,
    plugin_printf: c.sudo_printf_t,
    settings_in: [*c]const [*c]u8,
    user_info_in: [*c]const [*c]u8,
    submit_optind: c_int,
    submit_argv: [*c]const [*c]u8,
    submit_envp: [*c]const [*c]u8,
    plugin_options: [*c]const [*c]u8,
    errstr: [*c][*c]const u8,
) callconv(.c) c_int {
    _ = .{ version, conversation, settings_in, errstr };
    say_fn = plugin_printf;
    user_info = @ptrCast(user_info_in);
    armed = false;
    agent_path = "";
    const options: CArray = @ptrCast(plugin_options);
    gated_user = lookup(options, "user");
    const user = gated_user orelse return 1;
    if (args.listOrValidate(submit_argv, submit_optind)) return 1;
    if (!remoteGated(user)) return 1;
    if (!has(options, "remote") or !keepAgentPath(@ptrCast(submit_envp))) return 1;
    const path = lookup(options, "keys") orelse return 1;
    if (!loadKeys(path)) {
        say("quoin-sudo: the remote keys do not parse; remote sudo is off");
        return 1;
    }
    armed = true;
    return 1;
}

fn close(status_type: c_int, status: c_int) callconv(.c) void {
    _ = .{ status_type, status };
    armed = false;
}

fn listOrValidateRun(command_info: CArray) bool {
    const cmd = std.mem.span(lookup(command_info, "command") orelse return false);
    return std.mem.eql(u8, cmd, "list") or std.mem.eql(u8, cmd, "validate");
}

fn accept(
    plugin_name: [*c]const u8,
    plugin_type: c_uint,
    command_info: [*c]const [*c]u8,
    run_argv: [*c]const [*c]u8,
    run_envp: [*c]const [*c]u8,
    errstr: [*c][*c]const u8,
) callconv(.c) c_int {
    _ = .{ plugin_name, run_envp };
    if (plugin_type != c.SUDO_POLICY_PLUGIN) return 1;
    const info: CArray = @ptrCast(command_info);
    if (listOrValidateRun(info)) return 1;
    if (!armed) return 1;
    return approve(info, @ptrCast(run_argv), errstr);
}

/// The gate's approveRemote and sign, in one: 1 only for a good signature
/// from a listed key over this sudo's message.
fn approve(info: CArray, run_argv: CArray, errstr: [*c][*c]const u8) c_int {
    var rec: Record = .{};
    const program = std.mem.span(lookup(info, "command") orelse return refuse(&rec, "bad request", "bad request", null));
    rec.user = std.mem.span(lookup(user_info, "user") orelse "");
    rec.run_as = std.mem.span(lookup(info, "runas_user") orelse "");
    rec.cwd = std.mem.span(lookup(info, "cwd") orelse lookup(user_info, "cwd") orelse "");
    var n: usize = 1;
    argv_words[0] = program;
    if (run_argv != null and run_argv[0] != null) {
        while (run_argv[n]) |w| : (n += 1) {
            if (n == max_argv) return refuse(&rec, "message", "command too long for the gate", null);
            argv_words[n] = std.mem.span(@as([*:0]const u8, w));
        }
    }
    rec.argv = argv_words[0..n];
    const hosts = ownHostKeys();
    if (hosts.len == 0) return refuse(&rec, "no host keys", "no host keys in /etc/ssh", null);
    rec.host_keys = hosts;
    var nonce: [sudomsg.nonce_size]u8 = undefined;
    std.crypto.random.bytes(&nonce);
    rec.nonce = &nonce;
    const raw = sudomsg.marshal(.{ .nonce = &nonce, .host_keys = hosts, .user = rec.user, .run_as = rec.run_as, .cwd = rec.cwd, .argv = rec.argv }, &message_buf) catch |e|
        return refuse(&rec, "message", if (e == error.TooLong) "command too long for the gate" else "bad request", null);

    const uid = number(user_info, "uid") orelse return dropFailed(&rec, errstr);
    const gid = number(user_info, "gid") orelse return dropFailed(&rec, errstr);
    const groups = groupList(lookup(user_info, "groups") orelse return dropFailed(&rec, errstr)) orelse return dropFailed(&rec, errstr);
    const s = ids.connectAs(ids.Libc, agent_path, uid, gid, groups) catch |e| switch (e) {
        error.Connect => return refuse(&rec, "agent", "quoin-sudo: cannot connect to the forwarded agent", "cannot connect to the forwarded agent"),
        error.Drop, error.Restore => return dropFailed(&rec, errstr),
    };
    defer s.close();
    switch (agent.sign(s, keys, raw, &agent_buf)) {
        .failed => |why| {
            var msg: [256]u8 = undefined;
            return refuse(&rec, "agent", std.fmt.bufPrint(&msg, "quoin-sudo: {s}", .{why}) catch "quoin-sudo: the forwarded agent failed", why);
        },
        .signed => |x| {
            var fp: [50]u8 = undefined;
            rec.key = sshkey.fingerprint(x.key, &fp);
            if (!sshkey.verify(x.key, raw, x.signature)) return refuse(&rec, "signature did not verify", "signature did not verify", null);
            rec.write("allow", "signature", null);
            return 1;
        },
    }
}

fn dropFailed(rec: *Record, errstr: [*c][*c]const u8) c_int {
    rec.write("refuse", "cannot drop to the invoking user", null);
    errstr.* = "cannot drop to the invoking user";
    return 0;
}

/// Refuses, as the gate's 'N': the record, and the message sudo prints.
fn refuse(rec: *Record, source: []const u8, msg: []const u8, reason: ?[]const u8) c_int {
    rec.write("refuse", source, reason);
    say(msg);
    return 0;
}

fn groupList(list: [*:0]const u8) ?[]const u32 {
    const l = std.mem.span(list);
    if (l.len == 0) return user_groups[0..0];
    var n: usize = 0;
    var it = std.mem.splitScalar(u8, l, ',');
    while (it.next()) |g| {
        if (n == user_groups.len) return null;
        user_groups[n] = std.fmt.parseInt(u32, g, 10) catch return null;
        n += 1;
    }
    return user_groups[0..n];
}

/// This host's public host keys, as the gate's ownHostKeys reads its glob
/// /etc/ssh/ssh_host_*_key.pub: in name order, a file that does not parse
/// skipped.
fn ownHostKeys() []const []const u8 {
    var names: [max_keys][std.fs.max_name_bytes]u8 = undefined;
    var lens: [max_keys]usize = undefined;
    var count: usize = 0;
    var dir = std.fs.cwd().openDir(config.host_keys_dir, .{ .iterate = true }) catch return host_keys[0..0];
    defer dir.close();
    var it = dir.iterate();
    while (it.next() catch null) |e| {
        if (count == max_keys) break;
        if (!std.mem.startsWith(u8, e.name, "ssh_host_") or !std.mem.endsWith(u8, e.name, "_key.pub")) continue;
        if (e.name.len < "ssh_host__key.pub".len) continue;
        @memcpy(names[count][0..e.name.len], e.name);
        lens[count] = e.name.len;
        count += 1;
    }
    var order: [max_keys]usize = undefined;
    for (0..count) |i| order[i] = i;
    std.mem.sort(usize, order[0..count], Names{ .names = &names, .lens = &lens }, Names.lessThan);
    var n: usize = 0;
    for (order[0..count]) |i| {
        var text: [8192]u8 = undefined;
        const body = dir.readFile(names[i][0..lens[i]], &text) catch continue;
        const k = sshkey.line(body, &host_buf[n]) orelse continue;
        host_keys[n] = k;
        n += 1;
    }
    return host_keys[0..n];
}

const Names = struct {
    names: *const [max_keys][std.fs.max_name_bytes]u8,
    lens: *const [max_keys]usize,

    fn lessThan(ctx: Names, a: usize, b: usize) bool {
        return std.mem.order(u8, ctx.names[a][0..ctx.lens[a]], ctx.names[b][0..ctx.lens[b]]) == .lt;
    }
};

/// The gate's decision record, one line appended to the root-only log:
/// not the unified log, where os_log and syslog both resolve the format
/// from this dylib, which logd's sandbox may not read.
const Record = struct {
    user: []const u8 = "",
    run_as: []const u8 = "",
    cwd: []const u8 = "",
    argv: []const []const u8 = &.{},
    host_keys: []const []const u8 = &.{},
    nonce: ?*const [sudomsg.nonce_size]u8 = null,
    key: []const u8 = "",

    fn write(r: Record, outcome: []const u8, source: []const u8, reason: ?[]const u8) void {
        var line: [16 << 10]u8 = undefined;
        var w = std.Io.Writer.fixed(&line);
        r.format(&w, outcome, source, reason) catch {
            w.end = @min(w.end, line.len - 1);
            line[w.end] = '\n';
            w.end += 1;
        };
        const f = std.fs.cwd().createFile(config.log_path, .{ .truncate = false, .mode = 0o600 }) catch return;
        defer f.close();
        f.seekFromEnd(0) catch return;
        f.writeAll(w.buffered()) catch return;
    }

    fn format(r: Record, w: *std.Io.Writer, outcome: []const u8, source: []const u8, reason: ?[]const u8) !void {
        try w.print("time={d} level=INFO msg=decision remote=true pid={d}", .{ std.time.timestamp(), std.c.getpid() });
        if (r.nonce) |n| try w.print(" nonce={x}", .{n});
        try w.writeAll(" host_keys=[");
        for (r.host_keys, 0..) |k, i| {
            var fp: [50]u8 = undefined;
            try w.print("{s}{s}", .{ if (i == 0) "" else " ", sshkey.fingerprint(k, &fp) });
        }
        try w.writeAll("]");
        try field(w, "user", r.user);
        try field(w, "runas", r.run_as);
        try field(w, "cwd", r.cwd);
        try w.writeAll(" argv=[");
        for (r.argv, 0..) |a, i| {
            if (i > 0) try w.writeAll(" ");
            try quoted(w, a);
        }
        try w.writeAll("]");
        try w.print(" key={s} outcome={s}", .{ r.key, outcome });
        try field(w, "source", source);
        if (reason) |why| try field(w, "reason", why);
        try w.writeAll("\n");
    }

    fn field(w: *std.Io.Writer, name: []const u8, v: []const u8) !void {
        try w.print(" {s}=", .{name});
        try quoted(w, v);
    }

    fn quoted(w: *std.Io.Writer, v: []const u8) !void {
        try w.writeByte('"');
        for (v) |ch| switch (ch) {
            '"', '\\' => try w.print("\\{c}", .{ch}),
            0x20...0x21, 0x23...0x5b, 0x5d...0x7e => try w.writeByte(ch),
            else => try w.print("\\x{x:0>2}", .{ch}),
        };
        try w.writeByte('"');
    }
};
