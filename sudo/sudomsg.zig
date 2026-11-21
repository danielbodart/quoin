//! internal/sudomsg in Zig, for the plugins: the Message, built byte for
//! byte as Marshal and MarshalWithin write it, so quoin-signer reads it as
//! it reads the Linux gate's; and the Answer, read as ParseAnswer reads it
//! and checked as Message.Check checks it. The shared goldens in
//! testdata/sudomsg are the Go package's own, which its tests hold these
//! copies to.
//!
//! After the magic, the nonce and the host keys comes one string of named
//! fields, key then value, in ascending order of name, each marked
//! critical with a "!": see the Go package for why and for the rule on
//! fields to come. The answer is its own magic, then fields by the same
//! rules.

const std = @import("std");

pub const magic = "quoin-sudo-v1";
pub const nonce_size = 32;
/// OpenSSH's agent message limit, as Go's MaxSize.
pub const max_size = 256 << 10;
/// The agent extension a remote sudo is asked through, as Go's Extension.
pub const extension = "quoin-sudo@quoin";
/// What starts an answer, as Go's AnswerMagic.
pub const answer_magic = "quoin-sudo-answer-v1";
/// The most fields, the longest key with its mark, and the most hops, as
/// Go's MaxFields, MaxKey and MaxHops.
pub const max_fields = 32;
pub const max_key = 64;
pub const max_hops = 16;

/// The most bytes a message may take in an extension request whose key
/// blob is `longest` bytes, as Go's Room: max_size less the request's
/// type, the extension's name, the key blob and the message's length.
pub fn room(longest: usize) usize {
    return max_size -| (1 + 4 + extension.len + 4 + longest + 4);
}

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

/// How the gate asks: a dialog, with a presence check that may open a
/// window, or a question, Allow or Refuse.
pub const Decision = enum { dialog, question };
/// Whether the answer must say a person was checked.
pub const Presence = enum { required, none };

/// A rule that asked: its pattern and where it came from.
pub const Rule = struct {
    pattern: []const u8,
    source: []const u8,
};

/// The command, who runs it, as whom and where, the danger and environment
/// lines and the chain, leaf first, and how it is asked. The darwin build
/// has no danger catalogue yet, so danger and env are empty there, and no
/// windows or rules, so it keeps the defaults: a dialog, presence
/// required, no window.
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
    decision: Decision = .dialog,
    presence: Presence = .required,
    rule: ?Rule = null,
    /// The most seconds the answer may open a window for; 0 opens none.
    window: u32 = 0,
    /// The key blob of the window that made it a question, the one key
    /// whose answer counts; null is none.
    window_key: ?[]const u8 = null,
};

pub const Error = error{ NoHostKeys, NoCommand, Links, WindowKey, TooLong };

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
/// key, no command, a chain Go's Parse would refuse, an empty window key,
/// or more than max_size or `out` holds.
pub fn marshal(m: Message, out: []u8) Error![]u8 {
    return write(m, m.links.len, m.truncated, out);
}

/// marshal held to `limit` bytes, as Message.MarshalWithin: over it, the
/// chain's command lines are left out one at a time from the top of the
/// chain down, and cut set, until it fits. No other field is ever cut;
/// what does not fit with every command line out is error.TooLong.
pub fn marshalWithin(m: Message, limit: usize, out: []u8) Error![]u8 {
    const within = out[0..@min(out.len, limit)];
    var blank_from = m.links.len;
    var truncated = m.truncated;
    while (true) {
        if (write(m, blank_from, truncated, within)) |b| return b else |e| if (e != error.TooLong) return e;
        while (blank_from > 0 and m.links[blank_from - 1].cmdline.len == 0) blank_from -= 1;
        if (blank_from == 0) return error.TooLong;
        blank_from -= 1;
        truncated = true;
    }
}

/// Links from `blank_from` up are written with no command line. The fields
/// go in ascending order of name, as Parse requires, and chain, cut,
/// danger, env, rule and window-key only when there is something in them.
fn write(m: Message, blank_from: usize, truncated: bool, out: []u8) Error![]u8 {
    if (m.host_keys.len == 0) return error.NoHostKeys;
    if (m.argv.len == 0) return error.NoCommand;
    if (m.window_key) |k| if (k.len == 0) return error.WindowKey;
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
    try w.string("!decision");
    try w.string(@tagName(m.decision));
    if (m.env.len > 0) {
        try w.string("!env");
        v = try w.begin();
        try w.list(m.env);
        w.end(v);
    }
    try w.string("!presence");
    try w.string(@tagName(m.presence));
    if (m.rule) |r| {
        try w.string("!rule");
        v = try w.begin();
        try w.string(r.pattern);
        try w.string(r.source);
        w.end(v);
    }
    try w.string("!runas");
    try w.string(m.run_as);
    try w.string("!user");
    try w.string(m.user);
    try w.string("!window");
    try w.int(4);
    try w.be(u32, m.window);
    if (m.window_key) |k| {
        try w.string("!window-key");
        try w.string(k);
    }
    w.end(fields);
    return out[0..w.at];
}

