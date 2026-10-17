//! quoin-sudo-check-plugin for macOS: PLUGIN SYMBOL PAM_MODULE KEYS. Run
//! as root before any sudo.conf naming the plugin is installed, and nothing
//! may install one unless it exits 0: a Plugin line sudo cannot load makes
//! every sudo fatal, terminal or not, and darwin-rebuild needs sudo to undo
//! it. On Linux the check is a build step; here it needs the host's own
//! codesign and an arm64e process, so it runs at activation.
//!
//! What sudo checks: root-owned and not group- or world-writable, a code
//! signature that verifies, loading with every symbol bound into an arm64e
//! process as sudo is one, the symbol an audit plugin of sudo's API major.
//! What quoin promises: a sudo it does not arm for opens, is not armed and
//! is accepted, so a gate that is off is stock sudo; the PAM module loads
//! and ignores a call with no handle; and the listed keys parse. Those
//! loads are quoin-sudo-load's, built arm64e for that.

const std = @import("std");
const config = @import("config");
const sshkey = @import("sshkey");

pub fn main() u8 {
    const argv = std.os.argv;
    if (argv.len != 5) return fail("usage: quoin-sudo-check-plugin PLUGIN SYMBOL PAM_MODULE KEYS", .{});
    const plugin, const symbol, const pam, const keys = .{ std.mem.span(argv[1]), std.mem.span(argv[2]), std.mem.span(argv[3]), std.mem.span(argv[4]) };
    if (std.c.geteuid() != 0) return fail("run as root, as sudo loads the plugin", .{});
    for ([_][]const u8{ plugin, pam }) |path| {
        if (owned(path)) |why| return fail("{s}: {s}", .{ path, why });
        if (!run(&.{ "/usr/bin/codesign", "--verify", "--strict", path })) return fail("{s}: its code signature does not verify", .{path});
    }
    var text: [64 << 10]u8 = undefined;
    const body = std.fs.cwd().readFile(keys, &text) catch return fail("{s}: cannot read the remote keys", .{keys});
    var out: [32 << 10]u8 = undefined;
    _ = sshkey.listed(body, &out) orelse return fail("{s}: the remote keys do not parse, or one is neither nistp256 nor ed25519", .{keys});
    if (!run(&.{ config.loader, plugin, symbol, pam, keys })) return fail("{s} or {s} does not load as sudo would load it", .{ plugin, pam });
    return 0;
}

/// Why sudo would refuse to load `path`, or null.
fn owned(path: []const u8) ?[]const u8 {
    if (path.len == 0 or path[0] != '/') return "not an absolute path";
    const st = std.posix.fstatat(std.posix.AT.FDCWD, path, 0) catch return "missing";
    if (st.mode & std.posix.S.IFMT != std.posix.S.IFREG) return "not a regular file";
    if (st.uid != 0) return "not owned by root";
    if (st.mode & 0o022 != 0) return "group- or world-writable";
    return null;
}

fn run(cmd: []const []const u8) bool {
    var buf: [16 << 10]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf);
    var child = std.process.Child.init(cmd, fba.allocator());
    child.stdin_behavior = .Ignore;
    const term = child.spawnAndWait() catch return false;
    return term == .Exited and term.Exited == 0;
}

fn fail(comptime fmt: []const u8, args: anytype) u8 {
    var buf: [1024]u8 = undefined;
    var w = std.fs.File.stderr().writer(&buf);
    w.interface.print("quoin-sudo-check-plugin: " ++ fmt ++ "\n", args) catch return 1;
    w.interface.flush() catch return 1;
    return 1;
}
