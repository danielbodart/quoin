//! quoin-presence USER SIGNER_UID: the presence check of the signer's
//! dialog, as root, on the socket systemd passes it (Accept=no). Only the
//! answer leaves this machine; the secret never does.
//!
//! A request is a version byte, a u16 length and the secret: 1 to
//! max_secret bytes, with no NUL and no newline. The reply is P when PAM's
//! quoin-sudo service, the one the plugin runs for this host's dialog,
//! passes USER with it, and F when not; then the connection is closed. A
//! peer that is not SIGNER_UID, and a malformed request, are closed with
//! no reply. One request at a time, so pam_unix's fail delay is the limit
//! on guesses. The secret is zeroed after use and never logged.

const std = @import("std");
const c = @import("abi").c;
const fd = @import("fd");
const pam = @import("pam");

pub const version = 1;
/// The gate's limit on the dialog's password.
pub const max_secret = 1023;

var secret_buf: [max_secret + 1]u8 = undefined;

pub fn main() u8 {
    if (std.os.argv.len != 3) return usage();
    const user = std.os.argv[1];
    const signer = std.fmt.parseInt(u32, std.mem.span(std.os.argv[2]), 10) catch return usage();
    const pw = c.getpwnam(user);
    if (pw == null) {
        std.debug.print("quoin-presence: no user {s}\n", .{user});
        return 1;
    }
    if (pw.*.pw_uid == 0) {
        std.debug.print("quoin-presence: {s} is uid 0, whose password is never checked\n", .{user});
        return 1;
    }
    const l = fd.systemdListener() catch {
        std.debug.print("quoin-presence: systemd passed no one socket\n", .{});
        return 1;
    };
    while (true) {
        const s = l.accept() catch {
            std.debug.print("quoin-presence: accept failed\n", .{});
            return 1;
        };
        defer s.close();
        std.debug.print("quoin-presence: {s}\n", .{say(serve(s, signer, user, pam.verify))});
    }
}

fn usage() u8 {
    std.debug.print("usage: quoin-presence USER SIGNER_UID\n", .{});
    return 2;
}

pub const Outcome = enum { pass, fail, not_the_signer, malformed, hung_up };

fn say(o: Outcome) []const u8 {
    return switch (o) {
        .pass => "passed",
        .fail => "failed",
        .not_the_signer => "a peer that is not the signer, closed",
        .malformed => "a malformed request, closed",
        .hung_up => "the peer hung up",
    };
}

const Check = *const fn (user: [*:0]const u8, secret: [*:0]const u8) bool;

/// One request on `s`, checked by `check` when its peer is `signer`.
fn serve(s: fd.Sock, signer: u32, user: [*:0]const u8, check: Check) Outcome {
    if ((s.peerUid() catch return .hung_up) != signer) return .not_the_signer;
    defer std.crypto.secureZero(u8, &secret_buf);
    const secret = read(s) catch |e| return switch (e) {
        error.Malformed => .malformed,
        error.HungUp => .hung_up,
    };
    const ok = check(user, secret);
    s.sendAll(if (ok) "P" else "F") catch return .hung_up;
    return if (ok) .pass else .fail;
}

/// The request's secret, NUL-terminated in secret_buf.
fn read(s: fd.Sock) error{ Malformed, HungUp }![:0]const u8 {
    var head: [3]u8 = undefined;
    if ((s.recvFull(&head) catch return error.HungUp) != head.len) return error.HungUp;
    const len = length(head) orelse return error.Malformed;
    const body = secret_buf[0..len];
    if ((s.recvFull(body) catch return error.HungUp) != len) return error.HungUp;
    if (!clean(body)) return error.Malformed;
    secret_buf[len] = 0;
    return secret_buf[0..len :0];
}

/// The secret's length a request's head gives, or null for another
/// version or a length out of range.
pub fn length(head: [3]u8) ?usize {
    if (head[0] != version) return null;
    const len = std.mem.readInt(u16, head[1..3], .big);
    if (len == 0 or len > max_secret) return null;
    return len;
}

/// A secret with no NUL, which would cut it short for PAM, and no newline.
pub fn clean(secret: []const u8) bool {
    return std.mem.indexOfAny(u8, secret, "\x00\n") == null;
}