/// The bytes the signer signs and the gate verifies, as Go's Signed:
/// `message` verbatim, starting with its magic, then `answer`, in `out`.
pub fn signed(message: []const u8, answer: []const u8, out: []u8) Error![]u8 {
    if (out.len < message.len + answer.len) return error.TooLong;
    @memcpy(out[0..message.len], message);
    @memcpy(out[message.len..][0..answer.len], answer);
    return out[0 .. message.len + answer.len];
}

/// SSH wire reading: uint32 big-endian, string as uint32 length then bytes.
const Reader = struct {
    b: []const u8,

    fn int(r: *Reader) ?u32 {
        if (r.b.len < 4) return null;
        defer r.b = r.b[4..];
        return std.mem.readInt(u32, r.b[0..4], .big);
    }

    fn string(r: *Reader) ?[]const u8 {
        const n = r.int() orelse return null;
        if (n > r.b.len) return null;
        defer r.b = r.b[n..];
        return r.b[0..n];
    }
};

/// A session bind: the host key it names and whether it forwards.
pub const Hop = struct {
    host_key: []const u8,
    forwarded: bool,
};

/// An answer's hops, the first from the signer's machine, each checked
/// by parseAnswer.
pub const Hops = struct {
    len: u32 = 0,
    entries: []const u8 = "",

    pub fn iterator(h: Hops) HopIterator {
        return .{ .r = .{ .b = h.entries }, .left = h.len };
    }
};

pub const HopIterator = struct {
    r: Reader,
    left: u32,

    pub fn next(it: *HopIterator) ?Hop {
        if (it.left == 0) return null;
        it.left -= 1;
        return readHop(it.r.string() orelse return null);
    }
};

/// A hop's entry: its host key blob, not empty, then a forwarded byte, 0
/// or 1, and nothing after.
fn readHop(entry: []const u8) ?Hop {
    var r: Reader = .{ .b = entry };
    const key = r.string() orelse return null;
    if (key.len == 0 or r.b.len != 1 or r.b[0] > 1) return null;
    return .{ .host_key = key, .forwarded = r.b[0] == 1 };
}

/// The answer's decision and presence.
pub const AnswerDecision = enum { allow, refuse };
pub const AnswerPresence = enum { verified, none };

/// What the signer answers, as Go's Answer.
pub const Answer = struct {
    decision: AnswerDecision,
    presence: AnswerPresence,
    /// The seconds of window the person chose; 0 is none.
    window: u32,
    hops: Hops,
    /// The last hop, the bind nearest this host; null when the
    /// connection had none.
    last: ?Hop,
};

const AnswerField = enum { decision, hops, presence, window };

/// Malformed is an answer ParseAnswer refuses as not well formed;
/// Critical one with a critical field this reader does not know.
pub const ParseError = error{ Malformed, Critical };

