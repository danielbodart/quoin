//! quoin-sudo's Zig: install, test, lint, fmt and analyze steps.
const std = @import("std");

const gate_path = "/run/quoin-sudo/gate.sock";
const gate_uid = 0;

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{ .preferred_optimize_mode = .ReleaseSafe });
    const dev = b.option(bool, "dev", "Enable the steps that need lazy dependencies: test, analyze") orelse false;
    const sudo_version = b.option([]const u8, "sudo-version", "The sudo version the plugin is built for");
    const misread = b.option(bool, "misread-mode", "Build a plugin whose mode test always says -v") orelse false;
    const log_ids = b.option(bool, "log-ids", "Build a plugin that prints its ids before the drop and after the restore") orelse false;
    const oracle = b.option([]const u8, "oracle", "sudo's parse_args built as a test oracle (sudo/oracle)");

    if (target.result.os.tag == .macos) return darwin(b, target, optimize);

    const install = b.getInstallStep();
    if (sudo_version) |v| {
        const cfg = config(b, gate_path, gate_uid, if (misread) .misread else if (log_ids) .log_ids else .stock, v);
        const lib = plugin(b, target, optimize, modules(b, target, optimize), cfg, true);
        install.dependOn(&b.addInstallFileWithDir(lib.getEmittedBin(), .lib, "quoin_sudo.so").step);
        b.installArtifact(pamHelper(b, target, optimize, cfg, true));
        b.installArtifact(checkPlugin(b, target, optimize, cfg, true));
    } else {
        install.dependOn(&b.addFail("install needs -Dsudo-version=VERSION, the sudo the plugin is built for").step);
    }

    const test_step = b.step("test", "Run the unit and property tests");
    if (!dev) {
        test_step.dependOn(&b.addFail("needs -Ddev=true").step);
    } else if (oracle == null) {
        test_step.dependOn(&b.addFail("needs -Doracle=PATH, sudo's parse_args built as a test oracle").step);
    } else if (b.lazyDependency("minish", .{ .target = target, .optimize = optimize })) |minish| {
        const uid = std.os.linux.getuid();
        const cfg = config(b, "quoin-sudo-test-gate.sock", uid, .stock, "test");
        for ([_][]const u8{ "fd", "wire", "chain", "agent", "ids" }) |name| {
            const m = modules(b, target, optimize);
            const t = b.addTest(.{ .name = name, .root_module = m.get(name) });
            test_step.dependOn(&b.addRunArtifact(t).step);
        }
        const pam_cfg = config(b, "quoin-sudo-test-pam.sock", uid, .stock, "test");
        test_step.dependOn(&b.addRunArtifact(b.addTest(.{ .name = "pam", .root_module = pamHelper(b, target, optimize, pam_cfg, false).root_module })).step);

        const opts = b.addOptions();
        opts.addOption([]const u8, "path", oracle.?);
        const pm = modules(b, target, optimize);
        const pt = b.addTest(.{
            .name = "plugin",
            .root_module = b.createModule(.{
                .root_source_file = b.path("plugin_test.zig"),
                .target = target,
                .optimize = optimize,
                .link_libc = true,
                .imports = &.{
                    .{ .name = "minish", .module = minish.module("minish") },
                    .{ .name = "plugin", .module = plugin(b, target, optimize, pm, cfg, false).root_module },
                    .{ .name = "abi", .module = pm.abi },
                    .{ .name = "oracle", .module = opts.createModule() },
                },
            }),
        });
        test_step.dependOn(&b.addRunArtifact(pt).step);

        const misread_cfg = config(b, "quoin-sudo-test-gate.sock", uid, .misread, "test");
        const mm = modules(b, target, optimize);
        const mt = b.addTest(.{
            .name = "misread",
            .root_module = b.createModule(.{
                .root_source_file = b.path("misread_test.zig"),
                .target = target,
                .optimize = optimize,
                .link_libc = true,
                .imports = &.{
                    .{ .name = "plugin", .module = plugin(b, target, optimize, mm, misread_cfg, false).root_module },
                    .{ .name = "abi", .module = mm.abi },
                },
            }),
        });
        test_step.dependOn(&b.addRunArtifact(mt).step);

        const remote_cfg = config(b, "quoin-sudo-test-remote-gate.sock", uid, .remote, "test");
        const rm = modules(b, target, optimize);
        const rt = b.addTest(.{
            .name = "remote",
            .root_module = b.createModule(.{
                .root_source_file = b.path("remote_test.zig"),
                .target = target,
                .optimize = optimize,
                .link_libc = true,
                .imports = &.{
                    .{ .name = "minish", .module = minish.module("minish") },
                    .{ .name = "plugin", .module = plugin(b, target, optimize, rm, remote_cfg, false).root_module },
                    .{ .name = "abi", .module = rm.abi },
                    .{ .name = "agent", .module = rm.agent },
                    .{ .name = "fd", .module = rm.fd },
                },
            }),
        });
        test_step.dependOn(&b.addRunArtifact(rt).step);

        checkPluginCases(b, target, optimize, test_step);
    }

    const lint_step = b.step("lint", "Run lint.zig over the package");
    {
        const lint = b.addExecutable(.{
            .name = "lint",
            .root_module = b.createModule(.{ .root_source_file = b.path("lint.zig"), .target = b.graph.host }),
        });
        const run = b.addRunArtifact(lint);
        run.setCwd(b.path("."));
        run.has_side_effects = true;
        run.stdio = .inherit;
        run.addArgs(&.{ "--skip", "analyze", "." });
        lint_step.dependOn(&run.step);
    }

    const fmt_step = b.step("fmt", "Check the formatting of the package's Zig");
    fmt_step.dependOn(&b.addFmt(.{ .check = true, .paths = &.{"."} }).step);

    const analyze_step = b.step("analyze", "Run zwanzig over the package, and check it still catches the planted bugs");
    if (!dev) {
        analyze_step.dependOn(&b.addFail("needs -Ddev=true").step);
    } else if (b.lazyDependency("zwanzig", .{ .target = b.graph.host, .optimize = .ReleaseFast })) |zw| {
        const exe = zw.artifact("zwanzig");
        for ([_][]const u8{ "fd.zig", "wire.zig", "chain.zig", "agent.zig", "ids.zig", "quoin_sudo.zig", "quoin-sudo-pam.zig", "quoin-sudo-check-plugin.zig" }) |file| {
            const run = b.addRunArtifact(exe);
            run.addArg("--config");
            run.addFileArg(b.path(".zwanzig.json"));
            run.addFileArg(b.path(file));
            run.has_side_effects = true;
            run.stdio = .inherit;
            analyze_step.dependOn(&run.step);
        }
        const run = b.addRunArtifact(exe);
        run.addArg("--config");
        run.addFileArg(b.path(".zwanzig.json"));
        run.addFileArg(b.path("analyze/bugs.zig"));
        for ([_][]const u8{
            "bugs.zig:10:12: error: [store-violations-engine] double-close",
            "bugs.zig:17:9: error: [store-violations-engine] use after close",
            "bugs.zig:24:12: error: [store-violations-engine] use after close",
        }) |want| run.addCheck(.{ .expect_stdout_match = want });
        run.addCheck(.{ .expect_stdout_match = "Found 3 issue(s):\n" });
        run.addCheck(.{ .expect_term = .{ .Exited = 1 } });
        analyze_step.dependOn(&run.step);
    }
}

