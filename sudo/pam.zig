//! The sudo dialog's password check: PAM's quoin-sudo service,
//! authenticate then account, every prompt answered with the password. The
//! plugin runs it inside sudo for this host's dialog, and quoin-presence
//! for the signer's, so a change to the stack changes both.

const std = @import("std");
const c = @import("abi").c;

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

pub fn verify(user: [*:0]const u8, password: [*:0]const u8) bool {
    const conv: c.struct_pam_conv = .{ .conv = converse, .appdata_ptr = @constCast(password) };
    var h: ?*c.pam_handle_t = null;
    var rc = c.pam_start("quoin-sudo", user, &conv, &h);
    if (rc == c.PAM_SUCCESS) rc = c.pam_authenticate(h, c.PAM_SILENT);
    if (rc == c.PAM_SUCCESS) rc = c.pam_acct_mgmt(h, c.PAM_SILENT);
    if (h != null) _ = c.pam_end(h, rc);
    return rc == c.PAM_SUCCESS;
}