/// `b` read strictly, as Go's ParseAnswer: the answer's magic, then one
/// string of fields, with nothing after it and no more than max_size in
/// all. The fields are at most max_fields, each key at most max_key bytes,
/// an optional "!" and then a name of lower case letters, digits and
/// hyphens, in strictly ascending order of name. decision, hops, presence
/// and window must be there and marked, each read as its kind; another
/// field marked is error.Critical, one unmarked is dropped.
pub fn parseAnswer(b: []const u8) ParseError!Answer {
    if (b.len > max_size) return error.Malformed;
    var r: Reader = .{ .b = b };
    const got = r.string() orelse return error.Malformed;
    if (!std.mem.eql(u8, got, answer_magic)) return error.Malformed;
    var f: Reader = .{ .b = r.string() orelse return error.Malformed };
    if (r.b.len != 0) return error.Malformed;
    var a: Answer = .{ .decision = .refuse, .presence = .none, .window = 0, .hops = .{}, .last = null };
    var seen = std.EnumSet(AnswerField).initEmpty();
    var critical = false;
    var last: []const u8 = "";
    var n: usize = 0;
    while (f.b.len > 0) : (n += 1) {
        const key = f.string() orelse return error.Malformed;
        const value = f.string() orelse return error.Malformed;
        if (n == max_fields) return error.Malformed;
        const marked = std.mem.startsWith(u8, key, "!");
        const name = if (marked) key[1..] else key;
        if (!validName(name) or key.len > max_key or (n > 0 and std.mem.order(u8, name, last) != .gt)) return error.Malformed;
        last = name;
        const field = std.meta.stringToEnum(AnswerField, name) orelse {
            if (marked) critical = true;
            continue;
        };
        if (!marked) return error.Malformed;
        seen.insert(field);
        switch (field) {
            .decision => a.decision = std.meta.stringToEnum(AnswerDecision, value) orelse return error.Malformed,
            .presence => a.presence = std.meta.stringToEnum(AnswerPresence, value) orelse return error.Malformed,
            .window => {
                if (value.len != 4) return error.Malformed;
                a.window = std.mem.readInt(u32, value[0..4], .big);
            },
            .hops => {
                var h: Reader = .{ .b = value };
                const count = h.int() orelse return error.Malformed;
                if (count > max_hops) return error.Malformed;
                a.hops = .{ .len = count, .entries = h.b };
                for (0..count) |_| a.last = readHop(h.string() orelse return error.Malformed) orelse return error.Malformed;
                if (h.b.len != 0) return error.Malformed;
            },
        }
    }
    if (critical) return error.Critical;
    if (seen.count() != std.enums.values(AnswerField).len) return error.Malformed;
    return a;
}

fn validName(s: []const u8) bool {
    if (s.len == 0) return false;
    for (s) |c| if (!(std.ascii.isLower(c) or std.ascii.isDigit(c) or c == '-')) return false;
    return true;
}

pub const CheckError = error{ NotWindowKey, Refused, NotVerified, WindowTooLong, NoWindowHere, NotThisHost };

/// Whether `a`, signed with `key`, answers `m` as the gate takes it, as
/// Go's Message.Check: key is m's window key when it has one; the decision
/// is allow; presence is verified when m requires it; the window is at
/// most m's, and above 0 only for a dialog with presence verified; and the
/// last hop, when there is one, names one of m's host keys. The signature
/// over signed, and key being a listed key, are the caller's to check.
pub fn check(m: Message, a: Answer, key: []const u8) CheckError!void {
    if (m.window_key) |k| if (!std.mem.eql(u8, key, k)) return error.NotWindowKey;
    if (a.decision != .allow) return error.Refused;
    if (m.presence == .required and a.presence != .verified) return error.NotVerified;
    if (a.window > m.window) return error.WindowTooLong;
    if (a.window > 0 and (m.decision != .dialog or a.presence != .verified)) return error.NoWindowHere;
    if (a.last) |h| {
        for (m.host_keys) |k| {
            if (std.mem.eql(u8, k, h.host_key)) break;
        } else return error.NotThisHost;
    }
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

/// Go's example: the chain of a claude's sudo under an ssh login, with
/// every field, a question a rule asked inside the window of the key in
/// keys[2].
fn example(keys: *[3][64]u8) Message {
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
        .decision = .question,
        .presence = .none,
        .rule = .{ .pattern = "systemctl stop *", .source = "project rule" },
        .window_key = hostKey(&keys[2], 9),
    };
}

/// Go's dialog: example asked as a dialog that may open an hour's window,
/// with no rule and no window key.
fn dialog(keys: *[3][64]u8) Message {
    var m = example(keys);
    m.decision, m.presence, m.rule, m.window, m.window_key = .{ .dialog, .required, null, 3600, null };
    return m;
}

test "the message is Go's golden bytes for Go's example and its dialog" {
    var keys: [3][64]u8 = undefined;
    var out: [2048]u8 = undefined;
    const got = try marshal(example(&keys), &out);
    try testing.expectEqualSlices(u8, @embedFile("testdata/sudomsg/message.bin"), got);
    try testing.expectEqualStrings("\x00\x00\x00\x0dquoin-sudo-v1", got[0..17]);
    try testing.expectEqualSlices(u8, @embedFile("testdata/sudomsg/message-dialog.bin"), try marshal(dialog(&keys), &out));
}