test "a head is this version and a length of 1 to max_secret" {
    try std.testing.expectEqual(@as(?usize, 1), length(.{ 1, 0, 1 }));
    try std.testing.expectEqual(@as(?usize, 300), length(.{ 1, 1, 44 }));
    try std.testing.expectEqual(@as(?usize, max_secret), length(.{ 1, 3, 255 }));
    try std.testing.expectEqual(@as(?usize, null), length(.{ 1, 0, 0 }));
    try std.testing.expectEqual(@as(?usize, null), length(.{ 1, 4, 0 }));
    try std.testing.expectEqual(@as(?usize, null), length(.{ 1, 255, 255 }));
    try std.testing.expectEqual(@as(?usize, null), length(.{ 0, 0, 1 }));
    try std.testing.expectEqual(@as(?usize, null), length(.{ 2, 0, 1 }));
}

test "a secret with a NUL or a newline is not clean" {
    try std.testing.expect(clean("sesame"));
    try std.testing.expect(clean("with space\ttab"));
    try std.testing.expect(!clean("ses\x00ame"));
    try std.testing.expect(!clean("sesame\n"));
    try std.testing.expect(!clean("\r\n"));
}

var checked: usize = 0;

fn sesame(user: [*:0]const u8, secret: [*:0]const u8) bool {
    checked += 1;
    return std.mem.eql(u8, std.mem.span(user), "alice") and std.mem.eql(u8, std.mem.span(secret), "sesame");
}

/// What serve says to `req` from a peer of this uid, as `signer`, and the
/// reply, read to its end: none when a close with the request unread
/// resets the connection.
fn exchange(req: []const u8, signer: u32, reply: []u8) !struct { Outcome, []u8 } {
    const server, const client = try fd.pair();
    defer client.close();
    try client.sendAll(req);
    const o = serve(server, signer, "alice", sesame);
    server.close();
    return .{ o, reply[0 .. client.recvFull(reply) catch 0] };
}

fn request(comptime secret: []const u8) [3 + secret.len]u8 {
    var r: [3 + secret.len]u8 = undefined;
    r[0] = version;
    std.mem.writeInt(u16, r[1..3], secret.len, .big);
    @memcpy(r[3..], secret);
    return r;
}

test "the signer's right secret is P, a wrong one F, each then closed, and the secret is zeroed" {
    const me = std.os.linux.getuid();
    var buf: [8]u8 = undefined;
    const right = try exchange(&request("sesame"), me, &buf);
    try std.testing.expectEqual(Outcome.pass, right[0]);
    try std.testing.expectEqualStrings("P", right[1]);
    try std.testing.expect(std.mem.allEqual(u8, &secret_buf, 0));
    const wrong = try exchange(&request("sesamE"), me, &buf);
    try std.testing.expectEqual(Outcome.fail, wrong[0]);
    try std.testing.expectEqualStrings("F", wrong[1]);
    try std.testing.expect(std.mem.allEqual(u8, &secret_buf, 0));
}

test "another peer, and a malformed request, are closed with no reply and never checked" {
    const me = std.os.linux.getuid();
    var buf: [8]u8 = undefined;
    const before = checked;
    const other = try exchange(&request("sesame"), me +% 1, &buf);
    try std.testing.expectEqual(Outcome.not_the_signer, other[0]);
    try std.testing.expectEqual(@as(usize, 0), other[1].len);
    var v2 = request("sesame");
    v2[0] = 2;
    const long = [_]u8{ version, 4, 0 } ++ [_]u8{'x'} ** 1024;
    for ([_][]const u8{ &v2, &[_]u8{ version, 0, 0 }, &long, &request("ses\x00me"), &request("sesame\n") }) |r| {
        const got = try exchange(r, me, &buf);
        try std.testing.expectEqual(Outcome.malformed, got[0]);
        try std.testing.expectEqual(@as(usize, 0), got[1].len);
        try std.testing.expect(std.mem.allEqual(u8, &secret_buf, 0));
    }
    try std.testing.expectEqual(before, checked);
}

test "a peer that hangs up inside its request is never checked" {
    const before = checked;
    const server, const client = try fd.pair();
    try client.sendAll(&[_]u8{ version, 0, 6, 's' });
    client.close();
    try std.testing.expectEqual(Outcome.hung_up, serve(server, std.os.linux.getuid(), "alice", sesame));
    server.close();
    try std.testing.expect(std.mem.allEqual(u8, &secret_buf, 0));
    try std.testing.expectEqual(before, checked);
}
