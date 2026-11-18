//! quoin_audit, the audit plugin sudo loads with the option user=<forUser>,
//! and `remote` when the gate lists remote keys.
//!
//! A gated sudo is remote when the process serving its SSH_AUTH_SOCK is a
//! forwarder (chain.isForwarder): the plugin connects to the agent as the
//! invoking user at open, asks the kernel who listens, reads that
//! process's program as root, and keeps the connection for the signature.
//! So a sudo reparented away from its login, or under mosey, whose spawner
//! is no sshd-session, is remote all the same. One that is not remote but
//! is in an ssh login or a mosey session is stock: it never asks this
//! host's own galley for someone who is not at it.

const std = @import("std");
const abi = @import("abi");
const c = abi.c;
const fd = @import("fd");
const wire = @import("wire");
const chain = @import("chain");
const agent = @import("agent");
const ids = @import("ids");
const config = @import("config");
const args = @import("args");

const gate_not_running = "quoin-sudo: gate not running (systemctl status quoin-sudo.socket); sudo in a terminal is not gated";

var say_fn: c.sudo_printf_t = null;
var gated_user: ?[*:0]const u8 = null;
var user_info: wire.CArray = null;
var settings: wire.CArray = null;
var gate: ?fd.Sock = null;
var remote_check_in = false;
var agent_path_buf: [108]u8 = undefined;
var agent_path: []const u8 = "";
/// The forwarded agent's connection, made at open and kept for the
/// signature, so no second connect opens a second forwarded channel.
var agent_conn: ?fd.Sock = null;
/// The drop to the invoking user, or the restore, failed at open.
var drop_failed = false;
/// open found a remote sudo, by its agent, but the gate did not take it.
var remote_stock = false;
var exe_buf: [chain.max_exe_path]u8 = undefined;

var links: [chain.max_links]chain.Link = undefined;
var request: [wire.max_request]u8 = undefined;
var reply_buf: [wire.max_password + 1]u8 = undefined;
var agent_buf: [agent.max_frame]u8 = undefined;
var signature_request: [wire.max_signature_request]u8 = undefined;
var user_groups: [ids.max_groups]u32 = undefined;

pub export var quoin_audit: c.struct_audit_plugin = .{
    .type = c.SUDO_AUDIT_PLUGIN,
    .version = abi.api_version,
    .open = open,
    .close = close,
    .accept = accept,
};

fn say(kind: c_int, msg: [*:0]const u8) void {
    if (say_fn) |f| _ = f(kind, "%s\n", msg);
}

/// The value of `key=` in a sudo array.
fn lookup(a: wire.CArray, key: []const u8) ?[*:0]const u8 {
    if (a == null) return null;
    var i: usize = 0;
    while (a[i]) |entry| : (i += 1) {
        const e = std.mem.span(@as([*:0]const u8, entry));
        if (e.len > key.len and e[key.len] == '=' and std.mem.startsWith(u8, e, key)) return entry + key.len + 1;
    }
    return null;
}

/// Whether a sudo array has the bare entry `word`.
fn has(a: wire.CArray, word: []const u8) bool {
    if (a == null) return false;
    var i: usize = 0;
    while (a[i]) |entry| : (i += 1) {
        if (std.mem.eql(u8, std.mem.span(@as([*:0]const u8, entry)), word)) return true;
    }
    return false;
}

fn number(a: wire.CArray, key: []const u8) ?u32 {
    return std.fmt.parseInt(u32, std.mem.span(lookup(a, key) orelse return null), 10) catch null;
}

/// `login`: the chain is an ssh login's or a mosey session's, or the test
/// build takes every chain for remote.
const Gating = struct { links: usize, uid: u32, login: bool };

