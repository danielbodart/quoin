//! quoin_sudo_pam.so: quoin-sudo-pam for macOS, which has no pam_exec, as
//! a PAM module: `auth sufficient quoin_sudo_pam.so user=<forUser>
//! plugin=<quoin_sudo.so>`, in sudo_local, which /etc/pam.d/sudo includes
//! first. The Linux helper's tests -- no PAM_TTY, the sudo service, the
//! gated user -- and then, where it asks the gate whether its parent sudo
//! checked in, it asks the plugin loaded in this same sudo whether it armed
//! for it. Success skips the password; anything else is PAM_IGNORE, and the
//! stack goes on as stock. The plugin, armed, still has every command
//! signed in accept, so a skip here is never an approval.

const std = @import("std");
const c = @import("abi").c;

pub export fn pam_sm_authenticate(h: ?*c.pam_handle_t, flags: c_int, argc: c_int, argv: [*c][*c]const u8) c_int {
    _ = flags;
    const opts: []const [*c]const u8 = if (argc > 0 and argv != null) argv[0..@intCast(argc)] else &.{};
    const user = option(opts, "user") orelse return c.PAM_IGNORE;
    const plugin = option(opts, "plugin") orelse return c.PAM_IGNORE;
    const handle = h orelse return c.PAM_IGNORE;
    return if (skip(item(handle, c.PAM_TTY), item(handle, c.PAM_SERVICE), item(handle, c.PAM_USER), std.mem.span(user)) and armed(plugin)) c.PAM_SUCCESS else c.PAM_IGNORE;
}

pub export fn pam_sm_setcred(h: ?*c.pam_handle_t, flags: c_int, argc: c_int, argv: [*c][*c]const u8) c_int {
    _ = .{ h, flags, argc, argv };
    return c.PAM_IGNORE;
}

/// The Linux helper's skip, without its gate: a tty (sudo sets an empty
/// one when there is none), another service or another user is no.
fn skip(tty: ?[]const u8, service: ?[]const u8, pam_user: ?[]const u8, user: []const u8) bool {
    if (tty) |t| if (t.len > 0) return false;
    if (!std.mem.eql(u8, service orelse return false, "sudo")) return false;
    return std.mem.eql(u8, pam_user orelse return false, user);
}

/// Whether the plugin at `path`, already loaded in this process, armed:
/// RTLD_NOLOAD, so a plugin sudo did not load is no.
fn armed(path: [*:0]const u8) bool {
    const lib = c.dlopen(path, c.RTLD_NOLOAD | c.RTLD_LAZY) orelse return false;
    defer _ = c.dlclose(lib);
    const f: *const fn () callconv(.c) c_int = @ptrCast(@alignCast(c.dlsym(lib, "quoin_sudo_armed") orelse return false));
    return f() == 1;
}

fn item(h: *c.pam_handle_t, kind: c_int) ?[]const u8 {
    var v: ?*const anyopaque = null;
    if (c.pam_get_item(h, kind, &v) != c.PAM_SUCCESS) return null;
    return std.mem.span(@as([*:0]const u8, @ptrCast(v orelse return null)));
}

fn option(opts: []const [*c]const u8, key: []const u8) ?[*:0]const u8 {
    for (opts) |o| {
        const s = std.mem.span(@as([*:0]const u8, o orelse continue));
        if (s.len > key.len and s[key.len] == '=' and std.mem.startsWith(u8, s, key)) return @ptrCast(o + key.len + 1);
    }
    return null;
}

test "a tty, another service or another user skips nothing" {
    try std.testing.expect(!skip("/dev/ttys000", "sudo", "dan", "dan"));
    try std.testing.expect(skip("", "sudo", "dan", "dan"));
    try std.testing.expect(skip(null, "sudo", "dan", "dan"));
    try std.testing.expect(!skip(null, "su", "dan", "dan"));
    try std.testing.expect(!skip(null, null, "dan", "dan"));
    try std.testing.expect(!skip(null, "sudo", "bob", "dan"));
    try std.testing.expect(!skip(null, "sudo", null, "dan"));
}

test "a plugin that is not loaded has not armed" {
    try std.testing.expect(!armed("/nonexistent/quoin_sudo.so"));
}

test "no handle, no user and no plugin are each ignored" {
    const both = [_][*c]const u8{ "user=dan", "plugin=/nonexistent" };
    try std.testing.expectEqual(c.PAM_IGNORE, pam_sm_authenticate(null, 0, 2, @constCast(&both)));
    const no_user = [_][*c]const u8{"plugin=/nonexistent"};
    try std.testing.expectEqual(c.PAM_IGNORE, pam_sm_authenticate(null, 0, 1, @constCast(&no_user)));
    try std.testing.expectEqual(c.PAM_IGNORE, pam_sm_authenticate(null, 0, 0, null));
}
