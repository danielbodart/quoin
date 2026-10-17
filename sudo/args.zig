//! sudo's mode parse: whether a sudo is -l or -v, read as sudo's own
//! getopt_long reads its arguments (src/parse_args.c). Shared by the Linux
//! plugin and the darwin one, which arm for neither.

const std = @import("std");

/// Whether sudo's arguments before submit_optind say -v or -l, as sudo's
/// getopt_long reads them (src/parse_args.c).
pub fn listOrValidate(argv: [*c]const [*c]u8, optind: c_int) bool {
    if (argv == null or argv[0] == null or optind < 1) return false;
    if (sudoedit(std.mem.span(@as([*:0]const u8, argv[0])))) return false;
    const end: usize = @intCast(optind);
    var i: usize = 1;
    while (i < end) : (i += 1) {
        const w = std.mem.span(@as([*:0]const u8, argv[i] orelse return false));
        if (std.mem.eql(u8, w, "--")) return false;
        if (w.len < 2 or w[0] != '-') continue;
        if (w[1] == '-') {
            const name = w[2 .. std.mem.indexOfScalar(u8, w, '=') orelse w.len];
            const opt = long(name) orelse return false;
            if (opt.short == 'v' or opt.short == 'l') return true;
            if (opt.arg == .required and std.mem.indexOfScalar(u8, w, '=') == null) i += 1;
            continue;
        }
        var j: usize = 1;
        while (j < w.len) : (j += 1) {
            const ch = w[j];
            if (ch == 'v' or ch == 'l') return true;
            const at = std.mem.indexOfScalar(u8, short_opts, ch) orelse return false;
            if (at + 1 < short_opts.len and short_opts[at + 1] == ':') {
                const optional = at + 2 < short_opts.len and short_opts[at + 2] == ':';
                if (j + 1 == w.len and !optional) i += 1;
                break;
            }
        }
    }
    return false;
}

/// sudo's short options, src/parse_args.c's sudo_short_opts without its '+'.
const short_opts = "Aa:BbC:c:D:Eeg:Hh::iKklNnPp:R:r:SsT:t:U:u:Vv";

const Arg = enum { none, required, optional };
const Long = struct { name: []const u8, arg: Arg, short: u8 };

/// src/parse_args.c's sudo_long_opts; --host's 0 stands for OPT_HOSTNAME.
const long_opts = [_]Long{
    .{ .name = "background", .arg = .none, .short = 'b' },
    .{ .name = "preserve-env", .arg = .optional, .short = 'E' },
    .{ .name = "edit", .arg = .none, .short = 'e' },
    .{ .name = "set-home", .arg = .none, .short = 'H' },
    .{ .name = "login", .arg = .none, .short = 'i' },
    .{ .name = "remove-timestamp", .arg = .none, .short = 'K' },
    .{ .name = "list", .arg = .none, .short = 'l' },
    .{ .name = "preserve-groups", .arg = .none, .short = 'P' },
    .{ .name = "shell", .arg = .none, .short = 's' },
    .{ .name = "other-user", .arg = .required, .short = 'U' },
    .{ .name = "validate", .arg = .none, .short = 'v' },
    .{ .name = "askpass", .arg = .none, .short = 'A' },
    .{ .name = "auth-type", .arg = .required, .short = 'a' },
    .{ .name = "bell", .arg = .none, .short = 'B' },
    .{ .name = "close-from", .arg = .required, .short = 'C' },
    .{ .name = "login-class", .arg = .required, .short = 'c' },
    .{ .name = "chdir", .arg = .required, .short = 'D' },
    .{ .name = "group", .arg = .required, .short = 'g' },
    .{ .name = "help", .arg = .none, .short = 'h' },
    .{ .name = "host", .arg = .required, .short = 0 },
    .{ .name = "reset-timestamp", .arg = .none, .short = 'k' },
    .{ .name = "no-update", .arg = .none, .short = 'N' },
    .{ .name = "non-interactive", .arg = .none, .short = 'n' },
    .{ .name = "prompt", .arg = .required, .short = 'p' },
    .{ .name = "chroot", .arg = .required, .short = 'R' },
    .{ .name = "role", .arg = .required, .short = 'r' },
    .{ .name = "stdin", .arg = .none, .short = 'S' },
    .{ .name = "command-timeout", .arg = .required, .short = 'T' },
    .{ .name = "type", .arg = .required, .short = 't' },
    .{ .name = "user", .arg = .required, .short = 'u' },
    .{ .name = "version", .arg = .none, .short = 'V' },
};

/// glibc's getopt_long match: the exact name, else the first prefix match.
fn long(name: []const u8) ?Long {
    for (long_opts) |o| {
        if (std.mem.eql(u8, o.name, name)) return o;
    }
    for (long_opts) |o| {
        if (std.mem.startsWith(u8, o.name, name)) return o;
    }
    return null;
}

/// sudo's program name: argv[0]'s base, without libtool's lt- prefix.
fn sudoedit(argv0: []const u8) bool {
    var name = std.fs.path.basename(argv0);
    if (name.len > 3 and std.mem.startsWith(u8, name, "lt-")) name = name[3..];
    return std.mem.eql(u8, name, "sudoedit");
}