/// The gating test without the mode: the gated user with no tty. Fills
/// `links`.
fn gating(user: [*:0]const u8) ?Gating {
    const name = lookup(user_info, "user") orelse return null;
    if (!std.mem.eql(u8, std.mem.span(name), std.mem.span(user))) return null;
    if (lookup(user_info, "tty") != null) return null;
    const uid = number(user_info, "uid") orelse return null;
    const n = chain.walk(@intCast(std.os.linux.getppid()), &links);
    const l = links[0..n];
    return .{ .links = n, .uid = uid, .login = config.force_remote or chain.sshLogin(l, uid) or chain.moseySession(l, uid) };
}

/// Whether `conn`'s listener is a forwarder of the invoking user's: its
/// uid as the kernel recorded it, and its program read as root, since an
/// sshd-session is not dumpable.
fn forwarded(conn: ?fd.Sock, uid: u32) bool {
    const s = conn orelse return false;
    if ((s.peerUid() catch return false) != uid) return false;
    const exe = chain.exePath(s.peerPid() catch return false, &exe_buf) orelse return false;
    return chain.isForwarder(exe);
}

/// Keeps a non-empty, absolute SSH_AUTH_SOCK that fits sun_path.
fn keepAgentPath(user_env: wire.CArray) bool {
    const p = std.mem.span(lookup(user_env, "SSH_AUTH_SOCK") orelse return false);
    if (p.len == 0 or p[0] != '/' or p.len >= agent_path_buf.len) return false;
    @memcpy(agent_path_buf[0..p.len], p);
    agent_path = agent_path_buf[0..p.len];
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
    _ = .{ version, conversation, errstr };
    say_fn = plugin_printf;
    settings = settings_in;
    user_info = user_info_in;
    remote_check_in = false;
    remote_stock = false;
    drop_failed = false;
    closeAgent();
    agent_path = "";
    gated_user = lookup(plugin_options, "user");
    const user = gated_user orelse return 1;
    if (config.misread_mode or listOrValidate(submit_argv, submit_optind)) return 1;
    const g = gating(user) orelse return 1;
    const wants = has(plugin_options, "remote") and keepAgentPath(submit_envp);
    const conn = if (wants) connectAgent() else null;
    if (wants and (config.force_remote or forwarded(conn, g.uid))) {
        remote_stock = true;
        gate = checkIn(true) catch {
            if (conn) |s| s.close();
            return 1;
        };
        remote_check_in = true;
        agent_conn = conn;
        return 1;
    }
    if (conn) |s| s.close();
    if (drop_failed or g.login) return 1;
    gate = checkIn(false) catch {
        say(c.SUDO_CONV_ERROR_MSG, gate_not_running);
        return 1;
    };
    return 1;
}

fn checkIn(remote: bool) !fd.Sock {
    const s = try fd.connectUnix(config.gate_path);
    errdefer s.close();
    if (try s.peerUid() != config.gate_uid) return error.NotTheGate;
    var req: [15]u8 = undefined;
    try s.sendAll(wire.checkIn(&req, remote));
    const r = try readReply(s, .yes_no);
    if (r.reply != .yes) return error.NoCheckIn;
    return s;
}

const Got = struct { reply: wire.Reply, body: []u8 };

/// A reply: 'M' into request, the others into reply_buf, NUL-terminated
/// after its body.
fn readReply(s: fd.Sock, expect: wire.Expect) !Got {
    errdefer std.crypto.secureZero(u8, &reply_buf);
    var k: [1]u8 = undefined;
    if (try s.recvFull(&k) != 1) return error.NoAnswer;
    const reply = wire.replyKind(k[0], expect) orelse return error.NoAnswer;
    var l: [4]u8 = @splat(0);
    const size = wire.lengthSize(reply);
    if (try s.recvFull(l[4 - size ..]) != size) return error.NoAnswer;
    const len = std.mem.readInt(u32, &l, .big);
    if (!wire.lengthOk(reply, len)) return error.NoAnswer;
    const body = if (reply == .message) request[0..len] else reply_buf[0..len];
    if (try s.recvFull(body) != body.len) return error.NoAnswer;
    if (reply == .message) return .{ .reply = reply, .body = body };
    if (reply != .password and !wire.printable(body)) return error.NoAnswer;
    reply_buf[len] = 0;
    return .{ .reply = reply, .body = body };
}