/// A test build's misread mode test always says -v; its remote one takes
/// every chain for remote; its log_ids one prints the ids around the drop.
const Build = enum { stock, misread, remote, log_ids };

fn config(b: *std.Build, path: []const u8, uid: u32, kind: Build, sudo_version: []const u8) *std.Build.Module {
    const opts = b.addOptions();
    opts.addOption([]const u8, "gate_path", path);
    opts.addOption(u32, "gate_uid", uid);
    opts.addOption(bool, "misread_mode", kind == .misread);
    opts.addOption(bool, "force_remote", kind == .remote);
    opts.addOption(bool, "log_ids", kind == .log_ids);
    opts.addOption([]const u8, "sudo_version", sudo_version);
    return opts.createModule();
}

const Modules = struct {
    abi: *std.Build.Module,
    fd: *std.Build.Module,
    wire: *std.Build.Module,
    chain: *std.Build.Module,
    agent: *std.Build.Module,
    ids: *std.Build.Module,
    args: *std.Build.Module,

    fn get(m: Modules, name: []const u8) *std.Build.Module {
        inline for (@typeInfo(Modules).@"struct".fields) |f| {
            if (std.mem.eql(u8, f.name, name)) return @field(m, f.name);
        }
        unreachable;
    }
};

fn modules(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode) Modules {
    const abi = b.createModule(.{ .root_source_file = b.path("abi.zig"), .target = target, .optimize = optimize, .link_libc = true });
    // A system library is what makes zig read NIX_CFLAGS_COMPILE's include
    // paths for the @cImport.
    abi.linkSystemLibrary("pam", .{});
    const fd = b.createModule(.{ .root_source_file = b.path("fd.zig"), .target = target, .optimize = optimize });
    const chain = b.createModule(.{
        .root_source_file = b.path("chain.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{.{ .name = "fd", .module = fd }},
    });
    const agent = b.createModule(.{
        .root_source_file = b.path("agent.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{.{ .name = "fd", .module = fd }},
    });
    const wire = b.createModule(.{
        .root_source_file = b.path("wire.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{ .{ .name = "chain", .module = chain }, .{ .name = "agent", .module = agent } },
    });
    const ids = b.createModule(.{
        .root_source_file = b.path("ids.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{ .{ .name = "abi", .module = abi }, .{ .name = "fd", .module = fd } },
    });
    const args = b.createModule(.{ .root_source_file = b.path("args.zig"), .target = target, .optimize = optimize });
    return .{ .abi = abi, .fd = fd, .wire = wire, .chain = chain, .agent = agent, .ids = ids, .args = args };
}

fn plugin(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode, m: Modules, cfg: *std.Build.Module, strip: bool) *std.Build.Step.Compile {
    return b.addLibrary(.{
        .name = "quoin_sudo",
        .linkage = .dynamic,
        .root_module = b.createModule(.{
            .root_source_file = b.path("quoin_sudo.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .strip = strip,
            .imports = &.{
                .{ .name = "abi", .module = m.abi },
                .{ .name = "fd", .module = m.fd },
                .{ .name = "wire", .module = m.wire },
                .{ .name = "chain", .module = m.chain },
                .{ .name = "agent", .module = m.agent },
                .{ .name = "ids", .module = m.ids },
                .{ .name = "args", .module = m.args },
                .{ .name = "config", .module = cfg },
            },
        }),
    });
}

fn pamHelper(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode, cfg: *std.Build.Module, strip: bool) *std.Build.Step.Compile {
    const m = modules(b, target, optimize);
    return b.addExecutable(.{
        .name = "quoin-sudo-pam",
        .root_module = b.createModule(.{
            .root_source_file = b.path("quoin-sudo-pam.zig"),
            .target = target,
            .optimize = optimize,
            .strip = strip,
            .imports = &.{
                .{ .name = "fd", .module = m.fd },
                .{ .name = "wire", .module = m.wire },
                .{ .name = "config", .module = cfg },
            },
        }),
    });
}

fn checkPlugin(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode, cfg: *std.Build.Module, strip: bool) *std.Build.Step.Compile {
    return b.addExecutable(.{
        .name = "quoin-sudo-check-plugin",
        .root_module = b.createModule(.{
            .root_source_file = b.path("quoin-sudo-check-plugin.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .strip = strip,
            .imports = &.{
                .{ .name = "abi", .module = modules(b, target, optimize).abi },
                .{ .name = "config", .module = cfg },
            },
        }),
    });
}

/// The check-plugin passes the plugin built for its sudo, and fails a wrong
/// symbol, a wrong sudo version, a file that is no library and a plugin of
/// the wrong type (planted_type.zig).
fn checkPluginCases(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode, step: *std.Build.Step) void {
    const cfg = config(b, gate_path, gate_uid, .stock, "1.2.3");
    const check = checkPlugin(b, target, optimize, cfg, false);
    const so = plugin(b, target, optimize, modules(b, target, optimize), cfg, false).getEmittedBin();
    const planted = b.addLibrary(.{
        .name = "planted_type",
        .linkage = .dynamic,
        .root_module = b.createModule(.{
            .root_source_file = b.path("planted_type.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .imports = &.{.{ .name = "abi", .module = modules(b, target, optimize).abi }},
        }),
    }).getEmittedBin();
    const cases = [_]struct { so: std.Build.LazyPath, symbol: []const u8, version: []const u8, code: u8, stderr: []const u8 }{
        .{ .so = so, .symbol = "quoin_audit", .version = "1.2.3", .code = 0, .stderr = "" },
        .{ .so = so, .symbol = "quoin_approval", .version = "1.2.3", .code = 1, .stderr = "no symbol quoin_approval" },
        .{ .so = so, .symbol = "quoin_audit", .version = "1.2.4", .code = 1, .stderr = "is built for sudo 1.2.3, not 1.2.4" },
        .{ .so = b.path("build.zig"), .symbol = "quoin_audit", .version = "1.2.3", .code = 1, .stderr = "cannot load" },
        .{ .so = planted, .symbol = "quoin_audit", .version = "1.2.3", .code = 1, .stderr = "is plugin type 1, not 3 (audit)" },
    };
    for (cases) |c| {
        const run = b.addRunArtifact(check);
        run.addFileArg(c.so);
        run.addArgs(&.{ c.symbol, c.version });
        if (c.code == 0) run.addCheck(.{ .expect_stderr_exact = "" }) else run.addCheck(.{ .expect_stderr_match = c.stderr });
        run.addCheck(.{ .expect_term = .{ .Exited = c.code } });
        step.dependOn(&run.step);
    }
}

/// macOS: the plugin doing the gate's remote half itself, its PAM module,
/// and the pre-flight that runs at activation. -Dsudo-include=DIR names
/// sudo_plugin.h's directory (Apple ships none); -Dloader=PATH the arm64e
/// quoin-sudo-load the pre-flight runs, built apart with clang.
fn darwin(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode) void {
    const include = b.option([]const u8, "sudo-include", "The directory of sudo_plugin.h");
    const pam_dir = b.option([]const u8, "pam", "An OpenPAM prefix to compile against (include/) and test with (lib/); without it, the SDK's");
    const loader = b.option([]const u8, "loader", "The arm64e quoin-sudo-load the pre-flight runs") orelse "quoin-sudo-load";
    const install = b.getInstallStep();
    const cfg = darwinConfig(b, false, "/var/log/quoin-sudo.log", "/etc/ssh", loader);
    // What is installed binds PAM where sudo does, from the libpam already
    // in sudo's process: linking a libpam of its own would put a second
    // one beside Apple's, whose handles it cannot read.
    const m = darwinModules(b, target, optimize, include, pam_dir, false);
    const t = darwinModules(b, target, optimize, include, pam_dir, true);
    const plugin_lib = darwinPlugin(b, target, optimize, m, cfg, true);
    install.dependOn(&b.addInstallFileWithDir(plugin_lib.getEmittedBin(), .lib, "quoin_sudo.so").step);
    const pam_lib = darwinPam(b, target, optimize, m, true);
    install.dependOn(&b.addInstallFileWithDir(pam_lib.getEmittedBin(), .lib, "quoin_sudo_pam.so").step);
    b.installArtifact(b.addExecutable(.{
        .name = "quoin-sudo-check-plugin",
        .root_module = b.createModule(.{
            .root_source_file = b.path("quoin-sudo-check-plugin-darwin.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .strip = true,
            .imports = &.{ .{ .name = "config", .module = cfg }, .{ .name = "sshkey", .module = m.sshkey } },
        }),
    }));

    const test_step = b.step("test", "Run the darwin unit tests and the plugin's");
    for ([_]*std.Build.Module{ t.fd, t.chain, t.agent, t.ids, t.sshkey, t.sudomsg }) |mod| {
        test_step.dependOn(&b.addRunArtifact(b.addTest(.{ .root_module = mod })).step);
    }
    test_step.dependOn(&b.addRunArtifact(b.addTest(.{ .root_module = darwinPam(b, target, optimize, t, false).root_module })).step);
    const test_cfg = darwinConfig(b, true, "quoin-sudo-test.log", "quoin-sudo-test-host", loader);
    const pt = b.addTest(.{
        .name = "darwin",
        .root_module = b.createModule(.{
            .root_source_file = b.path("darwin_test.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .imports = &.{
                .{ .name = "plugin", .module = darwinPlugin(b, target, optimize, t, test_cfg, false).root_module },
                .{ .name = "abi", .module = t.abi },
                .{ .name = "agent", .module = t.agent },
                .{ .name = "sudomsg", .module = t.sudomsg },
                .{ .name = "config", .module = test_cfg },
            },
        }),
    });
    test_step.dependOn(&b.addRunArtifact(pt).step);

    const lint_step = b.step("lint", "Run lint.zig over the package");
    const lint = b.addExecutable(.{
        .name = "lint",
        .root_module = b.createModule(.{ .root_source_file = b.path("lint.zig"), .target = b.graph.host }),
    });
    const run = b.addRunArtifact(lint);
    run.setCwd(b.path("."));
    run.has_side_effects = true;
    run.stdio = .inherit;
    run.addArgs(&.{ "--skip", "analyze", "." });
    lint_step.dependOn(&run.step);

    const fmt_step = b.step("fmt", "Check the formatting of the package's Zig");
    fmt_step.dependOn(&b.addFmt(.{ .check = true, .paths = &.{"."} }).step);
}

fn darwinConfig(b: *std.Build, force_remote: bool, log_path: []const u8, host_keys_dir: []const u8, loader: []const u8) *std.Build.Module {
    const opts = b.addOptions();
    opts.addOption(bool, "force_remote", force_remote);
    opts.addOption([]const u8, "log_path", log_path);
    opts.addOption([]const u8, "host_keys_dir", host_keys_dir);
    opts.addOption([]const u8, "loader", loader);
    return opts.createModule();
}

const DarwinModules = struct {
    abi: *std.Build.Module,
    fd: *std.Build.Module,
    chain: *std.Build.Module,
    agent: *std.Build.Module,
    ids: *std.Build.Module,
    args: *std.Build.Module,
    sshkey: *std.Build.Module,
    sudomsg: *std.Build.Module,
};

fn darwinModules(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode, include: ?[]const u8, pam_dir: ?[]const u8, link_pam: bool) DarwinModules {
    const abi = b.createModule(.{ .root_source_file = b.path("abi.zig"), .target = target, .optimize = optimize, .link_libc = true });
    if (include) |dir| abi.addIncludePath(.{ .cwd_relative = dir });
    if (pam_dir) |dir| {
        abi.addIncludePath(.{ .cwd_relative = b.pathJoin(&.{ dir, "include" }) });
        if (link_pam) abi.addLibraryPath(.{ .cwd_relative = b.pathJoin(&.{ dir, "lib" }) });
    }
    if (link_pam) abi.linkSystemLibrary("pam", .{});
    const fd = b.createModule(.{ .root_source_file = b.path("fd_darwin.zig"), .target = target, .optimize = optimize, .link_libc = true });
    const chain = b.createModule(.{
        .root_source_file = b.path("chain.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{ .{ .name = "fd", .module = fd }, .{ .name = "abi", .module = abi } },
    });
    const agent = b.createModule(.{
        .root_source_file = b.path("agent.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{.{ .name = "fd", .module = fd }},
    });
    const ids = b.createModule(.{
        .root_source_file = b.path("ids.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{ .{ .name = "abi", .module = abi }, .{ .name = "fd", .module = fd } },
    });
    const args = b.createModule(.{ .root_source_file = b.path("args.zig"), .target = target, .optimize = optimize });
    const sshkey = b.createModule(.{
        .root_source_file = b.path("sshkey.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{.{ .name = "agent", .module = agent }},
    });
    const sudomsg = b.createModule(.{ .root_source_file = b.path("sudomsg.zig"), .target = target, .optimize = optimize });
    return .{ .abi = abi, .fd = fd, .chain = chain, .agent = agent, .ids = ids, .args = args, .sshkey = sshkey, .sudomsg = sudomsg };
}

fn darwinPlugin(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode, m: DarwinModules, cfg: *std.Build.Module, strip: bool) *std.Build.Step.Compile {
    return undefinedAllowed(b.addLibrary(.{
        .name = "quoin_sudo",
        .linkage = .dynamic,
        .root_module = b.createModule(.{
            .root_source_file = b.path("quoin_sudo_darwin.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .strip = strip,
            .imports = &.{
                .{ .name = "abi", .module = m.abi },
                .{ .name = "fd", .module = m.fd },
                .{ .name = "chain", .module = m.chain },
                .{ .name = "agent", .module = m.agent },
                .{ .name = "ids", .module = m.ids },
                .{ .name = "args", .module = m.args },
                .{ .name = "sshkey", .module = m.sshkey },
                .{ .name = "sudomsg", .module = m.sudomsg },
                .{ .name = "config", .module = cfg },
            },
        }),
    }));
}

/// -undefined dynamic_lookup: PAM's symbols come from sudo's process.
fn undefinedAllowed(lib: *std.Build.Step.Compile) *std.Build.Step.Compile {
    lib.linker_allow_shlib_undefined = true;
    return lib;
}

fn darwinPam(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode, m: DarwinModules, strip: bool) *std.Build.Step.Compile {
    return undefinedAllowed(b.addLibrary(.{
        .name = "quoin_sudo_pam",
        .linkage = .dynamic,
        .root_module = b.createModule(.{
            .root_source_file = b.path("quoin-sudo-pam-darwin.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .strip = strip,
            .imports = &.{.{ .name = "abi", .module = m.abi }},
        }),
    }));
}