test "the darwin plugin's message, with the defaults, is a dialog with presence required and no window" {
    var keys: [3][64]u8 = undefined;
    const e = example(&keys);
    const m: Message = .{ .nonce = e.nonce, .host_keys = e.host_keys, .user = e.user, .run_as = e.run_as, .cwd = e.cwd, .argv = e.argv };
    var out: [2048]u8 = undefined;
    const got = try marshal(m, &out);
    for ([_][]const u8{ "\x00\x00\x00\x09!decision\x00\x00\x00\x06dialog", "\x00\x00\x00\x09!presence\x00\x00\x00\x08required", "\x00\x00\x00\x07!window\x00\x00\x00\x04\x00\x00\x00\x00" }) |field| {
        try testing.expect(std.mem.indexOf(u8, got, field) != null);
    }
    try testing.expect(std.mem.indexOf(u8, got, "!rule") == null);
    try testing.expect(std.mem.indexOf(u8, got, "!window-key") == null);
    var empty = m;
    empty.window_key = "";
    try testing.expectError(error.WindowKey, marshal(empty, &out));
}

test "the answer is read from Go's golden as Go wrote it" {
    var keys: [3][64]u8 = undefined;
    const a = try parseAnswer(@embedFile("testdata/sudomsg/answer.bin"));
    try testing.expectEqual(AnswerDecision.allow, a.decision);
    try testing.expectEqual(AnswerPresence.verified, a.presence);
    try testing.expectEqual(3600, a.window);
    try testing.expectEqual(2, a.hops.len);
    var it = a.hops.iterator();
    var key: [64]u8 = undefined;
    const first = it.next().?;
    try testing.expectEqualSlices(u8, hostKey(&key, 3), first.host_key);
    try testing.expect(first.forwarded);
    const second = it.next().?;
    try testing.expectEqualSlices(u8, hostKey(&key, 1), second.host_key);
    try testing.expectEqualSlices(u8, second.host_key, a.last.?.host_key);
    try testing.expect(it.next() == null);
    try check(dialog(&keys), a, "any listed key");
    try testing.expectError(error.NotWindowKey, check(example(&keys), a, "another key"));
}

test "every answer is read and checked as the Go gate does, by Go's cases" {
    var keys: [3][64]u8 = undefined;
    var r: Reader = .{ .b = @embedFile("testdata/sudomsg/answer-cases.bin") };
    const n = r.int().?;
    try testing.expect(n > 0);
    for (0..n) |_| {
        var c: Reader = .{ .b = r.string().? };
        const name = c.string().?;
        var m = example(&keys);
        m.decision = std.meta.stringToEnum(Decision, c.string().?).?;
        m.presence = std.meta.stringToEnum(Presence, c.string().?).?;
        m.window = c.int().?;
        const window_key = c.string().?;
        m.window_key = if (window_key.len == 0) null else window_key;
        const key = c.string().?;
        const answer = c.string().?;
        try testing.expectEqual(1, c.b.len);
        const got: u8 = if (parseAnswer(answer)) |a| (if (check(m, a, key)) |_| 2 else |_| 1) else |_| 0;
        if (got != c.b[0]) {
            std.debug.print("{s}: got {d}, want {d}\n", .{ name, got, c.b[0] });
            return error.TestUnexpectedResult;
        }
    }
    try testing.expectEqual(0, r.b.len);
}

test "an answer with a critical field this reader does not know is error.Critical" {
    var out: [256]u8 = undefined;
    var w: Writer = .{ .out = &out };
    try w.string(answer_magic);
    const f = try w.begin();
    for ([_][]const u8{ "!decision", "allow", "!hops", "\x00\x00\x00\x00", "!note", "", "!presence", "none", "!window", "\x00\x00\x00\x00" }) |s| try w.string(s);
    w.end(f);
    try testing.expectError(error.Critical, parseAnswer(out[0..w.at]));
}

test "the signed bytes are the message verbatim, then the answer" {
    var out: [8]u8 = undefined;
    try testing.expectEqualStrings("msgans", try signed("msg", "ans", &out));
    try testing.expectError(error.TooLong, signed("msg", "answer", &out));
}

test "a message of room bytes makes an extension request of max_size" {
    try testing.expectEqual(max_size, 1 + 4 + extension.len + 4 + 51 + 4 + room(51));
    try testing.expectEqual(max_size - (1 + 4 + 16 + 4 + 51 + 4), room(51));
}

test "marshalWithin leaves command lines out from the top of the chain down until it fits, and says so with cut" {
    var keys: [3][64]u8 = undefined;
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
    var keys: [3][64]u8 = undefined;
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