fn close(status_type: c_int, status: c_int) callconv(.c) void {
    _ = .{ status_type, status };
    if (gate) |s| s.close();
    gate = null;
    closeAgent();
    remote_check_in = false;
}

fn closeAgent() void {
    if (agent_conn) |s| s.close();
    agent_conn = null;
}

fn accept(
    plugin_name: [*c]const u8,
    plugin_type: c_uint,
    command_info: [*c]const [*c]u8,
    run_argv: [*c]const [*c]u8,
    run_envp: [*c]const [*c]u8,
    errstr: [*c][*c]const u8,
) callconv(.c) c_int {
    _ = plugin_name;
    if (plugin_type != c.SUDO_POLICY_PLUGIN) return 1;
    if (listOrValidateRun(command_info)) return 1;
    const user = gated_user orelse return 1;
    const g = gating(user) orelse return 1;
    const s = gate orelse {
        if (drop_failed) {
            errstr.* = "cannot drop to the invoking user";
            return 0;
        }
        if (remote_stock or g.login) return 1;
        errstr.* = "gate not running";
        return 0;
    };
    const req = wire.approval(&request, links[0..g.links], user_info, settings, command_info, run_argv, run_envp, remote_check_in) catch {
        errstr.* = "command too long for the gate";
        return 0;
    };
    s.sendAll(req) catch return noAnswer(errstr);
    if (remote_check_in) return remoteAnswer(s, errstr);
    while (true) {
        const r = readReply(s, .local) catch return noAnswer(errstr);
        switch (r.reply) {
            .yes, .no, .message => return answer(r),
            .password => {
                const ok = verify(user, reply_buf[0..r.body.len :0]);
                std.crypto.secureZero(u8, &reply_buf);
                var v: [16]u8 = undefined;
                s.sendAll(wire.verify(&v, ok)) catch return noAnswer(errstr);
            },
        }
    }
}

/// 'Y' prints a message it has and allows; 'N' prints its message and refuses.
fn answer(r: Got) c_int {
    if (r.reply == .yes) {
        if (r.body.len > 0) say(c.SUDO_CONV_ERROR_MSG, @ptrCast(r.body.ptr));
        return 1;
    }
    if (r.reply == .no) say(c.SUDO_CONV_ERROR_MSG, @ptrCast(r.body.ptr));
    return 0;
}

/// After a remote 'A': the gate's 'M', the forwarded agent's signature in
/// an 'S', and the gate's answer.
fn remoteAnswer(s: fd.Sock, errstr: [*c][*c]const u8) c_int {
    const r = readReply(s, .remote) catch return noAnswer(errstr);
    if (r.reply != .message) return answer(r);
    const m = wire.signing(r.body) orelse return noAnswer(errstr);
    const req = agentStep(m) catch {
        errstr.* = "cannot drop to the invoking user";
        return 0;
    };
    s.sendAll(req) catch return noAnswer(errstr);
    return answer(readReply(s, .yes_no) catch return noAnswer(errstr));
}

/// The 'S' for `m`, signed on the connection open made. error.Drop when
/// open's drop or restore failed.
fn agentStep(m: wire.Signing) error{Drop}![]u8 {
    if (drop_failed) return error.Drop;
    const s = agent_conn orelse return wire.signFailed(&signature_request, "cannot connect to the forwarded agent");
    return switch (agent.sign(s, m.keys, m.message, &agent_buf)) {
        .signed => |x| wire.signature(&signature_request, x.key, x.signature),
        .failed => |why| wire.signFailed(&signature_request, why),
    };
}

const Invoking = struct { uid: u32, gid: u32, groups: []const u32 };

/// The invoking user's ids, from user_info.
fn invokingIds() ?Invoking {
    return .{
        .uid = number(user_info, "uid") orelse return null,
        .gid = number(user_info, "gid") orelse return null,
        .groups = groupList(lookup(user_info, "groups") orelse return null) orelse return null,
    };
}

