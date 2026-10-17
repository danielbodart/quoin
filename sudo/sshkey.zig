//! OpenSSH public keys for the darwin plugin, which has no gate to do this
//! in Go: a key line's blob, a signature checked against a listed key, and
//! the SHA256 fingerprint the decision records name a key by.

const std = @import("std");
const agent = @import("agent");

const p256 = "ecdsa-sha2-nistp256";
const ed25519 = "ssh-ed25519";

/// The key types golang.org/x/crypto/ssh parses, which a host key must be
/// for quoin-signer to read the message it is in.
const parsed = [_][]const u8{
    "ssh-rsa",                            "ssh-dss",
    "ecdsa-sha2-nistp256",                "ecdsa-sha2-nistp384",
    "ecdsa-sha2-nistp521",                "ssh-ed25519",
    "sk-ecdsa-sha2-nistp256@openssh.com", "sk-ssh-ed25519@openssh.com",
};

/// The blob of an authorized_keys line, `type base64 [comment]`, decoded
/// into `out`; null when the line is not one, its blob does not name the
/// line's type, or the type is not one x/crypto parses.
pub fn line(text: []const u8, out: []u8) ?[]u8 {
    var f = std.mem.tokenizeAny(u8, text, " \t\r\n");
    const kind = f.next() orelse return null;
    const b64 = f.next() orelse return null;
    for (parsed) |p| {
        if (std.mem.eql(u8, p, kind)) break;
    } else return null;
    const d = std.base64.standard.Decoder;
    const n = d.calcSizeForSlice(b64) catch return null;
    if (n > out.len) return null;
    d.decode(out[0..n], b64) catch return null;
    var r: agent.Reader = .{ .b = out[0..n] };
    const named = r.string() orelse return null;
    if (!std.mem.eql(u8, named, kind)) return null;
    return out[0..n];
}

/// Whether a remote key may be listed: nistp256, as the TPM makes, or
/// ed25519, the two std verifies.
pub fn listable(blob: []const u8) bool {
    var r: agent.Reader = .{ .b = blob };
    const kind = r.string() orelse return false;
    if (std.mem.eql(u8, kind, ed25519)) {
        const k = r.string() orelse return false;
        return k.len == 32 and r.done();
    }
    if (!std.mem.eql(u8, kind, p256)) return false;
    const curve = r.string() orelse return false;
    const q = r.string() orelse return false;
    if (!std.mem.eql(u8, curve, "nistp256") or q.len != 65 or q[0] != 4 or !r.done()) return false;
    _ = std.crypto.sign.ecdsa.EcdsaP256Sha256.PublicKey.fromSec1(q) catch return false;
    return true;
}

/// The listed keys in `text`, authorized_keys lines, in agent.validKeys'
/// form in `out`: at least one, each listable. A line that does not parse
/// fails the whole file, as a remote key that does not parse stops the
/// Linux gate starting.
pub fn listed(text: []const u8, out: []u8) ?[]u8 {
    if (out.len < 4) return null;
    var at: usize = 4;
    var n: u32 = 0;
    var lines = std.mem.splitScalar(u8, text, '\n');
    while (lines.next()) |l| {
        const t = std.mem.trim(u8, l, " \t\r");
        if (t.len == 0 or t[0] == '#') continue;
        var blob: [1024]u8 = undefined;
        const k = line(t, &blob) orelse return null;
        if (!listable(k) or out.len - at < 4 + k.len) return null;
        std.mem.writeInt(u32, out[at..][0..4], @intCast(k.len), .big);
        @memcpy(out[at + 4 ..][0..k.len], k);
        at += 4 + k.len;
        n += 1;
    }
    std.mem.writeInt(u32, out[0..4], n, .big);
    return if (agent.validKeys(out[0..at])) out[0..at] else null;
}