/// Connects to the agent at agent_path as the invoking user, never as
/// root: root's CAP_DAC_OVERRIDE passes the socket's modes. Null when it
/// cannot, with drop_failed set when the drop or the restore failed.
fn connectAgent() ?fd.Sock {
    const who = invokingIds() orelse {
        drop_failed = true;
        return null;
    };
    if (config.log_ids) logIds("before the drop");
    const s = ids.connectAs(ids.Libc, agent_path, who.uid, who.gid, who.groups) catch |e| {
        if (e != error.Connect) drop_failed = true;
        return null;
    };
    if (config.log_ids) logIds("after the restore");
    return s;
}

var log_groups: [ids.max_groups]u32 = undefined;
var log_line: [4096:0]u8 = undefined;

fn logIds(when: []const u8) void {
    var uid: [3]u32 = undefined;
    var gid: [3]u32 = undefined;
    if (!ids.Libc.getresuid(&uid) or !ids.Libc.getresgid(&gid)) return;
    const groups = ids.Libc.getgroups(&log_groups) orelse return;
    const line = std.fmt.bufPrintZ(&log_line, "quoin-sudo ids {s}: uid {any} gid {any} groups {any}", .{ when, uid, gid, groups }) catch return;
    say(c.SUDO_CONV_ERROR_MSG, line);
}

/// user_info's groups=, comma-separated gids.
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

/// sudo's own command_info for a -l or -v that the policy allowed.
fn listOrValidateRun(command_info: wire.CArray) bool {
    const cmd = std.mem.span(lookup(command_info, "command") orelse return false);
    return std.mem.eql(u8, cmd, "list") or std.mem.eql(u8, cmd, "validate");
}

fn noAnswer(errstr: [*c][*c]const u8) c_int {
    errstr.* = "no answer from gate";
    return 0;
}

/// Answers every prompt with the password; PAM frees what it is given.
fn converse(n: c_int, msgs: [*c][*c]const c.struct_pam_message, resp: [*c][*c]c.struct_pam_response, data: ?*anyopaque) callconv(.c) c_int {
    if (n <= 0) return c.PAM_CONV_ERR;
    const count: usize = @intCast(n);
    const password: [*:0]const u8 = @ptrCast(data orelse return c.PAM_CONV_ERR);
    const replies: [*]c.struct_pam_response = @ptrCast(@alignCast(std.c.calloc(count, @sizeOf(c.struct_pam_response)) orelse return c.PAM_BUF_ERR));
    for (0..count) |i| {
        const style = msgs[i].*.msg_style;
        if (style != c.PAM_PROMPT_ECHO_OFF and style != c.PAM_PROMPT_ECHO_ON) continue;
        const len = std.mem.len(password);
        const copy: [*]u8 = @ptrCast(std.c.malloc(len + 1) orelse {
            for (0..i) |j| if (replies[j].resp) |p| {
                std.crypto.secureZero(u8, std.mem.span(p));
                std.c.free(p);
            };
            std.c.free(replies);
            return c.PAM_BUF_ERR;
        });
        @memcpy(copy[0 .. len + 1], password[0 .. len + 1]);
        replies[i].resp = @ptrCast(copy);
    }
    resp.* = replies;
    return c.PAM_SUCCESS;
}

fn verify(user: [*:0]const u8, password: [*:0]const u8) bool {
    const conv: c.struct_pam_conv = .{ .conv = converse, .appdata_ptr = @constCast(password) };
    var h: ?*c.pam_handle_t = null;
    var rc = c.pam_start("quoin-sudo", user, &conv, &h);
    if (rc == c.PAM_SUCCESS) rc = c.pam_authenticate(h, c.PAM_SILENT);
    if (rc == c.PAM_SUCCESS) rc = c.pam_acct_mgmt(h, c.PAM_SILENT);
    if (h != null) _ = c.pam_end(h, rc);
    return rc == c.PAM_SUCCESS;
}

/// The mode parse, shared with the darwin build.
pub const listOrValidate = args.listOrValidate;