/// Whether `sig`, an agent's SIGN_RESPONSE string (format, blob), is
/// `key`'s signature over `message`, as ssh.PublicKey.Verify checks it.
pub fn verify(key: []const u8, message: []const u8, sig: []const u8) bool {
    var kr: agent.Reader = .{ .b = key };
    const kind = kr.string() orelse return false;
    var sr: agent.Reader = .{ .b = sig };
    const format = sr.string() orelse return false;
    const blob = sr.string() orelse return false;
    if (!sr.done() or !std.mem.eql(u8, format, kind)) return false;
    if (std.mem.eql(u8, kind, ed25519)) {
        const Ed = std.crypto.sign.Ed25519;
        const k = kr.string() orelse return false;
        if (k.len != 32 or !kr.done() or blob.len != 64) return false;
        const pk = Ed.PublicKey.fromBytes(k[0..32].*) catch return false;
        Ed.Signature.fromBytes(blob[0..64].*).verify(message, pk) catch return false;
        return true;
    }
    if (!std.mem.eql(u8, kind, p256)) return false;
    const Ec = std.crypto.sign.ecdsa.EcdsaP256Sha256;
    _ = kr.string() orelse return false;
    const q = kr.string() orelse return false;
    if (!kr.done()) return false;
    const pk = Ec.PublicKey.fromSec1(q) catch return false;
    var br: agent.Reader = .{ .b = blob };
    var rs: [64]u8 = undefined;
    if (!mpint(br.string() orelse return false, rs[0..32]) or !mpint(br.string() orelse return false, rs[32..64]) or !br.done()) return false;
    Ec.Signature.fromBytes(rs).verify(message, pk) catch return false;
    return true;
}

/// An SSH mpint, positive and at most 32 bytes once its sign byte is gone,
/// right-aligned into `out`.
fn mpint(b: []const u8, out: *[32]u8) bool {
    var v = b;
    if (v.len == 0 or v[0] & 0x80 != 0) return false;
    if (v[0] == 0) v = v[1..];
    if (v.len > 32) return false;
    @memset(out, 0);
    @memcpy(out[32 - v.len ..], v);
    return true;
}

/// `SHA256:` and the unpadded base64 of the blob's SHA-256, as
/// ssh.FingerprintSHA256 writes it.
pub fn fingerprint(blob: []const u8, out: *[50]u8) []const u8 {
    var h: [32]u8 = undefined;
    std.crypto.hash.sha2.Sha256.hash(blob, &h, .{});
    @memcpy(out[0..7], "SHA256:");
    return out[0 .. 7 + std.base64.standard_no_pad.Encoder.encode(out[7..], &h).len];
}

const testing = std.testing;

fn sshString(out: []u8, at: *usize, b: []const u8) void {
    std.mem.writeInt(u32, out[at.*..][0..4], @intCast(b.len), .big);
    @memcpy(out[at.* + 4 ..][0..b.len], b);
    at.* += 4 + b.len;
}

fn p256Blob(out: []u8, kp: std.crypto.sign.ecdsa.EcdsaP256Sha256.KeyPair) []u8 {
    var at: usize = 0;
    sshString(out, &at, p256);
    sshString(out, &at, "nistp256");
    sshString(out, &at, &kp.public_key.toUncompressedSec1());
    return out[0..at];
}

fn p256Sig(out: []u8, sig: std.crypto.sign.ecdsa.EcdsaP256Sha256.Signature) []u8 {
    var inner: [80]u8 = undefined;
    var ia: usize = 0;
    for ([_][]const u8{ &sig.r, &sig.s }) |half| {
        var v: []const u8 = half;
        while (v.len > 1 and v[0] == 0) v = v[1..];
        var m: [33]u8 = undefined;
        const n = if (v[0] & 0x80 != 0) blk: {
            m[0] = 0;
            @memcpy(m[1 .. 1 + v.len], v);
            break :blk v.len + 1;
        } else blk: {
            @memcpy(m[0..v.len], v);
            break :blk v.len;
        };
        sshString(&inner, &ia, m[0..n]);
    }
    var at: usize = 0;
    sshString(out, &at, p256);
    sshString(out, &at, inner[0..ia]);
    return out[0..at];
}

test "a nistp256 signature over the message verifies, and over anything else, or from another key, does not" {
    const Ec = std.crypto.sign.ecdsa.EcdsaP256Sha256;
    const kp = Ec.KeyPair.generate();
    const other = Ec.KeyPair.generate();
    var kb: [128]u8 = undefined;
    const key = p256Blob(&kb, kp);
    var ob: [128]u8 = undefined;
    const other_key = p256Blob(&ob, other);
    var sb: [160]u8 = undefined;
    const sig = p256Sig(&sb, try kp.sign("the message", null));
    try testing.expect(listable(key));
    try testing.expect(verify(key, "the message", sig));
    try testing.expect(!verify(key, "another message", sig));
    try testing.expect(!verify(other_key, "the message", sig));
    try testing.expect(!verify(key, "the message", sig[0 .. sig.len - 1]));
}

test "an ed25519 signature verifies against its key and its format must name the key's type" {
    const Ed = std.crypto.sign.Ed25519;
    const kp = Ed.KeyPair.generateDeterministic(@splat(7)) catch unreachable; // proven: a fixed seed is a valid one
    var kb: [64]u8 = undefined;
    var at: usize = 0;
    sshString(&kb, &at, ed25519);
    sshString(&kb, &at, &kp.public_key.toBytes());
    const key = kb[0..at];
    const s = try kp.sign("m", null);
    var sb: [96]u8 = undefined;
    var sa: usize = 0;
    sshString(&sb, &sa, ed25519);
    sshString(&sb, &sa, &s.toBytes());
    try testing.expect(listable(key));
    try testing.expect(verify(key, "m", sb[0..sa]));
    var wrong: [96]u8 = undefined;
    var wa: usize = 0;
    sshString(&wrong, &wa, p256);
    sshString(&wrong, &wa, &s.toBytes());
    try testing.expect(!verify(key, "m", wrong[0..wa]));
}

test "a key line decodes to its blob only when the blob names the line's type" {
    const text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7wrGycGisT+fHX2DD9ohFP+IzDJOQ4cqprClYHszBR a comment\n";
    var out: [128]u8 = undefined;
    const blob = line(text, &out).?;
    try testing.expectEqual(@as(usize, 51), blob.len);
    try testing.expect(listable(blob));
    try testing.expect(line("ssh-rsa AAAAC3NzaC1lZDI1NTE5AAAAIE7wrGycGisT+fHX2DD9ohFP+IzDJOQ4cqprClYHszBR", &out) == null);
    try testing.expect(line("ssh-foo AAAAC3NzaC1lZDI1NTE5AAAAIE7wrGycGisT+fHX2DD9ohFP+IzDJOQ4cqprClYHszBR", &out) == null);
    try testing.expect(line("ssh-ed25519 !!!", &out) == null);
    try testing.expect(line("", &out) == null);
}

test "listed keys are every line's blob, and one bad line, an rsa key or none at all is no list" {
    const ed = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7wrGycGisT+fHX2DD9ohFP+IzDJOQ4cqprClYHszBR a";
    var out: [512]u8 = undefined;
    const got = listed("# remote keys\n" ++ ed ++ "\n\n" ++ ed ++ "\n", &out).?;
    try testing.expectEqual(@as(u32, 2), std.mem.readInt(u32, got[0..4], .big));
    try testing.expect(listed(ed ++ "\nnot a key\n", &out) == null);
    try testing.expect(listed("# nothing\n", &out) == null);
    try testing.expect(listed("ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQC7 x\n", &out) == null);
}

test "the fingerprint is ssh-keygen's" {
    var out: [128]u8 = undefined;
    const blob = line("ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7wrGycGisT+fHX2DD9ohFP+IzDJOQ4cqprClYHszBR", &out).?;
    var fp: [50]u8 = undefined;
    try testing.expectEqualStrings("SHA256:sBxDoRE64KdUJ0SWqq1153fwENGTlcvB1tjV1v+OyyI", fingerprint(blob, &fp));
}
