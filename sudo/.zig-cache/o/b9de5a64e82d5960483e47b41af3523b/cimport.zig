pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_longlong;
pub const __uint64_t = c_ulonglong;
pub const __darwin_intptr_t = c_long;
pub const __darwin_natural_t = c_uint;
pub const __darwin_ct_rune_t = c_int;
pub const __mbstate_t = extern union {
    __mbstate8: [128]u8,
    _mbstateL: c_longlong,
};
pub const __darwin_mbstate_t = __mbstate_t;
pub const __darwin_ptrdiff_t = c_long;
pub const __darwin_size_t = c_ulong;
pub const __builtin_va_list = [*c]u8;
pub const __darwin_va_list = __builtin_va_list;
pub const __darwin_wchar_t = c_int;
pub const __darwin_rune_t = __darwin_wchar_t;
pub const __darwin_wint_t = c_int;
pub const __darwin_clock_t = c_ulong;
pub const __darwin_socklen_t = __uint32_t;
pub const __darwin_ssize_t = c_long;
pub const __darwin_time_t = c_long;
pub const __darwin_blkcnt_t = __int64_t;
pub const __darwin_blksize_t = __int32_t;
pub const __darwin_dev_t = __int32_t;
pub const __darwin_fsblkcnt_t = c_uint;
pub const __darwin_fsfilcnt_t = c_uint;
pub const __darwin_gid_t = __uint32_t;
pub const __darwin_id_t = __uint32_t;
pub const __darwin_ino64_t = __uint64_t;
pub const __darwin_ino_t = __darwin_ino64_t;
pub const __darwin_mach_port_name_t = __darwin_natural_t;
pub const __darwin_mach_port_t = __darwin_mach_port_name_t;
pub const __darwin_mode_t = __uint16_t;
pub const __darwin_off_t = __int64_t;
pub const __darwin_pid_t = __int32_t;
pub const __darwin_sigset_t = __uint32_t;
pub const __darwin_suseconds_t = __int32_t;
pub const __darwin_uid_t = __uint32_t;
pub const __darwin_useconds_t = __uint32_t;
pub const __darwin_uuid_t = [16]u8;
pub const __darwin_uuid_string_t = [37]u8;
pub const struct___darwin_pthread_handler_rec = extern struct {
    __routine: ?*const fn (?*anyopaque) callconv(.c) void = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) void),
    __arg: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __next: [*c]struct___darwin_pthread_handler_rec = @import("std").mem.zeroes([*c]struct___darwin_pthread_handler_rec),
};
pub const struct__opaque_pthread_attr_t = extern struct {
    __sig: c_long = @import("std").mem.zeroes(c_long),
    __opaque: [56]u8 = @import("std").mem.zeroes([56]u8),
};
pub const struct__opaque_pthread_cond_t = extern struct {
    __sig: c_long = @import("std").mem.zeroes(c_long),
    __opaque: [40]u8 = @import("std").mem.zeroes([40]u8),
};
pub const struct__opaque_pthread_condattr_t = extern struct {
    __sig: c_long = @import("std").mem.zeroes(c_long),
    __opaque: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const struct__opaque_pthread_mutex_t = extern struct {
    __sig: c_long = @import("std").mem.zeroes(c_long),
    __opaque: [56]u8 = @import("std").mem.zeroes([56]u8),
};
pub const struct__opaque_pthread_mutexattr_t = extern struct {
    __sig: c_long = @import("std").mem.zeroes(c_long),
    __opaque: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const struct__opaque_pthread_once_t = extern struct {
    __sig: c_long = @import("std").mem.zeroes(c_long),
    __opaque: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const struct__opaque_pthread_rwlock_t = extern struct {
    __sig: c_long = @import("std").mem.zeroes(c_long),
    __opaque: [192]u8 = @import("std").mem.zeroes([192]u8),
};
pub const struct__opaque_pthread_rwlockattr_t = extern struct {
    __sig: c_long = @import("std").mem.zeroes(c_long),
    __opaque: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const struct__opaque_pthread_t = extern struct {
    __sig: c_long = @import("std").mem.zeroes(c_long),
    __cleanup_stack: [*c]struct___darwin_pthread_handler_rec = @import("std").mem.zeroes([*c]struct___darwin_pthread_handler_rec),
    __opaque: [8176]u8 = @import("std").mem.zeroes([8176]u8),
};
pub const __darwin_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const __darwin_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const __darwin_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const __darwin_pthread_key_t = c_ulong;
pub const __darwin_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const __darwin_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const __darwin_pthread_once_t = struct__opaque_pthread_once_t;
pub const __darwin_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const __darwin_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const __darwin_pthread_t = [*c]struct__opaque_pthread_t;
pub const __darwin_nl_item = c_int;
pub const __darwin_wctrans_t = c_int;
pub const __darwin_wctype_t = __uint32_t;
pub const struct_accessx_descriptor = extern struct {
    ad_name_offset: c_uint = @import("std").mem.zeroes(c_uint),
    ad_flags: c_int = @import("std").mem.zeroes(c_int),
    ad_pad: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const u_int8_t = u8;
pub const u_int16_t = c_ushort;
pub const u_int32_t = c_uint;
pub const u_int64_t = c_ulonglong;
pub const register_t = i64;
pub const user_addr_t = u_int64_t;
pub const user_size_t = u_int64_t;
pub const user_ssize_t = i64;
pub const user_long_t = i64;
pub const user_ulong_t = u_int64_t;
pub const user_time_t = i64;
pub const user_off_t = i64;
pub const syscall_arg_t = u_int64_t;
pub extern fn getattrlistbulk(c_int, ?*anyopaque, ?*anyopaque, usize, u64) c_int;
pub extern fn getattrlistat(c_int, [*c]const u8, ?*anyopaque, ?*anyopaque, usize, c_ulong) c_int;
pub extern fn setattrlistat(c_int, [*c]const u8, ?*anyopaque, ?*anyopaque, usize, u32) c_int;
pub extern fn freadlink(c_int, noalias [*c]u8, usize) isize;
pub const uid_t = __darwin_uid_t;
pub const gid_t = __darwin_gid_t;
pub extern fn faccessat(c_int, [*c]const u8, c_int, c_int) c_int;
pub extern fn fchownat(c_int, [*c]const u8, uid_t, gid_t, c_int) c_int;
pub extern fn linkat(c_int, [*c]const u8, c_int, [*c]const u8, c_int) c_int;
pub extern fn readlinkat(c_int, [*c]const u8, [*c]u8, usize) isize;
pub extern fn symlinkat([*c]const u8, c_int, [*c]const u8) c_int;
pub extern fn unlinkat(c_int, [*c]const u8, c_int) c_int;
pub const off_t = __darwin_off_t;
pub const pid_t = __darwin_pid_t;
pub const useconds_t = __darwin_useconds_t;
pub extern fn _exit(c_int) noreturn;
pub extern fn access([*c]const u8, c_int) c_int;
pub extern fn alarm(c_uint) c_uint;
pub extern fn chdir([*c]const u8) c_int;
pub extern fn chown([*c]const u8, uid_t, gid_t) c_int;
pub extern fn close(c_int) c_int;
pub extern fn dup(c_int) c_int;
pub extern fn dup2(c_int, c_int) c_int;
pub extern fn execl(__path: [*c]const u8, __arg0: [*c]const u8, ...) c_int;
pub extern fn execle(__path: [*c]const u8, __arg0: [*c]const u8, ...) c_int;
pub extern fn execlp(__file: [*c]const u8, __arg0: [*c]const u8, ...) c_int;
pub extern fn execv(__path: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn execve(__file: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn execvp(__file: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn fork() pid_t;
pub extern fn fpathconf(c_int, c_int) c_long;
pub extern fn getcwd([*c]u8, __size: usize) [*c]u8;
pub extern fn getegid() gid_t;
pub extern fn geteuid() uid_t;
pub extern fn getgid() gid_t;
pub extern fn getgroups(__gidsetsize: c_int, [*c]gid_t) c_int;
pub extern fn getlogin() [*c]u8;
pub extern fn getpgrp() pid_t;
pub extern fn getpid() pid_t;
pub extern fn getppid() pid_t;
pub extern fn getuid() uid_t;
pub extern fn isatty(c_int) c_int;
pub extern fn link([*c]const u8, [*c]const u8) c_int;
pub extern fn lseek(c_int, off_t, c_int) off_t;
pub extern fn pathconf([*c]const u8, c_int) c_long;
pub extern fn pause() c_int;
pub extern fn pipe([*c]c_int) c_int;
pub extern fn read(c_int, ?*anyopaque, __nbyte: usize) isize;
pub extern fn rmdir([*c]const u8) c_int;
pub extern fn setgid(gid_t) c_int;
pub extern fn setpgid(pid_t, pid_t) c_int;
pub extern fn setsid() pid_t;
pub extern fn setuid(uid_t) c_int;
pub extern fn sleep(c_uint) c_uint;
pub extern fn sysconf(c_int) c_long;
pub extern fn tcgetpgrp(c_int) pid_t;
pub extern fn tcsetpgrp(c_int, pid_t) c_int;
pub extern fn ttyname(c_int) [*c]u8;
pub extern fn ttyname_r(c_int, [*c]u8, __len: usize) c_int;
pub extern fn unlink([*c]const u8) c_int;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __nbyte: usize) isize;
pub extern fn confstr(c_int, [*c]u8, __len: usize) usize;
pub extern fn getopt(__argc: c_int, [*c]const [*c]u8, [*c]const u8) c_int;
pub extern var optarg: [*c]u8;
pub extern var optind: c_int;
pub extern var opterr: c_int;
pub extern var optopt: c_int;
pub extern fn ctermid([*c]u8) [*c]u8;
pub extern fn brk(?*const anyopaque) ?*anyopaque;
pub extern fn chroot([*c]const u8) c_int;
pub extern fn crypt([*c]const u8, [*c]const u8) [*c]u8;
pub extern fn encrypt([*c]u8, c_int) void;
pub extern fn fchdir(c_int) c_int;
pub extern fn gethostid() c_long;
pub extern fn getpgid(pid_t) pid_t;
pub extern fn getsid(pid_t) pid_t;
pub extern fn getdtablesize() c_int;
pub extern fn getpagesize() c_int;
pub extern fn getpass([*c]const u8) [*c]u8;
pub extern fn getwd([*c]u8) [*c]u8;
pub extern fn lchown([*c]const u8, uid_t, gid_t) c_int;
pub extern fn lockf(c_int, c_int, off_t) c_int;
pub extern fn nice(c_int) c_int;
pub extern fn pread(__fd: c_int, __buf: ?*anyopaque, __nbyte: usize, __offset: off_t) isize;
pub extern fn pwrite(__fd: c_int, __buf: ?*const anyopaque, __nbyte: usize, __offset: off_t) isize;
pub extern fn sbrk(c_int) ?*anyopaque;
pub extern fn setpgrp() pid_t;
pub extern fn setregid(gid_t, gid_t) c_int;
pub extern fn setreuid(uid_t, uid_t) c_int;
pub extern fn swab(noalias ?*const anyopaque, noalias ?*anyopaque, __nbytes: isize) void;
pub extern fn sync() void;
pub extern fn truncate([*c]const u8, off_t) c_int;
pub extern fn ualarm(useconds_t, useconds_t) useconds_t;
pub extern fn usleep(useconds_t) c_int;
pub extern fn vfork() c_int;
pub extern fn fsync(c_int) c_int;
pub extern fn ftruncate(c_int, off_t) c_int;
pub extern fn getlogin_r([*c]u8, __namelen: usize) c_int;
pub extern fn fchown(c_int, uid_t, gid_t) c_int;
pub extern fn gethostname([*c]u8, __namelen: usize) c_int;
pub extern fn readlink(noalias [*c]const u8, noalias [*c]u8, __bufsize: usize) isize;
pub extern fn setegid(gid_t) c_int;
pub extern fn seteuid(uid_t) c_int;
pub extern fn symlink([*c]const u8, [*c]const u8) c_int;
pub const struct_fd_set = extern struct {
    fds_bits: [32]__int32_t = @import("std").mem.zeroes([32]__int32_t),
};
pub const fd_set = struct_fd_set;
pub extern fn __darwin_check_fd_set_overflow(c_int, ?*const anyopaque, c_int) c_int;
pub inline fn __darwin_check_fd_set(arg__a: c_int, arg__b: ?*const anyopaque) c_int {
    var _a = arg__a;
    _ = &_a;
    var _b = arg__b;
    _ = &_b;
    if (@as(usize, @intCast(@intFromPtr(&__darwin_check_fd_set_overflow))) != @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))) {
        return __darwin_check_fd_set_overflow(_a, _b, @as(c_int, 0));
    } else {
        return 1;
    }
    return 0;
}
pub inline fn __darwin_fd_isset(arg__fd: c_int, arg__p: [*c]const struct_fd_set) c_int {
    var _fd = arg__fd;
    _ = &_fd;
    var _p = arg__p;
    _ = &_p;
    if (__darwin_check_fd_set(_fd, @as(?*const anyopaque, @ptrCast(_p))) != 0) {
        return _p.*.fds_bits[@as(c_ulong, @bitCast(@as(c_long, _fd))) / (@sizeOf(__int32_t) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 8)))))] & @as(__int32_t, @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))) << @intCast(@as(c_ulong, @bitCast(@as(c_long, _fd))) % (@sizeOf(__int32_t) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 8))))))))));
    }
    return 0;
}
pub inline fn __darwin_fd_set(arg__fd: c_int, _p: [*c]struct_fd_set) void {
    var _fd = arg__fd;
    _ = &_fd;
    _ = &_p;
    if (__darwin_check_fd_set(_fd, @as(?*const anyopaque, @ptrCast(_p))) != 0) {
        _ = blk: {
            const ref = &_p.*.fds_bits[@as(c_ulong, @bitCast(@as(c_long, _fd))) / (@sizeOf(__int32_t) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 8)))))];
            ref.* |= @as(__int32_t, @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))) << @intCast(@as(c_ulong, @bitCast(@as(c_long, _fd))) % (@sizeOf(__int32_t) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 8))))))))));
            break :blk ref.*;
        };
    }
}
pub inline fn __darwin_fd_clr(arg__fd: c_int, _p: [*c]struct_fd_set) void {
    var _fd = arg__fd;
    _ = &_fd;
    _ = &_p;
    if (__darwin_check_fd_set(_fd, @as(?*const anyopaque, @ptrCast(_p))) != 0) {
        _ = blk: {
            const ref = &_p.*.fds_bits[@as(c_ulong, @bitCast(@as(c_long, _fd))) / (@sizeOf(__int32_t) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 8)))))];
            ref.* &= ~@as(__int32_t, @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 1)))) << @intCast(@as(c_ulong, @bitCast(@as(c_long, _fd))) % (@sizeOf(__int32_t) *% @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 8))))))))));
            break :blk ref.*;
        };
    }
}
pub const struct_timespec = extern struct {
    tv_sec: __darwin_time_t = @import("std").mem.zeroes(__darwin_time_t),
    tv_nsec: c_long = @import("std").mem.zeroes(c_long),
};
pub const struct_timeval = extern struct {
    tv_sec: __darwin_time_t = @import("std").mem.zeroes(__darwin_time_t),
    tv_usec: __darwin_suseconds_t = @import("std").mem.zeroes(__darwin_suseconds_t),
};
pub const time_t = __darwin_time_t;
pub const suseconds_t = __darwin_suseconds_t;
pub const sigset_t = __darwin_sigset_t;
pub extern fn pselect(c_int, noalias [*c]fd_set, noalias [*c]fd_set, noalias [*c]fd_set, noalias [*c]const struct_timespec, noalias [*c]const sigset_t) c_int;
pub extern fn select(c_int, noalias [*c]fd_set, noalias [*c]fd_set, noalias [*c]fd_set, noalias [*c]struct_timeval) c_int;
pub const dev_t = __darwin_dev_t;
pub const mode_t = __darwin_mode_t;
pub const uuid_t = __darwin_uuid_t;
pub extern fn _Exit(c_int) noreturn;
pub extern fn accessx_np([*c]const struct_accessx_descriptor, __sz: usize, [*c]c_int, uid_t) c_int;
pub extern fn acct([*c]const u8) c_int;
pub extern fn add_profil([*c]u8, __bufsiz: usize, c_ulong, c_uint) c_int;
pub extern fn endusershell() void;
pub extern fn execvP(__file: [*c]const u8, __searchpath: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn fflagstostr(c_ulong) [*c]u8;
pub extern fn getdomainname([*c]u8, __namelen: c_int) c_int;
pub extern fn getgrouplist([*c]const u8, c_int, [*c]c_int, __ngroups: [*c]c_int) c_int;
pub extern fn gethostuuid([*c]u8, [*c]const struct_timespec) c_int;
pub extern fn getmode(?*const anyopaque, mode_t) mode_t;
pub extern fn getpeereid(c_int, [*c]uid_t, [*c]gid_t) c_int;
pub extern fn getsgroups_np([*c]c_int, [*c]u8) c_int;
pub extern fn getusershell() [*c]u8;
pub extern fn getwgroups_np([*c]c_int, [*c]u8) c_int;
pub extern fn initgroups([*c]const u8, c_int) c_int;
pub extern fn issetugid() c_int;
pub extern fn mkdtemp([*c]u8) [*c]u8;
pub extern fn mknod([*c]const u8, mode_t, dev_t) c_int;
pub extern fn mkpath_np(path: [*c]const u8, omode: mode_t) c_int;
pub extern fn mkpathat_np(dfd: c_int, path: [*c]const u8, omode: mode_t) c_int;
pub extern fn mkstemp([*c]u8) c_int;
pub extern fn mkstemps([*c]u8, c_int) c_int;
pub extern fn mktemp([*c]u8) [*c]u8;
pub extern fn mkostemp(path: [*c]u8, oflags: c_int) c_int;
pub extern fn mkostemps(path: [*c]u8, slen: c_int, oflags: c_int) c_int;
pub extern fn mkstemp_dprotected_np(path: [*c]u8, dpclass: c_int, dpflags: c_int) c_int;
pub extern fn mkdtempat_np(dfd: c_int, path: [*c]u8) [*c]u8;
pub extern fn mkstempsat_np(dfd: c_int, path: [*c]u8, slen: c_int) c_int;
pub extern fn mkostempsat_np(dfd: c_int, path: [*c]u8, slen: c_int, oflags: c_int) c_int;
pub extern fn nfssvc(c_int, ?*anyopaque) c_int;
pub extern fn profil([*c]u8, __bufsiz: usize, c_ulong, c_uint) c_int;
pub extern fn pthread_setugid_np(uid_t, gid_t) c_int;
pub extern fn pthread_getugid_np([*c]uid_t, [*c]gid_t) c_int;
pub extern fn reboot(c_int) c_int;
pub extern fn revoke([*c]const u8) c_int;
pub extern fn rcmd([*c][*c]u8, c_int, [*c]const u8, [*c]const u8, [*c]const u8, [*c]c_int) c_int;
pub extern fn rcmd_af([*c][*c]u8, c_int, [*c]const u8, [*c]const u8, [*c]const u8, [*c]c_int, c_int) c_int;
pub extern fn rresvport([*c]c_int) c_int;
pub extern fn rresvport_af([*c]c_int, c_int) c_int;
pub extern fn iruserok(c_ulong, c_int, [*c]const u8, [*c]const u8) c_int;
pub extern fn iruserok_sa(?*const anyopaque, c_int, c_int, [*c]const u8, [*c]const u8) c_int;
pub extern fn ruserok([*c]const u8, c_int, [*c]const u8, [*c]const u8) c_int;
pub extern fn setdomainname([*c]const u8, __namelen: c_int) c_int;
pub extern fn setgroups(c_int, [*c]const gid_t) c_int;
pub extern fn sethostid(c_long) void;
pub extern fn sethostname([*c]const u8, __namelen: c_int) c_int;
pub extern fn setkey([*c]const u8) void;
pub extern fn setlogin([*c]const u8) c_int;
pub extern fn setmode([*c]const u8) ?*anyopaque;
pub extern fn setrgid(gid_t) c_int;
pub extern fn setruid(uid_t) c_int;
pub extern fn setsgroups_np(c_int, [*c]const u8) c_int;
pub extern fn setusershell() void;
pub extern fn setwgroups_np(c_int, [*c]const u8) c_int;
pub extern fn strtofflags([*c][*c]u8, [*c]c_ulong, [*c]c_ulong) c_int;
pub extern fn swapon([*c]const u8) c_int;
pub extern fn ttyslot() c_int;
pub extern fn undelete([*c]const u8) c_int;
pub extern fn unwhiteout([*c]const u8) c_int;
pub extern fn valloc(__size: usize) ?*anyopaque;
pub extern fn syscall(c_int, ...) c_int;
pub extern var suboptarg: [*c]u8;
pub extern fn getsubopt([*c][*c]u8, [*c]const [*c]u8, [*c][*c]u8) c_int;
pub extern fn fgetattrlist(c_int, ?*anyopaque, ?*anyopaque, __attrBufSize: usize, c_uint) c_int;
pub extern fn fsetattrlist(c_int, ?*anyopaque, ?*anyopaque, __attrBufSize: usize, c_uint) c_int;
pub extern fn getattrlist([*c]const u8, ?*anyopaque, ?*anyopaque, __attrBufSize: usize, c_uint) c_int;
pub extern fn setattrlist([*c]const u8, ?*anyopaque, ?*anyopaque, __attrBufSize: usize, c_uint) c_int;
pub extern fn exchangedata([*c]const u8, [*c]const u8, c_uint) c_int;
pub extern fn getdirentriesattr(c_int, ?*anyopaque, ?*anyopaque, __attrBufSize: usize, [*c]c_uint, [*c]c_uint, [*c]c_uint, c_uint) c_int;
pub const u_short = c_ushort;
pub const attrgroup_t = u_int32_t;
pub const struct_attrlist = extern struct {
    bitmapcount: u_short = @import("std").mem.zeroes(u_short),
    reserved: u_int16_t = @import("std").mem.zeroes(u_int16_t),
    commonattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
    volattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
    dirattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
    fileattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
    forkattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
};
pub const u_long = c_ulong;
pub const struct_fssearchblock = extern struct {
    returnattrs: [*c]struct_attrlist = @import("std").mem.zeroes([*c]struct_attrlist),
    returnbuffer: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    returnbuffersize: usize = @import("std").mem.zeroes(usize),
    maxmatches: u_long = @import("std").mem.zeroes(u_long),
    timelimit: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    searchparams1: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sizeofsearchparams1: usize = @import("std").mem.zeroes(usize),
    searchparams2: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sizeofsearchparams2: usize = @import("std").mem.zeroes(usize),
    searchattrs: struct_attrlist = @import("std").mem.zeroes(struct_attrlist),
};
pub const u_char = u8;
pub const struct_searchstate = extern struct {
    ss_union_flags: u32 align(1) = @import("std").mem.zeroes(u32),
    ss_union_layer: u32 align(1) = @import("std").mem.zeroes(u32),
    ss_fsstate: [548]u_char align(1) = @import("std").mem.zeroes([548]u_char),
};
pub extern fn searchfs([*c]const u8, [*c]struct_fssearchblock, [*c]c_ulong, c_uint, c_uint, [*c]struct_searchstate) c_int;
pub extern fn fsctl([*c]const u8, c_ulong, ?*anyopaque, c_uint) c_int;
pub extern fn ffsctl(c_int, c_ulong, ?*anyopaque, c_uint) c_int;
pub extern fn fsync_volume_np(c_int, c_int) c_int;
pub extern fn sync_volume_np([*c]const u8, c_int) c_int;
pub extern var optreset: c_int;
pub const struct_group = extern struct {
    gr_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    gr_passwd: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    gr_gid: gid_t = @import("std").mem.zeroes(gid_t),
    gr_mem: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
};
pub extern fn getgrgid(gid_t) [*c]struct_group;
pub extern fn getgrnam([*c]const u8) [*c]struct_group;
pub extern fn getgrgid_r(gid_t, [*c]struct_group, [*c]u8, usize, [*c][*c]struct_group) c_int;
pub extern fn getgrnam_r([*c]const u8, [*c]struct_group, [*c]u8, usize, [*c][*c]struct_group) c_int;
pub extern fn getgrent() [*c]struct_group;
pub extern fn setgrent() void;
pub extern fn endgrent() void;
pub const uuid_string_t = __darwin_uuid_string_t;
pub const UUID_NULL: uuid_t = [16]u8{
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
};
pub extern fn uuid_clear(uu: [*c]u8) void;
pub extern fn uuid_compare(uu1: [*c]const u8, uu2: [*c]const u8) c_int;
pub extern fn uuid_copy(dst: [*c]u8, src: [*c]const u8) void;
pub extern fn uuid_generate(out: [*c]u8) void;
pub extern fn uuid_generate_random(out: [*c]u8) void;
pub extern fn uuid_generate_time(out: [*c]u8) void;
pub extern fn uuid_is_null(uu: [*c]const u8) c_int;
pub extern fn uuid_parse(in: [*c]const u8, uu: [*c]u8) c_int;
pub extern fn uuid_unparse(uu: [*c]const u8, out: [*c]u8) void;
pub extern fn uuid_unparse_lower(uu: [*c]const u8, out: [*c]u8) void;
pub extern fn uuid_unparse_upper(uu: [*c]const u8, out: [*c]u8) void;
pub extern fn group_from_gid(gid_t, c_int) [*c]u8;
pub extern fn getgruuid([*c]u8) [*c]struct_group;
pub extern fn getgruuid_r([*c]u8, [*c]struct_group, [*c]u8, usize, [*c][*c]struct_group) c_int;
pub extern fn setgrfile([*c]const u8) void;
pub extern fn setgroupent(c_int) c_int;
pub const struct_sudo_conv_message = extern struct {
    msg_type: c_int = @import("std").mem.zeroes(c_int),
    timeout: c_int = @import("std").mem.zeroes(c_int),
    msg: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const struct_sudo_conv_reply = extern struct {
    reply: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const sudo_conv_callback_fn_t = ?*const fn (c_int, ?*anyopaque) callconv(.c) c_int;
pub const struct_sudo_conv_callback = extern struct {
    version: c_uint = @import("std").mem.zeroes(c_uint),
    closure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    on_suspend: sudo_conv_callback_fn_t = @import("std").mem.zeroes(sudo_conv_callback_fn_t),
    on_resume: sudo_conv_callback_fn_t = @import("std").mem.zeroes(sudo_conv_callback_fn_t),
};
pub const sudo_conv_t = ?*const fn (c_int, [*c]const struct_sudo_conv_message, [*c]struct_sudo_conv_reply, [*c]struct_sudo_conv_callback) callconv(.c) c_int;
pub const sudo_printf_t = ?*const fn (c_int, [*c]const u8, ...) callconv(.c) c_int;
pub const sudo_hook_fn_t = ?*const fn (...) callconv(.c) c_int;
pub const sudo_hook_fn_setenv_t = ?*const fn ([*c]const u8, [*c]const u8, c_int, ?*anyopaque) callconv(.c) c_int;
pub const sudo_hook_fn_putenv_t = ?*const fn ([*c]u8, ?*anyopaque) callconv(.c) c_int;
pub const sudo_hook_fn_getenv_t = ?*const fn ([*c]const u8, [*c][*c]u8, ?*anyopaque) callconv(.c) c_int;
pub const sudo_hook_fn_unsetenv_t = ?*const fn ([*c]const u8, ?*anyopaque) callconv(.c) c_int;
pub const struct_sudo_hook = extern struct {
    hook_version: c_uint = @import("std").mem.zeroes(c_uint),
    hook_type: c_uint = @import("std").mem.zeroes(c_uint),
    hook_fn: sudo_hook_fn_t = @import("std").mem.zeroes(sudo_hook_fn_t),
    closure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const sudo_plugin_ev_callback_t = ?*const fn (c_int, c_int, ?*anyopaque) callconv(.c) void;
pub const struct_sudo_plugin_event = extern struct {
    set: ?*const fn ([*c]struct_sudo_plugin_event, c_int, c_int, sudo_plugin_ev_callback_t, ?*anyopaque) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]struct_sudo_plugin_event, c_int, c_int, sudo_plugin_ev_callback_t, ?*anyopaque) callconv(.c) c_int),
    add: ?*const fn ([*c]struct_sudo_plugin_event, [*c]struct_timespec) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]struct_sudo_plugin_event, [*c]struct_timespec) callconv(.c) c_int),
    del: ?*const fn ([*c]struct_sudo_plugin_event) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]struct_sudo_plugin_event) callconv(.c) c_int),
    pending: ?*const fn ([*c]struct_sudo_plugin_event, c_int, [*c]struct_timespec) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]struct_sudo_plugin_event, c_int, [*c]struct_timespec) callconv(.c) c_int),
    fd: ?*const fn ([*c]struct_sudo_plugin_event) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]struct_sudo_plugin_event) callconv(.c) c_int),
    setbase: ?*const fn ([*c]struct_sudo_plugin_event, ?*anyopaque) callconv(.c) void = @import("std").mem.zeroes(?*const fn ([*c]struct_sudo_plugin_event, ?*anyopaque) callconv(.c) void),
    loopbreak: ?*const fn ([*c]struct_sudo_plugin_event) callconv(.c) void = @import("std").mem.zeroes(?*const fn ([*c]struct_sudo_plugin_event) callconv(.c) void),
    free: ?*const fn ([*c]struct_sudo_plugin_event) callconv(.c) void = @import("std").mem.zeroes(?*const fn ([*c]struct_sudo_plugin_event) callconv(.c) void),
};
pub const struct_passwd = opaque {};
pub const struct_policy_plugin = extern struct {
    type: c_uint = @import("std").mem.zeroes(c_uint),
    version: c_uint = @import("std").mem.zeroes(c_uint),
    open: ?*const fn (c_uint, sudo_conv_t, sudo_printf_t, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_uint, sudo_conv_t, sudo_printf_t, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    close: ?*const fn (c_int, c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int, c_int) callconv(.c) void),
    show_version: ?*const fn (c_int) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_int) callconv(.c) c_int),
    check_policy: ?*const fn (c_int, [*c]const [*c]u8, [*c][*c]u8, [*c][*c][*c]u8, [*c][*c][*c]u8, [*c][*c][*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_int, [*c]const [*c]u8, [*c][*c]u8, [*c][*c][*c]u8, [*c][*c][*c]u8, [*c][*c][*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    list: ?*const fn (c_int, [*c]const [*c]u8, c_int, [*c]const u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_int, [*c]const [*c]u8, c_int, [*c]const u8, [*c][*c]const u8) callconv(.c) c_int),
    validate: ?*const fn ([*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c][*c]const u8) callconv(.c) c_int),
    invalidate: ?*const fn (c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int) callconv(.c) void),
    init_session: ?*const fn (?*struct_passwd, [*c][*c][*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (?*struct_passwd, [*c][*c][*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    register_hooks: ?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void),
    deregister_hooks: ?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void),
    event_alloc: ?*const fn () callconv(.c) [*c]struct_sudo_plugin_event = @import("std").mem.zeroes(?*const fn () callconv(.c) [*c]struct_sudo_plugin_event),
};
pub const struct_io_plugin = extern struct {
    type: c_uint = @import("std").mem.zeroes(c_uint),
    version: c_uint = @import("std").mem.zeroes(c_uint),
    open: ?*const fn (c_uint, sudo_conv_t, sudo_printf_t, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, c_int, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_uint, sudo_conv_t, sudo_printf_t, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, c_int, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    close: ?*const fn (c_int, c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int, c_int) callconv(.c) void),
    show_version: ?*const fn (c_int) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_int) callconv(.c) c_int),
    log_ttyin: ?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int),
    log_ttyout: ?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int),
    log_stdin: ?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int),
    log_stdout: ?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int),
    log_stderr: ?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const u8, c_uint, [*c][*c]const u8) callconv(.c) c_int),
    register_hooks: ?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void),
    deregister_hooks: ?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void),
    change_winsize: ?*const fn (c_uint, c_uint, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_uint, c_uint, [*c][*c]const u8) callconv(.c) c_int),
    log_suspend: ?*const fn (c_int, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_int, [*c][*c]const u8) callconv(.c) c_int),
    event_alloc: ?*const fn () callconv(.c) [*c]struct_sudo_plugin_event = @import("std").mem.zeroes(?*const fn () callconv(.c) [*c]struct_sudo_plugin_event),
};
pub const struct_audit_plugin = extern struct {
    type: c_uint = @import("std").mem.zeroes(c_uint),
    version: c_uint = @import("std").mem.zeroes(c_uint),
    open: ?*const fn (c_uint, sudo_conv_t, sudo_printf_t, [*c]const [*c]u8, [*c]const [*c]u8, c_int, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_uint, sudo_conv_t, sudo_printf_t, [*c]const [*c]u8, [*c]const [*c]u8, c_int, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    close: ?*const fn (c_int, c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int, c_int) callconv(.c) void),
    accept: ?*const fn ([*c]const u8, c_uint, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const u8, c_uint, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    reject: ?*const fn ([*c]const u8, c_uint, [*c]const u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const u8, c_uint, [*c]const u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    @"error": ?*const fn ([*c]const u8, c_uint, [*c]const u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const u8, c_uint, [*c]const u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    show_version: ?*const fn (c_int) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_int) callconv(.c) c_int),
    register_hooks: ?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void),
    deregister_hooks: ?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int, ?*const fn ([*c]struct_sudo_hook) callconv(.c) c_int) callconv(.c) void),
    event_alloc: ?*const fn () callconv(.c) [*c]struct_sudo_plugin_event = @import("std").mem.zeroes(?*const fn () callconv(.c) [*c]struct_sudo_plugin_event),
};
pub const struct_approval_plugin = extern struct {
    type: c_uint = @import("std").mem.zeroes(c_uint),
    version: c_uint = @import("std").mem.zeroes(c_uint),
    open: ?*const fn (c_uint, sudo_conv_t, sudo_printf_t, [*c]const [*c]u8, [*c]const [*c]u8, c_int, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_uint, sudo_conv_t, sudo_printf_t, [*c]const [*c]u8, [*c]const [*c]u8, c_int, [*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    close: ?*const fn () callconv(.c) void = @import("std").mem.zeroes(?*const fn () callconv(.c) void),
    check: ?*const fn ([*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const [*c]u8, [*c]const [*c]u8, [*c]const [*c]u8, [*c][*c]const u8) callconv(.c) c_int),
    show_version: ?*const fn (c_int) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_int) callconv(.c) c_int),
};
pub const struct_sudoers_group_plugin = extern struct {
    version: c_uint = @import("std").mem.zeroes(c_uint),
    init: ?*const fn (c_int, sudo_printf_t, [*c]const [*c]u8) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_int, sudo_printf_t, [*c]const [*c]u8) callconv(.c) c_int),
    cleanup: ?*const fn () callconv(.c) void = @import("std").mem.zeroes(?*const fn () callconv(.c) void),
    query: ?*const fn ([*c]const u8, [*c]const u8, ?*const struct_passwd) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn ([*c]const u8, [*c]const u8, ?*const struct_passwd) callconv(.c) c_int),
};
pub const ptrdiff_t = c_long;
pub const rsize_t = c_ulong;
pub const wchar_t = c_int;
pub const max_align_t = c_longdouble;
pub const struct_pam_message = extern struct {
    msg_style: c_int = @import("std").mem.zeroes(c_int),
    msg: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const struct_pam_response = extern struct {
    resp: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    resp_retcode: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_pam_conv = extern struct {
    conv: ?*const fn (c_int, [*c][*c]const struct_pam_message, [*c][*c]struct_pam_response, ?*anyopaque) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (c_int, [*c][*c]const struct_pam_message, [*c][*c]struct_pam_response, ?*anyopaque) callconv(.c) c_int),
    appdata_ptr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const struct_pam_handle = opaque {};
pub const pam_handle_t = struct_pam_handle;
pub const struct_pam_repository = extern struct {
    type: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    scope: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    scope_len: usize = @import("std").mem.zeroes(usize),
};
pub const pam_repository_t = struct_pam_repository;
pub const PAM_SUCCESS: c_int = 0;
pub const PAM_OPEN_ERR: c_int = 1;
pub const PAM_SYMBOL_ERR: c_int = 2;
pub const PAM_SERVICE_ERR: c_int = 3;
pub const PAM_SYSTEM_ERR: c_int = 4;
pub const PAM_BUF_ERR: c_int = 5;
pub const PAM_CONV_ERR: c_int = 6;
pub const PAM_PERM_DENIED: c_int = 7;
pub const PAM_MAXTRIES: c_int = 8;
pub const PAM_AUTH_ERR: c_int = 9;
pub const PAM_NEW_AUTHTOK_REQD: c_int = 10;
pub const PAM_CRED_INSUFFICIENT: c_int = 11;
pub const PAM_AUTHINFO_UNAVAIL: c_int = 12;
pub const PAM_USER_UNKNOWN: c_int = 13;
pub const PAM_CRED_UNAVAIL: c_int = 14;
pub const PAM_CRED_EXPIRED: c_int = 15;
pub const PAM_CRED_ERR: c_int = 16;
pub const PAM_ACCT_EXPIRED: c_int = 17;
pub const PAM_AUTHTOK_EXPIRED: c_int = 18;
pub const PAM_SESSION_ERR: c_int = 19;
pub const PAM_AUTHTOK_ERR: c_int = 20;
pub const PAM_AUTHTOK_RECOVERY_ERR: c_int = 21;
pub const PAM_AUTHTOK_LOCK_BUSY: c_int = 22;
pub const PAM_AUTHTOK_DISABLE_AGING: c_int = 23;
pub const PAM_NO_MODULE_DATA: c_int = 24;
pub const PAM_IGNORE: c_int = 25;
pub const PAM_ABORT: c_int = 26;
pub const PAM_TRY_AGAIN: c_int = 27;
pub const PAM_MODULE_UNKNOWN: c_int = 28;
pub const PAM_DOMAIN_UNKNOWN: c_int = 29;
pub const PAM_BAD_HANDLE: c_int = 30;
pub const PAM_BAD_ITEM: c_int = 31;
pub const PAM_BAD_FEATURE: c_int = 32;
pub const PAM_BAD_CONSTANT: c_int = 33;
pub const PAM_NUM_ERRORS: c_int = 34;
const enum_unnamed_1 = c_uint;
pub const PAM_PROMPT_ECHO_OFF: c_int = 1;
pub const PAM_PROMPT_ECHO_ON: c_int = 2;
pub const PAM_ERROR_MSG: c_int = 3;
pub const PAM_TEXT_INFO: c_int = 4;
pub const PAM_MAX_NUM_MSG: c_int = 32;
pub const PAM_MAX_MSG_SIZE: c_int = 512;
pub const PAM_MAX_RESP_SIZE: c_int = 512;
const enum_unnamed_2 = c_uint;
pub const PAM_SILENT: c_int = -2147483648;
pub const PAM_DISALLOW_NULL_AUTHTOK: c_int = 1;
pub const PAM_ESTABLISH_CRED: c_int = 1;
pub const PAM_DELETE_CRED: c_int = 2;
pub const PAM_REINITIALIZE_CRED: c_int = 4;
pub const PAM_REFRESH_CRED: c_int = 8;
pub const PAM_PRELIM_CHECK: c_int = 1;
pub const PAM_UPDATE_AUTHTOK: c_int = 2;
pub const PAM_CHANGE_EXPIRED_AUTHTOK: c_int = 4;
const enum_unnamed_3 = c_int;
pub const PAM_SERVICE: c_int = 1;
pub const PAM_USER: c_int = 2;
pub const PAM_TTY: c_int = 3;
pub const PAM_RHOST: c_int = 4;
pub const PAM_CONV: c_int = 5;
pub const PAM_AUTHTOK: c_int = 6;
pub const PAM_OLDAUTHTOK: c_int = 7;
pub const PAM_RUSER: c_int = 8;
pub const PAM_USER_PROMPT: c_int = 9;
pub const PAM_REPOSITORY: c_int = 10;
pub const PAM_AUTHTOK_PROMPT: c_int = 11;
pub const PAM_OLDAUTHTOK_PROMPT: c_int = 12;
pub const PAM_HOST: c_int = 13;
pub const PAM_NUM_ITEMS: c_int = 14;
const enum_unnamed_4 = c_uint;
pub extern fn pam_acct_mgmt(_pamh: ?*pam_handle_t, _flags: c_int) c_int;
pub extern fn pam_authenticate(_pamh: ?*pam_handle_t, _flags: c_int) c_int;
pub extern fn pam_chauthtok(_pamh: ?*pam_handle_t, _flags: c_int) c_int;
pub extern fn pam_close_session(_pamh: ?*pam_handle_t, _flags: c_int) c_int;
pub extern fn pam_end(_pamh: ?*pam_handle_t, _status: c_int) c_int;
pub extern fn pam_get_data(_pamh: ?*const pam_handle_t, _module_data_name: [*c]const u8, _data: [*c]?*const anyopaque) c_int;
pub extern fn pam_get_item(_pamh: ?*const pam_handle_t, _item_type: c_int, _item: [*c]?*const anyopaque) c_int;
pub extern fn pam_get_user(_pamh: ?*pam_handle_t, _user: [*c][*c]const u8, _prompt: [*c]const u8) c_int;
pub extern fn pam_getenv(_pamh: ?*pam_handle_t, _name: [*c]const u8) [*c]const u8;
pub extern fn pam_getenvlist(_pamh: ?*pam_handle_t) [*c][*c]u8;
pub extern fn pam_open_session(_pamh: ?*pam_handle_t, _flags: c_int) c_int;
pub extern fn pam_putenv(_pamh: ?*pam_handle_t, _namevalue: [*c]const u8) c_int;
pub extern fn pam_set_data(_pamh: ?*pam_handle_t, _module_data_name: [*c]const u8, _data: ?*anyopaque, _cleanup: ?*const fn (?*pam_handle_t, ?*anyopaque, c_int) callconv(.c) void) c_int;
pub extern fn pam_set_item(_pamh: ?*pam_handle_t, _item_type: c_int, _item: ?*const anyopaque) c_int;
pub extern fn pam_setcred(_pamh: ?*pam_handle_t, _flags: c_int) c_int;
pub extern fn pam_start(_service: [*c]const u8, _user: [*c]const u8, _pam_conv: [*c]const struct_pam_conv, _pamh: [*c]?*pam_handle_t) c_int;
pub extern fn pam_strerror(_pamh: ?*const pam_handle_t, _error_number: c_int) [*c]const u8;
pub const __gnuc_va_list = __builtin_va_list;
pub const va_list = __builtin_va_list;
pub extern fn openpam_borrow_cred(_pamh: ?*pam_handle_t, _pwd: ?*const struct_passwd) c_int;
pub extern fn openpam_subst(_pamh: ?*const pam_handle_t, _buf: [*c]u8, _bufsize: [*c]usize, _template: [*c]const u8) c_int;
pub extern fn openpam_free_data(_pamh: ?*pam_handle_t, _data: ?*anyopaque, _status: c_int) void;
pub extern fn openpam_free_envlist(_envlist: [*c][*c]u8) void;
pub extern fn openpam_get_option(_pamh: ?*pam_handle_t, _option: [*c]const u8) [*c]const u8;
pub extern fn openpam_restore_cred(_pamh: ?*pam_handle_t) c_int;
pub extern fn openpam_set_option(_pamh: ?*pam_handle_t, _option: [*c]const u8, _value: [*c]const u8) c_int;
pub extern fn pam_error(_pamh: ?*const pam_handle_t, _fmt: [*c]const u8, ...) c_int;
pub extern fn pam_get_authtok(_pamh: ?*pam_handle_t, _item: c_int, _authtok: [*c][*c]const u8, _prompt: [*c]const u8) c_int;
pub extern fn pam_info(_pamh: ?*const pam_handle_t, _fmt: [*c]const u8, ...) c_int;
pub extern fn pam_prompt(_pamh: ?*const pam_handle_t, _style: c_int, _resp: [*c][*c]u8, _fmt: [*c]const u8, ...) c_int;
pub extern fn pam_setenv(_pamh: ?*pam_handle_t, _name: [*c]const u8, _value: [*c]const u8, _overwrite: c_int) c_int;
pub extern fn pam_vinfo(_pamh: ?*const pam_handle_t, _fmt: [*c]const u8, _ap: va_list) c_int;
pub extern fn pam_verror(_pamh: ?*const pam_handle_t, _fmt: [*c]const u8, _ap: va_list) c_int;
pub extern fn pam_vprompt(_pamh: ?*const pam_handle_t, _style: c_int, _resp: [*c][*c]u8, _fmt: [*c]const u8, _ap: va_list) c_int;
pub extern fn openpam_straddch(_str: [*c][*c]u8, _sizep: [*c]usize, _lenp: [*c]usize, ch: c_int) c_int;
pub const OPENPAM_RESTRICT_SERVICE_NAME: c_int = 0;
pub const OPENPAM_VERIFY_POLICY_FILE: c_int = 1;
pub const OPENPAM_RESTRICT_MODULE_NAME: c_int = 2;
pub const OPENPAM_VERIFY_MODULE_FILE: c_int = 3;
pub const OPENPAM_FALLBACK_TO_OTHER: c_int = 4;
pub const OPENPAM_NUM_FEATURES: c_int = 5;
const enum_unnamed_5 = c_uint;
pub extern fn openpam_set_feature(_feature: c_int, _onoff: c_int) c_int;
pub extern fn openpam_get_feature(_feature: c_int, _onoff: [*c]c_int) c_int;
pub const PAM_LOG_LIBDEBUG: c_int = -1;
pub const PAM_LOG_DEBUG: c_int = 0;
pub const PAM_LOG_VERBOSE: c_int = 1;
pub const PAM_LOG_NOTICE: c_int = 2;
pub const PAM_LOG_ERROR: c_int = 3;
const enum_unnamed_6 = c_int;
pub extern fn _openpam_log(_level: c_int, _func: [*c]const u8, _fmt: [*c]const u8, ...) void;
pub extern fn openpam_ttyconv(_n: c_int, _msg: [*c][*c]const struct_pam_message, _resp: [*c][*c]struct_pam_response, _data: ?*anyopaque) c_int;
pub extern var openpam_ttyconv_timeout: c_int;
pub extern fn openpam_nullconv(_n: c_int, _msg: [*c][*c]const struct_pam_message, _resp: [*c][*c]struct_pam_response, _data: ?*anyopaque) c_int;
pub const PAM_SM_AUTHENTICATE: c_int = 0;
pub const PAM_SM_SETCRED: c_int = 1;
pub const PAM_SM_ACCT_MGMT: c_int = 2;
pub const PAM_SM_OPEN_SESSION: c_int = 3;
pub const PAM_SM_CLOSE_SESSION: c_int = 4;
pub const PAM_SM_CHAUTHTOK: c_int = 5;
pub const PAM_NUM_PRIMITIVES: c_int = 6;
const enum_unnamed_7 = c_uint;
pub const pam_func_t = ?*const fn (?*struct_pam_handle, c_int, c_int, [*c][*c]const u8) callconv(.c) c_int;
pub const struct_pam_module = extern struct {
    path: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    func: [6]pam_func_t = @import("std").mem.zeroes([6]pam_func_t),
    dlh: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const pam_module_t = struct_pam_module;
pub extern fn pam_sm_acct_mgmt(_pamh: ?*pam_handle_t, _flags: c_int, _argc: c_int, _argv: [*c][*c]const u8) c_int;
pub extern fn pam_sm_authenticate(_pamh: ?*pam_handle_t, _flags: c_int, _argc: c_int, _argv: [*c][*c]const u8) c_int;
pub extern fn pam_sm_chauthtok(_pamh: ?*pam_handle_t, _flags: c_int, _argc: c_int, _argv: [*c][*c]const u8) c_int;
pub extern fn pam_sm_close_session(_pamh: ?*pam_handle_t, _flags: c_int, _args: c_int, _argv: [*c][*c]const u8) c_int;
pub extern fn pam_sm_open_session(_pamh: ?*pam_handle_t, _flags: c_int, _argc: c_int, _argv: [*c][*c]const u8) c_int;
pub extern fn pam_sm_setcred(_pamh: ?*pam_handle_t, _flags: c_int, _argc: c_int, _argv: [*c][*c]const u8) c_int;
pub const struct_timeval64 = extern struct {
    tv_sec: __int64_t = @import("std").mem.zeroes(__int64_t),
    tv_usec: __int64_t = @import("std").mem.zeroes(__int64_t),
};
pub const struct_itimerval = extern struct {
    it_interval: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    it_value: struct_timeval = @import("std").mem.zeroes(struct_timeval),
};
pub const struct_timezone = extern struct {
    tz_minuteswest: c_int = @import("std").mem.zeroes(c_int),
    tz_dsttime: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_clockinfo = extern struct {
    hz: c_int = @import("std").mem.zeroes(c_int),
    tick: c_int = @import("std").mem.zeroes(c_int),
    tickadj: c_int = @import("std").mem.zeroes(c_int),
    stathz: c_int = @import("std").mem.zeroes(c_int),
    profhz: c_int = @import("std").mem.zeroes(c_int),
};
pub const clock_t = __darwin_clock_t;
pub const struct_tm = extern struct {
    tm_sec: c_int = @import("std").mem.zeroes(c_int),
    tm_min: c_int = @import("std").mem.zeroes(c_int),
    tm_hour: c_int = @import("std").mem.zeroes(c_int),
    tm_mday: c_int = @import("std").mem.zeroes(c_int),
    tm_mon: c_int = @import("std").mem.zeroes(c_int),
    tm_year: c_int = @import("std").mem.zeroes(c_int),
    tm_wday: c_int = @import("std").mem.zeroes(c_int),
    tm_yday: c_int = @import("std").mem.zeroes(c_int),
    tm_isdst: c_int = @import("std").mem.zeroes(c_int),
    tm_gmtoff: c_long = @import("std").mem.zeroes(c_long),
    tm_zone: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const tzname: [*c][*c]u8 = @extern([*c][*c]u8, .{
    .name = "tzname",
});
pub extern var getdate_err: c_int;
pub extern var timezone: c_long;
pub extern var daylight: c_int;
pub extern fn asctime([*c]const struct_tm) [*c]u8;
pub extern fn clock() clock_t;
pub extern fn ctime([*c]const time_t) [*c]u8;
pub extern fn difftime(time_t, time_t) f64;
pub extern fn getdate([*c]const u8) [*c]struct_tm;
pub extern fn gmtime([*c]const time_t) [*c]struct_tm;
pub extern fn localtime([*c]const time_t) [*c]struct_tm;
pub extern fn mktime([*c]struct_tm) time_t;
pub extern fn strftime(noalias [*c]u8, __maxsize: usize, noalias [*c]const u8, noalias [*c]const struct_tm) usize;
pub extern fn strptime(noalias [*c]const u8, noalias [*c]const u8, noalias [*c]struct_tm) [*c]u8;
pub extern fn time([*c]time_t) time_t;
pub extern fn tzset() void;
pub extern fn asctime_r(noalias [*c]const struct_tm, noalias [*c]u8) [*c]u8;
pub extern fn ctime_r([*c]const time_t, [*c]u8) [*c]u8;
pub extern fn gmtime_r(noalias [*c]const time_t, noalias [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias [*c]const time_t, noalias [*c]struct_tm) [*c]struct_tm;
pub extern fn posix2time(time_t) time_t;
pub extern fn tzsetwall() void;
pub extern fn time2posix(time_t) time_t;
pub extern fn timelocal([*c]struct_tm) time_t;
pub extern fn timegm([*c]struct_tm) time_t;
pub extern fn nanosleep(__rqtp: [*c]const struct_timespec, __rmtp: [*c]struct_timespec) c_int;
pub const _CLOCK_REALTIME: c_int = 0;
pub const _CLOCK_MONOTONIC: c_int = 6;
pub const _CLOCK_MONOTONIC_RAW: c_int = 4;
pub const _CLOCK_MONOTONIC_RAW_APPROX: c_int = 5;
pub const _CLOCK_UPTIME_RAW: c_int = 8;
pub const _CLOCK_UPTIME_RAW_APPROX: c_int = 9;
pub const _CLOCK_PROCESS_CPUTIME_ID: c_int = 12;
pub const _CLOCK_THREAD_CPUTIME_ID: c_int = 16;
pub const clockid_t = c_uint;
pub extern fn clock_getres(__clock_id: clockid_t, __res: [*c]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn clock_gettime_nsec_np(__clock_id: clockid_t) __uint64_t;
pub extern fn clock_settime(__clock_id: clockid_t, __tp: [*c]const struct_timespec) c_int;
pub extern fn timespec_get(ts: [*c]struct_timespec, base: c_int) c_int;
pub extern fn adjtime([*c]const struct_timeval, [*c]struct_timeval) c_int;
pub extern fn futimes(c_int, [*c]const struct_timeval) c_int;
pub extern fn lutimes([*c]const u8, [*c]const struct_timeval) c_int;
pub extern fn settimeofday([*c]const struct_timeval, [*c]const struct_timezone) c_int;
pub extern fn getitimer(c_int, [*c]struct_itimerval) c_int;
pub extern fn gettimeofday(noalias [*c]struct_timeval, noalias ?*anyopaque) c_int;
pub extern fn setitimer(c_int, noalias [*c]const struct_itimerval, noalias [*c]struct_itimerval) c_int;
pub extern fn utimes([*c]const u8, [*c]const struct_timeval) c_int;
pub fn _OSSwapInt16(arg__data: __uint16_t) callconv(.c) __uint16_t {
    var _data = arg__data;
    _ = &_data;
    return @as(__uint16_t, @bitCast(@as(c_short, @truncate((@as(c_int, @bitCast(@as(c_uint, _data))) << @intCast(8)) | (@as(c_int, @bitCast(@as(c_uint, _data))) >> @intCast(8))))));
}
pub fn _OSSwapInt32(arg__data: __uint32_t) callconv(.c) __uint32_t {
    var _data = arg__data;
    _ = &_data;
    _data = __builtin_bswap32(_data);
    return _data;
}
pub fn _OSSwapInt64(arg__data: __uint64_t) callconv(.c) __uint64_t {
    var _data = arg__data;
    _ = &_data;
    return __builtin_bswap64(_data);
}
pub const u_int = c_uint;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_quad_t = u_int64_t;
pub const quad_t = i64;
pub const qaddr_t = [*c]quad_t;
pub const caddr_t = [*c]u8;
pub const daddr_t = i32;
pub const fixpt_t = u_int32_t;
pub const blkcnt_t = __darwin_blkcnt_t;
pub const blksize_t = __darwin_blksize_t;
pub const in_addr_t = __uint32_t;
pub const in_port_t = __uint16_t;
pub const ino_t = __darwin_ino_t;
pub const ino64_t = __darwin_ino64_t;
pub const key_t = __int32_t;
pub const nlink_t = __uint16_t;
pub const id_t = __darwin_id_t;
pub const segsz_t = i32;
pub const swblk_t = i32;
pub const errno_t = c_int;
pub const fd_mask = __int32_t;
pub const pthread_attr_t = __darwin_pthread_attr_t;
pub const pthread_cond_t = __darwin_pthread_cond_t;
pub const pthread_condattr_t = __darwin_pthread_condattr_t;
pub const pthread_mutex_t = __darwin_pthread_mutex_t;
pub const pthread_mutexattr_t = __darwin_pthread_mutexattr_t;
pub const pthread_once_t = __darwin_pthread_once_t;
pub const pthread_rwlock_t = __darwin_pthread_rwlock_t;
pub const pthread_rwlockattr_t = __darwin_pthread_rwlockattr_t;
pub const pthread_t = __darwin_pthread_t;
pub const pthread_key_t = __darwin_pthread_key_t;
pub const fsblkcnt_t = __darwin_fsblkcnt_t;
pub const fsfilcnt_t = __darwin_fsfilcnt_t;
pub const sig_atomic_t = c_int;
pub const struct___darwin_arm_exception_state = extern struct {
    __exception: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __fsr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __far: __uint32_t = @import("std").mem.zeroes(__uint32_t),
};
pub const struct___darwin_arm_exception_state64 = extern struct {
    __far: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    __esr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __exception: __uint32_t = @import("std").mem.zeroes(__uint32_t),
};
pub const struct___darwin_arm_exception_state64_v2 = extern struct {
    __far: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    __esr: __uint64_t = @import("std").mem.zeroes(__uint64_t),
};
pub const struct___darwin_arm_thread_state = extern struct {
    __r: [13]__uint32_t = @import("std").mem.zeroes([13]__uint32_t),
    __sp: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __lr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __pc: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __cpsr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
};
pub const struct___darwin_arm_thread_state64 = extern struct {
    __x: [29]__uint64_t = @import("std").mem.zeroes([29]__uint64_t),
    __fp: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    __lr: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    __sp: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    __pc: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    __cpsr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __pad: __uint32_t = @import("std").mem.zeroes(__uint32_t),
};
pub const struct___darwin_arm_vfp_state = extern struct {
    __r: [64]__uint32_t = @import("std").mem.zeroes([64]__uint32_t),
    __fpscr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
};
pub const __uint128_t = u128;
pub const struct___darwin_arm_neon_state64 = extern struct {
    __v: [32]__uint128_t = @import("std").mem.zeroes([32]__uint128_t),
    __fpsr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __fpcr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
};
pub const struct___darwin_arm_neon_state = extern struct {
    __v: [16]__uint128_t = @import("std").mem.zeroes([16]__uint128_t),
    __fpsr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __fpcr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
};
pub const struct___arm_pagein_state = extern struct {
    __pagein_error: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct___darwin_arm_sme_state = extern struct {
    __svcr: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    __tpidr2_el0: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    __svl_b: __uint16_t = @import("std").mem.zeroes(__uint16_t),
};
pub const struct___darwin_arm_sve_z_state = extern struct {
    __z: [16][256]u8 = @import("std").mem.zeroes([16][256]u8),
};
pub const struct___darwin_arm_sve_p_state = extern struct {
    __p: [16][32]u8 = @import("std").mem.zeroes([16][32]u8),
};
pub const struct___darwin_arm_sme_za_state = extern struct {
    __za: [4096]u8 = @import("std").mem.zeroes([4096]u8),
};
pub const struct___darwin_arm_sme2_state = extern struct {
    __zt0: [64]u8 = @import("std").mem.zeroes([64]u8),
};
pub const struct___arm_legacy_debug_state = extern struct {
    __bvr: [16]__uint32_t = @import("std").mem.zeroes([16]__uint32_t),
    __bcr: [16]__uint32_t = @import("std").mem.zeroes([16]__uint32_t),
    __wvr: [16]__uint32_t = @import("std").mem.zeroes([16]__uint32_t),
    __wcr: [16]__uint32_t = @import("std").mem.zeroes([16]__uint32_t),
};
pub const struct___darwin_arm_debug_state32 = extern struct {
    __bvr: [16]__uint32_t = @import("std").mem.zeroes([16]__uint32_t),
    __bcr: [16]__uint32_t = @import("std").mem.zeroes([16]__uint32_t),
    __wvr: [16]__uint32_t = @import("std").mem.zeroes([16]__uint32_t),
    __wcr: [16]__uint32_t = @import("std").mem.zeroes([16]__uint32_t),
    __mdscr_el1: __uint64_t = @import("std").mem.zeroes(__uint64_t),
};
pub const struct___darwin_arm_debug_state64 = extern struct {
    __bvr: [16]__uint64_t = @import("std").mem.zeroes([16]__uint64_t),
    __bcr: [16]__uint64_t = @import("std").mem.zeroes([16]__uint64_t),
    __wvr: [16]__uint64_t = @import("std").mem.zeroes([16]__uint64_t),
    __wcr: [16]__uint64_t = @import("std").mem.zeroes([16]__uint64_t),
    __mdscr_el1: __uint64_t = @import("std").mem.zeroes(__uint64_t),
};
pub const struct___darwin_arm_cpmu_state64 = extern struct {
    __ctrs: [16]__uint64_t = @import("std").mem.zeroes([16]__uint64_t),
};
pub const struct___darwin_mcontext32 = extern struct {
    __es: struct___darwin_arm_exception_state = @import("std").mem.zeroes(struct___darwin_arm_exception_state),
    __ss: struct___darwin_arm_thread_state = @import("std").mem.zeroes(struct___darwin_arm_thread_state),
    __fs: struct___darwin_arm_vfp_state = @import("std").mem.zeroes(struct___darwin_arm_vfp_state),
};
pub const struct___darwin_mcontext64 = extern struct {
    __es: struct___darwin_arm_exception_state64 = @import("std").mem.zeroes(struct___darwin_arm_exception_state64),
    __ss: struct___darwin_arm_thread_state64 = @import("std").mem.zeroes(struct___darwin_arm_thread_state64),
    __ns: struct___darwin_arm_neon_state64 = @import("std").mem.zeroes(struct___darwin_arm_neon_state64),
};
pub const mcontext_t = [*c]struct___darwin_mcontext64;
pub const struct___darwin_sigaltstack = extern struct {
    ss_sp: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ss_size: __darwin_size_t = @import("std").mem.zeroes(__darwin_size_t),
    ss_flags: c_int = @import("std").mem.zeroes(c_int),
};
pub const stack_t = struct___darwin_sigaltstack;
pub const struct___darwin_ucontext = extern struct {
    uc_onstack: c_int = @import("std").mem.zeroes(c_int),
    uc_sigmask: __darwin_sigset_t = @import("std").mem.zeroes(__darwin_sigset_t),
    uc_stack: struct___darwin_sigaltstack = @import("std").mem.zeroes(struct___darwin_sigaltstack),
    uc_link: [*c]struct___darwin_ucontext = @import("std").mem.zeroes([*c]struct___darwin_ucontext),
    uc_mcsize: __darwin_size_t = @import("std").mem.zeroes(__darwin_size_t),
    uc_mcontext: [*c]struct___darwin_mcontext64 = @import("std").mem.zeroes([*c]struct___darwin_mcontext64),
};
pub const ucontext_t = struct___darwin_ucontext;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const struct_sigevent = extern struct {
    sigev_notify: c_int = @import("std").mem.zeroes(c_int),
    sigev_signo: c_int = @import("std").mem.zeroes(c_int),
    sigev_value: union_sigval = @import("std").mem.zeroes(union_sigval),
    sigev_notify_function: ?*const fn (union_sigval) callconv(.c) void = @import("std").mem.zeroes(?*const fn (union_sigval) callconv(.c) void),
    sigev_notify_attributes: [*c]pthread_attr_t = @import("std").mem.zeroes([*c]pthread_attr_t),
};
pub const struct___siginfo = extern struct {
    si_signo: c_int = @import("std").mem.zeroes(c_int),
    si_errno: c_int = @import("std").mem.zeroes(c_int),
    si_code: c_int = @import("std").mem.zeroes(c_int),
    si_pid: pid_t = @import("std").mem.zeroes(pid_t),
    si_uid: uid_t = @import("std").mem.zeroes(uid_t),
    si_status: c_int = @import("std").mem.zeroes(c_int),
    si_addr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    si_value: union_sigval = @import("std").mem.zeroes(union_sigval),
    si_band: c_long = @import("std").mem.zeroes(c_long),
    __pad: [7]c_ulong = @import("std").mem.zeroes([7]c_ulong),
};
pub const siginfo_t = struct___siginfo;
pub const union___sigaction_u = extern union {
    __sa_handler: ?*const fn (c_int) callconv(.c) void,
    __sa_sigaction: ?*const fn (c_int, [*c]struct___siginfo, ?*anyopaque) callconv(.c) void,
};
pub const struct___sigaction = extern struct {
    __sigaction_u: union___sigaction_u = @import("std").mem.zeroes(union___sigaction_u),
    sa_tramp: ?*const fn (?*anyopaque, c_int, c_int, [*c]siginfo_t, ?*anyopaque) callconv(.c) void = @import("std").mem.zeroes(?*const fn (?*anyopaque, c_int, c_int, [*c]siginfo_t, ?*anyopaque) callconv(.c) void),
    sa_mask: sigset_t = @import("std").mem.zeroes(sigset_t),
    sa_flags: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_sigaction = extern struct {
    __sigaction_u: union___sigaction_u = @import("std").mem.zeroes(union___sigaction_u),
    sa_mask: sigset_t = @import("std").mem.zeroes(sigset_t),
    sa_flags: c_int = @import("std").mem.zeroes(c_int),
};
pub const sig_t = ?*const fn (c_int) callconv(.c) void;
pub const struct_sigvec = extern struct {
    sv_handler: ?*const fn (c_int) callconv(.c) void = @import("std").mem.zeroes(?*const fn (c_int) callconv(.c) void),
    sv_mask: c_int = @import("std").mem.zeroes(c_int),
    sv_flags: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_sigstack = extern struct {
    ss_sp: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    ss_onstack: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn signal(c_int, ?*const fn (c_int) callconv(.c) void) ?*const fn (c_int) callconv(.c) void;
pub const au_id_t = uid_t;
pub const au_asid_t = pid_t;
pub const au_event_t = u_int16_t;
pub const au_emod_t = u_int16_t;
pub const au_class_t = u_int32_t;
pub const au_asflgs_t = u_int64_t;
pub const au_ctlmode_t = u8;
pub const struct_au_tid = extern struct {
    port: dev_t = @import("std").mem.zeroes(dev_t),
    machine: u_int32_t = @import("std").mem.zeroes(u_int32_t),
};
pub const au_tid_t = struct_au_tid;
pub const struct_au_tid_addr = extern struct {
    at_port: dev_t = @import("std").mem.zeroes(dev_t),
    at_type: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    at_addr: [4]u_int32_t = @import("std").mem.zeroes([4]u_int32_t),
};
pub const au_tid_addr_t = struct_au_tid_addr;
pub const struct_au_mask = extern struct {
    am_success: c_uint = @import("std").mem.zeroes(c_uint),
    am_failure: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const au_mask_t = struct_au_mask;
pub const struct_auditinfo = extern struct {
    ai_auid: au_id_t = @import("std").mem.zeroes(au_id_t),
    ai_mask: au_mask_t = @import("std").mem.zeroes(au_mask_t),
    ai_termid: au_tid_t = @import("std").mem.zeroes(au_tid_t),
    ai_asid: au_asid_t = @import("std").mem.zeroes(au_asid_t),
};
pub const auditinfo_t = struct_auditinfo;
pub const struct_auditinfo_addr = extern struct {
    ai_auid: au_id_t = @import("std").mem.zeroes(au_id_t),
    ai_mask: au_mask_t = @import("std").mem.zeroes(au_mask_t),
    ai_termid: au_tid_addr_t = @import("std").mem.zeroes(au_tid_addr_t),
    ai_asid: au_asid_t = @import("std").mem.zeroes(au_asid_t),
    ai_flags: au_asflgs_t = @import("std").mem.zeroes(au_asflgs_t),
};
pub const auditinfo_addr_t = struct_auditinfo_addr;
pub const struct_auditpinfo = extern struct {
    ap_pid: pid_t = @import("std").mem.zeroes(pid_t),
    ap_auid: au_id_t = @import("std").mem.zeroes(au_id_t),
    ap_mask: au_mask_t = @import("std").mem.zeroes(au_mask_t),
    ap_termid: au_tid_t = @import("std").mem.zeroes(au_tid_t),
    ap_asid: au_asid_t = @import("std").mem.zeroes(au_asid_t),
};
pub const auditpinfo_t = struct_auditpinfo;
pub const struct_auditpinfo_addr = extern struct {
    ap_pid: pid_t = @import("std").mem.zeroes(pid_t),
    ap_auid: au_id_t = @import("std").mem.zeroes(au_id_t),
    ap_mask: au_mask_t = @import("std").mem.zeroes(au_mask_t),
    ap_termid: au_tid_addr_t = @import("std").mem.zeroes(au_tid_addr_t),
    ap_asid: au_asid_t = @import("std").mem.zeroes(au_asid_t),
    ap_flags: au_asflgs_t = @import("std").mem.zeroes(au_asflgs_t),
};
pub const auditpinfo_addr_t = struct_auditpinfo_addr;
pub const struct_au_session = extern struct {
    as_aia_p: [*c]auditinfo_addr_t = @import("std").mem.zeroes([*c]auditinfo_addr_t),
    as_mask: au_mask_t = @import("std").mem.zeroes(au_mask_t),
};
pub const au_session_t = struct_au_session;
pub const struct_au_expire_after = extern struct {
    age: time_t = @import("std").mem.zeroes(time_t),
    size: usize = @import("std").mem.zeroes(usize),
    op_type: u8 = @import("std").mem.zeroes(u8),
};
pub const au_expire_after_t = struct_au_expire_after;
pub const struct_au_token = opaque {};
pub const token_t = struct_au_token;
pub const struct_au_qctrl = extern struct {
    aq_hiwater: c_int = @import("std").mem.zeroes(c_int),
    aq_lowater: c_int = @import("std").mem.zeroes(c_int),
    aq_bufsz: c_int = @import("std").mem.zeroes(c_int),
    aq_delay: c_int = @import("std").mem.zeroes(c_int),
    aq_minfree: c_int = @import("std").mem.zeroes(c_int),
};
pub const au_qctrl_t = struct_au_qctrl;
pub const struct_audit_stat = extern struct {
    as_version: c_uint = @import("std").mem.zeroes(c_uint),
    as_numevent: c_uint = @import("std").mem.zeroes(c_uint),
    as_generated: c_int = @import("std").mem.zeroes(c_int),
    as_nonattrib: c_int = @import("std").mem.zeroes(c_int),
    as_kernel: c_int = @import("std").mem.zeroes(c_int),
    as_audit: c_int = @import("std").mem.zeroes(c_int),
    as_auditctl: c_int = @import("std").mem.zeroes(c_int),
    as_enqueue: c_int = @import("std").mem.zeroes(c_int),
    as_written: c_int = @import("std").mem.zeroes(c_int),
    as_wblocked: c_int = @import("std").mem.zeroes(c_int),
    as_rblocked: c_int = @import("std").mem.zeroes(c_int),
    as_dropped: c_int = @import("std").mem.zeroes(c_int),
    as_totalsize: c_int = @import("std").mem.zeroes(c_int),
    as_memused: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const au_stat_t = struct_audit_stat;
pub const struct_audit_fstat = extern struct {
    af_filesz: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    af_currsz: u_int64_t = @import("std").mem.zeroes(u_int64_t),
};
pub const au_fstat_t = struct_audit_fstat;
pub const struct_au_evclass_map = extern struct {
    ec_number: au_event_t = @import("std").mem.zeroes(au_event_t),
    ec_class: au_class_t = @import("std").mem.zeroes(au_class_t),
};
pub const au_evclass_map_t = struct_au_evclass_map;
pub const AU_SESSION_FLAG_IS_INITIAL: c_int = 1;
pub const AU_SESSION_FLAG_HAS_GRAPHIC_ACCESS: c_int = 16;
pub const AU_SESSION_FLAG_HAS_TTY: c_int = 32;
pub const AU_SESSION_FLAG_IS_REMOTE: c_int = 4096;
pub const AU_SESSION_FLAG_HAS_CONSOLE_ACCESS: c_int = 8192;
pub const AU_SESSION_FLAG_HAS_AUTHENTICATED: c_int = 16384;
pub const enum_audit_session_flags = c_uint;
pub extern fn audit(?*const anyopaque, c_int) c_int;
pub extern fn auditon(c_int, ?*anyopaque, c_int) c_int;
pub extern fn auditctl([*c]const u8) c_int;
pub extern fn getauid([*c]au_id_t) c_int;
pub extern fn setauid([*c]const au_id_t) c_int;
pub extern fn getaudit_addr([*c]struct_auditinfo_addr, c_int) c_int;
pub extern fn setaudit_addr([*c]const struct_auditinfo_addr, c_int) c_int;
pub extern fn getaudit([*c]struct_auditinfo) c_int;
pub extern fn setaudit([*c]const struct_auditinfo) c_int;
pub const int_least8_t = i8;
pub const int_least16_t = i16;
pub const int_least32_t = i32;
pub const int_least64_t = i64;
pub const uint_least8_t = u8;
pub const uint_least16_t = u16;
pub const uint_least32_t = u32;
pub const uint_least64_t = u64;
pub const int_fast8_t = i8;
pub const int_fast16_t = i16;
pub const int_fast32_t = i32;
pub const int_fast64_t = i64;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = u16;
pub const uint_fast32_t = u32;
pub const uint_fast64_t = u64;
pub const intmax_t = c_long;
pub const uintmax_t = c_ulong;
pub const boolean_t = c_int;
pub const natural_t = __darwin_natural_t;
pub const integer_t = c_int;
pub const vm_offset_t = usize;
pub const vm_size_t = usize;
pub const mach_vm_address_t = u64;
pub const mach_vm_offset_t = u64;
pub const mach_vm_size_t = u64;
pub const vm_map_offset_t = u64;
pub const vm_map_address_t = u64;
pub const vm_map_size_t = u64;
pub const vm32_offset_t = u32;
pub const vm32_address_t = u32;
pub const vm32_size_t = u32;
pub const mach_port_context_t = vm_offset_t;
pub const mach_port_name_t = natural_t;
pub const mach_port_name_array_t = [*c]mach_port_name_t;
pub const mach_port_t = __darwin_mach_port_t;
pub const mach_port_array_t = [*c]mach_port_t;
pub const mach_port_right_t = natural_t;
pub const mach_port_type_t = natural_t;
pub const mach_port_type_array_t = [*c]mach_port_type_t;
pub const mach_port_urefs_t = natural_t;
pub const mach_port_delta_t = integer_t;
pub const mach_port_seqno_t = natural_t;
pub const mach_port_mscount_t = natural_t;
pub const mach_port_msgcount_t = natural_t;
pub const mach_port_rights_t = natural_t;
pub const mach_port_srights_t = c_uint;
pub const struct_mach_port_status = extern struct {
    mps_pset: mach_port_rights_t = @import("std").mem.zeroes(mach_port_rights_t),
    mps_seqno: mach_port_seqno_t = @import("std").mem.zeroes(mach_port_seqno_t),
    mps_mscount: mach_port_mscount_t = @import("std").mem.zeroes(mach_port_mscount_t),
    mps_qlimit: mach_port_msgcount_t = @import("std").mem.zeroes(mach_port_msgcount_t),
    mps_msgcount: mach_port_msgcount_t = @import("std").mem.zeroes(mach_port_msgcount_t),
    mps_sorights: mach_port_rights_t = @import("std").mem.zeroes(mach_port_rights_t),
    mps_srights: boolean_t = @import("std").mem.zeroes(boolean_t),
    mps_pdrequest: boolean_t = @import("std").mem.zeroes(boolean_t),
    mps_nsrequest: boolean_t = @import("std").mem.zeroes(boolean_t),
    mps_flags: natural_t = @import("std").mem.zeroes(natural_t),
};
pub const mach_port_status_t = struct_mach_port_status;
pub const struct_mach_port_limits = extern struct {
    mpl_qlimit: mach_port_msgcount_t = @import("std").mem.zeroes(mach_port_msgcount_t),
};
pub const mach_port_limits_t = struct_mach_port_limits;
pub const struct_mach_port_info_ext = extern struct {
    mpie_status: mach_port_status_t = @import("std").mem.zeroes(mach_port_status_t),
    mpie_boost_cnt: mach_port_msgcount_t = @import("std").mem.zeroes(mach_port_msgcount_t),
    reserved: [6]u32 = @import("std").mem.zeroes([6]u32),
};
pub const mach_port_info_ext_t = struct_mach_port_info_ext;
pub const struct_mach_port_guard_info = extern struct {
    mpgi_guard: u64 = @import("std").mem.zeroes(u64),
};
pub const mach_port_guard_info_t = struct_mach_port_guard_info;
pub const mach_port_info_t = [*c]integer_t;
pub const mach_port_flavor_t = c_int;
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/port.h:326:26: warning: struct demoted to opaque type - has bitfield
pub const struct_mach_port_qos = opaque {};
pub const mach_port_qos_t = struct_mach_port_qos;
pub const struct_mach_service_port_info = extern struct {
    mspi_string_name: [255]u8 = @import("std").mem.zeroes([255]u8),
    mspi_domain_type: u8 = @import("std").mem.zeroes(u8),
};
pub const mach_service_port_info_data_t = struct_mach_service_port_info;
pub const mach_service_port_info_t = [*c]struct_mach_service_port_info;
const union_unnamed_8 = extern union {
    reserved: [2]u64,
    work_interval_port: mach_port_name_t,
    service_port_info: mach_service_port_info_t,
    service_port_name: mach_port_name_t,
};
pub const struct_mach_port_options = extern struct {
    flags: u32 = @import("std").mem.zeroes(u32),
    mpl: mach_port_limits_t = @import("std").mem.zeroes(mach_port_limits_t),
    unnamed_0: union_unnamed_8 = @import("std").mem.zeroes(union_unnamed_8),
};
pub const mach_port_options_t = struct_mach_port_options;
pub const mach_port_options_ptr_t = [*c]mach_port_options_t;
pub const kGUARD_EXC_DESTROY: c_int = 1;
pub const kGUARD_EXC_MOD_REFS: c_int = 2;
pub const kGUARD_EXC_INVALID_OPTIONS: c_int = 3;
pub const kGUARD_EXC_SET_CONTEXT: c_int = 4;
pub const kGUARD_EXC_THREAD_SET_STATE: c_int = 5;
pub const kGUARD_EXC_EXCEPTION_BEHAVIOR_ENFORCE: c_int = 6;
pub const kGUARD_EXC_SERVICE_PORT_VIOLATION_FATAL: c_int = 7;
pub const kGUARD_EXC_UNGUARDED: c_int = 8;
pub const kGUARD_EXC_INCORRECT_GUARD: c_int = 16;
pub const kGUARD_EXC_IMMOVABLE: c_int = 32;
pub const kGUARD_EXC_STRICT_REPLY: c_int = 64;
pub const kGUARD_EXC_MSG_FILTERED: c_int = 128;
pub const kGUARD_EXC_INVALID_RIGHT: c_int = 256;
pub const kGUARD_EXC_INVALID_NAME: c_int = 512;
pub const kGUARD_EXC_INVALID_VALUE: c_int = 1024;
pub const kGUARD_EXC_INVALID_ARGUMENT: c_int = 2048;
pub const kGUARD_EXC_RIGHT_EXISTS: c_int = 4096;
pub const kGUARD_EXC_KERN_NO_SPACE: c_int = 8192;
pub const kGUARD_EXC_KERN_FAILURE: c_int = 16384;
pub const kGUARD_EXC_KERN_RESOURCE: c_int = 32768;
pub const kGUARD_EXC_SEND_INVALID_REPLY: c_int = 65536;
pub const kGUARD_EXC_SEND_INVALID_VOUCHER: c_int = 131072;
pub const kGUARD_EXC_SEND_INVALID_RIGHT: c_int = 262144;
pub const kGUARD_EXC_RCV_INVALID_NAME: c_int = 524288;
pub const kGUARD_EXC_RCV_GUARDED_DESC: c_int = 1048576;
pub const kGUARD_EXC_SERVICE_PORT_VIOLATION_NON_FATAL: c_int = 1048577;
pub const kGUARD_EXC_PROVISIONAL_REPLY_PORT: c_int = 1048578;
pub const kGUARD_EXC_MOD_REFS_NON_FATAL: c_int = 2097152;
pub const kGUARD_EXC_IMMOVABLE_NON_FATAL: c_int = 4194304;
pub const kGUARD_EXC_REQUIRE_REPLY_PORT_SEMANTICS: c_int = 8388608;
pub const enum_mach_port_guard_exception_codes = c_uint;
pub extern fn audit_session_self() mach_port_name_t;
pub extern fn audit_session_join(port: mach_port_name_t) au_asid_t;
pub extern fn audit_session_port(asid: au_asid_t, portname: [*c]mach_port_name_t) c_int;
pub const struct_label = opaque {};
pub const struct_ucred = opaque {};
pub const struct_posix_cred = opaque {};
pub const kauth_cred_t = ?*struct_ucred;
pub const posix_cred_t = ?*struct_posix_cred;
pub const struct_xucred = extern struct {
    cr_version: u_int = @import("std").mem.zeroes(u_int),
    cr_uid: uid_t = @import("std").mem.zeroes(uid_t),
    cr_ngroups: c_short = @import("std").mem.zeroes(c_short),
    cr_groups: [16]gid_t = @import("std").mem.zeroes([16]gid_t),
};
pub const struct_kevent = extern struct {
    ident: usize = @import("std").mem.zeroes(usize),
    filter: i16 = @import("std").mem.zeroes(i16),
    flags: u16 = @import("std").mem.zeroes(u16),
    fflags: u32 = @import("std").mem.zeroes(u32),
    data: isize = @import("std").mem.zeroes(isize),
    udata: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const struct_kevent64_s = extern struct {
    ident: u64 = @import("std").mem.zeroes(u64),
    filter: i16 = @import("std").mem.zeroes(i16),
    flags: u16 = @import("std").mem.zeroes(u16),
    fflags: u32 = @import("std").mem.zeroes(u32),
    data: i64 = @import("std").mem.zeroes(i64),
    udata: u64 = @import("std").mem.zeroes(u64),
    ext: [2]u64 = @import("std").mem.zeroes([2]u64),
};
pub const eNoteReapDeprecated: c_int = 268435456;
const enum_unnamed_9 = c_uint;
pub const eNoteExitReparentedDeprecated: c_int = 524288;
const enum_unnamed_10 = c_uint;
pub const struct_knote = opaque {};
pub const struct_klist = extern struct {
    slh_first: ?*struct_knote = @import("std").mem.zeroes(?*struct_knote),
};
pub extern fn kqueue() c_int;
pub extern fn kevent(kq: c_int, changelist: [*c]const struct_kevent, nchanges: c_int, eventlist: [*c]struct_kevent, nevents: c_int, timeout: [*c]const struct_timespec) c_int;
pub extern fn kevent64(kq: c_int, changelist: [*c]const struct_kevent64_s, nchanges: c_int, eventlist: [*c]struct_kevent64_s, nevents: c_int, flags: c_uint, timeout: [*c]const struct_timespec) c_int;
pub const struct_session = opaque {};
pub const struct_pgrp = opaque {};
pub const struct_proc = opaque {};
const struct_unnamed_12 = extern struct {
    __p_forw: ?*struct_proc = @import("std").mem.zeroes(?*struct_proc),
    __p_back: ?*struct_proc = @import("std").mem.zeroes(?*struct_proc),
};
const union_unnamed_11 = extern union {
    p_st1: struct_unnamed_12,
    __p_starttime: struct_timeval,
};
pub const struct_vmspace = extern struct {
    dummy: i32 = @import("std").mem.zeroes(i32),
    dummy2: caddr_t = @import("std").mem.zeroes(caddr_t),
    dummy3: [5]i32 = @import("std").mem.zeroes([5]i32),
    dummy4: [3]caddr_t = @import("std").mem.zeroes([3]caddr_t),
};
pub const struct_sigacts_13 = opaque {};
pub const struct_vnode = opaque {};
pub const struct_user_14 = opaque {};
pub const struct_rusage = extern struct {
    ru_utime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    ru_stime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    ru_maxrss: c_long = @import("std").mem.zeroes(c_long),
    ru_ixrss: c_long = @import("std").mem.zeroes(c_long),
    ru_idrss: c_long = @import("std").mem.zeroes(c_long),
    ru_isrss: c_long = @import("std").mem.zeroes(c_long),
    ru_minflt: c_long = @import("std").mem.zeroes(c_long),
    ru_majflt: c_long = @import("std").mem.zeroes(c_long),
    ru_nswap: c_long = @import("std").mem.zeroes(c_long),
    ru_inblock: c_long = @import("std").mem.zeroes(c_long),
    ru_oublock: c_long = @import("std").mem.zeroes(c_long),
    ru_msgsnd: c_long = @import("std").mem.zeroes(c_long),
    ru_msgrcv: c_long = @import("std").mem.zeroes(c_long),
    ru_nsignals: c_long = @import("std").mem.zeroes(c_long),
    ru_nvcsw: c_long = @import("std").mem.zeroes(c_long),
    ru_nivcsw: c_long = @import("std").mem.zeroes(c_long),
};
pub const struct_extern_proc = extern struct {
    p_un: union_unnamed_11 = @import("std").mem.zeroes(union_unnamed_11),
    p_vmspace: [*c]struct_vmspace = @import("std").mem.zeroes([*c]struct_vmspace),
    p_sigacts: ?*struct_sigacts_13 = @import("std").mem.zeroes(?*struct_sigacts_13),
    p_flag: c_int = @import("std").mem.zeroes(c_int),
    p_stat: u8 = @import("std").mem.zeroes(u8),
    p_pid: pid_t = @import("std").mem.zeroes(pid_t),
    p_oppid: pid_t = @import("std").mem.zeroes(pid_t),
    p_dupfd: c_int = @import("std").mem.zeroes(c_int),
    user_stack: caddr_t = @import("std").mem.zeroes(caddr_t),
    exit_thread: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    p_debugger: c_int = @import("std").mem.zeroes(c_int),
    sigwait: boolean_t = @import("std").mem.zeroes(boolean_t),
    p_estcpu: u_int = @import("std").mem.zeroes(u_int),
    p_cpticks: c_int = @import("std").mem.zeroes(c_int),
    p_pctcpu: fixpt_t = @import("std").mem.zeroes(fixpt_t),
    p_wchan: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    p_wmesg: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    p_swtime: u_int = @import("std").mem.zeroes(u_int),
    p_slptime: u_int = @import("std").mem.zeroes(u_int),
    p_realtimer: struct_itimerval = @import("std").mem.zeroes(struct_itimerval),
    p_rtime: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    p_uticks: u_quad_t = @import("std").mem.zeroes(u_quad_t),
    p_sticks: u_quad_t = @import("std").mem.zeroes(u_quad_t),
    p_iticks: u_quad_t = @import("std").mem.zeroes(u_quad_t),
    p_traceflag: c_int = @import("std").mem.zeroes(c_int),
    p_tracep: ?*struct_vnode = @import("std").mem.zeroes(?*struct_vnode),
    p_siglist: c_int = @import("std").mem.zeroes(c_int),
    p_textvp: ?*struct_vnode = @import("std").mem.zeroes(?*struct_vnode),
    p_holdcnt: c_int = @import("std").mem.zeroes(c_int),
    p_sigmask: sigset_t = @import("std").mem.zeroes(sigset_t),
    p_sigignore: sigset_t = @import("std").mem.zeroes(sigset_t),
    p_sigcatch: sigset_t = @import("std").mem.zeroes(sigset_t),
    p_priority: u_char = @import("std").mem.zeroes(u_char),
    p_usrpri: u_char = @import("std").mem.zeroes(u_char),
    p_nice: u8 = @import("std").mem.zeroes(u8),
    p_comm: [17]u8 = @import("std").mem.zeroes([17]u8),
    p_pgrp: ?*struct_pgrp = @import("std").mem.zeroes(?*struct_pgrp),
    p_addr: ?*struct_user_14 = @import("std").mem.zeroes(?*struct_user_14),
    p_xstat: u_short = @import("std").mem.zeroes(u_short),
    p_acflag: u_short = @import("std").mem.zeroes(u_short),
    p_ru: [*c]struct_rusage = @import("std").mem.zeroes([*c]struct_rusage),
};
pub const struct_ctlname = extern struct {
    ctl_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    ctl_type: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct__pcred = extern struct {
    pc_lock: [72]u8 = @import("std").mem.zeroes([72]u8),
    pc_ucred: ?*struct_ucred = @import("std").mem.zeroes(?*struct_ucred),
    p_ruid: uid_t = @import("std").mem.zeroes(uid_t),
    p_svuid: uid_t = @import("std").mem.zeroes(uid_t),
    p_rgid: gid_t = @import("std").mem.zeroes(gid_t),
    p_svgid: gid_t = @import("std").mem.zeroes(gid_t),
    p_refcnt: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct__ucred = extern struct {
    cr_ref: i32 = @import("std").mem.zeroes(i32),
    cr_uid: uid_t = @import("std").mem.zeroes(uid_t),
    cr_ngroups: c_short = @import("std").mem.zeroes(c_short),
    cr_groups: [16]gid_t = @import("std").mem.zeroes([16]gid_t),
};
pub const struct_eproc_15 = extern struct {
    e_paddr: ?*struct_proc = @import("std").mem.zeroes(?*struct_proc),
    e_sess: ?*struct_session = @import("std").mem.zeroes(?*struct_session),
    e_pcred: struct__pcred = @import("std").mem.zeroes(struct__pcred),
    e_ucred: struct__ucred = @import("std").mem.zeroes(struct__ucred),
    e_vm: struct_vmspace = @import("std").mem.zeroes(struct_vmspace),
    e_ppid: pid_t = @import("std").mem.zeroes(pid_t),
    e_pgid: pid_t = @import("std").mem.zeroes(pid_t),
    e_jobc: c_short = @import("std").mem.zeroes(c_short),
    e_tdev: dev_t = @import("std").mem.zeroes(dev_t),
    e_tpgid: pid_t = @import("std").mem.zeroes(pid_t),
    e_tsess: ?*struct_session = @import("std").mem.zeroes(?*struct_session),
    e_wmesg: [8]u8 = @import("std").mem.zeroes([8]u8),
    e_xsize: segsz_t = @import("std").mem.zeroes(segsz_t),
    e_xrssize: c_short = @import("std").mem.zeroes(c_short),
    e_xccount: c_short = @import("std").mem.zeroes(c_short),
    e_xswrss: c_short = @import("std").mem.zeroes(c_short),
    e_flag: i32 = @import("std").mem.zeroes(i32),
    e_login: [12]u8 = @import("std").mem.zeroes([12]u8),
    e_spare: [4]i32 = @import("std").mem.zeroes([4]i32),
};
pub const struct_kinfo_proc = extern struct {
    kp_proc: struct_extern_proc = @import("std").mem.zeroes(struct_extern_proc),
    kp_eproc: struct_eproc_15 = @import("std").mem.zeroes(struct_eproc_15),
};
pub const struct_xsw_usage = extern struct {
    xsu_total: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    xsu_avail: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    xsu_used: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    xsu_pagesize: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    xsu_encrypted: boolean_t = @import("std").mem.zeroes(boolean_t),
};
pub const struct_loadavg = extern struct {
    ldavg: [3]fixpt_t = @import("std").mem.zeroes([3]fixpt_t),
    fscale: c_long = @import("std").mem.zeroes(c_long),
};
pub extern var averunnable: struct_loadavg;
pub extern fn sysctl([*c]c_int, u_int, ?*anyopaque, oldlenp: [*c]usize, ?*anyopaque, newlen: usize) c_int;
pub extern fn sysctlbyname([*c]const u8, ?*anyopaque, oldlenp: [*c]usize, ?*anyopaque, newlen: usize) c_int;
pub extern fn sysctlnametomib([*c]const u8, [*c]c_int, sizep: [*c]usize) c_int;
pub const struct_dl_info = extern struct {
    dli_fname: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    dli_fbase: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dli_sname: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    dli_saddr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const Dl_info = struct_dl_info;
pub extern fn dladdr(?*const anyopaque, [*c]Dl_info) c_int;
pub extern fn dlclose(__handle: ?*anyopaque) c_int;
pub extern fn dlerror() [*c]u8;
pub extern fn dlopen(__path: [*c]const u8, __mode: c_int) ?*anyopaque;
pub extern fn dlsym(__handle: ?*anyopaque, __symbol: [*c]const u8) ?*anyopaque;
pub extern fn dlopen_preflight(__path: [*c]const u8) bool;
pub const struct_ostat = extern struct {
    st_dev: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    st_ino: ino_t = @import("std").mem.zeroes(ino_t),
    st_mode: mode_t = @import("std").mem.zeroes(mode_t),
    st_nlink: nlink_t = @import("std").mem.zeroes(nlink_t),
    st_uid: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    st_gid: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    st_rdev: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    st_size: __int32_t = @import("std").mem.zeroes(__int32_t),
    st_atimespec: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtimespec: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctimespec: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_blksize: __int32_t = @import("std").mem.zeroes(__int32_t),
    st_blocks: __int32_t = @import("std").mem.zeroes(__int32_t),
    st_flags: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    st_gen: __uint32_t = @import("std").mem.zeroes(__uint32_t),
};
pub const struct_stat = extern struct {
    st_dev: dev_t = @import("std").mem.zeroes(dev_t),
    st_mode: mode_t = @import("std").mem.zeroes(mode_t),
    st_nlink: nlink_t = @import("std").mem.zeroes(nlink_t),
    st_ino: __darwin_ino64_t = @import("std").mem.zeroes(__darwin_ino64_t),
    st_uid: uid_t = @import("std").mem.zeroes(uid_t),
    st_gid: gid_t = @import("std").mem.zeroes(gid_t),
    st_rdev: dev_t = @import("std").mem.zeroes(dev_t),
    st_atimespec: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtimespec: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctimespec: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_birthtimespec: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_size: off_t = @import("std").mem.zeroes(off_t),
    st_blocks: blkcnt_t = @import("std").mem.zeroes(blkcnt_t),
    st_blksize: blksize_t = @import("std").mem.zeroes(blksize_t),
    st_flags: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    st_gen: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    st_lspare: __int32_t = @import("std").mem.zeroes(__int32_t),
    st_qspare: [2]__int64_t = @import("std").mem.zeroes([2]__int64_t),
};
pub extern fn chmod([*c]const u8, mode_t) c_int;
pub extern fn fchmod(c_int, mode_t) c_int;
pub extern fn fstat(c_int, [*c]struct_stat) c_int;
pub extern fn lstat([*c]const u8, [*c]struct_stat) c_int;
pub extern fn mkdir([*c]const u8, mode_t) c_int;
pub extern fn mkfifo([*c]const u8, mode_t) c_int;
pub extern fn stat([*c]const u8, [*c]struct_stat) c_int;
pub extern fn umask(mode_t) mode_t;
pub extern fn fchmodat(c_int, [*c]const u8, mode_t, c_int) c_int;
pub extern fn fstatat(c_int, [*c]const u8, [*c]struct_stat, c_int) c_int;
pub extern fn mkdirat(c_int, [*c]const u8, mode_t) c_int;
pub extern fn mkfifoat(c_int, [*c]const u8, mode_t) c_int;
pub extern fn mknodat(c_int, [*c]const u8, mode_t, dev_t) c_int;
pub extern fn futimens(__fd: c_int, __times: [*c]const struct_timespec) c_int;
pub extern fn utimensat(__fd: c_int, __path: [*c]const u8, __times: [*c]const struct_timespec, __flag: c_int) c_int;
pub const struct__filesec = opaque {};
pub const filesec_t = ?*struct__filesec;
pub extern fn chflags([*c]const u8, __uint32_t) c_int;
pub extern fn chmodx_np([*c]const u8, filesec_t) c_int;
pub extern fn fchflags(c_int, __uint32_t) c_int;
pub extern fn fchmodx_np(c_int, filesec_t) c_int;
pub extern fn fstatx_np(c_int, [*c]struct_stat, filesec_t) c_int;
pub extern fn lchflags([*c]const u8, __uint32_t) c_int;
pub extern fn lchmod([*c]const u8, mode_t) c_int;
pub extern fn lstatx_np([*c]const u8, [*c]struct_stat, filesec_t) c_int;
pub extern fn mkdirx_np([*c]const u8, filesec_t) c_int;
pub extern fn mkfifox_np([*c]const u8, filesec_t) c_int;
pub extern fn statx_np([*c]const u8, [*c]struct_stat, filesec_t) c_int;
pub extern fn umaskx_np(filesec_t) c_int;
pub const text_encoding_t = u_int32_t;
pub const fsobj_type_t = u_int32_t;
pub const fsobj_tag_t = u_int32_t;
pub const fsfile_type_t = u_int32_t;
pub const fsvolid_t = u_int32_t;
pub const struct_fsobj_id = extern struct {
    fid_objno: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    fid_generation: u_int32_t = @import("std").mem.zeroes(u_int32_t),
};
pub const fsobj_id_t = struct_fsobj_id;
pub const struct_attribute_set = extern struct {
    commonattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
    volattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
    dirattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
    fileattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
    forkattr: attrgroup_t = @import("std").mem.zeroes(attrgroup_t),
};
pub const attribute_set_t = struct_attribute_set;
pub const struct_attrreference = extern struct {
    attr_dataoffset: i32 = @import("std").mem.zeroes(i32),
    attr_length: u_int32_t = @import("std").mem.zeroes(u_int32_t),
};
pub const attrreference_t = struct_attrreference;
pub const struct_diskextent = extern struct {
    startblock: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    blockcount: u_int32_t = @import("std").mem.zeroes(u_int32_t),
};
pub const extentrecord = [8]struct_diskextent;
pub const vol_capabilities_set_t = [4]u_int32_t;
pub const struct_vol_capabilities_attr = extern struct {
    capabilities: vol_capabilities_set_t = @import("std").mem.zeroes(vol_capabilities_set_t),
    valid: vol_capabilities_set_t = @import("std").mem.zeroes(vol_capabilities_set_t),
};
pub const vol_capabilities_attr_t = struct_vol_capabilities_attr;
pub const struct_vol_attributes_attr = extern struct {
    validattr: attribute_set_t = @import("std").mem.zeroes(attribute_set_t),
    nativeattr: attribute_set_t = @import("std").mem.zeroes(attribute_set_t),
};
pub const vol_attributes_attr_t = struct_vol_attributes_attr;
pub const os_function_t = ?*const fn (?*anyopaque) callconv(.c) void;
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:334:16: warning: unsupported type: 'BlockPointer'
pub const os_block_t = @compileError("unable to resolve typedef child type");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:334:16
pub const struct_fsid = extern struct {
    val: [2]i32 = @import("std").mem.zeroes([2]i32),
};
pub const fsid_t = struct_fsid;
pub const struct_secure_boot_cryptex_args = extern struct {
    sbc_version: u_int32_t align(1) = @import("std").mem.zeroes(u_int32_t),
    sbc_4cc: u_int32_t align(1) = @import("std").mem.zeroes(u_int32_t),
    sbc_authentic_manifest_fd: c_int align(1) = @import("std").mem.zeroes(c_int),
    sbc_user_manifest_fd: c_int align(1) = @import("std").mem.zeroes(c_int),
    sbc_payload_fd: c_int align(1) = @import("std").mem.zeroes(c_int),
    sbc_flags: u_int64_t align(1) = @import("std").mem.zeroes(u_int64_t),
};
pub const secure_boot_cryptex_args_t = struct_secure_boot_cryptex_args;
pub const union_graft_args = extern union {
    max_size: [512]u_int8_t,
    sbc_args: secure_boot_cryptex_args_t,
};
pub const graftdmg_args_un = union_graft_args;
pub const struct_mount = opaque {};
pub const mount_t = ?*struct_mount;
pub const vnode_t = ?*struct_vnode;
pub const struct_statfs = extern struct {
    f_bsize: u32 = @import("std").mem.zeroes(u32),
    f_iosize: i32 = @import("std").mem.zeroes(i32),
    f_blocks: u64 = @import("std").mem.zeroes(u64),
    f_bfree: u64 = @import("std").mem.zeroes(u64),
    f_bavail: u64 = @import("std").mem.zeroes(u64),
    f_files: u64 = @import("std").mem.zeroes(u64),
    f_ffree: u64 = @import("std").mem.zeroes(u64),
    f_fsid: fsid_t = @import("std").mem.zeroes(fsid_t),
    f_owner: uid_t = @import("std").mem.zeroes(uid_t),
    f_type: u32 = @import("std").mem.zeroes(u32),
    f_flags: u32 = @import("std").mem.zeroes(u32),
    f_fssubtype: u32 = @import("std").mem.zeroes(u32),
    f_fstypename: [16]u8 = @import("std").mem.zeroes([16]u8),
    f_mntonname: [1024]u8 = @import("std").mem.zeroes([1024]u8),
    f_mntfromname: [1024]u8 = @import("std").mem.zeroes([1024]u8),
    f_flags_ext: u32 = @import("std").mem.zeroes(u32),
    f_reserved: [7]u32 = @import("std").mem.zeroes([7]u32),
};
pub const struct_vfsstatfs = extern struct {
    f_bsize: u32 = @import("std").mem.zeroes(u32),
    f_iosize: usize = @import("std").mem.zeroes(usize),
    f_blocks: u64 = @import("std").mem.zeroes(u64),
    f_bfree: u64 = @import("std").mem.zeroes(u64),
    f_bavail: u64 = @import("std").mem.zeroes(u64),
    f_bused: u64 = @import("std").mem.zeroes(u64),
    f_files: u64 = @import("std").mem.zeroes(u64),
    f_ffree: u64 = @import("std").mem.zeroes(u64),
    f_fsid: fsid_t = @import("std").mem.zeroes(fsid_t),
    f_owner: uid_t = @import("std").mem.zeroes(uid_t),
    f_flags: u64 = @import("std").mem.zeroes(u64),
    f_fstypename: [16]u8 = @import("std").mem.zeroes([16]u8),
    f_mntonname: [1024]u8 = @import("std").mem.zeroes([1024]u8),
    f_mntfromname: [1024]u8 = @import("std").mem.zeroes([1024]u8),
    f_fssubtype: u32 = @import("std").mem.zeroes(u32),
    f_reserved: [2]?*anyopaque = @import("std").mem.zeroes([2]?*anyopaque),
};
pub const struct_vfsconf = extern struct {
    vfc_reserved1: u32 = @import("std").mem.zeroes(u32),
    vfc_name: [15]u8 = @import("std").mem.zeroes([15]u8),
    vfc_typenum: c_int = @import("std").mem.zeroes(c_int),
    vfc_refcount: c_int = @import("std").mem.zeroes(c_int),
    vfc_flags: c_int = @import("std").mem.zeroes(c_int),
    vfc_reserved2: u32 = @import("std").mem.zeroes(u32),
    vfc_reserved3: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_vfsidctl = extern struct {
    vc_vers: c_int = @import("std").mem.zeroes(c_int),
    vc_fsid: fsid_t = @import("std").mem.zeroes(fsid_t),
    vc_ptr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vc_len: usize = @import("std").mem.zeroes(usize),
    vc_spare: [12]u_int32_t = @import("std").mem.zeroes([12]u_int32_t),
};
pub const struct_vfsquery = extern struct {
    vq_flags: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    vq_spare: [31]u_int32_t = @import("std").mem.zeroes([31]u_int32_t),
};
pub const struct_vfs_server = extern struct {
    vs_minutes: i32 = @import("std").mem.zeroes(i32),
    vs_server_name: [768]u_int8_t = @import("std").mem.zeroes([768]u_int8_t),
};
pub const struct_netfs_status = extern struct {
    ns_status: u_int32_t align(8) = @import("std").mem.zeroes(u_int32_t),
    ns_mountopts: [512]u8 = @import("std").mem.zeroes([512]u8),
    ns_waittime: u32 = @import("std").mem.zeroes(u32),
    ns_threadcount: u32 = @import("std").mem.zeroes(u32),
    pub fn ns_threadids(self: anytype) @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), c_ulonglong) {
        const Intermediate = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        const ReturnType = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), c_ulonglong);
        return @as(ReturnType, @ptrCast(@alignCast(@as(Intermediate, @ptrCast(self)) + 528)));
    }
};
pub const struct_fhandle = extern struct {
    fh_len: c_uint = @import("std").mem.zeroes(c_uint),
    fh_data: [128]u8 = @import("std").mem.zeroes([128]u8),
};
pub const fhandle_t = struct_fhandle;
pub const GRAFTDMG_CRYPTEX_BOOT: u32 = 1;
pub const GRAFTDMG_CRYPTEX_PREBOOT: u32 = 2;
pub const GRAFTDMG_CRYPTEX_DOWNLEVEL: u32 = 3;
pub const GRAFTDMG_CRYPTEX_PDI_NONCE: u32 = 6;
pub const GRAFTDMG_CRYPTEX_EFFECTIVE_AP: u32 = 7;
pub const GRAFTDMG_CRYPTEX_MOBILE_ASSET: u32 = 8;
pub const GRAFTDMG_CRYPTEX_MAX: u32 = 8;
pub const graftdmg_type_t = u32;
pub const CRYPTEX1_AUTH_ENV_GENERIC: u32 = 4;
pub const CRYPTEX1_AUTH_ENV_GENERIC_SUPPLEMENTAL: u32 = 5;
pub const CRYPTEX_AUTH_PDI_NONCE: u32 = 6;
pub const CRYPTEX_AUTH_MOBILE_ASSET: u32 = 8;
pub const CRYPTEX_AUTH_MAX: u32 = 8;
pub const cryptex_auth_type_t = u32;
pub extern fn fhopen([*c]const struct_fhandle, c_int) c_int;
pub extern fn fstatfs(c_int, [*c]struct_statfs) c_int;
pub extern fn getfh([*c]const u8, [*c]fhandle_t) c_int;
pub extern fn getfsstat([*c]struct_statfs, c_int, c_int) c_int;
pub extern fn getmntinfo([*c][*c]struct_statfs, c_int) c_int;
pub extern fn getmntinfo_r_np([*c][*c]struct_statfs, c_int) c_int;
pub extern fn mount([*c]const u8, [*c]const u8, c_int, ?*anyopaque) c_int;
pub extern fn fmount([*c]const u8, c_int, c_int, ?*anyopaque) c_int;
pub extern fn statfs([*c]const u8, [*c]struct_statfs) c_int;
pub extern fn unmount([*c]const u8, c_int) c_int;
pub extern fn getvfsbyname([*c]const u8, [*c]struct_vfsconf) c_int;
pub const rlim_t = __uint64_t;
pub const rusage_info_t = ?*anyopaque;
pub const struct_rusage_info_v0 = extern struct {
    ri_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    ri_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_wired_size: u64 = @import("std").mem.zeroes(u64),
    ri_resident_size: u64 = @import("std").mem.zeroes(u64),
    ri_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_proc_start_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_proc_exit_abstime: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_rusage_info_v1 = extern struct {
    ri_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    ri_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_wired_size: u64 = @import("std").mem.zeroes(u64),
    ri_resident_size: u64 = @import("std").mem.zeroes(u64),
    ri_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_proc_start_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_proc_exit_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_child_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_child_elapsed_abstime: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_rusage_info_v2 = extern struct {
    ri_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    ri_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_wired_size: u64 = @import("std").mem.zeroes(u64),
    ri_resident_size: u64 = @import("std").mem.zeroes(u64),
    ri_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_proc_start_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_proc_exit_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_child_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_child_elapsed_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_bytesread: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_byteswritten: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_rusage_info_v3 = extern struct {
    ri_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    ri_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_wired_size: u64 = @import("std").mem.zeroes(u64),
    ri_resident_size: u64 = @import("std").mem.zeroes(u64),
    ri_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_proc_start_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_proc_exit_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_child_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_child_elapsed_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_bytesread: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_byteswritten: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_default: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_maintenance: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_background: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_utility: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_legacy: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_user_initiated: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_user_interactive: u64 = @import("std").mem.zeroes(u64),
    ri_billed_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_serviced_system_time: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_rusage_info_v4 = extern struct {
    ri_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    ri_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_wired_size: u64 = @import("std").mem.zeroes(u64),
    ri_resident_size: u64 = @import("std").mem.zeroes(u64),
    ri_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_proc_start_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_proc_exit_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_child_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_child_elapsed_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_bytesread: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_byteswritten: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_default: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_maintenance: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_background: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_utility: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_legacy: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_user_initiated: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_user_interactive: u64 = @import("std").mem.zeroes(u64),
    ri_billed_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_serviced_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_logical_writes: u64 = @import("std").mem.zeroes(u64),
    ri_lifetime_max_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_instructions: u64 = @import("std").mem.zeroes(u64),
    ri_cycles: u64 = @import("std").mem.zeroes(u64),
    ri_billed_energy: u64 = @import("std").mem.zeroes(u64),
    ri_serviced_energy: u64 = @import("std").mem.zeroes(u64),
    ri_interval_max_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_runnable_time: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_rusage_info_v5 = extern struct {
    ri_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    ri_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_wired_size: u64 = @import("std").mem.zeroes(u64),
    ri_resident_size: u64 = @import("std").mem.zeroes(u64),
    ri_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_proc_start_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_proc_exit_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_child_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_child_elapsed_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_bytesread: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_byteswritten: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_default: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_maintenance: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_background: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_utility: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_legacy: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_user_initiated: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_user_interactive: u64 = @import("std").mem.zeroes(u64),
    ri_billed_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_serviced_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_logical_writes: u64 = @import("std").mem.zeroes(u64),
    ri_lifetime_max_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_instructions: u64 = @import("std").mem.zeroes(u64),
    ri_cycles: u64 = @import("std").mem.zeroes(u64),
    ri_billed_energy: u64 = @import("std").mem.zeroes(u64),
    ri_serviced_energy: u64 = @import("std").mem.zeroes(u64),
    ri_interval_max_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_runnable_time: u64 = @import("std").mem.zeroes(u64),
    ri_flags: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_rusage_info_v6 = extern struct {
    ri_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    ri_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_wired_size: u64 = @import("std").mem.zeroes(u64),
    ri_resident_size: u64 = @import("std").mem.zeroes(u64),
    ri_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_proc_start_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_proc_exit_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_child_user_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_child_pkg_idle_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_interrupt_wkups: u64 = @import("std").mem.zeroes(u64),
    ri_child_pageins: u64 = @import("std").mem.zeroes(u64),
    ri_child_elapsed_abstime: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_bytesread: u64 = @import("std").mem.zeroes(u64),
    ri_diskio_byteswritten: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_default: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_maintenance: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_background: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_utility: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_legacy: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_user_initiated: u64 = @import("std").mem.zeroes(u64),
    ri_cpu_time_qos_user_interactive: u64 = @import("std").mem.zeroes(u64),
    ri_billed_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_serviced_system_time: u64 = @import("std").mem.zeroes(u64),
    ri_logical_writes: u64 = @import("std").mem.zeroes(u64),
    ri_lifetime_max_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_instructions: u64 = @import("std").mem.zeroes(u64),
    ri_cycles: u64 = @import("std").mem.zeroes(u64),
    ri_billed_energy: u64 = @import("std").mem.zeroes(u64),
    ri_serviced_energy: u64 = @import("std").mem.zeroes(u64),
    ri_interval_max_phys_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_runnable_time: u64 = @import("std").mem.zeroes(u64),
    ri_flags: u64 = @import("std").mem.zeroes(u64),
    ri_user_ptime: u64 = @import("std").mem.zeroes(u64),
    ri_system_ptime: u64 = @import("std").mem.zeroes(u64),
    ri_pinstructions: u64 = @import("std").mem.zeroes(u64),
    ri_pcycles: u64 = @import("std").mem.zeroes(u64),
    ri_energy_nj: u64 = @import("std").mem.zeroes(u64),
    ri_penergy_nj: u64 = @import("std").mem.zeroes(u64),
    ri_secure_time_in_system: u64 = @import("std").mem.zeroes(u64),
    ri_secure_ptime_in_system: u64 = @import("std").mem.zeroes(u64),
    ri_neural_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_lifetime_max_neural_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_interval_max_neural_footprint: u64 = @import("std").mem.zeroes(u64),
    ri_reserved: [9]u64 = @import("std").mem.zeroes([9]u64),
};
pub const rusage_info_current = struct_rusage_info_v6;
pub const struct_rlimit = extern struct {
    rlim_cur: rlim_t = @import("std").mem.zeroes(rlim_t),
    rlim_max: rlim_t = @import("std").mem.zeroes(rlim_t),
};
pub const struct_proc_rlimit_control_wakeupmon = extern struct {
    wm_flags: u32 = @import("std").mem.zeroes(u32),
    wm_rate: i32 = @import("std").mem.zeroes(i32),
};
pub extern fn getpriority(c_int, id_t) c_int;
pub extern fn getiopolicy_np(c_int, c_int) c_int;
pub extern fn getrlimit(c_int, [*c]struct_rlimit) c_int;
pub extern fn getrusage(c_int, [*c]struct_rusage) c_int;
pub extern fn setpriority(c_int, id_t, c_int) c_int;
pub extern fn setiopolicy_np(c_int, c_int, c_int) c_int;
pub extern fn setrlimit(c_int, [*c]const struct_rlimit) c_int;
pub const kern_return_t = c_int;
pub const mach_msg_timeout_t = natural_t;
pub const mach_msg_bits_t = c_uint;
pub const mach_msg_size_t = natural_t;
pub const mach_msg_id_t = integer_t;
pub const mach_msg_priority_t = c_uint;
pub const mach_msg_type_name_t = c_uint;
pub const mach_msg_copy_options_t = c_uint;
pub const mach_msg_guard_flags_t = c_uint;
pub const mach_msg_descriptor_type_t = c_uint;
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:296:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_type_descriptor_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:303:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_port_descriptor_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:312:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_ool_descriptor32_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:320:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_ool_descriptor64_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:332:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_ool_descriptor_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:344:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_ool_ports_descriptor32_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:352:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_ool_ports_descriptor64_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:364:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_ool_ports_descriptor_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:376:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_guarded_port_descriptor32_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:383:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_guarded_port_descriptor64_t = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:394:32: warning: struct demoted to opaque type - has bitfield
pub const mach_msg_guarded_port_descriptor_t = opaque {};
pub const mach_msg_descriptor_t = extern union {
    port: mach_msg_port_descriptor_t,
    out_of_line: mach_msg_ool_descriptor_t,
    ool_ports: mach_msg_ool_ports_descriptor_t,
    type: mach_msg_type_descriptor_t,
    guarded_port: mach_msg_guarded_port_descriptor_t,
};
pub const mach_msg_body_t = extern struct {
    msgh_descriptor_count: mach_msg_size_t = @import("std").mem.zeroes(mach_msg_size_t),
};
pub const mach_msg_header_t = extern struct {
    msgh_bits: mach_msg_bits_t = @import("std").mem.zeroes(mach_msg_bits_t),
    msgh_size: mach_msg_size_t = @import("std").mem.zeroes(mach_msg_size_t),
    msgh_remote_port: mach_port_t = @import("std").mem.zeroes(mach_port_t),
    msgh_local_port: mach_port_t = @import("std").mem.zeroes(mach_port_t),
    msgh_voucher_port: mach_port_name_t = @import("std").mem.zeroes(mach_port_name_t),
    msgh_id: mach_msg_id_t = @import("std").mem.zeroes(mach_msg_id_t),
};
pub const mach_msg_base_t = extern struct {
    header: mach_msg_header_t = @import("std").mem.zeroes(mach_msg_header_t),
    body: mach_msg_body_t = @import("std").mem.zeroes(mach_msg_body_t),
};
pub const mach_msg_trailer_type_t = c_uint;
pub const mach_msg_trailer_size_t = c_uint;
pub const mach_msg_trailer_info_t = [*c]u8;
pub const mach_msg_trailer_t = extern struct {
    msgh_trailer_type: mach_msg_trailer_type_t = @import("std").mem.zeroes(mach_msg_trailer_type_t),
    msgh_trailer_size: mach_msg_trailer_size_t = @import("std").mem.zeroes(mach_msg_trailer_size_t),
};
pub const mach_msg_seqno_trailer_t = extern struct {
    msgh_trailer_type: mach_msg_trailer_type_t = @import("std").mem.zeroes(mach_msg_trailer_type_t),
    msgh_trailer_size: mach_msg_trailer_size_t = @import("std").mem.zeroes(mach_msg_trailer_size_t),
    msgh_seqno: mach_port_seqno_t = @import("std").mem.zeroes(mach_port_seqno_t),
};
pub const security_token_t = extern struct {
    val: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
};
pub const mach_msg_security_trailer_t = extern struct {
    msgh_trailer_type: mach_msg_trailer_type_t = @import("std").mem.zeroes(mach_msg_trailer_type_t),
    msgh_trailer_size: mach_msg_trailer_size_t = @import("std").mem.zeroes(mach_msg_trailer_size_t),
    msgh_seqno: mach_port_seqno_t = @import("std").mem.zeroes(mach_port_seqno_t),
    msgh_sender: security_token_t = @import("std").mem.zeroes(security_token_t),
};
pub const audit_token_t = extern struct {
    val: [8]c_uint = @import("std").mem.zeroes([8]c_uint),
};
pub const mach_msg_audit_trailer_t = extern struct {
    msgh_trailer_type: mach_msg_trailer_type_t = @import("std").mem.zeroes(mach_msg_trailer_type_t),
    msgh_trailer_size: mach_msg_trailer_size_t = @import("std").mem.zeroes(mach_msg_trailer_size_t),
    msgh_seqno: mach_port_seqno_t = @import("std").mem.zeroes(mach_port_seqno_t),
    msgh_sender: security_token_t = @import("std").mem.zeroes(security_token_t),
    msgh_audit: audit_token_t = @import("std").mem.zeroes(audit_token_t),
};
pub const mach_msg_context_trailer_t = extern struct {
    msgh_trailer_type: mach_msg_trailer_type_t = @import("std").mem.zeroes(mach_msg_trailer_type_t),
    msgh_trailer_size: mach_msg_trailer_size_t = @import("std").mem.zeroes(mach_msg_trailer_size_t),
    msgh_seqno: mach_port_seqno_t = @import("std").mem.zeroes(mach_port_seqno_t),
    msgh_sender: security_token_t = @import("std").mem.zeroes(security_token_t),
    msgh_audit: audit_token_t = @import("std").mem.zeroes(audit_token_t),
    msgh_context: mach_port_context_t = @import("std").mem.zeroes(mach_port_context_t),
};
pub const msg_labels_t = extern struct {
    sender: mach_port_name_t = @import("std").mem.zeroes(mach_port_name_t),
};
pub const mach_msg_filter_id = c_int;
pub const mach_msg_mac_trailer_t = extern struct {
    msgh_trailer_type: mach_msg_trailer_type_t = @import("std").mem.zeroes(mach_msg_trailer_type_t),
    msgh_trailer_size: mach_msg_trailer_size_t = @import("std").mem.zeroes(mach_msg_trailer_size_t),
    msgh_seqno: mach_port_seqno_t = @import("std").mem.zeroes(mach_port_seqno_t),
    msgh_sender: security_token_t = @import("std").mem.zeroes(security_token_t),
    msgh_audit: audit_token_t = @import("std").mem.zeroes(audit_token_t),
    msgh_context: mach_port_context_t = @import("std").mem.zeroes(mach_port_context_t),
    msgh_ad: mach_msg_filter_id = @import("std").mem.zeroes(mach_msg_filter_id),
    msgh_labels: msg_labels_t = @import("std").mem.zeroes(msg_labels_t),
};
pub const mach_msg_max_trailer_t = mach_msg_mac_trailer_t;
pub const mach_msg_format_0_trailer_t = mach_msg_security_trailer_t;
pub extern const KERNEL_SECURITY_TOKEN: security_token_t;
pub extern const KERNEL_AUDIT_TOKEN: audit_token_t;
pub const mach_msg_options_t = integer_t;
pub const mach_msg_empty_send_t = extern struct {
    header: mach_msg_header_t = @import("std").mem.zeroes(mach_msg_header_t),
};
pub const mach_msg_empty_rcv_t = extern struct {
    header: mach_msg_header_t = @import("std").mem.zeroes(mach_msg_header_t),
    trailer: mach_msg_trailer_t = @import("std").mem.zeroes(mach_msg_trailer_t),
};
pub const mach_msg_empty_t = extern union {
    send: mach_msg_empty_send_t,
    rcv: mach_msg_empty_rcv_t,
};
pub const mach_msg_type_size_t = natural_t;
pub const mach_msg_type_number_t = natural_t;
pub const mach_msg_option_t = integer_t;
pub const mach_msg_return_t = kern_return_t;
pub extern fn mach_msg_overwrite(msg: [*c]mach_msg_header_t, option: mach_msg_option_t, send_size: mach_msg_size_t, rcv_size: mach_msg_size_t, rcv_name: mach_port_name_t, timeout: mach_msg_timeout_t, notify: mach_port_name_t, rcv_msg: [*c]mach_msg_header_t, rcv_limit: mach_msg_size_t) mach_msg_return_t;
pub extern fn mach_msg(msg: [*c]mach_msg_header_t, option: mach_msg_option_t, send_size: mach_msg_size_t, rcv_size: mach_msg_size_t, rcv_name: mach_port_name_t, timeout: mach_msg_timeout_t, notify: mach_port_name_t) mach_msg_return_t;
pub extern fn mach_voucher_deallocate(voucher: mach_port_name_t) kern_return_t;
pub const sa_family_t = __uint8_t;
pub const socklen_t = __darwin_socklen_t;
pub const struct_iovec = extern struct {
    iov_base: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    iov_len: usize = @import("std").mem.zeroes(usize),
};
pub const sae_associd_t = __uint32_t;
pub const sae_connid_t = __uint32_t;
pub const struct_sockaddr = extern struct {
    sa_len: __uint8_t = @import("std").mem.zeroes(__uint8_t),
    sa_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const struct_sa_endpoints = extern struct {
    sae_srcif: c_uint = @import("std").mem.zeroes(c_uint),
    sae_srcaddr: [*c]const struct_sockaddr = @import("std").mem.zeroes([*c]const struct_sockaddr),
    sae_srcaddrlen: socklen_t = @import("std").mem.zeroes(socklen_t),
    sae_dstaddr: [*c]const struct_sockaddr = @import("std").mem.zeroes([*c]const struct_sockaddr),
    sae_dstaddrlen: socklen_t = @import("std").mem.zeroes(socklen_t),
};
pub const sa_endpoints_t = struct_sa_endpoints;
pub const struct_linger = extern struct {
    l_onoff: c_int = @import("std").mem.zeroes(c_int),
    l_linger: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_so_np_extensions = extern struct {
    npx_flags: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    npx_mask: u_int32_t = @import("std").mem.zeroes(u_int32_t),
};
pub const struct___sockaddr_header = extern struct {
    sa_len: __uint8_t = @import("std").mem.zeroes(__uint8_t),
    sa_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
};
pub const struct_sockproto = extern struct {
    sp_family: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    sp_protocol: __uint16_t = @import("std").mem.zeroes(__uint16_t),
};
pub const struct_sockaddr_storage = extern struct {
    ss_len: __uint8_t = @import("std").mem.zeroes(__uint8_t),
    ss_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    __ss_pad1: [6]u8 = @import("std").mem.zeroes([6]u8),
    __ss_align: __int64_t = @import("std").mem.zeroes(__int64_t),
    __ss_pad2: [112]u8 = @import("std").mem.zeroes([112]u8),
};
pub const struct_msghdr = extern struct {
    msg_name: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msg_namelen: socklen_t = @import("std").mem.zeroes(socklen_t),
    msg_iov: [*c]struct_iovec = @import("std").mem.zeroes([*c]struct_iovec),
    msg_iovlen: c_int = @import("std").mem.zeroes(c_int),
    msg_control: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msg_controllen: socklen_t = @import("std").mem.zeroes(socklen_t),
    msg_flags: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_cmsghdr = extern struct {
    cmsg_len: socklen_t = @import("std").mem.zeroes(socklen_t),
    cmsg_level: c_int = @import("std").mem.zeroes(c_int),
    cmsg_type: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_sf_hdtr = extern struct {
    headers: [*c]struct_iovec = @import("std").mem.zeroes([*c]struct_iovec),
    hdr_cnt: c_int = @import("std").mem.zeroes(c_int),
    trailers: [*c]struct_iovec = @import("std").mem.zeroes([*c]struct_iovec),
    trl_cnt: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn accept(c_int, noalias [*c]struct_sockaddr, noalias [*c]socklen_t) c_int;
pub extern fn bind(c_int, [*c]const struct_sockaddr, socklen_t) c_int;
pub extern fn connect(c_int, [*c]const struct_sockaddr, socklen_t) c_int;
pub extern fn getpeername(c_int, noalias [*c]struct_sockaddr, noalias [*c]socklen_t) c_int;
pub extern fn getsockname(c_int, noalias [*c]struct_sockaddr, noalias [*c]socklen_t) c_int;
pub extern fn getsockopt(c_int, c_int, c_int, noalias ?*anyopaque, noalias [*c]socklen_t) c_int;
pub extern fn listen(c_int, c_int) c_int;
pub extern fn recv(c_int, ?*anyopaque, usize, c_int) isize;
pub extern fn recvfrom(c_int, ?*anyopaque, usize, c_int, noalias [*c]struct_sockaddr, noalias [*c]socklen_t) isize;
pub extern fn recvmsg(c_int, [*c]struct_msghdr, c_int) isize;
pub extern fn send(c_int, ?*const anyopaque, usize, c_int) isize;
pub extern fn sendmsg(c_int, [*c]const struct_msghdr, c_int) isize;
pub extern fn sendto(c_int, ?*const anyopaque, usize, c_int, [*c]const struct_sockaddr, socklen_t) isize;
pub extern fn setsockopt(c_int, c_int, c_int, ?*const anyopaque, socklen_t) c_int;
pub extern fn shutdown(c_int, c_int) c_int;
pub extern fn sockatmark(c_int) c_int;
pub extern fn socket(c_int, c_int, c_int) c_int;
pub extern fn socketpair(c_int, c_int, c_int, [*c]c_int) c_int;
pub extern fn sendfile(c_int, c_int, off_t, [*c]off_t, [*c]struct_sf_hdtr, c_int) c_int;
pub extern fn pfctlinput(c_int, [*c]struct_sockaddr) void;
pub extern fn connectx(c_int, [*c]const sa_endpoints_t, sae_associd_t, c_uint, [*c]const struct_iovec, c_uint, [*c]usize, [*c]sae_connid_t) c_int;
pub extern fn disconnectx(c_int, sae_associd_t, sae_connid_t) c_int;
pub const struct_sockaddr_un = extern struct {
    sun_len: u8 = @import("std").mem.zeroes(u8),
    sun_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sun_path: [104]u8 = @import("std").mem.zeroes([104]u8),
};
pub const struct_ctl_event_data = extern struct {
    ctl_id: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ctl_unit: u_int32_t = @import("std").mem.zeroes(u_int32_t),
};
pub const struct_ctl_info = extern struct {
    ctl_id: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ctl_name: [96]u8 = @import("std").mem.zeroes([96]u8),
};
pub const struct_sockaddr_ctl = extern struct {
    sc_len: u_char = @import("std").mem.zeroes(u_char),
    sc_family: u_char = @import("std").mem.zeroes(u_char),
    ss_sysaddr: u_int16_t = @import("std").mem.zeroes(u_int16_t),
    sc_id: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    sc_unit: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    sc_reserved: [5]u_int32_t = @import("std").mem.zeroes([5]u_int32_t),
};
pub const struct_net_event_data = extern struct {
    if_family: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    if_unit: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    if_name: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const struct_timeval32 = extern struct {
    tv_sec: __int32_t = @import("std").mem.zeroes(__int32_t),
    tv_usec: __int32_t = @import("std").mem.zeroes(__int32_t),
};
pub const struct_if_data = extern struct {
    ifi_type: u_char = @import("std").mem.zeroes(u_char),
    ifi_typelen: u_char = @import("std").mem.zeroes(u_char),
    ifi_physical: u_char = @import("std").mem.zeroes(u_char),
    ifi_addrlen: u_char = @import("std").mem.zeroes(u_char),
    ifi_hdrlen: u_char = @import("std").mem.zeroes(u_char),
    ifi_recvquota: u_char = @import("std").mem.zeroes(u_char),
    ifi_xmitquota: u_char = @import("std").mem.zeroes(u_char),
    ifi_unused1: u_char = @import("std").mem.zeroes(u_char),
    ifi_mtu: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_metric: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_baudrate: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_ipackets: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_ierrors: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_opackets: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_oerrors: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_collisions: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_ibytes: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_obytes: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_imcasts: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_omcasts: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_iqdrops: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_noproto: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_recvtiming: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_xmittiming: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_lastchange: struct_timeval32 = @import("std").mem.zeroes(struct_timeval32),
    ifi_unused2: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_hwassist: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_reserved1: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_reserved2: u_int32_t = @import("std").mem.zeroes(u_int32_t),
};
pub const struct_if_data64 = extern struct {
    ifi_type: u_char = @import("std").mem.zeroes(u_char),
    ifi_typelen: u_char = @import("std").mem.zeroes(u_char),
    ifi_physical: u_char = @import("std").mem.zeroes(u_char),
    ifi_addrlen: u_char = @import("std").mem.zeroes(u_char),
    ifi_hdrlen: u_char = @import("std").mem.zeroes(u_char),
    ifi_recvquota: u_char = @import("std").mem.zeroes(u_char),
    ifi_xmitquota: u_char = @import("std").mem.zeroes(u_char),
    ifi_unused1: u_char = @import("std").mem.zeroes(u_char),
    ifi_mtu: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_metric: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_baudrate: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_ipackets: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_ierrors: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_opackets: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_oerrors: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_collisions: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_ibytes: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_obytes: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_imcasts: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_omcasts: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_iqdrops: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_noproto: u_int64_t = @import("std").mem.zeroes(u_int64_t),
    ifi_recvtiming: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_xmittiming: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    ifi_lastchange: struct_timeval32 = @import("std").mem.zeroes(struct_timeval32),
};
pub const struct_ifnet_interface_advisory = opaque {};
pub const struct_ifqueue = extern struct {
    ifq_head: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ifq_tail: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ifq_len: c_int = @import("std").mem.zeroes(c_int),
    ifq_maxlen: c_int = @import("std").mem.zeroes(c_int),
    ifq_drops: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_if_clonereq = extern struct {
    ifcr_total: c_int = @import("std").mem.zeroes(c_int),
    ifcr_count: c_int = @import("std").mem.zeroes(c_int),
    ifcr_buffer: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const struct_if_msghdr = extern struct {
    ifm_msglen: c_ushort = @import("std").mem.zeroes(c_ushort),
    ifm_version: u8 = @import("std").mem.zeroes(u8),
    ifm_type: u8 = @import("std").mem.zeroes(u8),
    ifm_addrs: c_int = @import("std").mem.zeroes(c_int),
    ifm_flags: c_int = @import("std").mem.zeroes(c_int),
    ifm_index: c_ushort = @import("std").mem.zeroes(c_ushort),
    ifm_data: struct_if_data = @import("std").mem.zeroes(struct_if_data),
};
pub const struct_ifa_msghdr = extern struct {
    ifam_msglen: c_ushort = @import("std").mem.zeroes(c_ushort),
    ifam_version: u8 = @import("std").mem.zeroes(u8),
    ifam_type: u8 = @import("std").mem.zeroes(u8),
    ifam_addrs: c_int = @import("std").mem.zeroes(c_int),
    ifam_flags: c_int = @import("std").mem.zeroes(c_int),
    ifam_index: c_ushort = @import("std").mem.zeroes(c_ushort),
    ifam_metric: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_ifma_msghdr = extern struct {
    ifmam_msglen: c_ushort = @import("std").mem.zeroes(c_ushort),
    ifmam_version: u8 = @import("std").mem.zeroes(u8),
    ifmam_type: u8 = @import("std").mem.zeroes(u8),
    ifmam_addrs: c_int = @import("std").mem.zeroes(c_int),
    ifmam_flags: c_int = @import("std").mem.zeroes(c_int),
    ifmam_index: c_ushort = @import("std").mem.zeroes(c_ushort),
};
pub const struct_if_msghdr2 = extern struct {
    ifm_msglen: u_short = @import("std").mem.zeroes(u_short),
    ifm_version: u_char = @import("std").mem.zeroes(u_char),
    ifm_type: u_char = @import("std").mem.zeroes(u_char),
    ifm_addrs: c_int = @import("std").mem.zeroes(c_int),
    ifm_flags: c_int = @import("std").mem.zeroes(c_int),
    ifm_index: u_short = @import("std").mem.zeroes(u_short),
    ifm_snd_len: c_int = @import("std").mem.zeroes(c_int),
    ifm_snd_maxlen: c_int = @import("std").mem.zeroes(c_int),
    ifm_snd_drops: c_int = @import("std").mem.zeroes(c_int),
    ifm_timer: c_int = @import("std").mem.zeroes(c_int),
    ifm_data: struct_if_data64 = @import("std").mem.zeroes(struct_if_data64),
};
pub const struct_ifma_msghdr2 = extern struct {
    ifmam_msglen: u_short = @import("std").mem.zeroes(u_short),
    ifmam_version: u_char = @import("std").mem.zeroes(u_char),
    ifmam_type: u_char = @import("std").mem.zeroes(u_char),
    ifmam_addrs: c_int = @import("std").mem.zeroes(c_int),
    ifmam_flags: c_int = @import("std").mem.zeroes(c_int),
    ifmam_index: u_short = @import("std").mem.zeroes(u_short),
    ifmam_refcount: i32 = @import("std").mem.zeroes(i32),
};
pub const struct_ifdevmtu = extern struct {
    ifdm_current: c_int = @import("std").mem.zeroes(c_int),
    ifdm_min: c_int = @import("std").mem.zeroes(c_int),
    ifdm_max: c_int = @import("std").mem.zeroes(c_int),
};
const union_unnamed_16 = extern union {
    ifk_ptr: ?*anyopaque,
    ifk_value: c_int,
};
pub const struct_ifkpi = extern struct {
    ifk_module_id: c_uint = @import("std").mem.zeroes(c_uint),
    ifk_type: c_uint = @import("std").mem.zeroes(c_uint),
    ifk_data: union_unnamed_16 = @import("std").mem.zeroes(union_unnamed_16),
};
const union_unnamed_17 = extern union {
    ifru_addr: struct_sockaddr,
    ifru_dstaddr: struct_sockaddr,
    ifru_broadaddr: struct_sockaddr,
    ifru_flags: c_short,
    ifru_metric: c_int,
    ifru_mtu: c_int,
    ifru_phys: c_int,
    ifru_media: c_int,
    ifru_intval: c_int,
    ifru_data: caddr_t,
    ifru_devmtu: struct_ifdevmtu,
    ifru_kpi: struct_ifkpi,
    ifru_wake_flags: u_int32_t,
    ifru_route_refcnt: u_int32_t,
    ifru_cap: [2]c_int,
    ifru_functional_type: u_int32_t,
    ifru_peer_egress_functional_type: u_int32_t,
    ifru_is_directlink: u_int8_t,
    ifru_is_vpn: u_int8_t,
};
pub const struct_ifreq = extern struct {
    ifr_name: [16]u8 = @import("std").mem.zeroes([16]u8),
    ifr_ifru: union_unnamed_17 = @import("std").mem.zeroes(union_unnamed_17),
};
pub const struct_ifaliasreq = extern struct {
    ifra_name: [16]u8 = @import("std").mem.zeroes([16]u8),
    ifra_addr: struct_sockaddr = @import("std").mem.zeroes(struct_sockaddr),
    ifra_broadaddr: struct_sockaddr = @import("std").mem.zeroes(struct_sockaddr),
    ifra_mask: struct_sockaddr = @import("std").mem.zeroes(struct_sockaddr),
};
pub const struct_rslvmulti_req = extern struct {
    sa: [*c]struct_sockaddr = @import("std").mem.zeroes([*c]struct_sockaddr),
    llsa: [*c][*c]struct_sockaddr = @import("std").mem.zeroes([*c][*c]struct_sockaddr),
};
pub const struct_ifmediareq = extern struct {
    ifm_name: [16]u8 = @import("std").mem.zeroes([16]u8),
    ifm_current: c_int = @import("std").mem.zeroes(c_int),
    ifm_mask: c_int = @import("std").mem.zeroes(c_int),
    ifm_status: c_int = @import("std").mem.zeroes(c_int),
    ifm_active: c_int = @import("std").mem.zeroes(c_int),
    ifm_count: c_int = @import("std").mem.zeroes(c_int),
    ifm_ulist: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
};
pub const struct_ifdrv = extern struct {
    ifd_name: [16]u8 = @import("std").mem.zeroes([16]u8),
    ifd_cmd: c_ulong = @import("std").mem.zeroes(c_ulong),
    ifd_len: usize = @import("std").mem.zeroes(usize),
    ifd_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const struct_ifstat = extern struct {
    ifs_name: [16]u8 = @import("std").mem.zeroes([16]u8),
    ascii: [801]u8 = @import("std").mem.zeroes([801]u8),
};
const union_unnamed_18 = extern union {
    ifcu_buf: caddr_t,
    ifcu_req: [*c]struct_ifreq,
};
pub const struct_ifconf = extern struct {
    ifc_len: c_int = @import("std").mem.zeroes(c_int),
    ifc_ifcu: union_unnamed_18 = @import("std").mem.zeroes(union_unnamed_18),
};
pub const struct_kev_dl_proto_data = extern struct {
    link_data: struct_net_event_data = @import("std").mem.zeroes(struct_net_event_data),
    proto_family: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    proto_remaining_count: u_int32_t = @import("std").mem.zeroes(u_int32_t),
};
pub const struct_if_nameindex = extern struct {
    if_index: c_uint = @import("std").mem.zeroes(c_uint),
    if_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub extern fn if_nametoindex([*c]const u8) c_uint;
pub extern fn if_indextoname(c_uint, [*c]u8) [*c]u8;
pub extern fn if_nameindex() [*c]struct_if_nameindex;
pub extern fn if_freenameindex([*c]struct_if_nameindex) void;
pub const struct_rt_metrics = extern struct {
    rmx_locks: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rmx_mtu: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rmx_hopcount: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rmx_expire: i32 = @import("std").mem.zeroes(i32),
    rmx_recvpipe: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rmx_sendpipe: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rmx_ssthresh: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rmx_rtt: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rmx_rttvar: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rmx_pksent: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rmx_filler: [4]u_int32_t = @import("std").mem.zeroes([4]u_int32_t),
};
pub const struct_rtstat = extern struct {
    rts_badredirect: c_short = @import("std").mem.zeroes(c_short),
    rts_dynamic: c_short = @import("std").mem.zeroes(c_short),
    rts_newgateway: c_short = @import("std").mem.zeroes(c_short),
    rts_unreach: c_short = @import("std").mem.zeroes(c_short),
    rts_wildcard: c_short = @import("std").mem.zeroes(c_short),
    rts_badrtgwroute: c_short = @import("std").mem.zeroes(c_short),
};
pub const struct_rt_msghdr = extern struct {
    rtm_msglen: u_short = @import("std").mem.zeroes(u_short),
    rtm_version: u_char = @import("std").mem.zeroes(u_char),
    rtm_type: u_char = @import("std").mem.zeroes(u_char),
    rtm_index: u_short = @import("std").mem.zeroes(u_short),
    rtm_flags: c_int = @import("std").mem.zeroes(c_int),
    rtm_addrs: c_int = @import("std").mem.zeroes(c_int),
    rtm_pid: pid_t = @import("std").mem.zeroes(pid_t),
    rtm_seq: c_int = @import("std").mem.zeroes(c_int),
    rtm_errno: c_int = @import("std").mem.zeroes(c_int),
    rtm_use: c_int = @import("std").mem.zeroes(c_int),
    rtm_inits: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rtm_rmx: struct_rt_metrics = @import("std").mem.zeroes(struct_rt_metrics),
};
pub const struct_rt_msghdr2 = extern struct {
    rtm_msglen: u_short = @import("std").mem.zeroes(u_short),
    rtm_version: u_char = @import("std").mem.zeroes(u_char),
    rtm_type: u_char = @import("std").mem.zeroes(u_char),
    rtm_index: u_short = @import("std").mem.zeroes(u_short),
    rtm_flags: c_int = @import("std").mem.zeroes(c_int),
    rtm_addrs: c_int = @import("std").mem.zeroes(c_int),
    rtm_refcnt: i32 = @import("std").mem.zeroes(i32),
    rtm_parentflags: c_int = @import("std").mem.zeroes(c_int),
    rtm_reserved: c_int = @import("std").mem.zeroes(c_int),
    rtm_use: c_int = @import("std").mem.zeroes(c_int),
    rtm_inits: u_int32_t = @import("std").mem.zeroes(u_int32_t),
    rtm_rmx: struct_rt_metrics = @import("std").mem.zeroes(struct_rt_metrics),
};
pub const struct_rt_msghdr_prelude = extern struct {
    rtm_msglen: u_short = @import("std").mem.zeroes(u_short),
};
pub const struct_rt_addrinfo = extern struct {
    rti_addrs: c_int = @import("std").mem.zeroes(c_int),
    rti_info: [8][*c]struct_sockaddr = @import("std").mem.zeroes([8][*c]struct_sockaddr),
};
pub const struct_in_addr = extern struct {
    s_addr: in_addr_t = @import("std").mem.zeroes(in_addr_t),
};
pub const struct_sockaddr_in = extern struct {
    sin_len: __uint8_t = @import("std").mem.zeroes(__uint8_t),
    sin_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sin_port: in_port_t = @import("std").mem.zeroes(in_port_t),
    sin_addr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    sin_zero: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const struct_ip_opts = extern struct {
    ip_dst: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    ip_opts: [40]u8 = @import("std").mem.zeroes([40]u8),
};
pub const struct_ip_mreq = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_interface: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const struct_ip_mreqn = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_address: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_ifindex: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_ip_mreq_source = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_sourceaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_interface: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const struct_group_req = extern struct {
    gr_interface: u32 = @import("std").mem.zeroes(u32),
    gr_group: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
};
pub const struct_group_source_req = extern struct {
    gsr_interface: u32 = @import("std").mem.zeroes(u32),
    gsr_group: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
    gsr_source: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
};
pub const struct___msfilterreq = extern struct {
    msfr_ifindex: u32 = @import("std").mem.zeroes(u32),
    msfr_fmode: u32 = @import("std").mem.zeroes(u32),
    msfr_nsrcs: u32 = @import("std").mem.zeroes(u32),
    __msfr_align: u32 = @import("std").mem.zeroes(u32),
    msfr_group: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
    msfr_srcs: [*c]struct_sockaddr_storage = @import("std").mem.zeroes([*c]struct_sockaddr_storage),
};
pub extern fn setipv4sourcefilter(c_int, struct_in_addr, struct_in_addr, u32, u32, [*c]struct_in_addr) c_int;
pub extern fn getipv4sourcefilter(c_int, struct_in_addr, struct_in_addr, [*c]u32, [*c]u32, [*c]struct_in_addr) c_int;
pub extern fn setsourcefilter(c_int, u32, [*c]struct_sockaddr, socklen_t, u32, u32, [*c]struct_sockaddr_storage) c_int;
pub extern fn getsourcefilter(c_int, u32, [*c]struct_sockaddr, socklen_t, [*c]u32, [*c]u32, [*c]struct_sockaddr_storage) c_int;
pub const struct_in_pktinfo = extern struct {
    ipi_ifindex: c_uint = @import("std").mem.zeroes(c_uint),
    ipi_spec_dst: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    ipi_addr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
const union_unnamed_19 = extern union {
    __u6_addr8: [16]__uint8_t,
    __u6_addr16: [8]__uint16_t,
    __u6_addr32: [4]__uint32_t,
};
pub const struct_in6_addr = extern struct {
    __u6_addr: union_unnamed_19 = @import("std").mem.zeroes(union_unnamed_19),
};
pub const in6_addr_t = struct_in6_addr;
pub const struct_sockaddr_in6 = extern struct {
    sin6_len: __uint8_t = @import("std").mem.zeroes(__uint8_t),
    sin6_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sin6_port: in_port_t = @import("std").mem.zeroes(in_port_t),
    sin6_flowinfo: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    sin6_addr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    sin6_scope_id: __uint32_t = @import("std").mem.zeroes(__uint32_t),
};
pub extern const in6addr_any: struct_in6_addr;
pub extern const in6addr_loopback: struct_in6_addr;
pub extern const in6addr_nodelocal_allnodes: struct_in6_addr;
pub extern const in6addr_linklocal_allnodes: struct_in6_addr;
pub extern const in6addr_linklocal_allrouters: struct_in6_addr;
pub extern const in6addr_linklocal_allv2routers: struct_in6_addr;
pub const struct_ipv6_mreq = extern struct {
    ipv6mr_multiaddr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    ipv6mr_interface: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct_in6_pktinfo = extern struct {
    ipi6_addr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    ipi6_ifindex: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct_ip6_mtuinfo = extern struct {
    ip6m_addr: struct_sockaddr_in6 = @import("std").mem.zeroes(struct_sockaddr_in6),
    ip6m_mtu: u32 = @import("std").mem.zeroes(u32),
};
pub extern fn inet6_option_space(c_int) c_int;
pub extern fn inet6_option_init(?*anyopaque, [*c][*c]struct_cmsghdr, c_int) c_int;
pub extern fn inet6_option_append([*c]struct_cmsghdr, [*c]const __uint8_t, c_int, c_int) c_int;
pub extern fn inet6_option_alloc([*c]struct_cmsghdr, c_int, c_int, c_int) [*c]__uint8_t;
pub extern fn inet6_option_next([*c]const struct_cmsghdr, [*c][*c]__uint8_t) c_int;
pub extern fn inet6_option_find([*c]const struct_cmsghdr, [*c][*c]__uint8_t, c_int) c_int;
pub extern fn inet6_rthdr_space(c_int, c_int) usize;
pub extern fn inet6_rthdr_init(?*anyopaque, c_int) [*c]struct_cmsghdr;
pub extern fn inet6_rthdr_add([*c]struct_cmsghdr, [*c]const struct_in6_addr, c_uint) c_int;
pub extern fn inet6_rthdr_lasthop([*c]struct_cmsghdr, c_uint) c_int;
pub extern fn inet6_rthdr_segments([*c]const struct_cmsghdr) c_int;
pub extern fn inet6_rthdr_getaddr([*c]struct_cmsghdr, c_int) [*c]struct_in6_addr;
pub extern fn inet6_rthdr_getflags([*c]const struct_cmsghdr, c_int) c_int;
pub extern fn inet6_opt_init(?*anyopaque, socklen_t) c_int;
pub extern fn inet6_opt_append(?*anyopaque, socklen_t, c_int, __uint8_t, socklen_t, __uint8_t, [*c]?*anyopaque) c_int;
pub extern fn inet6_opt_finish(?*anyopaque, socklen_t, c_int) c_int;
pub extern fn inet6_opt_set_val(?*anyopaque, c_int, ?*anyopaque, socklen_t) c_int;
pub extern fn inet6_opt_next(?*anyopaque, socklen_t, c_int, [*c]__uint8_t, [*c]socklen_t, [*c]?*anyopaque) c_int;
pub extern fn inet6_opt_find(?*anyopaque, socklen_t, c_int, __uint8_t, [*c]socklen_t, [*c]?*anyopaque) c_int;
pub extern fn inet6_opt_get_val(?*anyopaque, c_int, ?*anyopaque, socklen_t) c_int;
pub extern fn inet6_rth_space(c_int, c_int) socklen_t;
pub extern fn inet6_rth_init(?*anyopaque, socklen_t, c_int, c_int) ?*anyopaque;
pub extern fn inet6_rth_add(?*anyopaque, [*c]const struct_in6_addr) c_int;
pub extern fn inet6_rth_reverse(?*const anyopaque, ?*anyopaque) c_int;
pub extern fn inet6_rth_segments(?*const anyopaque) c_int;
pub extern fn inet6_rth_getaddr(?*const anyopaque, c_int) [*c]struct_in6_addr;
pub extern fn bindresvport(c_int, [*c]struct_sockaddr_in) c_int;
pub extern fn bindresvport_sa(c_int, [*c]struct_sockaddr) c_int;
pub const tcp_seq = __uint32_t;
pub const tcp_cc = __uint32_t;
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet/tcp.h:93:18: warning: struct demoted to opaque type - has bitfield
pub const struct_tcphdr = opaque {};
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet/tcp.h:269:6: warning: struct demoted to opaque type - has bitfield
pub const struct_tcp_connection_info = opaque {};
pub const cpu_type_t = integer_t;
pub const cpu_subtype_t = integer_t;
pub const cpu_threadtype_t = integer_t;
pub const struct_proc_bsdinfo = extern struct {
    pbi_flags: u32 = @import("std").mem.zeroes(u32),
    pbi_status: u32 = @import("std").mem.zeroes(u32),
    pbi_xstatus: u32 = @import("std").mem.zeroes(u32),
    pbi_pid: u32 = @import("std").mem.zeroes(u32),
    pbi_ppid: u32 = @import("std").mem.zeroes(u32),
    pbi_uid: uid_t = @import("std").mem.zeroes(uid_t),
    pbi_gid: gid_t = @import("std").mem.zeroes(gid_t),
    pbi_ruid: uid_t = @import("std").mem.zeroes(uid_t),
    pbi_rgid: gid_t = @import("std").mem.zeroes(gid_t),
    pbi_svuid: uid_t = @import("std").mem.zeroes(uid_t),
    pbi_svgid: gid_t = @import("std").mem.zeroes(gid_t),
    rfu_1: u32 = @import("std").mem.zeroes(u32),
    pbi_comm: [16]u8 = @import("std").mem.zeroes([16]u8),
    pbi_name: [32]u8 = @import("std").mem.zeroes([32]u8),
    pbi_nfiles: u32 = @import("std").mem.zeroes(u32),
    pbi_pgid: u32 = @import("std").mem.zeroes(u32),
    pbi_pjobc: u32 = @import("std").mem.zeroes(u32),
    e_tdev: u32 = @import("std").mem.zeroes(u32),
    e_tpgid: u32 = @import("std").mem.zeroes(u32),
    pbi_nice: i32 = @import("std").mem.zeroes(i32),
    pbi_start_tvsec: u64 = @import("std").mem.zeroes(u64),
    pbi_start_tvusec: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_proc_bsdshortinfo = extern struct {
    pbsi_pid: u32 = @import("std").mem.zeroes(u32),
    pbsi_ppid: u32 = @import("std").mem.zeroes(u32),
    pbsi_pgid: u32 = @import("std").mem.zeroes(u32),
    pbsi_status: u32 = @import("std").mem.zeroes(u32),
    pbsi_comm: [16]u8 = @import("std").mem.zeroes([16]u8),
    pbsi_flags: u32 = @import("std").mem.zeroes(u32),
    pbsi_uid: uid_t = @import("std").mem.zeroes(uid_t),
    pbsi_gid: gid_t = @import("std").mem.zeroes(gid_t),
    pbsi_ruid: uid_t = @import("std").mem.zeroes(uid_t),
    pbsi_rgid: gid_t = @import("std").mem.zeroes(gid_t),
    pbsi_svuid: uid_t = @import("std").mem.zeroes(uid_t),
    pbsi_svgid: gid_t = @import("std").mem.zeroes(gid_t),
    pbsi_rfu: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_proc_taskinfo = extern struct {
    pti_virtual_size: u64 = @import("std").mem.zeroes(u64),
    pti_resident_size: u64 = @import("std").mem.zeroes(u64),
    pti_total_user: u64 = @import("std").mem.zeroes(u64),
    pti_total_system: u64 = @import("std").mem.zeroes(u64),
    pti_threads_user: u64 = @import("std").mem.zeroes(u64),
    pti_threads_system: u64 = @import("std").mem.zeroes(u64),
    pti_policy: i32 = @import("std").mem.zeroes(i32),
    pti_faults: i32 = @import("std").mem.zeroes(i32),
    pti_pageins: i32 = @import("std").mem.zeroes(i32),
    pti_cow_faults: i32 = @import("std").mem.zeroes(i32),
    pti_messages_sent: i32 = @import("std").mem.zeroes(i32),
    pti_messages_received: i32 = @import("std").mem.zeroes(i32),
    pti_syscalls_mach: i32 = @import("std").mem.zeroes(i32),
    pti_syscalls_unix: i32 = @import("std").mem.zeroes(i32),
    pti_csw: i32 = @import("std").mem.zeroes(i32),
    pti_threadnum: i32 = @import("std").mem.zeroes(i32),
    pti_numrunning: i32 = @import("std").mem.zeroes(i32),
    pti_priority: i32 = @import("std").mem.zeroes(i32),
};
pub const struct_proc_taskallinfo = extern struct {
    pbsd: struct_proc_bsdinfo = @import("std").mem.zeroes(struct_proc_bsdinfo),
    ptinfo: struct_proc_taskinfo = @import("std").mem.zeroes(struct_proc_taskinfo),
};
pub const struct_proc_threadinfo = extern struct {
    pth_user_time: u64 = @import("std").mem.zeroes(u64),
    pth_system_time: u64 = @import("std").mem.zeroes(u64),
    pth_cpu_usage: i32 = @import("std").mem.zeroes(i32),
    pth_policy: i32 = @import("std").mem.zeroes(i32),
    pth_run_state: i32 = @import("std").mem.zeroes(i32),
    pth_flags: i32 = @import("std").mem.zeroes(i32),
    pth_sleep_time: i32 = @import("std").mem.zeroes(i32),
    pth_curpri: i32 = @import("std").mem.zeroes(i32),
    pth_priority: i32 = @import("std").mem.zeroes(i32),
    pth_maxpriority: i32 = @import("std").mem.zeroes(i32),
    pth_name: [64]u8 = @import("std").mem.zeroes([64]u8),
};
pub const struct_proc_regioninfo = extern struct {
    pri_protection: u32 = @import("std").mem.zeroes(u32),
    pri_max_protection: u32 = @import("std").mem.zeroes(u32),
    pri_inheritance: u32 = @import("std").mem.zeroes(u32),
    pri_flags: u32 = @import("std").mem.zeroes(u32),
    pri_offset: u64 = @import("std").mem.zeroes(u64),
    pri_behavior: u32 = @import("std").mem.zeroes(u32),
    pri_user_wired_count: u32 = @import("std").mem.zeroes(u32),
    pri_user_tag: u32 = @import("std").mem.zeroes(u32),
    pri_pages_resident: u32 = @import("std").mem.zeroes(u32),
    pri_pages_shared_now_private: u32 = @import("std").mem.zeroes(u32),
    pri_pages_swapped_out: u32 = @import("std").mem.zeroes(u32),
    pri_pages_dirtied: u32 = @import("std").mem.zeroes(u32),
    pri_ref_count: u32 = @import("std").mem.zeroes(u32),
    pri_shadow_depth: u32 = @import("std").mem.zeroes(u32),
    pri_share_mode: u32 = @import("std").mem.zeroes(u32),
    pri_private_pages_resident: u32 = @import("std").mem.zeroes(u32),
    pri_shared_pages_resident: u32 = @import("std").mem.zeroes(u32),
    pri_obj_id: u32 = @import("std").mem.zeroes(u32),
    pri_depth: u32 = @import("std").mem.zeroes(u32),
    pri_address: u64 = @import("std").mem.zeroes(u64),
    pri_size: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_proc_workqueueinfo = extern struct {
    pwq_nthreads: u32 = @import("std").mem.zeroes(u32),
    pwq_runthreads: u32 = @import("std").mem.zeroes(u32),
    pwq_blockedthreads: u32 = @import("std").mem.zeroes(u32),
    pwq_state: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_proc_fileinfo = extern struct {
    fi_openflags: u32 = @import("std").mem.zeroes(u32),
    fi_status: u32 = @import("std").mem.zeroes(u32),
    fi_offset: off_t = @import("std").mem.zeroes(off_t),
    fi_type: i32 = @import("std").mem.zeroes(i32),
    fi_guardflags: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_proc_exitreasonbasicinfo = extern struct {
    beri_namespace: u32 align(1) = @import("std").mem.zeroes(u32),
    beri_code: u64 align(1) = @import("std").mem.zeroes(u64),
    beri_flags: u64 align(1) = @import("std").mem.zeroes(u64),
    beri_reason_buf_size: u32 align(1) = @import("std").mem.zeroes(u32),
};
pub const struct_proc_exitreasoninfo = extern struct {
    eri_namespace: u32 align(1) = @import("std").mem.zeroes(u32),
    eri_code: u64 align(1) = @import("std").mem.zeroes(u64),
    eri_flags: u64 align(1) = @import("std").mem.zeroes(u64),
    eri_reason_buf_size: u32 align(1) = @import("std").mem.zeroes(u32),
    eri_kcd_buf: u64 align(1) = @import("std").mem.zeroes(u64),
};
pub const struct_vinfo_stat = extern struct {
    vst_dev: u32 = @import("std").mem.zeroes(u32),
    vst_mode: u16 = @import("std").mem.zeroes(u16),
    vst_nlink: u16 = @import("std").mem.zeroes(u16),
    vst_ino: u64 = @import("std").mem.zeroes(u64),
    vst_uid: uid_t = @import("std").mem.zeroes(uid_t),
    vst_gid: gid_t = @import("std").mem.zeroes(gid_t),
    vst_atime: i64 = @import("std").mem.zeroes(i64),
    vst_atimensec: i64 = @import("std").mem.zeroes(i64),
    vst_mtime: i64 = @import("std").mem.zeroes(i64),
    vst_mtimensec: i64 = @import("std").mem.zeroes(i64),
    vst_ctime: i64 = @import("std").mem.zeroes(i64),
    vst_ctimensec: i64 = @import("std").mem.zeroes(i64),
    vst_birthtime: i64 = @import("std").mem.zeroes(i64),
    vst_birthtimensec: i64 = @import("std").mem.zeroes(i64),
    vst_size: off_t = @import("std").mem.zeroes(off_t),
    vst_blocks: i64 = @import("std").mem.zeroes(i64),
    vst_blksize: i32 = @import("std").mem.zeroes(i32),
    vst_flags: u32 = @import("std").mem.zeroes(u32),
    vst_gen: u32 = @import("std").mem.zeroes(u32),
    vst_rdev: u32 = @import("std").mem.zeroes(u32),
    vst_qspare: [2]i64 = @import("std").mem.zeroes([2]i64),
};
pub const struct_vnode_info = extern struct {
    vi_stat: struct_vinfo_stat = @import("std").mem.zeroes(struct_vinfo_stat),
    vi_type: c_int = @import("std").mem.zeroes(c_int),
    vi_pad: c_int = @import("std").mem.zeroes(c_int),
    vi_fsid: fsid_t = @import("std").mem.zeroes(fsid_t),
};
pub const struct_vnode_info_path = extern struct {
    vip_vi: struct_vnode_info = @import("std").mem.zeroes(struct_vnode_info),
    vip_path: [1024]u8 = @import("std").mem.zeroes([1024]u8),
};
pub const struct_vnode_fdinfo = extern struct {
    pfi: struct_proc_fileinfo = @import("std").mem.zeroes(struct_proc_fileinfo),
    pvi: struct_vnode_info = @import("std").mem.zeroes(struct_vnode_info),
};
pub const struct_vnode_fdinfowithpath = extern struct {
    pfi: struct_proc_fileinfo = @import("std").mem.zeroes(struct_proc_fileinfo),
    pvip: struct_vnode_info_path = @import("std").mem.zeroes(struct_vnode_info_path),
};
pub const struct_proc_regionwithpathinfo = extern struct {
    prp_prinfo: struct_proc_regioninfo = @import("std").mem.zeroes(struct_proc_regioninfo),
    prp_vip: struct_vnode_info_path = @import("std").mem.zeroes(struct_vnode_info_path),
};
pub const struct_proc_regionpath = extern struct {
    prpo_addr: u64 = @import("std").mem.zeroes(u64),
    prpo_regionlength: u64 = @import("std").mem.zeroes(u64),
    prpo_path: [1024]u8 = @import("std").mem.zeroes([1024]u8),
};
pub const struct_proc_vnodepathinfo = extern struct {
    pvi_cdir: struct_vnode_info_path = @import("std").mem.zeroes(struct_vnode_info_path),
    pvi_rdir: struct_vnode_info_path = @import("std").mem.zeroes(struct_vnode_info_path),
};
pub const struct_proc_threadwithpathinfo = extern struct {
    pt: struct_proc_threadinfo = @import("std").mem.zeroes(struct_proc_threadinfo),
    pvip: struct_vnode_info_path = @import("std").mem.zeroes(struct_vnode_info_path),
};
pub const struct_in4in6_addr = extern struct {
    i46a_pad32: [3]u_int32_t = @import("std").mem.zeroes([3]u_int32_t),
    i46a_addr4: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
const union_unnamed_20 = extern union {
    ina_46: struct_in4in6_addr,
    ina_6: struct_in6_addr,
};
const union_unnamed_21 = extern union {
    ina_46: struct_in4in6_addr,
    ina_6: struct_in6_addr,
};
const struct_unnamed_22 = extern struct {
    in4_tos: u_char = @import("std").mem.zeroes(u_char),
};
const struct_unnamed_23 = extern struct {
    in6_hlim: u8 = @import("std").mem.zeroes(u8),
    in6_cksum: c_int = @import("std").mem.zeroes(c_int),
    in6_ifindex: u_short = @import("std").mem.zeroes(u_short),
    in6_hops: c_short = @import("std").mem.zeroes(c_short),
};
pub const struct_in_sockinfo = extern struct {
    insi_fport: c_int = @import("std").mem.zeroes(c_int),
    insi_lport: c_int = @import("std").mem.zeroes(c_int),
    insi_gencnt: u64 = @import("std").mem.zeroes(u64),
    insi_flags: u32 = @import("std").mem.zeroes(u32),
    insi_flow: u32 = @import("std").mem.zeroes(u32),
    insi_vflag: u8 = @import("std").mem.zeroes(u8),
    insi_ip_ttl: u8 = @import("std").mem.zeroes(u8),
    rfu_1: u32 = @import("std").mem.zeroes(u32),
    insi_faddr: union_unnamed_20 = @import("std").mem.zeroes(union_unnamed_20),
    insi_laddr: union_unnamed_21 = @import("std").mem.zeroes(union_unnamed_21),
    insi_v4: struct_unnamed_22 = @import("std").mem.zeroes(struct_unnamed_22),
    insi_v6: struct_unnamed_23 = @import("std").mem.zeroes(struct_unnamed_23),
};
pub const struct_tcp_sockinfo = extern struct {
    tcpsi_ini: struct_in_sockinfo = @import("std").mem.zeroes(struct_in_sockinfo),
    tcpsi_state: c_int = @import("std").mem.zeroes(c_int),
    tcpsi_timer: [4]c_int = @import("std").mem.zeroes([4]c_int),
    tcpsi_mss: c_int = @import("std").mem.zeroes(c_int),
    tcpsi_flags: u32 = @import("std").mem.zeroes(u32),
    rfu_1: u32 = @import("std").mem.zeroes(u32),
    tcpsi_tp: u64 = @import("std").mem.zeroes(u64),
};
const union_unnamed_24 = extern union {
    ua_sun: struct_sockaddr_un,
    ua_dummy: [255]u8,
};
const union_unnamed_25 = extern union {
    ua_sun: struct_sockaddr_un,
    ua_dummy: [255]u8,
};
pub const struct_un_sockinfo = extern struct {
    unsi_conn_so: u64 = @import("std").mem.zeroes(u64),
    unsi_conn_pcb: u64 = @import("std").mem.zeroes(u64),
    unsi_addr: union_unnamed_24 = @import("std").mem.zeroes(union_unnamed_24),
    unsi_caddr: union_unnamed_25 = @import("std").mem.zeroes(union_unnamed_25),
};
pub const struct_ndrv_info = extern struct {
    ndrvsi_if_family: u32 = @import("std").mem.zeroes(u32),
    ndrvsi_if_unit: u32 = @import("std").mem.zeroes(u32),
    ndrvsi_if_name: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const struct_kern_event_info = extern struct {
    kesi_vendor_code_filter: u32 = @import("std").mem.zeroes(u32),
    kesi_class_filter: u32 = @import("std").mem.zeroes(u32),
    kesi_subclass_filter: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_kern_ctl_info = extern struct {
    kcsi_id: u32 = @import("std").mem.zeroes(u32),
    kcsi_reg_unit: u32 = @import("std").mem.zeroes(u32),
    kcsi_flags: u32 = @import("std").mem.zeroes(u32),
    kcsi_recvbufsize: u32 = @import("std").mem.zeroes(u32),
    kcsi_sendbufsize: u32 = @import("std").mem.zeroes(u32),
    kcsi_unit: u32 = @import("std").mem.zeroes(u32),
    kcsi_name: [96]u8 = @import("std").mem.zeroes([96]u8),
};
pub const struct_vsock_sockinfo = extern struct {
    local_cid: u32 = @import("std").mem.zeroes(u32),
    local_port: u32 = @import("std").mem.zeroes(u32),
    remote_cid: u32 = @import("std").mem.zeroes(u32),
    remote_port: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_sockbuf_info = extern struct {
    sbi_cc: u32 = @import("std").mem.zeroes(u32),
    sbi_hiwat: u32 = @import("std").mem.zeroes(u32),
    sbi_mbcnt: u32 = @import("std").mem.zeroes(u32),
    sbi_mbmax: u32 = @import("std").mem.zeroes(u32),
    sbi_lowat: u32 = @import("std").mem.zeroes(u32),
    sbi_flags: c_short = @import("std").mem.zeroes(c_short),
    sbi_timeo: c_short = @import("std").mem.zeroes(c_short),
};
pub const SOCKINFO_GENERIC: c_int = 0;
pub const SOCKINFO_IN: c_int = 1;
pub const SOCKINFO_TCP: c_int = 2;
pub const SOCKINFO_UN: c_int = 3;
pub const SOCKINFO_NDRV: c_int = 4;
pub const SOCKINFO_KERN_EVENT: c_int = 5;
pub const SOCKINFO_KERN_CTL: c_int = 6;
pub const SOCKINFO_VSOCK: c_int = 7;
const enum_unnamed_26 = c_uint;
const union_unnamed_27 = extern union {
    pri_in: struct_in_sockinfo,
    pri_tcp: struct_tcp_sockinfo,
    pri_un: struct_un_sockinfo,
    pri_ndrv: struct_ndrv_info,
    pri_kern_event: struct_kern_event_info,
    pri_kern_ctl: struct_kern_ctl_info,
    pri_vsock: struct_vsock_sockinfo,
};
pub const struct_socket_info = extern struct {
    soi_stat: struct_vinfo_stat = @import("std").mem.zeroes(struct_vinfo_stat),
    soi_so: u64 = @import("std").mem.zeroes(u64),
    soi_pcb: u64 = @import("std").mem.zeroes(u64),
    soi_type: c_int = @import("std").mem.zeroes(c_int),
    soi_protocol: c_int = @import("std").mem.zeroes(c_int),
    soi_family: c_int = @import("std").mem.zeroes(c_int),
    soi_options: c_short = @import("std").mem.zeroes(c_short),
    soi_linger: c_short = @import("std").mem.zeroes(c_short),
    soi_state: c_short = @import("std").mem.zeroes(c_short),
    soi_qlen: c_short = @import("std").mem.zeroes(c_short),
    soi_incqlen: c_short = @import("std").mem.zeroes(c_short),
    soi_qlimit: c_short = @import("std").mem.zeroes(c_short),
    soi_timeo: c_short = @import("std").mem.zeroes(c_short),
    soi_error: u_short = @import("std").mem.zeroes(u_short),
    soi_oobmark: u32 = @import("std").mem.zeroes(u32),
    soi_rcv: struct_sockbuf_info = @import("std").mem.zeroes(struct_sockbuf_info),
    soi_snd: struct_sockbuf_info = @import("std").mem.zeroes(struct_sockbuf_info),
    soi_kind: c_int = @import("std").mem.zeroes(c_int),
    rfu_1: u32 = @import("std").mem.zeroes(u32),
    soi_proto: union_unnamed_27 = @import("std").mem.zeroes(union_unnamed_27),
};
pub const struct_socket_fdinfo = extern struct {
    pfi: struct_proc_fileinfo = @import("std").mem.zeroes(struct_proc_fileinfo),
    psi: struct_socket_info = @import("std").mem.zeroes(struct_socket_info),
};
pub const struct_psem_info = extern struct {
    psem_stat: struct_vinfo_stat = @import("std").mem.zeroes(struct_vinfo_stat),
    psem_name: [1024]u8 = @import("std").mem.zeroes([1024]u8),
};
pub const struct_psem_fdinfo = extern struct {
    pfi: struct_proc_fileinfo = @import("std").mem.zeroes(struct_proc_fileinfo),
    pseminfo: struct_psem_info = @import("std").mem.zeroes(struct_psem_info),
};
pub const struct_pshm_info = extern struct {
    pshm_stat: struct_vinfo_stat = @import("std").mem.zeroes(struct_vinfo_stat),
    pshm_mappaddr: u64 = @import("std").mem.zeroes(u64),
    pshm_name: [1024]u8 = @import("std").mem.zeroes([1024]u8),
};
pub const struct_pshm_fdinfo = extern struct {
    pfi: struct_proc_fileinfo = @import("std").mem.zeroes(struct_proc_fileinfo),
    pshminfo: struct_pshm_info = @import("std").mem.zeroes(struct_pshm_info),
};
pub const struct_pipe_info = extern struct {
    pipe_stat: struct_vinfo_stat = @import("std").mem.zeroes(struct_vinfo_stat),
    pipe_handle: u64 = @import("std").mem.zeroes(u64),
    pipe_peerhandle: u64 = @import("std").mem.zeroes(u64),
    pipe_status: c_int = @import("std").mem.zeroes(c_int),
    rfu_1: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_pipe_fdinfo = extern struct {
    pfi: struct_proc_fileinfo = @import("std").mem.zeroes(struct_proc_fileinfo),
    pipeinfo: struct_pipe_info = @import("std").mem.zeroes(struct_pipe_info),
};
pub const struct_kqueue_info = extern struct {
    kq_stat: struct_vinfo_stat = @import("std").mem.zeroes(struct_vinfo_stat),
    kq_state: u32 = @import("std").mem.zeroes(u32),
    rfu_1: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_kqueue_dyninfo = extern struct {
    kqdi_info: struct_kqueue_info = @import("std").mem.zeroes(struct_kqueue_info),
    kqdi_servicer: u64 = @import("std").mem.zeroes(u64),
    kqdi_owner: u64 = @import("std").mem.zeroes(u64),
    kqdi_sync_waiters: u32 = @import("std").mem.zeroes(u32),
    kqdi_sync_waiter_qos: u8 = @import("std").mem.zeroes(u8),
    kqdi_async_qos: u8 = @import("std").mem.zeroes(u8),
    kqdi_request_state: u16 = @import("std").mem.zeroes(u16),
    kqdi_events_qos: u8 = @import("std").mem.zeroes(u8),
    kqdi_pri: u8 = @import("std").mem.zeroes(u8),
    kqdi_pol: u8 = @import("std").mem.zeroes(u8),
    kqdi_cpupercent: u8 = @import("std").mem.zeroes(u8),
    _kqdi_reserved0: [4]u8 = @import("std").mem.zeroes([4]u8),
    _kqdi_reserved1: [4]u64 = @import("std").mem.zeroes([4]u64),
};
pub const struct_kqueue_fdinfo = extern struct {
    pfi: struct_proc_fileinfo = @import("std").mem.zeroes(struct_proc_fileinfo),
    kqueueinfo: struct_kqueue_info = @import("std").mem.zeroes(struct_kqueue_info),
};
pub const struct_appletalk_info = extern struct {
    atalk_stat: struct_vinfo_stat = @import("std").mem.zeroes(struct_vinfo_stat),
};
pub const struct_appletalk_fdinfo = extern struct {
    pfi: struct_proc_fileinfo = @import("std").mem.zeroes(struct_proc_fileinfo),
    appletalkinfo: struct_appletalk_info = @import("std").mem.zeroes(struct_appletalk_info),
};
pub const proc_info_udata_t = u64;
pub const struct_proc_fdinfo = extern struct {
    proc_fd: i32 = @import("std").mem.zeroes(i32),
    proc_fdtype: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_proc_fileportinfo = extern struct {
    proc_fileport: u32 = @import("std").mem.zeroes(u32),
    proc_fdtype: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_proc_channel_info = extern struct {
    chi_instance: uuid_t = @import("std").mem.zeroes(uuid_t),
    chi_port: u32 = @import("std").mem.zeroes(u32),
    chi_type: u32 = @import("std").mem.zeroes(u32),
    chi_flags: u32 = @import("std").mem.zeroes(u32),
    rfu_1: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_channel_fdinfo = extern struct {
    pfi: struct_proc_fileinfo = @import("std").mem.zeroes(struct_proc_fileinfo),
    channelinfo: struct_proc_channel_info = @import("std").mem.zeroes(struct_proc_channel_info),
};
pub extern fn proc_listpidspath(@"type": u32, typeinfo: u32, path: [*c]const u8, pathflags: u32, buffer: ?*anyopaque, buffersize: c_int) c_int;
pub extern fn proc_listpids(@"type": u32, typeinfo: u32, buffer: ?*anyopaque, buffersize: c_int) c_int;
pub extern fn proc_listallpids(buffer: ?*anyopaque, buffersize: c_int) c_int;
pub extern fn proc_listpgrppids(pgrpid: pid_t, buffer: ?*anyopaque, buffersize: c_int) c_int;
pub extern fn proc_listchildpids(ppid: pid_t, buffer: ?*anyopaque, buffersize: c_int) c_int;
pub extern fn proc_pidinfo(pid: c_int, flavor: c_int, arg: u64, buffer: ?*anyopaque, buffersize: c_int) c_int;
pub extern fn proc_pidfdinfo(pid: c_int, fd: c_int, flavor: c_int, buffer: ?*anyopaque, buffersize: c_int) c_int;
pub extern fn proc_pidfileportinfo(pid: c_int, fileport: u32, flavor: c_int, buffer: ?*anyopaque, buffersize: c_int) c_int;
pub extern fn proc_name(pid: c_int, buffer: ?*anyopaque, buffersize: u32) c_int;
pub extern fn proc_regionfilename(pid: c_int, address: u64, buffer: ?*anyopaque, buffersize: u32) c_int;
pub extern fn proc_kmsgbuf(buffer: ?*anyopaque, buffersize: u32) c_int;
pub extern fn proc_pidpath(pid: c_int, buffer: ?*anyopaque, buffersize: u32) c_int;
pub extern fn proc_pidpath_audittoken(audittoken: [*c]audit_token_t, buffer: ?*anyopaque, buffersize: u32) c_int;
pub extern fn proc_libversion(major: [*c]c_int, minor: [*c]c_int) c_int;
pub extern fn proc_pid_rusage(pid: c_int, flavor: c_int, buffer: [*c]rusage_info_t) c_int;
pub extern fn proc_setpcontrol(control: c_int) c_int;
pub extern fn proc_track_dirty(pid: pid_t, flags: u32) c_int;
pub extern fn proc_set_dirty(pid: pid_t, dirty: bool) c_int;
pub extern fn proc_get_dirty(pid: pid_t, flags: [*c]u32) c_int;
pub extern fn proc_clear_dirty(pid: pid_t, flags: u32) c_int;
pub extern fn proc_terminate(pid: pid_t, sig: [*c]c_int) c_int;
pub extern fn proc_terminate_all_rsr(sig: c_int) c_int;
pub extern fn proc_signal_with_audittoken(audittoken: [*c]audit_token_t, sig: c_int) c_int;
pub extern fn proc_terminate_with_audittoken(audittoken: [*c]audit_token_t, sig: [*c]c_int) c_int;
pub extern fn proc_signal_delegate(instigator: audit_token_t, target: audit_token_t, sig: c_int) c_int;
pub extern fn proc_terminate_delegate(instigator: audit_token_t, target: audit_token_t, sig: [*c]c_int) c_int;
pub extern fn proc_set_no_smt() c_int;
pub extern fn proc_setthread_no_smt() c_int;
pub extern fn proc_set_csm(flags: u32) c_int;
pub extern fn proc_setthread_csm(flags: u32) c_int;
pub extern fn proc_udata_info(pid: c_int, flavor: c_int, buffer: ?*anyopaque, buffersize: c_int) c_int;
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 20);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 8);
pub const __clang_version__ = "20.1.8 ";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
pub const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
pub const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
pub const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
pub const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 20.1.8";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 1);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __block = @compileError("unable to translate macro: undefined identifier `__blocks__`");
// (no file):42:9
pub const __BLOCKS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 1);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @as(c_int, 128);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):97:9
pub const __INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):104:9
pub const __UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_int;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_NORM_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_NORM_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_NORM_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 4.9406564584124654e-324);
pub const __LDBL_NORM_MAX__ = @as(c_longdouble, 1.7976931348623157e+308);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 15);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 2.2204460492503131e-16);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 53);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __LDBL_MAX_EXP__ = @as(c_int, 1024);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.7976931348623157e+308);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __LDBL_MIN__ = @as(c_longdouble, 2.2250738585072014e-308);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 8);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub inline fn __INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub inline fn __INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub inline fn __INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __INT64_TYPE__ = c_longlong;
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `LL`");
// (no file):208:9
pub const __INT64_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub inline fn __UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub inline fn __UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// (no file):233:9
pub const __UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulonglong;
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `ULL`");
// (no file):242:9
pub const __UINT64_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_longlong;
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_TYPE__ = c_ulonglong;
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_longlong;
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_TYPE__ = c_ulonglong;
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __USER_LABEL_PREFIX__ = @compileError("unable to translate macro: undefined identifier `_`");
// (no file):334:9
pub const __NO_MATH_ERRNO__ = @as(c_int, 1);
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __GCC_DESTRUCTIVE_SIZE = @as(c_int, 64);
pub const __GCC_CONSTRUCTIVE_SIZE = @as(c_int, 64);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __nonnull = @compileError("unable to translate macro: undefined identifier `_Nonnull`");
// (no file):369:9
pub const __null_unspecified = @compileError("unable to translate macro: undefined identifier `_Null_unspecified`");
// (no file):370:9
pub const __nullable = @compileError("unable to translate macro: undefined identifier `_Nullable`");
// (no file):371:9
pub const TARGET_OS_WIN32 = @as(c_int, 0);
pub const TARGET_OS_WINDOWS = @as(c_int, 0);
pub const TARGET_OS_LINUX = @as(c_int, 0);
pub const TARGET_OS_UNIX = @as(c_int, 0);
pub const TARGET_OS_MAC = @as(c_int, 1);
pub const TARGET_OS_OSX = @as(c_int, 1);
pub const TARGET_OS_IPHONE = @as(c_int, 0);
pub const TARGET_OS_IOS = @as(c_int, 0);
pub const TARGET_OS_TV = @as(c_int, 0);
pub const TARGET_OS_WATCH = @as(c_int, 0);
pub const TARGET_OS_VISION = @as(c_int, 0);
pub const TARGET_OS_DRIVERKIT = @as(c_int, 0);
pub const TARGET_OS_MACCATALYST = @as(c_int, 0);
pub const TARGET_OS_SIMULATOR = @as(c_int, 0);
pub const TARGET_OS_EMBEDDED = @as(c_int, 0);
pub const TARGET_OS_NANO = @as(c_int, 0);
pub const TARGET_IPHONE_SIMULATOR = @as(c_int, 0);
pub const TARGET_OS_UIKITFORMAC = @as(c_int, 0);
pub const __AARCH64EL__ = @as(c_int, 1);
pub const __aarch64__ = @as(c_int, 1);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __AARCH64_CMODEL_SMALL__ = @as(c_int, 1);
pub inline fn __ARM_ACLE_VERSION(year: anytype, quarter: anytype, patch: anytype) @TypeOf(((@as(c_int, 100) * year) + (@as(c_int, 10) * quarter)) + patch) {
    _ = &year;
    _ = &quarter;
    _ = &patch;
    return ((@as(c_int, 100) * year) + (@as(c_int, 10) * quarter)) + patch;
}
pub const __ARM_ACLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 202420, .decimal);
pub const __FUNCTION_MULTI_VERSIONING_SUPPORT_LEVEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 202430, .decimal);
pub const __ARM_ARCH = @as(c_int, 8);
pub const __ARM_ARCH_PROFILE = 'A';
pub const __ARM_64BIT_STATE = @as(c_int, 1);
pub const __ARM_PCS_AAPCS64 = @as(c_int, 1);
pub const __ARM_ARCH_ISA_A64 = @as(c_int, 1);
pub const __ARM_FEATURE_CLZ = @as(c_int, 1);
pub const __ARM_FEATURE_FMA = @as(c_int, 1);
pub const __ARM_FEATURE_LDREX = @as(c_int, 0xF);
pub const __ARM_FEATURE_IDIV = @as(c_int, 1);
pub const __ARM_FEATURE_DIV = @as(c_int, 1);
pub const __ARM_FEATURE_NUMERIC_MAXMIN = @as(c_int, 1);
pub const __ARM_FEATURE_DIRECTED_ROUNDING = @as(c_int, 1);
pub const __ARM_ALIGN_MAX_STACK_PWR = @as(c_int, 4);
pub const __ARM_STATE_ZA = @as(c_int, 1);
pub const __ARM_STATE_ZT0 = @as(c_int, 1);
pub const __ARM_FP = @as(c_int, 0xE);
pub const __ARM_FP16_FORMAT_IEEE = @as(c_int, 1);
pub const __ARM_FP16_ARGS = @as(c_int, 1);
pub const __ARM_NEON_SVE_BRIDGE = @as(c_int, 1);
pub const __ARM_SIZEOF_WCHAR_T = @as(c_int, 4);
pub const __ARM_SIZEOF_MINIMAL_ENUM = @as(c_int, 4);
pub const __ARM_NEON = @as(c_int, 1);
pub const __ARM_NEON_FP = @as(c_int, 0xE);
pub const __ARM_FEATURE_CRC32 = @as(c_int, 1);
pub const __ARM_FEATURE_RCPC = @as(c_int, 1);
pub const __ARM_FEATURE_CRYPTO = @as(c_int, 1);
pub const __ARM_FEATURE_AES = @as(c_int, 1);
pub const __ARM_FEATURE_SHA2 = @as(c_int, 1);
pub const __ARM_FEATURE_SHA3 = @as(c_int, 1);
pub const __ARM_FEATURE_SHA512 = @as(c_int, 1);
pub const __ARM_FEATURE_PAUTH = @as(c_int, 1);
pub const __ARM_FEATURE_UNALIGNED = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_VECTOR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_SCALAR_ARITHMETIC = @as(c_int, 1);
pub const __ARM_FEATURE_DOTPROD = @as(c_int, 1);
pub const __ARM_FEATURE_ATOMICS = @as(c_int, 1);
pub const __ARM_FEATURE_FP16_FML = @as(c_int, 1);
pub const __ARM_FEATURE_COMPLEX = @as(c_int, 1);
pub const __ARM_FEATURE_JCVT = @as(c_int, 1);
pub const __ARM_FEATURE_QRDMX = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __FP_FAST_FMA = @as(c_int, 1);
pub const __FP_FAST_FMAF = @as(c_int, 1);
pub const __AARCH64_SIMD__ = @as(c_int, 1);
pub const __ARM64_ARCH_8__ = @as(c_int, 1);
pub const __ARM_NEON__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __arm64 = @as(c_int, 1);
pub const __arm64__ = @as(c_int, 1);
pub const __APPLE_CC__ = @as(c_int, 6000);
pub const __APPLE__ = @as(c_int, 1);
pub const __weak = @compileError("unable to translate macro: undefined identifier `objc_gc`");
// (no file):452:9
pub const __strong = "";
pub const __unsafe_unretained = "";
pub const __DYNAMIC__ = @as(c_int, 1);
pub const __MACH__ = @as(c_int, 1);
pub const __STDC_NO_THREADS__ = @as(c_int, 1);
pub const __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __ENVIRONMENT_OS_VERSION_MIN_REQUIRED__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const _GNU_SOURCE = "";
pub const _UNISTD_H_ = "";
pub const _LIBC_BOUNDS_H_ = "";
pub const _CDEFS_H_ = "";
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub inline fn __has_cpp_attribute(x: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &x;
    return @as(c_int, 0);
}
pub inline fn __P(protos: anytype) @TypeOf(protos) {
    _ = &protos;
    return protos;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:116:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:117:9
pub const __const = @compileError("unable to translate C expr: unexpected token 'const'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:119:9
pub const __signed = c_int;
pub const __volatile = @compileError("unable to translate C expr: unexpected token 'volatile'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:121:9
pub const __dead2 = @compileError("unable to translate macro: undefined identifier `__noreturn__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:165:9
pub const __pure2 = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:166:9
pub const __stateful_pure = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:167:9
pub const __unused = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:172:9
pub const __used = @compileError("unable to translate macro: undefined identifier `__used__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:177:9
pub const __cold = @compileError("unable to translate macro: undefined identifier `__cold__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:183:9
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `returns_nonnull`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:190:9
pub const __exported = @compileError("unable to translate macro: undefined identifier `__visibility__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:200:9
pub const __exported_push = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:201:9
pub const __exported_pop = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:202:9
pub const __deprecated = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:214:9
pub const __deprecated_msg = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:218:10
pub inline fn __deprecated_enum_msg(_msg: anytype) @TypeOf(__deprecated_msg(_msg)) {
    _ = &_msg;
    return __deprecated_msg(_msg);
}
pub const __kpi_deprecated = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:229:9
pub const __unavailable = @compileError("unable to translate macro: undefined identifier `__unavailable__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:235:9
pub const __kpi_unavailable = "";
pub const __kpi_deprecated_arm64_macos_unavailable = "";
pub const __dead = "";
pub const __pure = "";
pub const __restrict = @compileError("unable to translate C expr: unexpected token 'restrict'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:257:9
pub const __disable_tail_calls = @compileError("unable to translate macro: undefined identifier `__disable_tail_calls__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:290:9
pub const __not_tail_called = @compileError("unable to translate macro: undefined identifier `__not_tail_called__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:302:9
pub const __result_use_check = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:313:9
pub const __swift_unavailable = @compileError("unable to translate macro: undefined identifier `__availability__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:323:9
pub const __swift_unavailable_from_async = @compileError("unable to translate macro: undefined identifier `__swift_attr__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:332:9
pub const __swift_nonisolated = @compileError("unable to translate macro: undefined identifier `__swift_attr__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:333:9
pub const __swift_nonisolated_unsafe = @compileError("unable to translate macro: undefined identifier `__swift_attr__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:334:9
pub const __abortlike = __dead2 ++ __cold ++ __not_tail_called;
pub const __header_inline = @compileError("unable to translate C expr: unexpected token 'inline'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:370:10
pub const __header_always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:383:10
pub const __unreachable_ok_push = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:396:10
pub const __unreachable_ok_pop = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:399:10
pub const __printflike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:420:9
pub const __printf0like = @compileError("unable to translate macro: undefined identifier `__format__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:422:9
pub const __scanflike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:424:9
pub const __osloglike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:426:9
pub const __IDSTRING = @compileError("unable to translate C expr: unexpected token 'static'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:429:9
pub const __COPYRIGHT = @compileError("unable to translate macro: undefined identifier `copyright`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:432:9
pub const __RCSID = @compileError("unable to translate macro: undefined identifier `rcsid`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:436:9
pub const __SCCSID = @compileError("unable to translate macro: undefined identifier `sccsid`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:440:9
pub const __PROJECT_VERSION = @compileError("unable to translate macro: undefined identifier `project_version`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:444:9
pub const __FBSDID = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:449:9
pub const __DECONST = @compileError("unable to translate C expr: unexpected token 'const'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:453:9
pub const __DEVOLATILE = @compileError("unable to translate C expr: unexpected token 'volatile'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:457:9
pub const __DEQUALIFY = @compileError("unable to translate C expr: unexpected token 'const'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:461:9
pub const __alloc_align = @compileError("unable to translate macro: undefined identifier `alloc_align`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:470:9
pub const __alloc_size = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:491:9
pub const __has_safe_buffers = @as(c_int, 1);
pub const __unsafe_buffer_usage = @compileError("unable to translate macro: undefined identifier `__unsafe_buffer_usage__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:572:9
pub const __unsafe_buffer_usage_begin = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:578:9
pub const __unsafe_buffer_usage_end = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:579:9
pub const __DARWIN_ONLY_64_BIT_INO_T = @as(c_int, 1);
pub const __DARWIN_ONLY_UNIX_CONFORMANCE = @as(c_int, 1);
pub const __DARWIN_ONLY_VERS_1050 = @as(c_int, 1);
pub const __DARWIN_UNIX03 = @as(c_int, 1);
pub const __DARWIN_64_BIT_INO_T = @as(c_int, 1);
pub const __DARWIN_VERS_1050 = @as(c_int, 1);
pub const __DARWIN_NON_CANCELABLE = @as(c_int, 0);
pub const __DARWIN_SUF_UNIX03 = "";
pub const __DARWIN_SUF_64_BIT_INO_T = "";
pub const __DARWIN_SUF_1050 = "";
pub const __DARWIN_SUF_NON_CANCELABLE = "";
pub const __DARWIN_SUF_EXTSN = "$DARWIN_EXTSN";
pub const __DARWIN_ALIAS = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:764:9
pub const __DARWIN_ALIAS_C = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:765:9
pub const __DARWIN_ALIAS_I = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:766:9
pub const __DARWIN_NOCANCEL = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:767:9
pub const __DARWIN_INODE64 = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:768:9
pub const __DARWIN_1050 = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:770:9
pub const __DARWIN_1050ALIAS = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:771:9
pub const __DARWIN_1050ALIAS_C = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:772:9
pub const __DARWIN_1050ALIAS_I = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:773:9
pub const __DARWIN_1050INODE64 = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:774:9
pub const __DARWIN_EXTSN = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:776:9
pub const __DARWIN_EXTSN_C = @compileError("unable to translate C expr: unexpected token '__asm'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:777:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:35:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:41:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_2_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:47:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:53:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:59:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_3_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:65:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:71:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:77:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:83:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_4_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:89:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:95:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_5_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:101:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:107:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_6_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:113:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:119:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_7_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:125:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:131:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:137:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:143:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:149:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_8_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:155:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:161:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:167:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:173:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_9_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:179:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:185:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:191:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:197:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_10_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:203:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:209:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:215:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:221:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:227:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_11_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:233:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:239:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:245:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:251:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:257:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_12_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:263:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:269:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:275:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:281:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:287:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:293:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_5 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:299:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_6 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:305:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_13_7 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:311:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:317:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:323:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:329:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:335:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_5 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:341:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:347:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_6 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:359:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_7 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:365:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_14_8 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:371:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:377:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:383:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:389:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:395:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:401:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_5 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:407:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_6 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:413:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_7 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:419:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_15_8 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:425:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:431:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:437:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:443:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:449:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:455:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_5 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:461:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_6 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:467:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_16_7 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:473:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:479:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:485:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:491:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:497:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:503:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_5 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:509:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_6 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:515:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_17_7 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:521:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:527:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:533:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:539:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:545:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:551:9
pub const __DARWIN_ALIAS_STARTING_IPHONE___IPHONE_18_5 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:557:9
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_7(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_8(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_9(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_10_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_11_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_12_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_13_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_14_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_15_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_10_16(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_11_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_1(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_2(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_3(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_4(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_5(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_6(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_12_7(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __DARWIN_ALIAS_STARTING_MAC___MAC_13_0(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_13_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:857:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_13_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:869:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_13_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:875:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_13_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:881:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_13_5 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:887:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_13_6 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:893:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_13_7 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:899:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_14_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:905:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_14_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:911:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_14_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:917:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_14_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:923:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_14_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:929:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_14_5 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:935:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_14_6 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:941:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_14_7 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:947:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_15_0 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:953:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_15_1 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:959:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_15_2 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:965:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_15_3 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:971:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_15_4 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:977:9
pub const __DARWIN_ALIAS_STARTING_MAC___MAC_15_5 = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_symbol_aliasing.h:983:9
pub const __DARWIN_ALIAS_STARTING = @compileError("unable to translate macro: undefined identifier `__DARWIN_ALIAS_STARTING_MAC_`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:787:9
pub const ___POSIX_C_DEPRECATED_STARTING_198808L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199009L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199209L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199309L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_199506L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_200112L = "";
pub const ___POSIX_C_DEPRECATED_STARTING_200809L = "";
pub const __POSIX_C_DEPRECATED = @compileError("unable to translate macro: undefined identifier `___POSIX_C_DEPRECATED_STARTING_`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:850:9
pub const __DARWIN_C_ANSI = @as(c_long, 0o10000);
pub const __DARWIN_C_FULL = @as(c_long, 900000);
pub const __DARWIN_C_LEVEL = __DARWIN_C_FULL;
pub const __STDC_WANT_LIB_EXT1__ = @as(c_int, 1);
pub const __DARWIN_NO_LONG_LONG = @as(c_int, 0);
pub const _DARWIN_FEATURE_64_BIT_INODE = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_64_BIT_INODE = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_VERS_1050 = @as(c_int, 1);
pub const _DARWIN_FEATURE_ONLY_UNIX_CONFORMANCE = @as(c_int, 1);
pub const _DARWIN_FEATURE_UNIX_CONFORMANCE = @as(c_int, 3);
pub const __CAST_AWAY_QUALIFIER = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:948:9
pub const __XNU_PRIVATE_EXTERN = @compileError("unable to translate macro: undefined identifier `visibility`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:962:9
pub const __has_ptrcheck = @as(c_int, 0);
pub const __single = "";
pub const __unsafe_indexable = "";
pub const __counted_by = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:981:9
pub const __counted_by_or_null = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:982:9
pub const __sized_by = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:983:9
pub const __sized_by_or_null = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:984:9
pub const __ended_by = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:985:9
pub const __terminated_by = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:986:9
pub const __null_terminated = "";
pub const __ptrcheck_abi_assume_single = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:996:9
pub const __ptrcheck_abi_assume_unsafe_indexable = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:997:9
pub inline fn __unsafe_forge_bidi_indexable(T: anytype, P: anytype, S: anytype) @TypeOf(T(P)) {
    _ = &T;
    _ = &P;
    _ = &S;
    return T(P);
}
pub const __unsafe_forge_single = @import("std").zig.c_translation.Macros.CAST_OR_CALL;
pub inline fn __unsafe_forge_terminated_by(T: anytype, P: anytype, E: anytype) @TypeOf(T(P)) {
    _ = &T;
    _ = &P;
    _ = &E;
    return T(P);
}
pub const __unsafe_forge_null_terminated = @import("std").zig.c_translation.Macros.CAST_OR_CALL;
pub inline fn __terminated_by_to_indexable(P: anytype) @TypeOf(P) {
    _ = &P;
    return P;
}
pub inline fn __unsafe_terminated_by_to_indexable(P: anytype) @TypeOf(P) {
    _ = &P;
    return P;
}
pub inline fn __null_terminated_to_indexable(P: anytype) @TypeOf(P) {
    _ = &P;
    return P;
}
pub inline fn __unsafe_null_terminated_to_indexable(P: anytype) @TypeOf(P) {
    _ = &P;
    return P;
}
pub const __unsafe_terminated_by_from_indexable = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1008:9
pub const __unsafe_null_terminated_from_indexable = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1009:9
pub const __array_decay_dicards_count_in_parameters = "";
pub const __unsafe_late_const = "";
pub const __ptrcheck_unavailable = "";
pub const __ptrcheck_unavailable_r = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1018:9
pub const __ASSUME_PTR_ABI_SINGLE_BEGIN = __ptrcheck_abi_assume_single();
pub const __ASSUME_PTR_ABI_SINGLE_END = __ptrcheck_abi_assume_unsafe_indexable();
pub const __header_indexable = "";
pub const __header_bidi_indexable = "";
pub const __compiler_barrier = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1047:9
pub const __enum_open = @compileError("unable to translate macro: undefined identifier `__enum_extensibility__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1050:9
pub const __enum_closed = @compileError("unable to translate macro: undefined identifier `__enum_extensibility__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1051:9
pub const __enum_options = @compileError("unable to translate macro: undefined identifier `__flag_enum__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1058:9
pub const __enum_decl = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1071:9
pub const __enum_closed_decl = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1073:9
pub const __options_decl = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1075:9
pub const __options_closed_decl = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/cdefs.h:1077:9
pub const __kernel_ptr_semantics = "";
pub const __kernel_data_semantics = "";
pub const __kernel_dual_semantics = "";
pub const __xnu_data_size = "";
pub const __xnu_returns_data_pointer = "";
pub const _LIBC_COUNT = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/_bounds.h:47:9
pub const _LIBC_COUNT_OR_NULL = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/_bounds.h:48:9
pub const _LIBC_SIZE = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/_bounds.h:49:9
pub const _LIBC_SIZE_OR_NULL = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/_bounds.h:50:9
pub const _LIBC_ENDED_BY = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/_bounds.h:51:9
pub const _LIBC_SINGLE = "";
pub const _LIBC_UNSAFE_INDEXABLE = "";
pub const _LIBC_CSTR = "";
pub const _LIBC_NULL_TERMINATED = "";
pub inline fn _LIBC_FLEX_COUNT(FIELD: anytype, INTCOUNT: anytype) @TypeOf(INTCOUNT) {
    _ = &FIELD;
    _ = &INTCOUNT;
    return INTCOUNT;
}
pub const _LIBC_SINGLE_BY_DEFAULT = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/_bounds.h:58:9
pub const _LIBC_PTRCHECK_REPLACED = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/_bounds.h:59:9
pub const __TYPES_H_ = "";
pub const _SYS__TYPES_H_ = "";
pub const _BSD_MACHINE__TYPES_H_ = "";
pub const _BSD_ARM__TYPES_H_ = "";
pub const USE_CLANG_TYPES = @as(c_int, 0);
pub const __DARWIN_NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const _SYS__PTHREAD_TYPES_H_ = "";
pub const __PTHREAD_SIZE__ = @as(c_int, 8176);
pub const __PTHREAD_ATTR_SIZE__ = @as(c_int, 56);
pub const __PTHREAD_MUTEXATTR_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_MUTEX_SIZE__ = @as(c_int, 56);
pub const __PTHREAD_CONDATTR_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_COND_SIZE__ = @as(c_int, 40);
pub const __PTHREAD_ONCE_SIZE__ = @as(c_int, 8);
pub const __PTHREAD_RWLOCK_SIZE__ = @as(c_int, 192);
pub const __PTHREAD_RWLOCKATTR_SIZE__ = @as(c_int, 16);
pub const __offsetof = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_types.h:97:9
pub const __strfmonlike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/_types.h:34:9
pub const __strftimelike = @compileError("unable to translate macro: undefined identifier `__format__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/_types.h:36:9
pub const __DARWIN_WCHAR_MAX = __WCHAR_MAX__;
pub const __DARWIN_WCHAR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7fffffff, .hex) - @as(c_int, 1);
pub const __DARWIN_WEOF = @import("std").zig.c_translation.cast(__darwin_wint_t, -@as(c_int, 1));
pub const _FORTIFY_SOURCE = @as(c_int, 2);
pub const _SYS_UNISTD_H_ = "";
pub const _POSIX_VERSION = @as(c_long, 200112);
pub const _POSIX2_VERSION = @as(c_long, 200112);
pub const _POSIX_VDISABLE = @import("std").zig.c_translation.cast(u8, '\xff');
pub const _POSIX_THREAD_KEYS_MAX = @as(c_int, 128);
pub const F_OK = @as(c_int, 0);
pub const X_OK = @as(c_int, 1) << @as(c_int, 0);
pub const W_OK = @as(c_int, 1) << @as(c_int, 1);
pub const R_OK = @as(c_int, 1) << @as(c_int, 2);
pub const _READ_OK = @as(c_int, 1) << @as(c_int, 9);
pub const _WRITE_OK = @as(c_int, 1) << @as(c_int, 10);
pub const _EXECUTE_OK = @as(c_int, 1) << @as(c_int, 11);
pub const _DELETE_OK = @as(c_int, 1) << @as(c_int, 12);
pub const _APPEND_OK = @as(c_int, 1) << @as(c_int, 13);
pub const _RMFILE_OK = @as(c_int, 1) << @as(c_int, 14);
pub const _RATTR_OK = @as(c_int, 1) << @as(c_int, 15);
pub const _WATTR_OK = @as(c_int, 1) << @as(c_int, 16);
pub const _REXT_OK = @as(c_int, 1) << @as(c_int, 17);
pub const _WEXT_OK = @as(c_int, 1) << @as(c_int, 18);
pub const _RPERM_OK = @as(c_int, 1) << @as(c_int, 19);
pub const _WPERM_OK = @as(c_int, 1) << @as(c_int, 20);
pub const _CHOWN_OK = @as(c_int, 1) << @as(c_int, 21);
pub const _ACCESS_EXTENDED_MASK = (((((((((((_READ_OK | _WRITE_OK) | _EXECUTE_OK) | _DELETE_OK) | _APPEND_OK) | _RMFILE_OK) | _REXT_OK) | _WEXT_OK) | _RATTR_OK) | _WATTR_OK) | _RPERM_OK) | _WPERM_OK) | _CHOWN_OK;
pub const _SEEK_SET_H_ = "";
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const SEEK_HOLE = @as(c_int, 3);
pub const SEEK_DATA = @as(c_int, 4);
pub const L_SET = SEEK_SET;
pub const L_INCR = SEEK_CUR;
pub const L_XTND = SEEK_END;
pub const ACCESSX_MAX_DESCRIPTORS = @as(c_int, 100);
pub const ACCESSX_MAX_TABLESIZE = @as(c_int, 16) * @as(c_int, 1024);
pub const _PC_LINK_MAX = @as(c_int, 1);
pub const _PC_MAX_CANON = @as(c_int, 2);
pub const _PC_MAX_INPUT = @as(c_int, 3);
pub const _PC_NAME_MAX = @as(c_int, 4);
pub const _PC_PATH_MAX = @as(c_int, 5);
pub const _PC_PIPE_BUF = @as(c_int, 6);
pub const _PC_CHOWN_RESTRICTED = @as(c_int, 7);
pub const _PC_NO_TRUNC = @as(c_int, 8);
pub const _PC_VDISABLE = @as(c_int, 9);
pub const _PC_NAME_CHARS_MAX = @as(c_int, 10);
pub const _PC_CASE_SENSITIVE = @as(c_int, 11);
pub const _PC_CASE_PRESERVING = @as(c_int, 12);
pub const _PC_EXTENDED_SECURITY_NP = @as(c_int, 13);
pub const _PC_AUTH_OPAQUE_NP = @as(c_int, 14);
pub const _PC_2_SYMLINKS = @as(c_int, 15);
pub const _PC_ALLOC_SIZE_MIN = @as(c_int, 16);
pub const _PC_ASYNC_IO = @as(c_int, 17);
pub const _PC_FILESIZEBITS = @as(c_int, 18);
pub const _PC_PRIO_IO = @as(c_int, 19);
pub const _PC_REC_INCR_XFER_SIZE = @as(c_int, 20);
pub const _PC_REC_MAX_XFER_SIZE = @as(c_int, 21);
pub const _PC_REC_MIN_XFER_SIZE = @as(c_int, 22);
pub const _PC_REC_XFER_ALIGN = @as(c_int, 23);
pub const _PC_SYMLINK_MAX = @as(c_int, 24);
pub const _PC_SYNC_IO = @as(c_int, 25);
pub const _PC_XATTR_SIZE_BITS = @as(c_int, 26);
pub const _PC_MIN_HOLE_SIZE = @as(c_int, 27);
pub const _CS_PATH = @as(c_int, 1);
pub const USE_CLANG_STDDEF = @as(c_int, 0);
pub const _SIZE_T = "";
pub const _SSIZE_T = "";
pub const _BSD_MACHINE_TYPES_H_ = "";
pub const _ARM_MACHTYPES_H_ = "";
pub const _MACHTYPES_H_ = "";
pub const _INT8_T = "";
pub const _INT16_T = "";
pub const _INT32_T = "";
pub const _INT64_T = "";
pub const _U_INT8_T = "";
pub const _U_INT16_T = "";
pub const _U_INT32_T = "";
pub const _U_INT64_T = "";
pub const _INTPTR_T = "";
pub const _UINTPTR_T = "";
pub const USER_ADDR_NULL = @import("std").zig.c_translation.cast(user_addr_t, @as(c_int, 0));
pub inline fn CAST_USER_ADDR_T(a_ptr: anytype) user_addr_t {
    _ = &a_ptr;
    return @import("std").zig.c_translation.cast(user_addr_t, @import("std").zig.c_translation.cast(usize, a_ptr));
}
pub const _UINT64_T = "";
pub const _UINT32_T = "";
pub const __AVAILABILITY__ = "";
pub const __API_TO_BE_DEPRECATED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_MACOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_MACOSAPPLICATIONEXTENSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_IOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_IOSAPPLICATIONEXTENSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_MACCATALYST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_MACCATALYSTAPPLICATIONEXTENSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_WATCHOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_WATCHOSAPPLICATIONEXTENSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_TVOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_TVOSAPPLICATIONEXTENSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_DRIVERKIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_VISIONOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_VISIONOSAPPLICATIONEXTENSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __API_TO_BE_DEPRECATED_KERNELKIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __AVAILABILITY_VERSIONS__ = "";
pub const __MAC_10_0 = @as(c_int, 1000);
pub const __MAC_10_1 = @as(c_int, 1010);
pub const __MAC_10_2 = @as(c_int, 1020);
pub const __MAC_10_3 = @as(c_int, 1030);
pub const __MAC_10_4 = @as(c_int, 1040);
pub const __MAC_10_5 = @as(c_int, 1050);
pub const __MAC_10_6 = @as(c_int, 1060);
pub const __MAC_10_7 = @as(c_int, 1070);
pub const __MAC_10_8 = @as(c_int, 1080);
pub const __MAC_10_9 = @as(c_int, 1090);
pub const __MAC_10_10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101000, .decimal);
pub const __MAC_10_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101002, .decimal);
pub const __MAC_10_10_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101003, .decimal);
pub const __MAC_10_11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101100, .decimal);
pub const __MAC_10_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101102, .decimal);
pub const __MAC_10_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101103, .decimal);
pub const __MAC_10_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101104, .decimal);
pub const __MAC_10_12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101200, .decimal);
pub const __MAC_10_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101201, .decimal);
pub const __MAC_10_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101202, .decimal);
pub const __MAC_10_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101204, .decimal);
pub const __MAC_10_13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101300, .decimal);
pub const __MAC_10_13_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101301, .decimal);
pub const __MAC_10_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101302, .decimal);
pub const __MAC_10_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101304, .decimal);
pub const __MAC_10_14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101400, .decimal);
pub const __MAC_10_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101401, .decimal);
pub const __MAC_10_14_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101404, .decimal);
pub const __MAC_10_14_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101405, .decimal);
pub const __MAC_10_14_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101406, .decimal);
pub const __MAC_10_15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101500, .decimal);
pub const __MAC_10_15_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101501, .decimal);
pub const __MAC_10_15_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101504, .decimal);
pub const __MAC_10_16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 101600, .decimal);
pub const __MAC_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const __MAC_11_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110100, .decimal);
pub const __MAC_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110300, .decimal);
pub const __MAC_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110400, .decimal);
pub const __MAC_11_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110500, .decimal);
pub const __MAC_11_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110600, .decimal);
pub const __MAC_12_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120000, .decimal);
pub const __MAC_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120100, .decimal);
pub const __MAC_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120200, .decimal);
pub const __MAC_12_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120300, .decimal);
pub const __MAC_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120400, .decimal);
pub const __MAC_12_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120500, .decimal);
pub const __MAC_12_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120600, .decimal);
pub const __MAC_12_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120700, .decimal);
pub const __MAC_13_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __MAC_13_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130100, .decimal);
pub const __MAC_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130200, .decimal);
pub const __MAC_13_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130300, .decimal);
pub const __MAC_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130400, .decimal);
pub const __MAC_13_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130500, .decimal);
pub const __MAC_13_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130600, .decimal);
pub const __MAC_13_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130700, .decimal);
pub const __MAC_14_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140000, .decimal);
pub const __MAC_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140100, .decimal);
pub const __MAC_14_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140200, .decimal);
pub const __MAC_14_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140300, .decimal);
pub const __MAC_14_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140400, .decimal);
pub const __MAC_14_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140500, .decimal);
pub const __MAC_14_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140600, .decimal);
pub const __MAC_14_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140700, .decimal);
pub const __MAC_15_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150000, .decimal);
pub const __MAC_15_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150100, .decimal);
pub const __MAC_15_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150200, .decimal);
pub const __MAC_15_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150300, .decimal);
pub const __MAC_15_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150400, .decimal);
pub const __MAC_15_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150500, .decimal);
pub const __IPHONE_2_0 = @as(c_int, 20000);
pub const __IPHONE_2_1 = @as(c_int, 20100);
pub const __IPHONE_2_2 = @as(c_int, 20200);
pub const __IPHONE_3_0 = @as(c_int, 30000);
pub const __IPHONE_3_1 = @as(c_int, 30100);
pub const __IPHONE_3_2 = @as(c_int, 30200);
pub const __IPHONE_4_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40000, .decimal);
pub const __IPHONE_4_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40100, .decimal);
pub const __IPHONE_4_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40200, .decimal);
pub const __IPHONE_4_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40300, .decimal);
pub const __IPHONE_5_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50000, .decimal);
pub const __IPHONE_5_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50100, .decimal);
pub const __IPHONE_6_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60000, .decimal);
pub const __IPHONE_6_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60100, .decimal);
pub const __IPHONE_7_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70000, .decimal);
pub const __IPHONE_7_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70100, .decimal);
pub const __IPHONE_8_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80000, .decimal);
pub const __IPHONE_8_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80100, .decimal);
pub const __IPHONE_8_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80200, .decimal);
pub const __IPHONE_8_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80300, .decimal);
pub const __IPHONE_8_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80400, .decimal);
pub const __IPHONE_9_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90000, .decimal);
pub const __IPHONE_9_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90100, .decimal);
pub const __IPHONE_9_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90200, .decimal);
pub const __IPHONE_9_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90300, .decimal);
pub const __IPHONE_10_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __IPHONE_10_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100100, .decimal);
pub const __IPHONE_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100200, .decimal);
pub const __IPHONE_10_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100300, .decimal);
pub const __IPHONE_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const __IPHONE_11_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110100, .decimal);
pub const __IPHONE_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110200, .decimal);
pub const __IPHONE_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110300, .decimal);
pub const __IPHONE_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110400, .decimal);
pub const __IPHONE_12_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120000, .decimal);
pub const __IPHONE_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120100, .decimal);
pub const __IPHONE_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120200, .decimal);
pub const __IPHONE_12_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120300, .decimal);
pub const __IPHONE_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120400, .decimal);
pub const __IPHONE_13_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __IPHONE_13_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130100, .decimal);
pub const __IPHONE_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130200, .decimal);
pub const __IPHONE_13_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130300, .decimal);
pub const __IPHONE_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130400, .decimal);
pub const __IPHONE_13_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130500, .decimal);
pub const __IPHONE_13_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130600, .decimal);
pub const __IPHONE_13_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130700, .decimal);
pub const __IPHONE_14_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140000, .decimal);
pub const __IPHONE_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140100, .decimal);
pub const __IPHONE_14_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140200, .decimal);
pub const __IPHONE_14_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140300, .decimal);
pub const __IPHONE_14_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140500, .decimal);
pub const __IPHONE_14_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140400, .decimal);
pub const __IPHONE_14_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140600, .decimal);
pub const __IPHONE_14_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140700, .decimal);
pub const __IPHONE_14_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140800, .decimal);
pub const __IPHONE_15_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150000, .decimal);
pub const __IPHONE_15_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150100, .decimal);
pub const __IPHONE_15_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150200, .decimal);
pub const __IPHONE_15_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150300, .decimal);
pub const __IPHONE_15_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150400, .decimal);
pub const __IPHONE_15_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150500, .decimal);
pub const __IPHONE_15_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150600, .decimal);
pub const __IPHONE_15_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150700, .decimal);
pub const __IPHONE_15_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150800, .decimal);
pub const __IPHONE_16_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160000, .decimal);
pub const __IPHONE_16_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160100, .decimal);
pub const __IPHONE_16_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160200, .decimal);
pub const __IPHONE_16_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160300, .decimal);
pub const __IPHONE_16_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160400, .decimal);
pub const __IPHONE_16_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160500, .decimal);
pub const __IPHONE_16_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160600, .decimal);
pub const __IPHONE_16_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160700, .decimal);
pub const __IPHONE_17_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170000, .decimal);
pub const __IPHONE_17_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170100, .decimal);
pub const __IPHONE_17_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170200, .decimal);
pub const __IPHONE_17_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170300, .decimal);
pub const __IPHONE_17_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170400, .decimal);
pub const __IPHONE_17_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170500, .decimal);
pub const __IPHONE_17_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170600, .decimal);
pub const __IPHONE_17_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170700, .decimal);
pub const __IPHONE_18_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180000, .decimal);
pub const __IPHONE_18_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180100, .decimal);
pub const __IPHONE_18_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180200, .decimal);
pub const __IPHONE_18_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180300, .decimal);
pub const __IPHONE_18_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180400, .decimal);
pub const __IPHONE_18_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180500, .decimal);
pub const __WATCHOS_1_0 = @as(c_int, 10000);
pub const __WATCHOS_2_0 = @as(c_int, 20000);
pub const __WATCHOS_2_1 = @as(c_int, 20100);
pub const __WATCHOS_2_2 = @as(c_int, 20200);
pub const __WATCHOS_3_0 = @as(c_int, 30000);
pub const __WATCHOS_3_1 = @as(c_int, 30100);
pub const __WATCHOS_3_1_1 = @as(c_int, 30101);
pub const __WATCHOS_3_2 = @as(c_int, 30200);
pub const __WATCHOS_4_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40000, .decimal);
pub const __WATCHOS_4_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40100, .decimal);
pub const __WATCHOS_4_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40200, .decimal);
pub const __WATCHOS_4_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40300, .decimal);
pub const __WATCHOS_5_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50000, .decimal);
pub const __WATCHOS_5_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50100, .decimal);
pub const __WATCHOS_5_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50200, .decimal);
pub const __WATCHOS_5_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50300, .decimal);
pub const __WATCHOS_6_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60000, .decimal);
pub const __WATCHOS_6_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60100, .decimal);
pub const __WATCHOS_6_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60200, .decimal);
pub const __WATCHOS_7_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70000, .decimal);
pub const __WATCHOS_7_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70100, .decimal);
pub const __WATCHOS_7_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70200, .decimal);
pub const __WATCHOS_7_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70300, .decimal);
pub const __WATCHOS_7_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70400, .decimal);
pub const __WATCHOS_7_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70500, .decimal);
pub const __WATCHOS_7_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70600, .decimal);
pub const __WATCHOS_8_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80000, .decimal);
pub const __WATCHOS_8_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80100, .decimal);
pub const __WATCHOS_8_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80300, .decimal);
pub const __WATCHOS_8_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80400, .decimal);
pub const __WATCHOS_8_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80500, .decimal);
pub const __WATCHOS_8_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80600, .decimal);
pub const __WATCHOS_8_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80700, .decimal);
pub const __WATCHOS_8_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80800, .decimal);
pub const __WATCHOS_9_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90000, .decimal);
pub const __WATCHOS_9_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90100, .decimal);
pub const __WATCHOS_9_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90200, .decimal);
pub const __WATCHOS_9_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90300, .decimal);
pub const __WATCHOS_9_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90400, .decimal);
pub const __WATCHOS_9_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90500, .decimal);
pub const __WATCHOS_9_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90600, .decimal);
pub const __WATCHOS_10_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __WATCHOS_10_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100100, .decimal);
pub const __WATCHOS_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100200, .decimal);
pub const __WATCHOS_10_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100300, .decimal);
pub const __WATCHOS_10_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100400, .decimal);
pub const __WATCHOS_10_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100500, .decimal);
pub const __WATCHOS_10_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100600, .decimal);
pub const __WATCHOS_10_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100700, .decimal);
pub const __WATCHOS_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const __WATCHOS_11_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110100, .decimal);
pub const __WATCHOS_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110200, .decimal);
pub const __WATCHOS_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110300, .decimal);
pub const __WATCHOS_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110400, .decimal);
pub const __WATCHOS_11_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110500, .decimal);
pub const __TVOS_9_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90000, .decimal);
pub const __TVOS_9_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90100, .decimal);
pub const __TVOS_9_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90200, .decimal);
pub const __TVOS_10_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const __TVOS_10_0_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100001, .decimal);
pub const __TVOS_10_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100100, .decimal);
pub const __TVOS_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100200, .decimal);
pub const __TVOS_11_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110000, .decimal);
pub const __TVOS_11_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110100, .decimal);
pub const __TVOS_11_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110200, .decimal);
pub const __TVOS_11_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110300, .decimal);
pub const __TVOS_11_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 110400, .decimal);
pub const __TVOS_12_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120000, .decimal);
pub const __TVOS_12_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120100, .decimal);
pub const __TVOS_12_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120200, .decimal);
pub const __TVOS_12_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120300, .decimal);
pub const __TVOS_12_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 120400, .decimal);
pub const __TVOS_13_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130000, .decimal);
pub const __TVOS_13_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130200, .decimal);
pub const __TVOS_13_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130300, .decimal);
pub const __TVOS_13_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 130400, .decimal);
pub const __TVOS_14_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140000, .decimal);
pub const __TVOS_14_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140100, .decimal);
pub const __TVOS_14_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140200, .decimal);
pub const __TVOS_14_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140300, .decimal);
pub const __TVOS_14_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140500, .decimal);
pub const __TVOS_14_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140600, .decimal);
pub const __TVOS_14_7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 140700, .decimal);
pub const __TVOS_15_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150000, .decimal);
pub const __TVOS_15_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150100, .decimal);
pub const __TVOS_15_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150200, .decimal);
pub const __TVOS_15_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150300, .decimal);
pub const __TVOS_15_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150400, .decimal);
pub const __TVOS_15_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150500, .decimal);
pub const __TVOS_15_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 150600, .decimal);
pub const __TVOS_16_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160000, .decimal);
pub const __TVOS_16_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160100, .decimal);
pub const __TVOS_16_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160200, .decimal);
pub const __TVOS_16_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160300, .decimal);
pub const __TVOS_16_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160400, .decimal);
pub const __TVOS_16_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160500, .decimal);
pub const __TVOS_16_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 160600, .decimal);
pub const __TVOS_17_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170000, .decimal);
pub const __TVOS_17_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170100, .decimal);
pub const __TVOS_17_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170200, .decimal);
pub const __TVOS_17_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170300, .decimal);
pub const __TVOS_17_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170400, .decimal);
pub const __TVOS_17_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170500, .decimal);
pub const __TVOS_17_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 170600, .decimal);
pub const __TVOS_18_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180000, .decimal);
pub const __TVOS_18_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180100, .decimal);
pub const __TVOS_18_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180200, .decimal);
pub const __TVOS_18_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180300, .decimal);
pub const __TVOS_18_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180400, .decimal);
pub const __TVOS_18_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 180500, .decimal);
pub const __BRIDGEOS_2_0 = @as(c_int, 20000);
pub const __BRIDGEOS_3_0 = @as(c_int, 30000);
pub const __BRIDGEOS_3_1 = @as(c_int, 30100);
pub const __BRIDGEOS_3_4 = @as(c_int, 30400);
pub const __BRIDGEOS_4_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40000, .decimal);
pub const __BRIDGEOS_4_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 40100, .decimal);
pub const __BRIDGEOS_5_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50000, .decimal);
pub const __BRIDGEOS_5_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50100, .decimal);
pub const __BRIDGEOS_5_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 50300, .decimal);
pub const __BRIDGEOS_6_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60000, .decimal);
pub const __BRIDGEOS_6_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60200, .decimal);
pub const __BRIDGEOS_6_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60400, .decimal);
pub const __BRIDGEOS_6_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60500, .decimal);
pub const __BRIDGEOS_6_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60600, .decimal);
pub const __BRIDGEOS_7_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70000, .decimal);
pub const __BRIDGEOS_7_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70100, .decimal);
pub const __BRIDGEOS_7_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70200, .decimal);
pub const __BRIDGEOS_7_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70300, .decimal);
pub const __BRIDGEOS_7_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70400, .decimal);
pub const __BRIDGEOS_7_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 70600, .decimal);
pub const __BRIDGEOS_8_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80000, .decimal);
pub const __BRIDGEOS_8_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80100, .decimal);
pub const __BRIDGEOS_8_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80200, .decimal);
pub const __BRIDGEOS_8_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80300, .decimal);
pub const __BRIDGEOS_8_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80400, .decimal);
pub const __BRIDGEOS_8_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80500, .decimal);
pub const __BRIDGEOS_8_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 80600, .decimal);
pub const __BRIDGEOS_9_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90000, .decimal);
pub const __BRIDGEOS_9_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90100, .decimal);
pub const __BRIDGEOS_9_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90200, .decimal);
pub const __BRIDGEOS_9_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90300, .decimal);
pub const __BRIDGEOS_9_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90400, .decimal);
pub const __BRIDGEOS_9_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 90500, .decimal);
pub const __DRIVERKIT_19_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 190000, .decimal);
pub const __DRIVERKIT_20_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 200000, .decimal);
pub const __DRIVERKIT_21_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 210000, .decimal);
pub const __DRIVERKIT_22_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 220000, .decimal);
pub const __DRIVERKIT_22_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 220400, .decimal);
pub const __DRIVERKIT_22_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 220500, .decimal);
pub const __DRIVERKIT_22_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 220600, .decimal);
pub const __DRIVERKIT_23_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230000, .decimal);
pub const __DRIVERKIT_23_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230100, .decimal);
pub const __DRIVERKIT_23_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230200, .decimal);
pub const __DRIVERKIT_23_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230300, .decimal);
pub const __DRIVERKIT_23_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230400, .decimal);
pub const __DRIVERKIT_23_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230500, .decimal);
pub const __DRIVERKIT_23_6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 230600, .decimal);
pub const __DRIVERKIT_24_0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240000, .decimal);
pub const __DRIVERKIT_24_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240100, .decimal);
pub const __DRIVERKIT_24_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240200, .decimal);
pub const __DRIVERKIT_24_3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240300, .decimal);
pub const __DRIVERKIT_24_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240400, .decimal);
pub const __DRIVERKIT_24_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 240500, .decimal);
pub const __VISIONOS_1_0 = @as(c_int, 10000);
pub const __VISIONOS_1_1 = @as(c_int, 10100);
pub const __VISIONOS_1_2 = @as(c_int, 10200);
pub const __VISIONOS_1_3 = @as(c_int, 10300);
pub const __VISIONOS_2_0 = @as(c_int, 20000);
pub const __VISIONOS_2_1 = @as(c_int, 20100);
pub const __VISIONOS_2_2 = @as(c_int, 20200);
pub const __VISIONOS_2_3 = @as(c_int, 20300);
pub const __VISIONOS_2_4 = @as(c_int, 20400);
pub const __VISIONOS_2_5 = @as(c_int, 20500);
pub const MAC_OS_X_VERSION_10_0 = __MAC_10_0;
pub const MAC_OS_X_VERSION_10_1 = __MAC_10_1;
pub const MAC_OS_X_VERSION_10_2 = __MAC_10_2;
pub const MAC_OS_X_VERSION_10_3 = __MAC_10_3;
pub const MAC_OS_X_VERSION_10_4 = __MAC_10_4;
pub const MAC_OS_X_VERSION_10_5 = __MAC_10_5;
pub const MAC_OS_X_VERSION_10_6 = __MAC_10_6;
pub const MAC_OS_X_VERSION_10_7 = __MAC_10_7;
pub const MAC_OS_X_VERSION_10_8 = __MAC_10_8;
pub const MAC_OS_X_VERSION_10_9 = __MAC_10_9;
pub const MAC_OS_X_VERSION_10_10 = __MAC_10_10;
pub const MAC_OS_X_VERSION_10_10_2 = __MAC_10_10_2;
pub const MAC_OS_X_VERSION_10_10_3 = __MAC_10_10_3;
pub const MAC_OS_X_VERSION_10_11 = __MAC_10_11;
pub const MAC_OS_X_VERSION_10_11_2 = __MAC_10_11_2;
pub const MAC_OS_X_VERSION_10_11_3 = __MAC_10_11_3;
pub const MAC_OS_X_VERSION_10_11_4 = __MAC_10_11_4;
pub const MAC_OS_X_VERSION_10_12 = __MAC_10_12;
pub const MAC_OS_X_VERSION_10_12_1 = __MAC_10_12_1;
pub const MAC_OS_X_VERSION_10_12_2 = __MAC_10_12_2;
pub const MAC_OS_X_VERSION_10_12_4 = __MAC_10_12_4;
pub const MAC_OS_X_VERSION_10_13 = __MAC_10_13;
pub const MAC_OS_X_VERSION_10_13_1 = __MAC_10_13_1;
pub const MAC_OS_X_VERSION_10_13_2 = __MAC_10_13_2;
pub const MAC_OS_X_VERSION_10_13_4 = __MAC_10_13_4;
pub const MAC_OS_X_VERSION_10_14 = __MAC_10_14;
pub const MAC_OS_X_VERSION_10_14_1 = __MAC_10_14_1;
pub const MAC_OS_X_VERSION_10_14_4 = __MAC_10_14_4;
pub const MAC_OS_X_VERSION_10_14_5 = __MAC_10_14_5;
pub const MAC_OS_X_VERSION_10_14_6 = __MAC_10_14_6;
pub const MAC_OS_X_VERSION_10_15 = __MAC_10_15;
pub const MAC_OS_X_VERSION_10_15_1 = __MAC_10_15_1;
pub const MAC_OS_X_VERSION_10_15_4 = __MAC_10_15_4;
pub const MAC_OS_X_VERSION_10_16 = __MAC_10_16;
pub const MAC_OS_VERSION_11_0 = __MAC_11_0;
pub const MAC_OS_VERSION_11_1 = __MAC_11_1;
pub const MAC_OS_VERSION_11_3 = __MAC_11_3;
pub const MAC_OS_VERSION_11_4 = __MAC_11_4;
pub const MAC_OS_VERSION_11_5 = __MAC_11_5;
pub const MAC_OS_VERSION_11_6 = __MAC_11_6;
pub const MAC_OS_VERSION_12_0 = __MAC_12_0;
pub const MAC_OS_VERSION_12_1 = __MAC_12_1;
pub const MAC_OS_VERSION_12_2 = __MAC_12_2;
pub const MAC_OS_VERSION_12_3 = __MAC_12_3;
pub const MAC_OS_VERSION_12_4 = __MAC_12_4;
pub const MAC_OS_VERSION_12_5 = __MAC_12_5;
pub const MAC_OS_VERSION_12_6 = __MAC_12_6;
pub const MAC_OS_VERSION_12_7 = __MAC_12_7;
pub const MAC_OS_VERSION_13_0 = __MAC_13_0;
pub const MAC_OS_VERSION_13_1 = __MAC_13_1;
pub const MAC_OS_VERSION_13_2 = __MAC_13_2;
pub const MAC_OS_VERSION_13_3 = __MAC_13_3;
pub const MAC_OS_VERSION_13_4 = __MAC_13_4;
pub const MAC_OS_VERSION_13_5 = __MAC_13_5;
pub const MAC_OS_VERSION_13_6 = __MAC_13_6;
pub const MAC_OS_VERSION_13_7 = __MAC_13_7;
pub const MAC_OS_VERSION_14_0 = __MAC_14_0;
pub const MAC_OS_VERSION_14_1 = __MAC_14_1;
pub const MAC_OS_VERSION_14_2 = __MAC_14_2;
pub const MAC_OS_VERSION_14_3 = __MAC_14_3;
pub const MAC_OS_VERSION_14_4 = __MAC_14_4;
pub const MAC_OS_VERSION_14_5 = __MAC_14_5;
pub const MAC_OS_VERSION_14_6 = __MAC_14_6;
pub const MAC_OS_VERSION_14_7 = __MAC_14_7;
pub const MAC_OS_VERSION_15_0 = __MAC_15_0;
pub const MAC_OS_VERSION_15_1 = __MAC_15_1;
pub const MAC_OS_VERSION_15_2 = __MAC_15_2;
pub const MAC_OS_VERSION_15_3 = __MAC_15_3;
pub const MAC_OS_VERSION_15_4 = __MAC_15_4;
pub const MAC_OS_VERSION_15_5 = __MAC_15_5;
pub const __AVAILABILITY_VERSIONS_VERSION_HASH = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 93585900, .decimal);
pub const __AVAILABILITY_VERSIONS_VERSION_STRING = "Local";
pub const __AVAILABILITY_FILE = "AvailabilityVersions.h";
pub const __AVAILABILITY_INTERNAL__ = "";
pub const __MAC_OS_X_VERSION_MIN_REQUIRED = __ENVIRONMENT_OS_VERSION_MIN_REQUIRED__;
pub const __MAC_OS_X_VERSION_MAX_ALLOWED = __MAC_15_5;
pub const __AVAILABILITY_INTERNAL_DEPRECATED = @compileError("unable to translate macro: undefined identifier `deprecated`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:130:9
pub const __AVAILABILITY_INTERNAL_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `deprecated`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:133:17
pub const __AVAILABILITY_INTERNAL_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `unavailable`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:142:9
pub const __AVAILABILITY_INTERNAL_WEAK_IMPORT = @compileError("unable to translate macro: undefined identifier `weak_import`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:143:9
pub const __AVAILABILITY_INTERNAL_REGULAR = "";
pub const __API_AVAILABLE_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:148:12
pub const __API_DEPRECATED_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:149:12
pub const __API_OBSOLETED_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:150:12
pub const __API_UNAVAILABLE_PLATFORM_macos = @compileError("unable to translate macro: undefined identifier `macos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:151:12
pub const __API_AVAILABLE_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:152:12
pub const __API_DEPRECATED_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:153:12
pub const __API_OBSOLETED_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:154:12
pub const __API_UNAVAILABLE_PLATFORM_macosx = @compileError("unable to translate macro: undefined identifier `macos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:155:12
pub const __API_AVAILABLE_PLATFORM_macOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `macOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:156:12
pub const __API_DEPRECATED_PLATFORM_macOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `macOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:157:12
pub const __API_OBSOLETED_PLATFORM_macOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `macOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:158:12
pub const __API_UNAVAILABLE_PLATFORM_macOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `macOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:159:12
pub const __API_AVAILABLE_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:160:12
pub const __API_DEPRECATED_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:161:12
pub const __API_OBSOLETED_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:162:12
pub const __API_UNAVAILABLE_PLATFORM_ios = @compileError("unable to translate macro: undefined identifier `ios`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:163:12
pub const __API_AVAILABLE_PLATFORM_iOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `iOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:164:12
pub const __API_DEPRECATED_PLATFORM_iOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `iOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:165:12
pub const __API_OBSOLETED_PLATFORM_iOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `iOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:166:12
pub const __API_UNAVAILABLE_PLATFORM_iOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `iOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:167:12
pub const __API_AVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:168:12
pub const __API_DEPRECATED_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:169:12
pub const __API_OBSOLETED_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:170:12
pub const __API_UNAVAILABLE_PLATFORM_macCatalyst = @compileError("unable to translate macro: undefined identifier `macCatalyst`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:171:12
pub const __API_AVAILABLE_PLATFORM_macCatalystApplicationExtension = @compileError("unable to translate macro: undefined identifier `macCatalystApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:172:12
pub const __API_DEPRECATED_PLATFORM_macCatalystApplicationExtension = @compileError("unable to translate macro: undefined identifier `macCatalystApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:173:12
pub const __API_OBSOLETED_PLATFORM_macCatalystApplicationExtension = @compileError("unable to translate macro: undefined identifier `macCatalystApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:174:12
pub const __API_UNAVAILABLE_PLATFORM_macCatalystApplicationExtension = @compileError("unable to translate macro: undefined identifier `macCatalystApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:175:12
pub const __API_AVAILABLE_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:176:12
pub const __API_DEPRECATED_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:177:12
pub const __API_OBSOLETED_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:178:12
pub const __API_UNAVAILABLE_PLATFORM_watchos = @compileError("unable to translate macro: undefined identifier `watchos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:179:12
pub const __API_AVAILABLE_PLATFORM_watchOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `watchOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:180:12
pub const __API_DEPRECATED_PLATFORM_watchOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `watchOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:181:12
pub const __API_OBSOLETED_PLATFORM_watchOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `watchOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:182:12
pub const __API_UNAVAILABLE_PLATFORM_watchOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `watchOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:183:12
pub const __API_AVAILABLE_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:184:12
pub const __API_DEPRECATED_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:185:12
pub const __API_OBSOLETED_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:186:12
pub const __API_UNAVAILABLE_PLATFORM_tvos = @compileError("unable to translate macro: undefined identifier `tvos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:187:12
pub const __API_AVAILABLE_PLATFORM_tvOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `tvOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:188:12
pub const __API_DEPRECATED_PLATFORM_tvOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `tvOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:189:12
pub const __API_OBSOLETED_PLATFORM_tvOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `tvOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:190:12
pub const __API_UNAVAILABLE_PLATFORM_tvOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `tvOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:191:12
pub const __API_AVAILABLE_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:193:12
pub const __API_DEPRECATED_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:194:12
pub const __API_OBSOLETED_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:195:12
pub const __API_UNAVAILABLE_PLATFORM_driverkit = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:196:12
pub const __API_AVAILABLE_PLATFORM_visionos = @compileError("unable to translate macro: undefined identifier `visionos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:197:12
pub const __API_DEPRECATED_PLATFORM_visionos = @compileError("unable to translate macro: undefined identifier `visionos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:198:12
pub const __API_OBSOLETED_PLATFORM_visionos = @compileError("unable to translate macro: undefined identifier `visionos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:199:12
pub const __API_UNAVAILABLE_PLATFORM_visionos = @compileError("unable to translate macro: undefined identifier `visionos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:200:12
pub const __API_AVAILABLE_PLATFORM_visionOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `visionOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:201:12
pub const __API_DEPRECATED_PLATFORM_visionOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `visionOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:202:12
pub const __API_OBSOLETED_PLATFORM_visionOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `visionOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:203:12
pub const __API_UNAVAILABLE_PLATFORM_visionOSApplicationExtension = @compileError("unable to translate macro: undefined identifier `visionOSApplicationExtension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:204:12
pub const __API_UNAVAILABLE_PLATFORM_kernelkit = @compileError("unable to translate macro: undefined identifier `kernelkit`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:206:12
pub const __API_APPLY_TO = @compileError("unable to translate macro: undefined identifier `any`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:216:11
pub inline fn __API_RANGE_STRINGIFY(x: anytype) @TypeOf(__API_RANGE_STRINGIFY2(x)) {
    _ = &x;
    return __API_RANGE_STRINGIFY2(x);
}
pub const __API_RANGE_STRINGIFY2 = @compileError("unable to translate C expr: unexpected token '#'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:218:11
pub const __API_A = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:232:13
pub inline fn __API_AVAILABLE0(arg0: anytype) @TypeOf(__API_A(arg0)) {
    _ = &arg0;
    return __API_A(arg0);
}
pub inline fn __API_AVAILABLE1(arg0: anytype, arg1: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1)) {
    _ = &arg0;
    _ = &arg1;
    return __API_A(arg0) ++ __API_A(arg1);
}
pub inline fn __API_AVAILABLE2(arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2);
}
pub inline fn __API_AVAILABLE3(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3);
}
pub inline fn __API_AVAILABLE4(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4);
}
pub inline fn __API_AVAILABLE5(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5);
}
pub inline fn __API_AVAILABLE6(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6);
}
pub inline fn __API_AVAILABLE7(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7);
}
pub inline fn __API_AVAILABLE8(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8);
}
pub inline fn __API_AVAILABLE9(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9);
}
pub inline fn __API_AVAILABLE10(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10);
}
pub inline fn __API_AVAILABLE11(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11);
}
pub inline fn __API_AVAILABLE12(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12);
}
pub inline fn __API_AVAILABLE13(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13);
}
pub inline fn __API_AVAILABLE14(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13) ++ __API_A(arg14)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13) ++ __API_A(arg14);
}
pub inline fn __API_AVAILABLE15(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13) ++ __API_A(arg14) ++ __API_A(arg15)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_A(arg0) ++ __API_A(arg1) ++ __API_A(arg2) ++ __API_A(arg3) ++ __API_A(arg4) ++ __API_A(arg5) ++ __API_A(arg6) ++ __API_A(arg7) ++ __API_A(arg8) ++ __API_A(arg9) ++ __API_A(arg10) ++ __API_A(arg11) ++ __API_A(arg12) ++ __API_A(arg13) ++ __API_A(arg14) ++ __API_A(arg15);
}
pub const __API_AVAILABLE_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:250:13
pub const __API_A_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:252:13
pub inline fn __API_AVAILABLE_BEGIN0(arg0: anytype) @TypeOf(__API_A_BEGIN(arg0)) {
    _ = &arg0;
    return __API_A_BEGIN(arg0);
}
pub inline fn __API_AVAILABLE_BEGIN1(arg0: anytype, arg1: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1)) {
    _ = &arg0;
    _ = &arg1;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1);
}
pub inline fn __API_AVAILABLE_BEGIN2(arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2);
}
pub inline fn __API_AVAILABLE_BEGIN3(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3);
}
pub inline fn __API_AVAILABLE_BEGIN4(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4);
}
pub inline fn __API_AVAILABLE_BEGIN5(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5);
}
pub inline fn __API_AVAILABLE_BEGIN6(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6);
}
pub inline fn __API_AVAILABLE_BEGIN7(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7);
}
pub inline fn __API_AVAILABLE_BEGIN8(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8);
}
pub inline fn __API_AVAILABLE_BEGIN9(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9);
}
pub inline fn __API_AVAILABLE_BEGIN10(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10);
}
pub inline fn __API_AVAILABLE_BEGIN11(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11);
}
pub inline fn __API_AVAILABLE_BEGIN12(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12);
}
pub inline fn __API_AVAILABLE_BEGIN13(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13);
}
pub inline fn __API_AVAILABLE_BEGIN14(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13) ++ __API_A_BEGIN(arg14)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13) ++ __API_A_BEGIN(arg14);
}
pub inline fn __API_AVAILABLE_BEGIN15(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13) ++ __API_A_BEGIN(arg14) ++ __API_A_BEGIN(arg15)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_A_BEGIN(arg0) ++ __API_A_BEGIN(arg1) ++ __API_A_BEGIN(arg2) ++ __API_A_BEGIN(arg3) ++ __API_A_BEGIN(arg4) ++ __API_A_BEGIN(arg5) ++ __API_A_BEGIN(arg6) ++ __API_A_BEGIN(arg7) ++ __API_A_BEGIN(arg8) ++ __API_A_BEGIN(arg9) ++ __API_A_BEGIN(arg10) ++ __API_A_BEGIN(arg11) ++ __API_A_BEGIN(arg12) ++ __API_A_BEGIN(arg13) ++ __API_A_BEGIN(arg14) ++ __API_A_BEGIN(arg15);
}
pub const __API_AVAILABLE_BEGIN_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:270:13
pub const __API_D = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:274:13
pub inline fn __API_DEPRECATED_MSG0(msg: anytype, arg0: anytype) @TypeOf(__API_D(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_D(msg, arg0);
}
pub inline fn __API_DEPRECATED_MSG1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1);
}
pub inline fn __API_DEPRECATED_MSG2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2);
}
pub inline fn __API_DEPRECATED_MSG3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3);
}
pub inline fn __API_DEPRECATED_MSG4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4);
}
pub inline fn __API_DEPRECATED_MSG5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5);
}
pub inline fn __API_DEPRECATED_MSG6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6);
}
pub inline fn __API_DEPRECATED_MSG7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7);
}
pub inline fn __API_DEPRECATED_MSG8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8);
}
pub inline fn __API_DEPRECATED_MSG9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9);
}
pub inline fn __API_DEPRECATED_MSG10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10);
}
pub inline fn __API_DEPRECATED_MSG11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11);
}
pub inline fn __API_DEPRECATED_MSG12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12);
}
pub inline fn __API_DEPRECATED_MSG13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13);
}
pub inline fn __API_DEPRECATED_MSG14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13) ++ __API_D(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13) ++ __API_D(msg, arg14);
}
pub inline fn __API_DEPRECATED_MSG15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13) ++ __API_D(msg, arg14) ++ __API_D(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_D(msg, arg0) ++ __API_D(msg, arg1) ++ __API_D(msg, arg2) ++ __API_D(msg, arg3) ++ __API_D(msg, arg4) ++ __API_D(msg, arg5) ++ __API_D(msg, arg6) ++ __API_D(msg, arg7) ++ __API_D(msg, arg8) ++ __API_D(msg, arg9) ++ __API_D(msg, arg10) ++ __API_D(msg, arg11) ++ __API_D(msg, arg12) ++ __API_D(msg, arg13) ++ __API_D(msg, arg14) ++ __API_D(msg, arg15);
}
pub const __API_DEPRECATED_MSG_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:292:13
pub const __API_D_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:294:13
pub inline fn __API_DEPRECATED_BEGIN0(msg: anytype, arg0: anytype) @TypeOf(__API_D_BEGIN(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_D_BEGIN(msg, arg0);
}
pub inline fn __API_DEPRECATED_BEGIN1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1);
}
pub inline fn __API_DEPRECATED_BEGIN2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2);
}
pub inline fn __API_DEPRECATED_BEGIN3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3);
}
pub inline fn __API_DEPRECATED_BEGIN4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4);
}
pub inline fn __API_DEPRECATED_BEGIN5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5);
}
pub inline fn __API_DEPRECATED_BEGIN6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6);
}
pub inline fn __API_DEPRECATED_BEGIN7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7);
}
pub inline fn __API_DEPRECATED_BEGIN8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8);
}
pub inline fn __API_DEPRECATED_BEGIN9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9);
}
pub inline fn __API_DEPRECATED_BEGIN10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10);
}
pub inline fn __API_DEPRECATED_BEGIN11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11);
}
pub inline fn __API_DEPRECATED_BEGIN12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12);
}
pub inline fn __API_DEPRECATED_BEGIN13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13);
}
pub inline fn __API_DEPRECATED_BEGIN14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13) ++ __API_D_BEGIN(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13) ++ __API_D_BEGIN(msg, arg14);
}
pub inline fn __API_DEPRECATED_BEGIN15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13) ++ __API_D_BEGIN(msg, arg14) ++ __API_D_BEGIN(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_D_BEGIN(msg, arg0) ++ __API_D_BEGIN(msg, arg1) ++ __API_D_BEGIN(msg, arg2) ++ __API_D_BEGIN(msg, arg3) ++ __API_D_BEGIN(msg, arg4) ++ __API_D_BEGIN(msg, arg5) ++ __API_D_BEGIN(msg, arg6) ++ __API_D_BEGIN(msg, arg7) ++ __API_D_BEGIN(msg, arg8) ++ __API_D_BEGIN(msg, arg9) ++ __API_D_BEGIN(msg, arg10) ++ __API_D_BEGIN(msg, arg11) ++ __API_D_BEGIN(msg, arg12) ++ __API_D_BEGIN(msg, arg13) ++ __API_D_BEGIN(msg, arg14) ++ __API_D_BEGIN(msg, arg15);
}
pub const __API_DEPRECATED_BEGIN_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:312:13
pub const __API_DR = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:315:17
pub inline fn __API_DEPRECATED_REP0(msg: anytype, arg0: anytype) @TypeOf(__API_DR(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_DR(msg, arg0);
}
pub inline fn __API_DEPRECATED_REP1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1);
}
pub inline fn __API_DEPRECATED_REP2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2);
}
pub inline fn __API_DEPRECATED_REP3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3);
}
pub inline fn __API_DEPRECATED_REP4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4);
}
pub inline fn __API_DEPRECATED_REP5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5);
}
pub inline fn __API_DEPRECATED_REP6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6);
}
pub inline fn __API_DEPRECATED_REP7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7);
}
pub inline fn __API_DEPRECATED_REP8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8);
}
pub inline fn __API_DEPRECATED_REP9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9);
}
pub inline fn __API_DEPRECATED_REP10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10);
}
pub inline fn __API_DEPRECATED_REP11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11);
}
pub inline fn __API_DEPRECATED_REP12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12);
}
pub inline fn __API_DEPRECATED_REP13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13);
}
pub inline fn __API_DEPRECATED_REP14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13) ++ __API_DR(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13) ++ __API_DR(msg, arg14);
}
pub inline fn __API_DEPRECATED_REP15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13) ++ __API_DR(msg, arg14) ++ __API_DR(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_DR(msg, arg0) ++ __API_DR(msg, arg1) ++ __API_DR(msg, arg2) ++ __API_DR(msg, arg3) ++ __API_DR(msg, arg4) ++ __API_DR(msg, arg5) ++ __API_DR(msg, arg6) ++ __API_DR(msg, arg7) ++ __API_DR(msg, arg8) ++ __API_DR(msg, arg9) ++ __API_DR(msg, arg10) ++ __API_DR(msg, arg11) ++ __API_DR(msg, arg12) ++ __API_DR(msg, arg13) ++ __API_DR(msg, arg14) ++ __API_DR(msg, arg15);
}
pub const __API_DEPRECATED_REP_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:336:13
pub const __API_DR_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:339:17
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN0(msg: anytype, arg0: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_DR_BEGIN(msg, arg0);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13) ++ __API_DR_BEGIN(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13) ++ __API_DR_BEGIN(msg, arg14);
}
pub inline fn __API_DEPRECATED_WITH_REPLACEMENT_BEGIN15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13) ++ __API_DR_BEGIN(msg, arg14) ++ __API_DR_BEGIN(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_DR_BEGIN(msg, arg0) ++ __API_DR_BEGIN(msg, arg1) ++ __API_DR_BEGIN(msg, arg2) ++ __API_DR_BEGIN(msg, arg3) ++ __API_DR_BEGIN(msg, arg4) ++ __API_DR_BEGIN(msg, arg5) ++ __API_DR_BEGIN(msg, arg6) ++ __API_DR_BEGIN(msg, arg7) ++ __API_DR_BEGIN(msg, arg8) ++ __API_DR_BEGIN(msg, arg9) ++ __API_DR_BEGIN(msg, arg10) ++ __API_DR_BEGIN(msg, arg11) ++ __API_DR_BEGIN(msg, arg12) ++ __API_DR_BEGIN(msg, arg13) ++ __API_DR_BEGIN(msg, arg14) ++ __API_DR_BEGIN(msg, arg15);
}
pub const __API_DEPRECATED_WITH_REPLACEMENT_BEGIN_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:360:13
pub const __API_O = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:364:9
pub inline fn __API_OBSOLETED_MSG0(msg: anytype, arg0: anytype) @TypeOf(__API_O(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_O(msg, arg0);
}
pub inline fn __API_OBSOLETED_MSG1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1);
}
pub inline fn __API_OBSOLETED_MSG2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2);
}
pub inline fn __API_OBSOLETED_MSG3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3);
}
pub inline fn __API_OBSOLETED_MSG4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4);
}
pub inline fn __API_OBSOLETED_MSG5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5);
}
pub inline fn __API_OBSOLETED_MSG6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6);
}
pub inline fn __API_OBSOLETED_MSG7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7);
}
pub inline fn __API_OBSOLETED_MSG8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8);
}
pub inline fn __API_OBSOLETED_MSG9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9);
}
pub inline fn __API_OBSOLETED_MSG10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10);
}
pub inline fn __API_OBSOLETED_MSG11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11);
}
pub inline fn __API_OBSOLETED_MSG12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12);
}
pub inline fn __API_OBSOLETED_MSG13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13);
}
pub inline fn __API_OBSOLETED_MSG14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13) ++ __API_O(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13) ++ __API_O(msg, arg14);
}
pub inline fn __API_OBSOLETED_MSG15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13) ++ __API_O(msg, arg14) ++ __API_O(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_O(msg, arg0) ++ __API_O(msg, arg1) ++ __API_O(msg, arg2) ++ __API_O(msg, arg3) ++ __API_O(msg, arg4) ++ __API_O(msg, arg5) ++ __API_O(msg, arg6) ++ __API_O(msg, arg7) ++ __API_O(msg, arg8) ++ __API_O(msg, arg9) ++ __API_O(msg, arg10) ++ __API_O(msg, arg11) ++ __API_O(msg, arg12) ++ __API_O(msg, arg13) ++ __API_O(msg, arg14) ++ __API_O(msg, arg15);
}
pub const __API_OBSOLETED_MSG_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:382:13
pub const __API_O_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:384:9
pub inline fn __API_OBSOLETED_BEGIN0(msg: anytype, arg0: anytype) @TypeOf(__API_O_BEGIN(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_O_BEGIN(msg, arg0);
}
pub inline fn __API_OBSOLETED_BEGIN1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1);
}
pub inline fn __API_OBSOLETED_BEGIN2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2);
}
pub inline fn __API_OBSOLETED_BEGIN3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3);
}
pub inline fn __API_OBSOLETED_BEGIN4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4);
}
pub inline fn __API_OBSOLETED_BEGIN5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5);
}
pub inline fn __API_OBSOLETED_BEGIN6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6);
}
pub inline fn __API_OBSOLETED_BEGIN7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7);
}
pub inline fn __API_OBSOLETED_BEGIN8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8);
}
pub inline fn __API_OBSOLETED_BEGIN9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9);
}
pub inline fn __API_OBSOLETED_BEGIN10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10);
}
pub inline fn __API_OBSOLETED_BEGIN11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11);
}
pub inline fn __API_OBSOLETED_BEGIN12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12);
}
pub inline fn __API_OBSOLETED_BEGIN13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13);
}
pub inline fn __API_OBSOLETED_BEGIN14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13) ++ __API_O_BEGIN(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13) ++ __API_O_BEGIN(msg, arg14);
}
pub inline fn __API_OBSOLETED_BEGIN15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13) ++ __API_O_BEGIN(msg, arg14) ++ __API_O_BEGIN(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_O_BEGIN(msg, arg0) ++ __API_O_BEGIN(msg, arg1) ++ __API_O_BEGIN(msg, arg2) ++ __API_O_BEGIN(msg, arg3) ++ __API_O_BEGIN(msg, arg4) ++ __API_O_BEGIN(msg, arg5) ++ __API_O_BEGIN(msg, arg6) ++ __API_O_BEGIN(msg, arg7) ++ __API_O_BEGIN(msg, arg8) ++ __API_O_BEGIN(msg, arg9) ++ __API_O_BEGIN(msg, arg10) ++ __API_O_BEGIN(msg, arg11) ++ __API_O_BEGIN(msg, arg12) ++ __API_O_BEGIN(msg, arg13) ++ __API_O_BEGIN(msg, arg14) ++ __API_O_BEGIN(msg, arg15);
}
pub const __API_OBSOLETED_BEGIN_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:402:13
pub const __API_OR = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:405:13
pub inline fn __API_OBSOLETED_REP0(msg: anytype, arg0: anytype) @TypeOf(__API_OR(msg, arg0)) {
    _ = &msg;
    _ = &arg0;
    return __API_OR(msg, arg0);
}
pub inline fn __API_OBSOLETED_REP1(msg: anytype, arg0: anytype, arg1: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1);
}
pub inline fn __API_OBSOLETED_REP2(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2);
}
pub inline fn __API_OBSOLETED_REP3(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3);
}
pub inline fn __API_OBSOLETED_REP4(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4);
}
pub inline fn __API_OBSOLETED_REP5(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5);
}
pub inline fn __API_OBSOLETED_REP6(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6);
}
pub inline fn __API_OBSOLETED_REP7(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7);
}
pub inline fn __API_OBSOLETED_REP8(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8);
}
pub inline fn __API_OBSOLETED_REP9(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9);
}
pub inline fn __API_OBSOLETED_REP10(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10);
}
pub inline fn __API_OBSOLETED_REP11(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11);
}
pub inline fn __API_OBSOLETED_REP12(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12);
}
pub inline fn __API_OBSOLETED_REP13(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13);
}
pub inline fn __API_OBSOLETED_REP14(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13) ++ __API_OR(msg, arg14)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13) ++ __API_OR(msg, arg14);
}
pub inline fn __API_OBSOLETED_REP15(msg: anytype, arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13) ++ __API_OR(msg, arg14) ++ __API_OR(msg, arg15)) {
    _ = &msg;
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_OR(msg, arg0) ++ __API_OR(msg, arg1) ++ __API_OR(msg, arg2) ++ __API_OR(msg, arg3) ++ __API_OR(msg, arg4) ++ __API_OR(msg, arg5) ++ __API_OR(msg, arg6) ++ __API_OR(msg, arg7) ++ __API_OR(msg, arg8) ++ __API_OR(msg, arg9) ++ __API_OR(msg, arg10) ++ __API_OR(msg, arg11) ++ __API_OR(msg, arg12) ++ __API_OR(msg, arg13) ++ __API_OR(msg, arg14) ++ __API_OR(msg, arg15);
}
pub const __API_OBSOLETED_REP_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:426:13
pub const __API_OR_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:429:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN0 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:434:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN1 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:435:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN2 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:436:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN3 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:437:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN4 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:438:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN5 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:439:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN6 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:440:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN7 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:441:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN8 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:442:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN9 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:443:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN10 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:444:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN11 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:445:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN12 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:446:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN13 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:447:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN14 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:448:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN15 = @compileError("unable to translate macro: undefined identifier `__API_R_BEGIN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:449:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:450:13
pub const __API_U = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:461:13
pub inline fn __API_UNAVAILABLE0(arg0: anytype) @TypeOf(__API_U(arg0)) {
    _ = &arg0;
    return __API_U(arg0);
}
pub inline fn __API_UNAVAILABLE1(arg0: anytype, arg1: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1)) {
    _ = &arg0;
    _ = &arg1;
    return __API_U(arg0) ++ __API_U(arg1);
}
pub inline fn __API_UNAVAILABLE2(arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2);
}
pub inline fn __API_UNAVAILABLE3(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3);
}
pub inline fn __API_UNAVAILABLE4(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4);
}
pub inline fn __API_UNAVAILABLE5(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5);
}
pub inline fn __API_UNAVAILABLE6(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6);
}
pub inline fn __API_UNAVAILABLE7(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7);
}
pub inline fn __API_UNAVAILABLE8(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8);
}
pub inline fn __API_UNAVAILABLE9(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9);
}
pub inline fn __API_UNAVAILABLE10(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10);
}
pub inline fn __API_UNAVAILABLE11(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11);
}
pub inline fn __API_UNAVAILABLE12(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12);
}
pub inline fn __API_UNAVAILABLE13(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13);
}
pub inline fn __API_UNAVAILABLE14(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13) ++ __API_U(arg14)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13) ++ __API_U(arg14);
}
pub inline fn __API_UNAVAILABLE15(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13) ++ __API_U(arg14) ++ __API_U(arg15)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_U(arg0) ++ __API_U(arg1) ++ __API_U(arg2) ++ __API_U(arg3) ++ __API_U(arg4) ++ __API_U(arg5) ++ __API_U(arg6) ++ __API_U(arg7) ++ __API_U(arg8) ++ __API_U(arg9) ++ __API_U(arg10) ++ __API_U(arg11) ++ __API_U(arg12) ++ __API_U(arg13) ++ __API_U(arg14) ++ __API_U(arg15);
}
pub const __API_UNAVAILABLE_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:479:13
pub const __API_U_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:481:13
pub inline fn __API_UNAVAILABLE_BEGIN0(arg0: anytype) @TypeOf(__API_U_BEGIN(arg0)) {
    _ = &arg0;
    return __API_U_BEGIN(arg0);
}
pub inline fn __API_UNAVAILABLE_BEGIN1(arg0: anytype, arg1: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1)) {
    _ = &arg0;
    _ = &arg1;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1);
}
pub inline fn __API_UNAVAILABLE_BEGIN2(arg0: anytype, arg1: anytype, arg2: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2);
}
pub inline fn __API_UNAVAILABLE_BEGIN3(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3);
}
pub inline fn __API_UNAVAILABLE_BEGIN4(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4);
}
pub inline fn __API_UNAVAILABLE_BEGIN5(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5);
}
pub inline fn __API_UNAVAILABLE_BEGIN6(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6);
}
pub inline fn __API_UNAVAILABLE_BEGIN7(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7);
}
pub inline fn __API_UNAVAILABLE_BEGIN8(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8);
}
pub inline fn __API_UNAVAILABLE_BEGIN9(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9);
}
pub inline fn __API_UNAVAILABLE_BEGIN10(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10);
}
pub inline fn __API_UNAVAILABLE_BEGIN11(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11);
}
pub inline fn __API_UNAVAILABLE_BEGIN12(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12);
}
pub inline fn __API_UNAVAILABLE_BEGIN13(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13);
}
pub inline fn __API_UNAVAILABLE_BEGIN14(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13) ++ __API_U_BEGIN(arg14)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13) ++ __API_U_BEGIN(arg14);
}
pub inline fn __API_UNAVAILABLE_BEGIN15(arg0: anytype, arg1: anytype, arg2: anytype, arg3: anytype, arg4: anytype, arg5: anytype, arg6: anytype, arg7: anytype, arg8: anytype, arg9: anytype, arg10: anytype, arg11: anytype, arg12: anytype, arg13: anytype, arg14: anytype, arg15: anytype) @TypeOf(__API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13) ++ __API_U_BEGIN(arg14) ++ __API_U_BEGIN(arg15)) {
    _ = &arg0;
    _ = &arg1;
    _ = &arg2;
    _ = &arg3;
    _ = &arg4;
    _ = &arg5;
    _ = &arg6;
    _ = &arg7;
    _ = &arg8;
    _ = &arg9;
    _ = &arg10;
    _ = &arg11;
    _ = &arg12;
    _ = &arg13;
    _ = &arg14;
    _ = &arg15;
    return __API_U_BEGIN(arg0) ++ __API_U_BEGIN(arg1) ++ __API_U_BEGIN(arg2) ++ __API_U_BEGIN(arg3) ++ __API_U_BEGIN(arg4) ++ __API_U_BEGIN(arg5) ++ __API_U_BEGIN(arg6) ++ __API_U_BEGIN(arg7) ++ __API_U_BEGIN(arg8) ++ __API_U_BEGIN(arg9) ++ __API_U_BEGIN(arg10) ++ __API_U_BEGIN(arg11) ++ __API_U_BEGIN(arg12) ++ __API_U_BEGIN(arg13) ++ __API_U_BEGIN(arg14) ++ __API_U_BEGIN(arg15);
}
pub const __API_UNAVAILABLE_BEGIN_GET_MACRO_93585900 = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:499:13
pub const __swift_compiler_version_at_least = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternal.h:521:13
pub const __AVAILABILITY_INTERNAL_LEGACY__ = "";
pub const __ENABLE_LEGACY_MAC_AVAILABILITY = @as(c_int, 1);
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2833:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2834:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2835:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2837:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2841:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2843:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2848:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2852:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2853:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2855:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2859:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2861:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2865:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2867:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2872:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2876:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2877:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2879:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2883:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2885:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2889:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2891:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2896:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2901:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2905:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2907:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2911:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2913:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2917:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2919:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2923:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2925:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2929:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2931:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2935:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2937:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2941:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2943:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2947:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2949:25
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2953:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2954:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2955:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2956:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2957:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2958:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2960:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2964:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2966:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2971:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2975:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2976:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2978:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2982:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2984:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2988:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2990:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2995:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:2999:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3000:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3002:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3006:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3008:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3012:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3014:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3019:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3023:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3024:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3026:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3030:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3032:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3036:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3038:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3042:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3044:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3048:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3050:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3054:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3056:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3060:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3062:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3066:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3068:25
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3072:21
pub const __AVAILABILITY_INTERNAL__MAC_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3073:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3074:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3075:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3076:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3077:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3079:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3083:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3085:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3090:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3094:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3095:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3097:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3101:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3103:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3107:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3109:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3114:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3118:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3119:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3121:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3125:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3127:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3131:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3133:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3138:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3142:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3143:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3145:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3149:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3151:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3155:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3157:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3161:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3163:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3167:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3169:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3173:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3175:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3179:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3181:25
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3185:21
pub const __AVAILABILITY_INTERNAL__MAC_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3186:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3187:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3188:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3189:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3190:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3192:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3196:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3198:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3203:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3207:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3208:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3210:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3214:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3216:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3220:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3222:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3227:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3231:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3232:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3234:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3238:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3240:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3244:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3246:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3251:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3255:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3256:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3258:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3262:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3264:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3268:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3270:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3274:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3276:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3280:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3282:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3286:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3288:25
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3292:21
pub const __AVAILABILITY_INTERNAL__MAC_10_4_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3293:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3294:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEPRECATED__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3295:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3296:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3297:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3298:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3300:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3304:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3306:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3311:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3315:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3316:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3318:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3322:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3324:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3328:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3330:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3335:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3339:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3340:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3342:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3346:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3348:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3352:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3354:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3359:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3363:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3365:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3369:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3371:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3375:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3377:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3381:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3383:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3387:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3389:25
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3393:21
pub const __AVAILABILITY_INTERNAL__MAC_10_5_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3394:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3395:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3396:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3397:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3398:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3400:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3404:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3406:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3411:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3415:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3416:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3418:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3422:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3424:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3428:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3430:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3435:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3439:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3440:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3442:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3446:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3448:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3452:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3454:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3459:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3463:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3464:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3466:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3470:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3472:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3476:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3478:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3482:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3484:25
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3488:21
pub const __AVAILABILITY_INTERNAL__MAC_10_6_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3489:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3490:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3491:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3492:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3493:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3495:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3499:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3501:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3506:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3510:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3511:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3513:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3517:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3519:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3523:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3525:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3530:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3534:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3535:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3537:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3541:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3543:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3547:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3549:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3554:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_13_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3558:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3559:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3561:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3565:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3567:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3571:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3573:25
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3577:21
pub const __AVAILABILITY_INTERNAL__MAC_10_7_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3578:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3579:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3580:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3581:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3582:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3584:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3588:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3590:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3595:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3599:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3600:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3602:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3606:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3608:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3612:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3614:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3619:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3623:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3624:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3626:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3630:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3632:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3636:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3638:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3643:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3647:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3648:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3650:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3654:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3656:25
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3660:21
pub const __AVAILABILITY_INTERNAL__MAC_10_8_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3661:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3662:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3663:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3664:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3665:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3667:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3671:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3673:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3678:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3682:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3683:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3685:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3689:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3691:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3695:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3697:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3702:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3706:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3707:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3709:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3713:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3715:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3719:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3721:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3726:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3730:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3731:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3732:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3734:25
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3738:21
pub const __AVAILABILITY_INTERNAL__MAC_10_9_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3739:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3740:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3741:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_0_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3743:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3747:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3748:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3749:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3751:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3755:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3757:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3762:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3766:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3767:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3769:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3773:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3775:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3779:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3781:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3786:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3790:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3791:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3793:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3797:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3799:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3803:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3805:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3810:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3814:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3816:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3820:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3822:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3826:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3828:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3832:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3834:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3838:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_5_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3840:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3844:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_6_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3846:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3850:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_7_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3852:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3856:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_8_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3858:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3862:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_9_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3864:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_10_13_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3869:25
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3873:21
pub const __AVAILABILITY_INTERNAL__MAC_10_0_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3874:21
pub const __AVAILABILITY_INTERNAL__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3875:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3876:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3877:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3878:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3880:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3884:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3886:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3890:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3891:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3893:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3897:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3899:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3903:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3905:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3910:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3914:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3915:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3917:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3921:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3923:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3927:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3929:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3934:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3938:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3939:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3940:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3941:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3943:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3947:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3948:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3950:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3954:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3956:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3960:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3962:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3967:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3971:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3972:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3974:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3978:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3980:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3984:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3986:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3991:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3995:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_3_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3996:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3997:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3998:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:3999:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4001:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4005:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4007:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_10_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4012:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4016:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4017:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4019:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4023:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4025:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4029:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4031:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4036:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4040:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4041:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4043:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4047:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4049:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4053:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4055:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4060:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4064:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4066:25
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_10_13_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4070:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4071:21
pub const __AVAILABILITY_INTERNAL__MAC_10_10_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4072:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4073:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4074:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4075:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4077:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4081:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4083:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4087:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4089:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4093:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4094:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4096:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4100:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4102:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4106:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4108:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4113:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4117:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4118:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4119:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4120:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4122:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4126:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4128:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4132:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4133:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4135:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4139:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4141:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4145:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4147:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4152:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4156:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_3_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4157:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4158:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4159:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4161:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4165:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4166:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4168:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4172:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4174:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4178:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4180:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4185:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4189:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_4_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4190:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4191:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4192:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4193:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4195:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4199:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_3_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4201:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4205:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4207:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_11_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4212:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4216:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4217:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4219:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4223:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4225:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4229:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4231:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4236:25
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4240:21
pub const __AVAILABILITY_INTERNAL__MAC_10_11_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4241:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4242:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4243:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4244:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4246:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4250:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4252:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4256:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4258:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4262:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_1_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4263:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4264:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4265:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4267:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4271:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4273:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4277:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_2_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4278:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4279:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4280:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4282:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4286:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_4_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4287:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4288:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4289:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_1_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4291:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4295:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_2_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4297:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4301:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_4_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4303:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_12_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4308:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4312:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4314:25
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_13_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4318:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4319:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4320:21
pub const __AVAILABILITY_INTERNAL__MAC_10_12_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4321:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4322:21
pub const __AVAILABILITY_INTERNAL__MAC_10_13_4 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4323:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4324:21
pub const __AVAILABILITY_INTERNAL__MAC_10_14_DEP__MAC_10_14 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4325:21
pub const __AVAILABILITY_INTERNAL__MAC_10_15 = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4326:21
pub const __AVAILABILITY_INTERNAL__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4328:21
pub const __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4329:21
pub const __AVAILABILITY_INTERNAL__MAC_NA_DEP__MAC_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4330:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4332:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4333:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4334:21
pub const __AVAILABILITY_INTERNAL__IPHONE_NA_DEP__IPHONE_NA_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4335:21
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4338:22
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4339:22
pub const __AVAILABILITY_INTERNAL__IPHONE_COMPAT_VERSION_DEP__IPHONE_COMPAT_VERSION_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/AvailabilityInternalLegacy.h:4340:22
pub const __OSX_AVAILABLE_STARTING = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:237:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:238:17
pub const __OSX_AVAILABLE_BUT_DEPRECATED_MSG = @compileError("unable to translate macro: undefined identifier `__AVAILABILITY_INTERNAL`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:240:17
pub const __OS_AVAILABILITY = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:263:13
pub const __OS_AVAILABILITY_MSG = @compileError("unable to translate macro: undefined identifier `availability`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:264:13
pub const __OSX_EXTENSION_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx_app_extension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:281:13
pub const __IOS_EXTENSION_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `ios_app_extension`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:282:13
pub inline fn __OS_EXTENSION_UNAVAILABLE(_msg: anytype) @TypeOf(__OSX_EXTENSION_UNAVAILABLE(_msg) ++ __IOS_EXTENSION_UNAVAILABLE(_msg)) {
    _ = &_msg;
    return __OSX_EXTENSION_UNAVAILABLE(_msg) ++ __IOS_EXTENSION_UNAVAILABLE(_msg);
}
pub const __OSX_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:299:13
pub const __OSX_AVAILABLE = @compileError("unable to translate macro: undefined identifier `macosx`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:300:13
pub const __OSX_DEPRECATED = @compileError("unable to translate macro: undefined identifier `macosx`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:301:13
pub const __IOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `ios`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:325:13
pub const __IOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `ios`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:327:15
pub const __IOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `ios`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:329:13
pub const __IOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `ios`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:330:13
pub const __TVOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `tvos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:354:13
pub const __TVOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `tvos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:356:15
pub const __TVOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `tvos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:358:13
pub const __TVOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `tvos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:359:13
pub const __WATCHOS_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `watchos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:383:13
pub const __WATCHOS_PROHIBITED = @compileError("unable to translate macro: undefined identifier `watchos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:385:15
pub const __WATCHOS_AVAILABLE = @compileError("unable to translate macro: undefined identifier `watchos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:387:13
pub const __WATCHOS_DEPRECATED = @compileError("unable to translate macro: undefined identifier `watchos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:388:13
pub const __SWIFT_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `swift`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:411:13
pub const __SWIFT_UNAVAILABLE_MSG = @compileError("unable to translate macro: undefined identifier `swift`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:412:13
pub const __API_AVAILABLE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:457:13
pub const __API_AVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:459:13
pub const __API_AVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:460:13
pub const __API_DEPRECATED = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:480:13
pub const __API_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:481:13
pub const __API_DEPRECATED_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:483:13
pub const __API_DEPRECATED_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:484:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:486:13
pub const __API_DEPRECATED_WITH_REPLACEMENT_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:487:13
pub const __API_OBSOLETED = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:490:13
pub const __API_OBSOLETED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:491:13
pub const __API_OBSOLETED_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:493:13
pub const __API_OBSOLETED_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:494:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:496:13
pub const __API_OBSOLETED_WITH_REPLACEMENT_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:497:13
pub const __API_UNAVAILABLE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:507:13
pub const __API_UNAVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:509:13
pub const __API_UNAVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:510:13
pub const __SPI_AVAILABLE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:595:11
pub const __SPI_AVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:599:11
pub const __SPI_AVAILABLE_END = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:603:11
pub const __SPI_DEPRECATED = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:607:11
pub const __SPI_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/Availability.h:611:11
pub const _UID_T = "";
pub const _GID_T = "";
pub const _SYS_SYSLIMITS_H_ = "";
pub const ARG_MAX = @as(c_int, 1024) * @as(c_int, 1024);
pub const CHILD_MAX = @as(c_int, 266);
pub const GID_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 2147483647, .decimal);
pub const LINK_MAX = @as(c_int, 32767);
pub const MAX_CANON = @as(c_int, 1024);
pub const MAX_INPUT = @as(c_int, 1024);
pub const NAME_MAX = @as(c_int, 255);
pub const NGROUPS_MAX = @as(c_int, 16);
pub const UID_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 2147483647, .decimal);
pub const OPEN_MAX = @as(c_int, 10240);
pub const PATH_MAX = @as(c_int, 1024);
pub const PIPE_BUF = @as(c_int, 512);
pub const BC_BASE_MAX = @as(c_int, 99);
pub const BC_DIM_MAX = @as(c_int, 2048);
pub const BC_SCALE_MAX = @as(c_int, 99);
pub const BC_STRING_MAX = @as(c_int, 1000);
pub const CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const EQUIV_CLASS_MAX = @as(c_int, 2);
pub const EXPR_NEST_MAX = @as(c_int, 32);
pub const LINE_MAX = @as(c_int, 2048);
pub const RE_DUP_MAX = @as(c_int, 255);
pub const NZERO = @as(c_int, 20);
pub const _OFF_T = "";
pub const _PID_T = "";
pub const _USECONDS_T = "";
pub const NULL = __DARWIN_NULL;
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const _XOPEN_VERSION = @as(c_int, 600);
pub const _XOPEN_XCU_VERSION = @as(c_int, 4);
pub const _POSIX_ADVISORY_INFO = -@as(c_int, 1);
pub const _POSIX_ASYNCHRONOUS_IO = -@as(c_int, 1);
pub const _POSIX_BARRIERS = -@as(c_int, 1);
pub const _POSIX_CHOWN_RESTRICTED = @as(c_long, 200112);
pub const _POSIX_CLOCK_SELECTION = -@as(c_int, 1);
pub const _POSIX_CPUTIME = -@as(c_int, 1);
pub const _POSIX_FSYNC = @as(c_long, 200112);
pub const _POSIX_IPV6 = @as(c_long, 200112);
pub const _POSIX_JOB_CONTROL = @as(c_long, 200112);
pub const _POSIX_MAPPED_FILES = @as(c_long, 200112);
pub const _POSIX_MEMLOCK = -@as(c_int, 1);
pub const _POSIX_MEMLOCK_RANGE = -@as(c_int, 1);
pub const _POSIX_MEMORY_PROTECTION = @as(c_long, 200112);
pub const _POSIX_MESSAGE_PASSING = -@as(c_int, 1);
pub const _POSIX_MONOTONIC_CLOCK = -@as(c_int, 1);
pub const _POSIX_NO_TRUNC = @as(c_long, 200112);
pub const _POSIX_PRIORITIZED_IO = -@as(c_int, 1);
pub const _POSIX_PRIORITY_SCHEDULING = -@as(c_int, 1);
pub const _POSIX_RAW_SOCKETS = -@as(c_int, 1);
pub const _POSIX_READER_WRITER_LOCKS = @as(c_long, 200112);
pub const _POSIX_REALTIME_SIGNALS = -@as(c_int, 1);
pub const _POSIX_REGEXP = @as(c_long, 200112);
pub const _POSIX_SAVED_IDS = @as(c_long, 200112);
pub const _POSIX_SEMAPHORES = -@as(c_int, 1);
pub const _POSIX_SHARED_MEMORY_OBJECTS = -@as(c_int, 1);
pub const _POSIX_SHELL = @as(c_long, 200112);
pub const _POSIX_SPAWN = @as(c_long, 200112);
pub const _POSIX_SPIN_LOCKS = -@as(c_int, 1);
pub const _POSIX_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_SYNCHRONIZED_IO = -@as(c_int, 1);
pub const _POSIX_THREAD_ATTR_STACKADDR = @as(c_long, 200112);
pub const _POSIX_THREAD_ATTR_STACKSIZE = @as(c_long, 200112);
pub const _POSIX_THREAD_CPUTIME = -@as(c_int, 1);
pub const _POSIX_THREAD_PRIO_INHERIT = -@as(c_int, 1);
pub const _POSIX_THREAD_PRIO_PROTECT = -@as(c_int, 1);
pub const _POSIX_THREAD_PRIORITY_SCHEDULING = -@as(c_int, 1);
pub const _POSIX_THREAD_PROCESS_SHARED = @as(c_long, 200112);
pub const _POSIX_THREAD_SAFE_FUNCTIONS = @as(c_long, 200112);
pub const _POSIX_THREAD_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_THREADS = @as(c_long, 200112);
pub const _POSIX_TIMEOUTS = -@as(c_int, 1);
pub const _POSIX_TIMERS = -@as(c_int, 1);
pub const _POSIX_TRACE = -@as(c_int, 1);
pub const _POSIX_TRACE_EVENT_FILTER = -@as(c_int, 1);
pub const _POSIX_TRACE_INHERIT = -@as(c_int, 1);
pub const _POSIX_TRACE_LOG = -@as(c_int, 1);
pub const _POSIX_TYPED_MEMORY_OBJECTS = -@as(c_int, 1);
pub const _POSIX2_C_BIND = @as(c_long, 200112);
pub const _POSIX2_C_DEV = @as(c_long, 200112);
pub const _POSIX2_CHAR_TERM = @as(c_long, 200112);
pub const _POSIX2_FORT_DEV = -@as(c_int, 1);
pub const _POSIX2_FORT_RUN = @as(c_long, 200112);
pub const _POSIX2_LOCALEDEF = @as(c_long, 200112);
pub const _POSIX2_PBS = -@as(c_int, 1);
pub const _POSIX2_PBS_ACCOUNTING = -@as(c_int, 1);
pub const _POSIX2_PBS_CHECKPOINT = -@as(c_int, 1);
pub const _POSIX2_PBS_LOCATE = -@as(c_int, 1);
pub const _POSIX2_PBS_MESSAGE = -@as(c_int, 1);
pub const _POSIX2_PBS_TRACK = -@as(c_int, 1);
pub const _POSIX2_SW_DEV = @as(c_long, 200112);
pub const _POSIX2_UPE = @as(c_long, 200112);
pub const __ILP32_OFF32 = -@as(c_int, 1);
pub const __ILP32_OFFBIG = -@as(c_int, 1);
pub const __LP64_OFF64 = @as(c_int, 1);
pub const __LPBIG_OFFBIG = @as(c_int, 1);
pub const _POSIX_V6_ILP32_OFF32 = __ILP32_OFF32;
pub const _POSIX_V6_ILP32_OFFBIG = __ILP32_OFFBIG;
pub const _POSIX_V6_LP64_OFF64 = __LP64_OFF64;
pub const _POSIX_V6_LPBIG_OFFBIG = __LPBIG_OFFBIG;
pub const _POSIX_V7_ILP32_OFF32 = __ILP32_OFF32;
pub const _POSIX_V7_ILP32_OFFBIG = __ILP32_OFFBIG;
pub const _POSIX_V7_LP64_OFF64 = __LP64_OFF64;
pub const _POSIX_V7_LPBIG_OFFBIG = __LPBIG_OFFBIG;
pub const _V6_ILP32_OFF32 = __ILP32_OFF32;
pub const _V6_ILP32_OFFBIG = __ILP32_OFFBIG;
pub const _V6_LP64_OFF64 = __LP64_OFF64;
pub const _V6_LPBIG_OFFBIG = __LPBIG_OFFBIG;
pub const _XBS5_ILP32_OFF32 = __ILP32_OFF32;
pub const _XBS5_ILP32_OFFBIG = __ILP32_OFFBIG;
pub const _XBS5_LP64_OFF64 = __LP64_OFF64;
pub const _XBS5_LPBIG_OFFBIG = __LPBIG_OFFBIG;
pub const _XOPEN_CRYPT = @as(c_int, 1);
pub const _XOPEN_ENH_I18N = @as(c_int, 1);
pub const _XOPEN_LEGACY = -@as(c_int, 1);
pub const _XOPEN_REALTIME = -@as(c_int, 1);
pub const _XOPEN_REALTIME_THREADS = -@as(c_int, 1);
pub const _XOPEN_SHM = @as(c_int, 1);
pub const _XOPEN_STREAMS = -@as(c_int, 1);
pub const _XOPEN_UNIX = @as(c_int, 1);
pub const _SC_ARG_MAX = @as(c_int, 1);
pub const _SC_CHILD_MAX = @as(c_int, 2);
pub const _SC_CLK_TCK = @as(c_int, 3);
pub const _SC_NGROUPS_MAX = @as(c_int, 4);
pub const _SC_OPEN_MAX = @as(c_int, 5);
pub const _SC_JOB_CONTROL = @as(c_int, 6);
pub const _SC_SAVED_IDS = @as(c_int, 7);
pub const _SC_VERSION = @as(c_int, 8);
pub const _SC_BC_BASE_MAX = @as(c_int, 9);
pub const _SC_BC_DIM_MAX = @as(c_int, 10);
pub const _SC_BC_SCALE_MAX = @as(c_int, 11);
pub const _SC_BC_STRING_MAX = @as(c_int, 12);
pub const _SC_COLL_WEIGHTS_MAX = @as(c_int, 13);
pub const _SC_EXPR_NEST_MAX = @as(c_int, 14);
pub const _SC_LINE_MAX = @as(c_int, 15);
pub const _SC_RE_DUP_MAX = @as(c_int, 16);
pub const _SC_2_VERSION = @as(c_int, 17);
pub const _SC_2_C_BIND = @as(c_int, 18);
pub const _SC_2_C_DEV = @as(c_int, 19);
pub const _SC_2_CHAR_TERM = @as(c_int, 20);
pub const _SC_2_FORT_DEV = @as(c_int, 21);
pub const _SC_2_FORT_RUN = @as(c_int, 22);
pub const _SC_2_LOCALEDEF = @as(c_int, 23);
pub const _SC_2_SW_DEV = @as(c_int, 24);
pub const _SC_2_UPE = @as(c_int, 25);
pub const _SC_STREAM_MAX = @as(c_int, 26);
pub const _SC_TZNAME_MAX = @as(c_int, 27);
pub const _SC_ASYNCHRONOUS_IO = @as(c_int, 28);
pub const _SC_PAGESIZE = @as(c_int, 29);
pub const _SC_MEMLOCK = @as(c_int, 30);
pub const _SC_MEMLOCK_RANGE = @as(c_int, 31);
pub const _SC_MEMORY_PROTECTION = @as(c_int, 32);
pub const _SC_MESSAGE_PASSING = @as(c_int, 33);
pub const _SC_PRIORITIZED_IO = @as(c_int, 34);
pub const _SC_PRIORITY_SCHEDULING = @as(c_int, 35);
pub const _SC_REALTIME_SIGNALS = @as(c_int, 36);
pub const _SC_SEMAPHORES = @as(c_int, 37);
pub const _SC_FSYNC = @as(c_int, 38);
pub const _SC_SHARED_MEMORY_OBJECTS = @as(c_int, 39);
pub const _SC_SYNCHRONIZED_IO = @as(c_int, 40);
pub const _SC_TIMERS = @as(c_int, 41);
pub const _SC_AIO_LISTIO_MAX = @as(c_int, 42);
pub const _SC_AIO_MAX = @as(c_int, 43);
pub const _SC_AIO_PRIO_DELTA_MAX = @as(c_int, 44);
pub const _SC_DELAYTIMER_MAX = @as(c_int, 45);
pub const _SC_MQ_OPEN_MAX = @as(c_int, 46);
pub const _SC_MAPPED_FILES = @as(c_int, 47);
pub const _SC_RTSIG_MAX = @as(c_int, 48);
pub const _SC_SEM_NSEMS_MAX = @as(c_int, 49);
pub const _SC_SEM_VALUE_MAX = @as(c_int, 50);
pub const _SC_SIGQUEUE_MAX = @as(c_int, 51);
pub const _SC_TIMER_MAX = @as(c_int, 52);
pub const _SC_NPROCESSORS_CONF = @as(c_int, 57);
pub const _SC_NPROCESSORS_ONLN = @as(c_int, 58);
pub const _SC_2_PBS = @as(c_int, 59);
pub const _SC_2_PBS_ACCOUNTING = @as(c_int, 60);
pub const _SC_2_PBS_CHECKPOINT = @as(c_int, 61);
pub const _SC_2_PBS_LOCATE = @as(c_int, 62);
pub const _SC_2_PBS_MESSAGE = @as(c_int, 63);
pub const _SC_2_PBS_TRACK = @as(c_int, 64);
pub const _SC_ADVISORY_INFO = @as(c_int, 65);
pub const _SC_BARRIERS = @as(c_int, 66);
pub const _SC_CLOCK_SELECTION = @as(c_int, 67);
pub const _SC_CPUTIME = @as(c_int, 68);
pub const _SC_FILE_LOCKING = @as(c_int, 69);
pub const _SC_GETGR_R_SIZE_MAX = @as(c_int, 70);
pub const _SC_GETPW_R_SIZE_MAX = @as(c_int, 71);
pub const _SC_HOST_NAME_MAX = @as(c_int, 72);
pub const _SC_LOGIN_NAME_MAX = @as(c_int, 73);
pub const _SC_MONOTONIC_CLOCK = @as(c_int, 74);
pub const _SC_MQ_PRIO_MAX = @as(c_int, 75);
pub const _SC_READER_WRITER_LOCKS = @as(c_int, 76);
pub const _SC_REGEXP = @as(c_int, 77);
pub const _SC_SHELL = @as(c_int, 78);
pub const _SC_SPAWN = @as(c_int, 79);
pub const _SC_SPIN_LOCKS = @as(c_int, 80);
pub const _SC_SPORADIC_SERVER = @as(c_int, 81);
pub const _SC_THREAD_ATTR_STACKADDR = @as(c_int, 82);
pub const _SC_THREAD_ATTR_STACKSIZE = @as(c_int, 83);
pub const _SC_THREAD_CPUTIME = @as(c_int, 84);
pub const _SC_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 85);
pub const _SC_THREAD_KEYS_MAX = @as(c_int, 86);
pub const _SC_THREAD_PRIO_INHERIT = @as(c_int, 87);
pub const _SC_THREAD_PRIO_PROTECT = @as(c_int, 88);
pub const _SC_THREAD_PRIORITY_SCHEDULING = @as(c_int, 89);
pub const _SC_THREAD_PROCESS_SHARED = @as(c_int, 90);
pub const _SC_THREAD_SAFE_FUNCTIONS = @as(c_int, 91);
pub const _SC_THREAD_SPORADIC_SERVER = @as(c_int, 92);
pub const _SC_THREAD_STACK_MIN = @as(c_int, 93);
pub const _SC_THREAD_THREADS_MAX = @as(c_int, 94);
pub const _SC_TIMEOUTS = @as(c_int, 95);
pub const _SC_THREADS = @as(c_int, 96);
pub const _SC_TRACE = @as(c_int, 97);
pub const _SC_TRACE_EVENT_FILTER = @as(c_int, 98);
pub const _SC_TRACE_INHERIT = @as(c_int, 99);
pub const _SC_TRACE_LOG = @as(c_int, 100);
pub const _SC_TTY_NAME_MAX = @as(c_int, 101);
pub const _SC_TYPED_MEMORY_OBJECTS = @as(c_int, 102);
pub const _SC_V6_ILP32_OFF32 = @as(c_int, 103);
pub const _SC_V6_ILP32_OFFBIG = @as(c_int, 104);
pub const _SC_V6_LP64_OFF64 = @as(c_int, 105);
pub const _SC_V6_LPBIG_OFFBIG = @as(c_int, 106);
pub const _SC_IPV6 = @as(c_int, 118);
pub const _SC_RAW_SOCKETS = @as(c_int, 119);
pub const _SC_SYMLOOP_MAX = @as(c_int, 120);
pub const _SC_ATEXIT_MAX = @as(c_int, 107);
pub const _SC_IOV_MAX = @as(c_int, 56);
pub const _SC_PAGE_SIZE = _SC_PAGESIZE;
pub const _SC_XOPEN_CRYPT = @as(c_int, 108);
pub const _SC_XOPEN_ENH_I18N = @as(c_int, 109);
pub const _SC_XOPEN_LEGACY = @as(c_int, 110);
pub const _SC_XOPEN_REALTIME = @as(c_int, 111);
pub const _SC_XOPEN_REALTIME_THREADS = @as(c_int, 112);
pub const _SC_XOPEN_SHM = @as(c_int, 113);
pub const _SC_XOPEN_STREAMS = @as(c_int, 114);
pub const _SC_XOPEN_UNIX = @as(c_int, 115);
pub const _SC_XOPEN_VERSION = @as(c_int, 116);
pub const _SC_XOPEN_XCU_VERSION = @as(c_int, 121);
pub const _SC_XBS5_ILP32_OFF32 = @as(c_int, 122);
pub const _SC_XBS5_ILP32_OFFBIG = @as(c_int, 123);
pub const _SC_XBS5_LP64_OFF64 = @as(c_int, 124);
pub const _SC_XBS5_LPBIG_OFFBIG = @as(c_int, 125);
pub const _SC_SS_REPL_MAX = @as(c_int, 126);
pub const _SC_TRACE_EVENT_NAME_MAX = @as(c_int, 127);
pub const _SC_TRACE_NAME_MAX = @as(c_int, 128);
pub const _SC_TRACE_SYS_MAX = @as(c_int, 129);
pub const _SC_TRACE_USER_EVENT_MAX = @as(c_int, 130);
pub const _SC_PASS_MAX = @as(c_int, 131);
pub const _SC_PHYS_PAGES = @as(c_int, 200);
pub const _CS_POSIX_V6_ILP32_OFF32_CFLAGS = @as(c_int, 2);
pub const _CS_POSIX_V6_ILP32_OFF32_LDFLAGS = @as(c_int, 3);
pub const _CS_POSIX_V6_ILP32_OFF32_LIBS = @as(c_int, 4);
pub const _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS = @as(c_int, 5);
pub const _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS = @as(c_int, 6);
pub const _CS_POSIX_V6_ILP32_OFFBIG_LIBS = @as(c_int, 7);
pub const _CS_POSIX_V6_LP64_OFF64_CFLAGS = @as(c_int, 8);
pub const _CS_POSIX_V6_LP64_OFF64_LDFLAGS = @as(c_int, 9);
pub const _CS_POSIX_V6_LP64_OFF64_LIBS = @as(c_int, 10);
pub const _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS = @as(c_int, 11);
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS = @as(c_int, 12);
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LIBS = @as(c_int, 13);
pub const _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS = @as(c_int, 14);
pub const _CS_XBS5_ILP32_OFF32_CFLAGS = @as(c_int, 20);
pub const _CS_XBS5_ILP32_OFF32_LDFLAGS = @as(c_int, 21);
pub const _CS_XBS5_ILP32_OFF32_LIBS = @as(c_int, 22);
pub const _CS_XBS5_ILP32_OFF32_LINTFLAGS = @as(c_int, 23);
pub const _CS_XBS5_ILP32_OFFBIG_CFLAGS = @as(c_int, 24);
pub const _CS_XBS5_ILP32_OFFBIG_LDFLAGS = @as(c_int, 25);
pub const _CS_XBS5_ILP32_OFFBIG_LIBS = @as(c_int, 26);
pub const _CS_XBS5_ILP32_OFFBIG_LINTFLAGS = @as(c_int, 27);
pub const _CS_XBS5_LP64_OFF64_CFLAGS = @as(c_int, 28);
pub const _CS_XBS5_LP64_OFF64_LDFLAGS = @as(c_int, 29);
pub const _CS_XBS5_LP64_OFF64_LIBS = @as(c_int, 30);
pub const _CS_XBS5_LP64_OFF64_LINTFLAGS = @as(c_int, 31);
pub const _CS_XBS5_LPBIG_OFFBIG_CFLAGS = @as(c_int, 32);
pub const _CS_XBS5_LPBIG_OFFBIG_LDFLAGS = @as(c_int, 33);
pub const _CS_XBS5_LPBIG_OFFBIG_LIBS = @as(c_int, 34);
pub const _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS = @as(c_int, 35);
pub const _CS_DARWIN_USER_DIR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const _CS_DARWIN_USER_TEMP_DIR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65537, .decimal);
pub const _CS_DARWIN_USER_CACHE_DIR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65538, .decimal);
pub const _CTERMID_H_ = "";
pub const L_ctermid = @as(c_int, 1024);
pub const F_ULOCK = @as(c_int, 0);
pub const F_LOCK = @as(c_int, 1);
pub const F_TLOCK = @as(c_int, 2);
pub const F_TEST = @as(c_int, 3);
pub const _SYS_SELECT_H_ = "";
pub const __SYS_APPLEAPIOPTS_H__ = "";
pub const __APPLE_API_STANDARD = "";
pub const __APPLE_API_STABLE = "";
pub const __APPLE_API_EVOLVING = "";
pub const __APPLE_API_UNSTABLE = "";
pub const __APPLE_API_PRIVATE = "";
pub const __APPLE_API_OBSOLETE = "";
pub const _FD_SET = "";
pub const __DARWIN_FD_SETSIZE = @as(c_int, 1024);
pub const __DARWIN_NBBY = @as(c_int, 8);
pub const __DARWIN_NFDBITS = @import("std").zig.c_translation.sizeof(__int32_t) * __DARWIN_NBBY;
pub inline fn __DARWIN_howmany(x: anytype, y: anytype) @TypeOf(if (@import("std").zig.c_translation.MacroArithmetic.rem(x, y) == @as(c_int, 0)) @import("std").zig.c_translation.MacroArithmetic.div(x, y) else @import("std").zig.c_translation.MacroArithmetic.div(x, y) + @as(c_int, 1)) {
    _ = &x;
    _ = &y;
    return if (@import("std").zig.c_translation.MacroArithmetic.rem(x, y) == @as(c_int, 0)) @import("std").zig.c_translation.MacroArithmetic.div(x, y) else @import("std").zig.c_translation.MacroArithmetic.div(x, y) + @as(c_int, 1);
}
pub inline fn __DARWIN_FD_SET(n: anytype, p: anytype) @TypeOf(__darwin_fd_set(n, p)) {
    _ = &n;
    _ = &p;
    return __darwin_fd_set(n, p);
}
pub inline fn __DARWIN_FD_CLR(n: anytype, p: anytype) @TypeOf(__darwin_fd_clr(n, p)) {
    _ = &n;
    _ = &p;
    return __darwin_fd_clr(n, p);
}
pub inline fn __DARWIN_FD_ISSET(n: anytype, p: anytype) @TypeOf(__darwin_fd_isset(n, p)) {
    _ = &n;
    _ = &p;
    return __darwin_fd_isset(n, p);
}
pub const __DARWIN_FD_ZERO = @compileError("unable to translate macro: undefined identifier `__builtin_bzero`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_types/_fd_def.h:115:9
pub const __DARWIN_FD_COPY = @compileError("unable to translate macro: undefined identifier `bcopy`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_types/_fd_def.h:120:9
pub const _STRUCT_TIMESPEC = struct_timespec;
pub const _STRUCT_TIMEVAL = struct_timeval;
pub const _TIME_T = "";
pub const _SUSECONDS_T = "";
pub const _SIGSET_T = "";
pub const FD_SETSIZE = __DARWIN_FD_SETSIZE;
pub inline fn FD_SET(n: anytype, p: anytype) @TypeOf(__DARWIN_FD_SET(n, p)) {
    _ = &n;
    _ = &p;
    return __DARWIN_FD_SET(n, p);
}
pub inline fn FD_CLR(n: anytype, p: anytype) @TypeOf(__DARWIN_FD_CLR(n, p)) {
    _ = &n;
    _ = &p;
    return __DARWIN_FD_CLR(n, p);
}
pub inline fn FD_ISSET(n: anytype, p: anytype) @TypeOf(__DARWIN_FD_ISSET(n, p)) {
    _ = &n;
    _ = &p;
    return __DARWIN_FD_ISSET(n, p);
}
pub inline fn FD_ZERO(p: anytype) @TypeOf(__DARWIN_FD_ZERO(p)) {
    _ = &p;
    return __DARWIN_FD_ZERO(p);
}
pub inline fn FD_COPY(f: anytype, t: anytype) @TypeOf(__DARWIN_FD_COPY(f, t)) {
    _ = &f;
    _ = &t;
    return __DARWIN_FD_COPY(f, t);
}
pub const _SYS__SELECT_H_ = "";
pub const _DEV_T = "";
pub const _MODE_T = "";
pub const _UUID_T = "";
pub const __GETHOSTUUID_H = "";
pub const SYNC_VOLUME_FULLSYNC = @as(c_int, 0x01);
pub const SYNC_VOLUME_WAIT = @as(c_int, 0x02);
pub const _GRP_H_ = "";
pub const _PATH_GROUP = "/etc/group";
pub const _UUID_UUID_H = "";
pub const _UUID_STRING_T = "";
pub const UUID_DEFINE = @compileError("unable to translate macro: undefined identifier `unused`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/uuid/uuid.h:46:9
pub const SUDO_PLUGIN_H = "";
pub const SUDO_API_VERSION_MAJOR = @as(c_int, 1);
pub const SUDO_API_VERSION_MINOR = @as(c_int, 21);
pub inline fn SUDO_API_MKVERSION(x: anytype, y: anytype) @TypeOf((x << @as(c_int, 16)) | y) {
    _ = &x;
    _ = &y;
    return (x << @as(c_int, 16)) | y;
}
pub const SUDO_API_VERSION = SUDO_API_MKVERSION(SUDO_API_VERSION_MAJOR, SUDO_API_VERSION_MINOR);
pub inline fn SUDO_API_VERSION_GET_MAJOR(v: anytype) @TypeOf(v >> @as(c_int, 16)) {
    _ = &v;
    return v >> @as(c_int, 16);
}
pub inline fn SUDO_API_VERSION_GET_MINOR(v: anytype) @TypeOf(v & @as(c_uint, 0xffff)) {
    _ = &v;
    return v & @as(c_uint, 0xffff);
}
pub const SUDO_API_VERSION_SET_MAJOR = @compileError("unable to translate C expr: unexpected token 'do'");
// /tmp/claude-1000/-home-dan-Projects-nix-config/3a82af54-cce6-45ed-81ba-d3952548250d/scratchpad/sudo113/sudo_plugin.h:31:9
pub const SUDO_API_VERSION_SET_MINOR = @compileError("unable to translate C expr: unexpected token 'do'");
// /tmp/claude-1000/-home-dan-Projects-nix-config/3a82af54-cce6-45ed-81ba-d3952548250d/scratchpad/sudo113/sudo_plugin.h:34:9
pub const SUDO_FRONT_END = @as(c_int, 0);
pub const SUDO_CONV_PROMPT_ECHO_OFF = @as(c_int, 0x0001);
pub const SUDO_CONV_PROMPT_ECHO_ON = @as(c_int, 0x0002);
pub const SUDO_CONV_ERROR_MSG = @as(c_int, 0x0003);
pub const SUDO_CONV_INFO_MSG = @as(c_int, 0x0004);
pub const SUDO_CONV_PROMPT_MASK = @as(c_int, 0x0005);
pub const SUDO_CONV_PROMPT_ECHO_OK = @as(c_int, 0x1000);
pub const SUDO_CONV_PREFER_TTY = @as(c_int, 0x2000);
pub const SUDO_CONV_REPL_MAX = @as(c_int, 1023);
pub const SUDO_CONV_CALLBACK_VERSION_MAJOR = @as(c_int, 1);
pub const SUDO_CONV_CALLBACK_VERSION_MINOR = @as(c_int, 0);
pub const SUDO_CONV_CALLBACK_VERSION = SUDO_API_MKVERSION(SUDO_CONV_CALLBACK_VERSION_MAJOR, SUDO_CONV_CALLBACK_VERSION_MINOR);
pub const SUDO_HOOK_VERSION_MAJOR = @as(c_int, 1);
pub const SUDO_HOOK_VERSION_MINOR = @as(c_int, 0);
pub const SUDO_HOOK_VERSION = SUDO_API_MKVERSION(SUDO_HOOK_VERSION_MAJOR, SUDO_HOOK_VERSION_MINOR);
pub const SUDO_HOOK_RET_ERROR = -@as(c_int, 1);
pub const SUDO_HOOK_RET_NEXT = @as(c_int, 0);
pub const SUDO_HOOK_RET_STOP = @as(c_int, 1);
pub const SUDO_HOOK_SETENV = @as(c_int, 1);
pub const SUDO_HOOK_UNSETENV = @as(c_int, 2);
pub const SUDO_HOOK_PUTENV = @as(c_int, 3);
pub const SUDO_HOOK_GETENV = @as(c_int, 4);
pub const SUDO_PLUGIN_EV_TIMEOUT = @as(c_int, 0x01);
pub const SUDO_PLUGIN_EV_READ = @as(c_int, 0x02);
pub const SUDO_PLUGIN_EV_WRITE = @as(c_int, 0x04);
pub const SUDO_PLUGIN_EV_PERSIST = @as(c_int, 0x08);
pub const SUDO_PLUGIN_EV_SIGNAL = @as(c_int, 0x10);
pub const SUDO_POLICY_PLUGIN = @as(c_int, 1);
pub const SUDO_IO_PLUGIN = @as(c_int, 2);
pub const SUDO_PLUGIN_NO_STATUS = @as(c_int, 0);
pub const SUDO_PLUGIN_WAIT_STATUS = @as(c_int, 1);
pub const SUDO_PLUGIN_EXEC_ERROR = @as(c_int, 2);
pub const SUDO_PLUGIN_SUDO_ERROR = @as(c_int, 3);
pub const SUDO_AUDIT_PLUGIN = @as(c_int, 3);
pub const SUDO_APPROVAL_PLUGIN = @as(c_int, 4);
pub const GROUP_API_VERSION_MAJOR = @as(c_int, 1);
pub const GROUP_API_VERSION_MINOR = @as(c_int, 0);
pub const GROUP_API_VERSION = SUDO_API_MKVERSION(GROUP_API_VERSION_MAJOR, GROUP_API_VERSION_MINOR);
pub inline fn GROUP_API_VERSION_GET_MAJOR(v: anytype) @TypeOf(SUDO_API_VERSION_GET_MAJOR(v)) {
    _ = &v;
    return SUDO_API_VERSION_GET_MAJOR(v);
}
pub inline fn GROUP_API_VERSION_GET_MINOR(v: anytype) @TypeOf(SUDO_API_VERSION_GET_MINOR(v)) {
    _ = &v;
    return SUDO_API_VERSION_GET_MINOR(v);
}
pub inline fn GROUP_API_VERSION_SET_MAJOR(vp: anytype, n: anytype) @TypeOf(SUDO_API_VERSION_SET_MAJOR(vp, n)) {
    _ = &vp;
    _ = &n;
    return SUDO_API_VERSION_SET_MAJOR(vp, n);
}
pub inline fn GROUP_API_VERSION_SET_MINOR(vp: anytype, n: anytype) @TypeOf(SUDO_API_VERSION_SET_MINOR(vp, n)) {
    _ = &vp;
    _ = &n;
    return SUDO_API_VERSION_SET_MINOR(vp, n);
}
pub const SECURITY_PAM_APPL_H_INCLUDED = "";
pub const SECURITY_PAM_TYPES_H_INCLUDED = "";
pub const __need_ptrdiff_t = "";
pub const __need_size_t = "";
pub const __need_rsize_t = "";
pub const __need_wchar_t = "";
pub const __need_NULL = "";
pub const __need_max_align_t = "";
pub const __need_offsetof = "";
pub const __STDDEF_H = "";
pub const _PTRDIFF_T = "";
pub const _RSIZE_T = "";
pub const _WCHAR_T = "";
pub const __CLANG_MAX_ALIGN_T_DEFINED = "";
pub const offsetof = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/include/__stddef_offsetof.h:16:9
pub const SECURITY_PAM_CONSTANTS_H_INCLUDED = "";
pub const SECURITY_OPENPAM_VERSION_H_INCLUDED = "";
pub const OPENPAM = "";
pub const OPENPAM_VERSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 20230627, .decimal);
pub const OPENPAM_RELEASE = "Ximenia";
pub const SECURITY_OPENPAM_ATTR_H_INCLUDED = "";
pub inline fn OPENPAM_GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const OPENPAM_FORMAT = @compileError("unable to translate macro: undefined identifier `__format__`");
// /nix/store/ndgnnx7x0w2yvllnf2qs7aishp0sciy8-openpam-20230627/include/security/openpam_attr.h:13:10
pub const OPENPAM_NONNULL = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/ndgnnx7x0w2yvllnf2qs7aishp0sciy8-openpam-20230627/include/security/openpam_attr.h:19:10
pub const OPENPAM_UNUSED = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /nix/store/ndgnnx7x0w2yvllnf2qs7aishp0sciy8-openpam-20230627/include/security/openpam_attr.h:25:10
pub const SECURITY_PAM_MODULES_H_INCLUDED = "";
pub const SECURITY_OPENPAM_H_INCLUDED = "";
pub const __need___va_list = "";
pub const __need_va_list = "";
pub const __need_va_arg = "";
pub const __need___va_copy = "";
pub const __need_va_copy = "";
pub const __STDARG_H = "";
pub const __GNUC_VA_LIST = "";
pub const _VA_LIST = "";
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/include/__stdarg_va_arg.h:17:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/include/__stdarg_va_arg.h:19:9
pub const va_arg = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/include/__stdarg_va_arg.h:20:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/include/__stdarg___va_copy.h:11:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/include/__stdarg_va_copy.h:11:9
pub const openpam_log = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/ndgnnx7x0w2yvllnf2qs7aishp0sciy8-openpam-20230627/include/security/openpam.h:220:9
pub const PAM_SM_DUMMY = @compileError("unable to translate macro: undefined identifier `pam_sm_`");
// /nix/store/ndgnnx7x0w2yvllnf2qs7aishp0sciy8-openpam-20230627/include/security/openpam.h:277:9
pub const PAM_SM_AUTH = "";
pub const _PAM_SM_AUTHENTICATE = pam_sm_authenticate;
pub const _PAM_SM_SETCRED = pam_sm_setcred;
pub const PAM_SM_ACCOUNT = "";
pub const _PAM_SM_ACCT_MGMT = pam_sm_acct_mgmt;
pub const PAM_SM_SESSION = "";
pub const _PAM_SM_OPEN_SESSION = pam_sm_open_session;
pub const _PAM_SM_CLOSE_SESSION = pam_sm_close_session;
pub const PAM_SM_PASSWORD = "";
pub const _PAM_SM_CHAUTHTOK = pam_sm_chauthtok;
pub const PAM_SOEXT = ".so";
pub const PAM_EXTERN = "";
pub const PAM_MODULE_ENTRY = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/ndgnnx7x0w2yvllnf2qs7aishp0sciy8-openpam-20230627/include/security/openpam.h:383:10
pub const _SYS_SYSCTL_H_ = "";
pub const _SYS_TIME_H_ = "";
pub const _STRUCT_TIMEVAL64 = "";
pub const ITIMER_REAL = @as(c_int, 0);
pub const ITIMER_VIRTUAL = @as(c_int, 1);
pub const ITIMER_PROF = @as(c_int, 2);
pub const TIMEVAL_TO_TIMESPEC = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/time.h:121:9
pub const TIMESPEC_TO_TIMEVAL = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/time.h:125:9
pub const DST_NONE = @as(c_int, 0);
pub const DST_USA = @as(c_int, 1);
pub const DST_AUST = @as(c_int, 2);
pub const DST_WET = @as(c_int, 3);
pub const DST_MET = @as(c_int, 4);
pub const DST_EET = @as(c_int, 5);
pub const DST_CAN = @as(c_int, 6);
pub const timerclear = @compileError("unable to translate C expr: unexpected token '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/time.h:143:9
pub inline fn timerisset(tvp: anytype) @TypeOf((tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0)) {
    _ = &tvp;
    return (tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0);
}
pub inline fn timercmp(tvp: anytype, uvp: anytype, cmp: anytype) @TypeOf(if (tvp.*.tv_sec == uvp.*.tv_sec) tvp.*.tv_usec ++ cmp(uvp).*.tv_usec else tvp.*.tv_sec ++ cmp(uvp).*.tv_sec) {
    _ = &tvp;
    _ = &uvp;
    _ = &cmp;
    return if (tvp.*.tv_sec == uvp.*.tv_sec) tvp.*.tv_usec ++ cmp(uvp).*.tv_usec else tvp.*.tv_sec ++ cmp(uvp).*.tv_sec;
}
pub const timeradd = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/time.h:149:9
pub const timersub = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/time.h:158:9
pub inline fn timevalcmp(l: anytype, r: anytype, cmp: anytype) @TypeOf(timercmp(l, r, cmp)) {
    _ = &l;
    _ = &r;
    _ = &cmp;
    return timercmp(l, r, cmp);
}
pub const _TIME_H_ = "";
pub const _CLOCK_T = "";
pub const CLOCKS_PER_SEC = @import("std").zig.c_translation.cast(clock_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal));
pub const __CLOCK_AVAILABILITY = __OSX_AVAILABLE(@as(f64, 10.12)) ++ __IOS_AVAILABLE(@as(f64, 10.0)) ++ __TVOS_AVAILABLE(@as(f64, 10.0)) ++ __WATCHOS_AVAILABLE(@as(f64, 3.0));
pub const CLOCK_REALTIME = _CLOCK_REALTIME;
pub const CLOCK_MONOTONIC = _CLOCK_MONOTONIC;
pub const CLOCK_MONOTONIC_RAW = _CLOCK_MONOTONIC_RAW;
pub const CLOCK_MONOTONIC_RAW_APPROX = _CLOCK_MONOTONIC_RAW_APPROX;
pub const CLOCK_UPTIME_RAW = _CLOCK_UPTIME_RAW;
pub const CLOCK_UPTIME_RAW_APPROX = _CLOCK_UPTIME_RAW_APPROX;
pub const CLOCK_PROCESS_CPUTIME_ID = _CLOCK_PROCESS_CPUTIME_ID;
pub const CLOCK_THREAD_CPUTIME_ID = _CLOCK_THREAD_CPUTIME_ID;
pub const TIME_UTC = @as(c_int, 1);
pub const _SYS_UCRED_H_ = "";
pub const _SYS_PARAM_H_ = "";
pub const BSD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 199506, .decimal);
pub const BSD4_3 = @as(c_int, 1);
pub const BSD4_4 = @as(c_int, 1);
pub const NeXTBSD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1995064, .decimal);
pub const NeXTBSD4_0 = @as(c_int, 0);
pub const _SYS_TYPES_H_ = "";
pub const _BSD_MACHINE_ENDIAN_H_ = "";
pub const _ARM__ENDIAN_H_ = "";
pub const _QUAD_HIGHWORD = @as(c_int, 1);
pub const _QUAD_LOWWORD = @as(c_int, 0);
pub const _SYS__ENDIAN_H_ = "";
pub const _BSD_MACHINE__ENDIAN_H_ = "";
pub const _ARM___ENDIAN_H_ = "";
pub const _SYS___ENDIAN_H_ = "";
pub const __DARWIN_LITTLE_ENDIAN = @as(c_int, 1234);
pub const __DARWIN_BIG_ENDIAN = @as(c_int, 4321);
pub const __DARWIN_PDP_ENDIAN = @as(c_int, 3412);
pub const LITTLE_ENDIAN = __DARWIN_LITTLE_ENDIAN;
pub const BIG_ENDIAN = __DARWIN_BIG_ENDIAN;
pub const PDP_ENDIAN = __DARWIN_PDP_ENDIAN;
pub const __DARWIN_BYTE_ORDER = __DARWIN_LITTLE_ENDIAN;
pub const BYTE_ORDER = __DARWIN_BYTE_ORDER;
pub const _OS__OSBYTEORDER_H = "";
pub inline fn __DARWIN_OSSwapConstInt16(x: anytype) __uint16_t {
    _ = &x;
    return @import("std").zig.c_translation.cast(__uint16_t, ((@import("std").zig.c_translation.cast(__uint16_t, x) & @as(c_uint, 0xff00)) >> @as(c_int, 8)) | ((@import("std").zig.c_translation.cast(__uint16_t, x) & @as(c_uint, 0x00ff)) << @as(c_int, 8)));
}
pub inline fn __DARWIN_OSSwapConstInt32(x: anytype) __uint32_t {
    _ = &x;
    return @import("std").zig.c_translation.cast(__uint32_t, ((((@import("std").zig.c_translation.cast(__uint32_t, x) & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((@import("std").zig.c_translation.cast(__uint32_t, x) & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint32_t, x) & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint32_t, x) & @as(c_uint, 0x000000ff)) << @as(c_int, 24)));
}
pub inline fn __DARWIN_OSSwapConstInt64(x: anytype) __uint64_t {
    _ = &x;
    return @import("std").zig.c_translation.cast(__uint64_t, ((((((((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((@import("std").zig.c_translation.cast(__uint64_t, x) & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56)));
}
pub const _OS__OSBYTEORDERARM_H = "";
pub const __DARWIN_OS_INLINE = @compileError("unable to translate C expr: unexpected token 'static'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/libkern/arm/_OSByteOrder.h:38:17
pub inline fn __DARWIN_OSSwapInt16(x: anytype) __uint16_t {
    _ = &x;
    return @import("std").zig.c_translation.cast(__uint16_t, if (__builtin_constant_p(x) != 0) __DARWIN_OSSwapConstInt16(x) else _OSSwapInt16(x));
}
pub inline fn __DARWIN_OSSwapInt32(x: anytype) @TypeOf(if (__builtin_constant_p(x) != 0) __DARWIN_OSSwapConstInt32(x) else _OSSwapInt32(x)) {
    _ = &x;
    return if (__builtin_constant_p(x) != 0) __DARWIN_OSSwapConstInt32(x) else _OSSwapInt32(x);
}
pub inline fn __DARWIN_OSSwapInt64(x: anytype) @TypeOf(if (__builtin_constant_p(x) != 0) __DARWIN_OSSwapConstInt64(x) else _OSSwapInt64(x)) {
    _ = &x;
    return if (__builtin_constant_p(x) != 0) __DARWIN_OSSwapConstInt64(x) else _OSSwapInt64(x);
}
pub inline fn ntohs(x: anytype) @TypeOf(__DARWIN_OSSwapInt16(x)) {
    _ = &x;
    return __DARWIN_OSSwapInt16(x);
}
pub inline fn htons(x: anytype) @TypeOf(__DARWIN_OSSwapInt16(x)) {
    _ = &x;
    return __DARWIN_OSSwapInt16(x);
}
pub inline fn ntohl(x: anytype) @TypeOf(__DARWIN_OSSwapInt32(x)) {
    _ = &x;
    return __DARWIN_OSSwapInt32(x);
}
pub inline fn htonl(x: anytype) @TypeOf(__DARWIN_OSSwapInt32(x)) {
    _ = &x;
    return __DARWIN_OSSwapInt32(x);
}
pub inline fn ntohll(x: anytype) @TypeOf(__DARWIN_OSSwapInt64(x)) {
    _ = &x;
    return __DARWIN_OSSwapInt64(x);
}
pub inline fn htonll(x: anytype) @TypeOf(__DARWIN_OSSwapInt64(x)) {
    _ = &x;
    return __DARWIN_OSSwapInt64(x);
}
pub const NTOHL = @compileError("unable to translate C expr: unexpected token '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_endian.h:144:9
pub const NTOHS = @compileError("unable to translate C expr: unexpected token '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_endian.h:145:9
pub const NTOHLL = @compileError("unable to translate C expr: unexpected token '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_endian.h:146:9
pub const HTONL = @compileError("unable to translate C expr: unexpected token '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_endian.h:147:9
pub const HTONS = @compileError("unable to translate C expr: unexpected token '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_endian.h:148:9
pub const HTONLL = @compileError("unable to translate C expr: unexpected token '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/_endian.h:149:9
pub const _U_CHAR = "";
pub const _U_SHORT = "";
pub const _U_INT = "";
pub const _U_LONG = "";
pub const __DARWIN_UINT = "";
pub const _CADDR_T = "";
pub const _BLKCNT_T = "";
pub const _BLKSIZE_T = "";
pub const _IN_ADDR_T = "";
pub const _IN_PORT_T = "";
pub const _INO_T = "";
pub const _INO64_T = "";
pub const _KEY_T = "";
pub const _NLINK_T = "";
pub const _ID_T = "";
pub inline fn major(x: anytype) i32 {
    _ = &x;
    return @import("std").zig.c_translation.cast(i32, (@import("std").zig.c_translation.cast(u_int32_t, x) >> @as(c_int, 24)) & @as(c_int, 0xff));
}
pub inline fn minor(x: anytype) i32 {
    _ = &x;
    return @import("std").zig.c_translation.cast(i32, x & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff, .hex));
}
pub inline fn makedev(x: anytype, y: anytype) dev_t {
    _ = &x;
    _ = &y;
    return @import("std").zig.c_translation.cast(dev_t, (x << @as(c_int, 24)) | y);
}
pub const _ERRNO_T = "";
pub const NBBY = __DARWIN_NBBY;
pub const NFDBITS = __DARWIN_NFDBITS;
pub inline fn howmany(x: anytype, y: anytype) @TypeOf(__DARWIN_howmany(x, y)) {
    _ = &x;
    _ = &y;
    return __DARWIN_howmany(x, y);
}
pub const _PTHREAD_ATTR_T = "";
pub const _PTHREAD_COND_T = "";
pub const _PTHREAD_CONDATTR_T = "";
pub const _PTHREAD_MUTEX_T = "";
pub const _PTHREAD_MUTEXATTR_T = "";
pub const _PTHREAD_ONCE_T = "";
pub const _PTHREAD_RWLOCK_T = "";
pub const _PTHREAD_RWLOCKATTR_T = "";
pub const _PTHREAD_T = "";
pub const _PTHREAD_KEY_T = "";
pub const _FSBLKCNT_T = "";
pub const _FSFILCNT_T = "";
pub const MAXCOMLEN = @as(c_int, 16);
pub const MAXINTERP = @as(c_int, 64);
pub const MAXLOGNAME = @as(c_int, 255);
pub const MAXUPRC = CHILD_MAX;
pub const NCARGS = ARG_MAX;
pub const NGROUPS = NGROUPS_MAX;
pub const NOFILE = @as(c_int, 256);
pub const NOGROUP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const MAXHOSTNAMELEN = @as(c_int, 256);
pub const MAXDOMNAMELEN = @as(c_int, 256);
pub const _BSD_MACHINE_PARAM_H_ = "";
pub const _ARM_PARAM_H_ = "";
pub const _ARM__PARAM_H_ = "";
pub const __DARWIN_ALIGNBYTES = @import("std").zig.c_translation.sizeof(__darwin_size_t) - @as(c_int, 1);
pub inline fn __DARWIN_ALIGN(p: anytype) @TypeOf(@import("std").zig.c_translation.cast(__darwin_size_t, @import("std").zig.c_translation.cast(__darwin_size_t, p) + __DARWIN_ALIGNBYTES) & ~__DARWIN_ALIGNBYTES) {
    _ = &p;
    return @import("std").zig.c_translation.cast(__darwin_size_t, @import("std").zig.c_translation.cast(__darwin_size_t, p) + __DARWIN_ALIGNBYTES) & ~__DARWIN_ALIGNBYTES;
}
pub const __DARWIN_ALIGNBYTES32 = @import("std").zig.c_translation.sizeof(__uint32_t) - @as(c_int, 1);
pub inline fn __DARWIN_ALIGN32(p: anytype) @TypeOf(@import("std").zig.c_translation.cast(__darwin_size_t, @import("std").zig.c_translation.cast(__darwin_size_t, p) + __DARWIN_ALIGNBYTES32) & ~__DARWIN_ALIGNBYTES32) {
    _ = &p;
    return @import("std").zig.c_translation.cast(__darwin_size_t, @import("std").zig.c_translation.cast(__darwin_size_t, p) + __DARWIN_ALIGNBYTES32) & ~__DARWIN_ALIGNBYTES32;
}
pub const ALIGNBYTES = __DARWIN_ALIGNBYTES;
pub inline fn ALIGN(p: anytype) @TypeOf(__DARWIN_ALIGN(p)) {
    _ = &p;
    return __DARWIN_ALIGN(p);
}
pub const NBPG = @as(c_int, 4096);
pub const PGOFSET = NBPG - @as(c_int, 1);
pub const PGSHIFT = @as(c_int, 12);
pub const DEV_BSIZE = @as(c_int, 512);
pub const DEV_BSHIFT = @as(c_int, 9);
pub const BLKDEV_IOSIZE = @as(c_int, 2048);
pub const MAXPHYS = @as(c_int, 64) * @as(c_int, 1024);
pub const CLSIZE = @as(c_int, 1);
pub const CLSIZELOG2 = @as(c_int, 0);
pub const MSIZESHIFT = @as(c_int, 8);
pub const MSIZE = @as(c_int, 1) << MSIZESHIFT;
pub const MCLSHIFT = @as(c_int, 11);
pub const MCLBYTES = @as(c_int, 1) << MCLSHIFT;
pub const MBIGCLSHIFT = @as(c_int, 12);
pub const MBIGCLBYTES = @as(c_int, 1) << MBIGCLSHIFT;
pub const M16KCLSHIFT = @as(c_int, 14);
pub const M16KCLBYTES = @as(c_int, 1) << M16KCLSHIFT;
pub const MCLOFSET = MCLBYTES - @as(c_int, 1);
pub const NMBCLUSTERS = @compileError("unable to translate macro: undefined identifier `CONFIG_NMBCLUSTERS`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/arm/param.h:93:9
pub inline fn ctos(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn stoc(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn ctod(x: anytype) @TypeOf(x << (PGSHIFT - DEV_BSHIFT)) {
    _ = &x;
    return x << (PGSHIFT - DEV_BSHIFT);
}
pub inline fn dtoc(x: anytype) @TypeOf(x >> (PGSHIFT - DEV_BSHIFT)) {
    _ = &x;
    return x >> (PGSHIFT - DEV_BSHIFT);
}
pub inline fn dtob(x: anytype) @TypeOf(x << DEV_BSHIFT) {
    _ = &x;
    return x << DEV_BSHIFT;
}
pub inline fn ctob(x: anytype) @TypeOf(x << PGSHIFT) {
    _ = &x;
    return x << PGSHIFT;
}
pub inline fn btoc(x: anytype) @TypeOf((@import("std").zig.c_translation.cast(c_uint, x) + (NBPG - @as(c_int, 1))) >> PGSHIFT) {
    _ = &x;
    return (@import("std").zig.c_translation.cast(c_uint, x) + (NBPG - @as(c_int, 1))) >> PGSHIFT;
}
pub inline fn btodb(bytes: anytype, devBlockSize: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.cast(c_uint, bytes), devBlockSize)) {
    _ = &bytes;
    _ = &devBlockSize;
    return @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.cast(c_uint, bytes), devBlockSize);
}
pub inline fn dbtob(db: anytype, devBlockSize: anytype) @TypeOf(@import("std").zig.c_translation.cast(c_uint, db) * devBlockSize) {
    _ = &db;
    _ = &devBlockSize;
    return @import("std").zig.c_translation.cast(c_uint, db) * devBlockSize;
}
pub inline fn bdbtofsb(bn: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(bn, @import("std").zig.c_translation.MacroArithmetic.div(BLKDEV_IOSIZE, DEV_BSIZE))) {
    _ = &bn;
    return @import("std").zig.c_translation.MacroArithmetic.div(bn, @import("std").zig.c_translation.MacroArithmetic.div(BLKDEV_IOSIZE, DEV_BSIZE));
}
pub inline fn STATUS_WORD(rpl: anytype, ipl: anytype) @TypeOf((ipl << @as(c_int, 8)) | rpl) {
    _ = &rpl;
    _ = &ipl;
    return (ipl << @as(c_int, 8)) | rpl;
}
pub inline fn USERMODE(x: anytype) @TypeOf((x & @as(c_int, 3)) == @as(c_int, 3)) {
    _ = &x;
    return (x & @as(c_int, 3)) == @as(c_int, 3);
}
pub inline fn BASEPRI(x: anytype) @TypeOf((x & (@as(c_int, 255) << @as(c_int, 8))) == @as(c_int, 0)) {
    _ = &x;
    return (x & (@as(c_int, 255) << @as(c_int, 8))) == @as(c_int, 0);
}
pub const DELAY = @compileError("unable to translate macro: undefined identifier `N`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/arm/param.h:146:9
pub const __CLANG_LIMITS_H = "";
pub const _GCC_LIMITS_H_ = "";
pub const _LIMITS_H_ = "";
pub const _BSD_MACHINE_LIMITS_H_ = "";
pub const _ARM_LIMITS_H_ = "";
pub const _ARM__LIMITS_H_ = "";
pub const __DARWIN_CLK_TCK = @as(c_int, 100);
pub const USE_CLANG_LIMITS = @as(c_int, 0);
pub const MB_LEN_MAX = @as(c_int, 6);
pub const CLK_TCK = __DARWIN_CLK_TCK;
pub const CHAR_BIT = @as(c_int, 8);
pub const SCHAR_MAX = @as(c_int, 127);
pub const SCHAR_MIN = -@as(c_int, 128);
pub const UCHAR_MAX = @as(c_int, 255);
pub const CHAR_MAX = @as(c_int, 127);
pub const CHAR_MIN = -@as(c_int, 128);
pub const USHRT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const SHRT_MAX = @as(c_int, 32767);
pub const SHRT_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const UINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex);
pub const INT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const ULONG_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 0xffffffffffffffff, .hex);
pub const LONG_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 0x7fffffffffffffff, .hex);
pub const LONG_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 0x7fffffffffffffff, .hex) - @as(c_int, 1);
pub const ULLONG_MAX = @as(c_ulonglong, 0xffffffffffffffff);
pub const LLONG_MAX = @as(c_longlong, 0x7fffffffffffffff);
pub const LLONG_MIN = -@as(c_longlong, 0x7fffffffffffffff) - @as(c_int, 1);
pub const LONG_BIT = @as(c_int, 64);
pub const SSIZE_MAX = LONG_MAX;
pub const WORD_BIT = @as(c_int, 32);
pub const SIZE_T_MAX = ULONG_MAX;
pub const UQUAD_MAX = ULLONG_MAX;
pub const QUAD_MAX = LLONG_MAX;
pub const QUAD_MIN = LLONG_MIN;
pub const _POSIX_ARG_MAX = @as(c_int, 4096);
pub const _POSIX_CHILD_MAX = @as(c_int, 25);
pub const _POSIX_LINK_MAX = @as(c_int, 8);
pub const _POSIX_MAX_CANON = @as(c_int, 255);
pub const _POSIX_MAX_INPUT = @as(c_int, 255);
pub const _POSIX_NAME_MAX = @as(c_int, 14);
pub const _POSIX_NGROUPS_MAX = @as(c_int, 8);
pub const _POSIX_OPEN_MAX = @as(c_int, 20);
pub const _POSIX_PATH_MAX = @as(c_int, 256);
pub const _POSIX_PIPE_BUF = @as(c_int, 512);
pub const _POSIX_SSIZE_MAX = @as(c_int, 32767);
pub const _POSIX_STREAM_MAX = @as(c_int, 8);
pub const _POSIX_TZNAME_MAX = @as(c_int, 6);
pub const _POSIX2_BC_BASE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_DIM_MAX = @as(c_int, 2048);
pub const _POSIX2_BC_SCALE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_STRING_MAX = @as(c_int, 1000);
pub const _POSIX2_EQUIV_CLASS_MAX = @as(c_int, 2);
pub const _POSIX2_EXPR_NEST_MAX = @as(c_int, 32);
pub const _POSIX2_LINE_MAX = @as(c_int, 2048);
pub const _POSIX2_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX_AIO_LISTIO_MAX = @as(c_int, 2);
pub const _POSIX_AIO_MAX = @as(c_int, 1);
pub const _POSIX_DELAYTIMER_MAX = @as(c_int, 32);
pub const _POSIX_MQ_OPEN_MAX = @as(c_int, 8);
pub const _POSIX_MQ_PRIO_MAX = @as(c_int, 32);
pub const _POSIX_RTSIG_MAX = @as(c_int, 8);
pub const _POSIX_SEM_NSEMS_MAX = @as(c_int, 256);
pub const _POSIX_SEM_VALUE_MAX = @as(c_int, 32767);
pub const _POSIX_SIGQUEUE_MAX = @as(c_int, 32);
pub const _POSIX_TIMER_MAX = @as(c_int, 32);
pub const _POSIX_CLOCKRES_MIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 20000000, .decimal);
pub const _POSIX_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const _POSIX_THREAD_THREADS_MAX = @as(c_int, 64);
pub const PTHREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const PTHREAD_KEYS_MAX = @as(c_int, 512);
pub const PTHREAD_STACK_MIN = @as(c_int, 16384);
pub const _POSIX_HOST_NAME_MAX = @as(c_int, 255);
pub const _POSIX_LOGIN_NAME_MAX = @as(c_int, 9);
pub const _POSIX_SS_REPL_MAX = @as(c_int, 4);
pub const _POSIX_SYMLINK_MAX = @as(c_int, 255);
pub const _POSIX_SYMLOOP_MAX = @as(c_int, 8);
pub const _POSIX_TRACE_EVENT_NAME_MAX = @as(c_int, 30);
pub const _POSIX_TRACE_NAME_MAX = @as(c_int, 8);
pub const _POSIX_TRACE_SYS_MAX = @as(c_int, 8);
pub const _POSIX_TRACE_USER_EVENT_MAX = @as(c_int, 32);
pub const _POSIX_TTY_NAME_MAX = @as(c_int, 9);
pub const _POSIX2_CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const _POSIX2_COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const _POSIX_RE_DUP_MAX = _POSIX2_RE_DUP_MAX;
pub const OFF_MIN = LLONG_MIN;
pub const OFF_MAX = LLONG_MAX;
pub const PASS_MAX = @as(c_int, 128);
pub const NL_ARGMAX = @as(c_int, 9);
pub const NL_LANGMAX = @as(c_int, 14);
pub const NL_MSGMAX = @as(c_int, 32767);
pub const NL_NMAX = @as(c_int, 1);
pub const NL_SETMAX = @as(c_int, 255);
pub const NL_TEXTMAX = @as(c_int, 2048);
pub const _XOPEN_IOV_MAX = @as(c_int, 16);
pub const IOV_MAX = @as(c_int, 1024);
pub const _XOPEN_NAME_MAX = @as(c_int, 255);
pub const _XOPEN_PATH_MAX = @as(c_int, 1024);
pub const LONG_LONG_MAX = __LONG_LONG_MAX__;
pub const LONG_LONG_MIN = -__LONG_LONG_MAX__ - @as(c_longlong, 1);
pub const ULONG_LONG_MAX = (__LONG_LONG_MAX__ * @as(c_ulonglong, 2)) + @as(c_ulonglong, 1);
pub const _SYS_SIGNAL_H_ = "";
pub const __DARWIN_NSIG = @as(c_int, 32);
pub const NSIG = __DARWIN_NSIG;
pub const _BSD_MACHINE_SIGNAL_H_ = "";
pub const _ARM_SIGNAL_ = @as(c_int, 1);
pub const SIGHUP = @as(c_int, 1);
pub const SIGINT = @as(c_int, 2);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGILL = @as(c_int, 4);
pub const SIGTRAP = @as(c_int, 5);
pub const SIGABRT = @as(c_int, 6);
pub const SIGIOT = SIGABRT;
pub const SIGEMT = @as(c_int, 7);
pub const SIGFPE = @as(c_int, 8);
pub const SIGKILL = @as(c_int, 9);
pub const SIGBUS = @as(c_int, 10);
pub const SIGSEGV = @as(c_int, 11);
pub const SIGSYS = @as(c_int, 12);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGALRM = @as(c_int, 14);
pub const SIGTERM = @as(c_int, 15);
pub const SIGURG = @as(c_int, 16);
pub const SIGSTOP = @as(c_int, 17);
pub const SIGTSTP = @as(c_int, 18);
pub const SIGCONT = @as(c_int, 19);
pub const SIGCHLD = @as(c_int, 20);
pub const SIGTTIN = @as(c_int, 21);
pub const SIGTTOU = @as(c_int, 22);
pub const SIGIO = @as(c_int, 23);
pub const SIGXCPU = @as(c_int, 24);
pub const SIGXFSZ = @as(c_int, 25);
pub const SIGVTALRM = @as(c_int, 26);
pub const SIGPROF = @as(c_int, 27);
pub const SIGWINCH = @as(c_int, 28);
pub const SIGINFO = @as(c_int, 29);
pub const SIGUSR1 = @as(c_int, 30);
pub const SIGUSR2 = @as(c_int, 31);
pub const SIG_DFL = @compileError("unable to translate C expr: expected ')' instead got '('");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/signal.h:131:9
pub const SIG_IGN = @compileError("unable to translate C expr: expected ')' instead got '('");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/signal.h:132:9
pub const SIG_HOLD = @compileError("unable to translate C expr: expected ')' instead got '('");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/signal.h:133:9
pub const SIG_ERR = @compileError("unable to translate C expr: expected ')' instead got '('");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/signal.h:134:9
pub const _BSD_MACHINE__MCONTEXT_H_ = "";
pub const __ARM_MCONTEXT_H_ = "";
pub const _MACH_MACHINE__STRUCTS_H_ = "";
pub const _MACH_ARM__STRUCTS_H_ = "";
pub const _STRUCT_ARM_EXCEPTION_STATE = struct___darwin_arm_exception_state;
pub const _STRUCT_ARM_EXCEPTION_STATE64 = struct___darwin_arm_exception_state64;
pub const _STRUCT_ARM_EXCEPTION_STATE64_V2 = struct___darwin_arm_exception_state64_v2;
pub const _STRUCT_ARM_THREAD_STATE = struct___darwin_arm_thread_state;
pub const __DARWIN_OPAQUE_ARM_THREAD_STATE64 = @as(c_int, 0);
pub const _STRUCT_ARM_THREAD_STATE64 = struct___darwin_arm_thread_state64;
pub inline fn __darwin_arm_thread_state64_get_pc(ts: anytype) @TypeOf(ts.__pc) {
    _ = &ts;
    return ts.__pc;
}
pub inline fn __darwin_arm_thread_state64_get_pc_fptr(ts: anytype) ?*anyopaque {
    _ = &ts;
    return @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast(usize, ts.__pc));
}
pub const __darwin_arm_thread_state64_set_pc_fptr = @compileError("unable to translate C expr: expected ')' instead got '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/arm/_structs.h:436:9
pub const __darwin_arm_thread_state64_set_pc_presigned_fptr = @compileError("unable to translate C expr: expected ')' instead got '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/arm/_structs.h:439:9
pub inline fn __darwin_arm_thread_state64_get_lr(ts: anytype) @TypeOf(ts.__lr) {
    _ = &ts;
    return ts.__lr;
}
pub inline fn __darwin_arm_thread_state64_get_lr_fptr(ts: anytype) ?*anyopaque {
    _ = &ts;
    return @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast(usize, ts.__lr));
}
pub const __darwin_arm_thread_state64_set_lr_fptr = @compileError("unable to translate C expr: expected ')' instead got '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/arm/_structs.h:448:9
pub const __darwin_arm_thread_state64_set_lr_presigned_fptr = @compileError("unable to translate C expr: expected ')' instead got '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/arm/_structs.h:451:9
pub inline fn __darwin_arm_thread_state64_get_sp(ts: anytype) @TypeOf(ts.__sp) {
    _ = &ts;
    return ts.__sp;
}
pub const __darwin_arm_thread_state64_set_sp = @compileError("unable to translate C expr: expected ')' instead got '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/arm/_structs.h:457:9
pub inline fn __darwin_arm_thread_state64_get_fp(ts: anytype) @TypeOf(ts.__fp) {
    _ = &ts;
    return ts.__fp;
}
pub const __darwin_arm_thread_state64_set_fp = @compileError("unable to translate C expr: expected ')' instead got '='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/arm/_structs.h:463:9
pub const __darwin_arm_thread_state64_ptrauth_strip = @import("std").zig.c_translation.Macros.DISCARD;
pub const _STRUCT_ARM_VFP_STATE = struct___darwin_arm_vfp_state;
pub const _STRUCT_ARM_NEON_STATE64 = struct___darwin_arm_neon_state64;
pub const _STRUCT_ARM_NEON_STATE = struct___darwin_arm_neon_state;
pub const _STRUCT_ARM_PAGEIN_STATE = struct___arm_pagein_state;
pub const _STRUCT_ARM_SME_STATE = struct___darwin_arm_sme_state;
pub const _STRUCT_ARM_SVE_Z_STATE = struct___darwin_arm_sve_z_state;
pub const _STRUCT_ARM_SVE_P_STATE = struct___darwin_arm_sve_p_state;
pub const _STRUCT_ARM_SME_ZA_STATE = struct___darwin_arm_sme_za_state;
pub const _STRUCT_ARM_SME2_STATE = struct___darwin_arm_sme2_state;
pub const _STRUCT_ARM_LEGACY_DEBUG_STATE = struct___arm_legacy_debug_state;
pub const _STRUCT_ARM_DEBUG_STATE32 = struct___darwin_arm_debug_state32;
pub const _STRUCT_ARM_DEBUG_STATE64 = struct___darwin_arm_debug_state64;
pub const _STRUCT_ARM_CPMU_STATE64 = struct___darwin_arm_cpmu_state64;
pub const _STRUCT_MCONTEXT32 = struct___darwin_mcontext32;
pub const _STRUCT_MCONTEXT64 = struct___darwin_mcontext64;
pub const _MCONTEXT_T = "";
pub const _STRUCT_MCONTEXT = _STRUCT_MCONTEXT64;
pub const _STRUCT_SIGALTSTACK = struct___darwin_sigaltstack;
pub const _STRUCT_UCONTEXT = struct___darwin_ucontext;
pub const SIGEV_NONE = @as(c_int, 0);
pub const SIGEV_SIGNAL = @as(c_int, 1);
pub const SIGEV_THREAD = @as(c_int, 3);
pub const ILL_NOOP = @as(c_int, 0);
pub const ILL_ILLOPC = @as(c_int, 1);
pub const ILL_ILLTRP = @as(c_int, 2);
pub const ILL_PRVOPC = @as(c_int, 3);
pub const ILL_ILLOPN = @as(c_int, 4);
pub const ILL_ILLADR = @as(c_int, 5);
pub const ILL_PRVREG = @as(c_int, 6);
pub const ILL_COPROC = @as(c_int, 7);
pub const ILL_BADSTK = @as(c_int, 8);
pub const FPE_NOOP = @as(c_int, 0);
pub const FPE_FLTDIV = @as(c_int, 1);
pub const FPE_FLTOVF = @as(c_int, 2);
pub const FPE_FLTUND = @as(c_int, 3);
pub const FPE_FLTRES = @as(c_int, 4);
pub const FPE_FLTINV = @as(c_int, 5);
pub const FPE_FLTSUB = @as(c_int, 6);
pub const FPE_INTDIV = @as(c_int, 7);
pub const FPE_INTOVF = @as(c_int, 8);
pub const SEGV_NOOP = @as(c_int, 0);
pub const SEGV_MAPERR = @as(c_int, 1);
pub const SEGV_ACCERR = @as(c_int, 2);
pub const BUS_NOOP = @as(c_int, 0);
pub const BUS_ADRALN = @as(c_int, 1);
pub const BUS_ADRERR = @as(c_int, 2);
pub const BUS_OBJERR = @as(c_int, 3);
pub const TRAP_BRKPT = @as(c_int, 1);
pub const TRAP_TRACE = @as(c_int, 2);
pub const CLD_NOOP = @as(c_int, 0);
pub const CLD_EXITED = @as(c_int, 1);
pub const CLD_KILLED = @as(c_int, 2);
pub const CLD_DUMPED = @as(c_int, 3);
pub const CLD_TRAPPED = @as(c_int, 4);
pub const CLD_STOPPED = @as(c_int, 5);
pub const CLD_CONTINUED = @as(c_int, 6);
pub const POLL_IN = @as(c_int, 1);
pub const POLL_OUT = @as(c_int, 2);
pub const POLL_MSG = @as(c_int, 3);
pub const POLL_ERR = @as(c_int, 4);
pub const POLL_PRI = @as(c_int, 5);
pub const POLL_HUP = @as(c_int, 6);
pub const sa_handler = __sigaction_u.__sa_handler;
pub const sa_sigaction = __sigaction_u.__sa_sigaction;
pub const SA_ONSTACK = @as(c_int, 0x0001);
pub const SA_RESTART = @as(c_int, 0x0002);
pub const SA_RESETHAND = @as(c_int, 0x0004);
pub const SA_NOCLDSTOP = @as(c_int, 0x0008);
pub const SA_NODEFER = @as(c_int, 0x0010);
pub const SA_NOCLDWAIT = @as(c_int, 0x0020);
pub const SA_SIGINFO = @as(c_int, 0x0040);
pub const SA_USERTRAMP = @as(c_int, 0x0100);
pub const SA_64REGSET = @as(c_int, 0x0200);
pub const SA_USERSPACE_MASK = (((((SA_ONSTACK | SA_RESTART) | SA_RESETHAND) | SA_NOCLDSTOP) | SA_NODEFER) | SA_NOCLDWAIT) | SA_SIGINFO;
pub const SIG_BLOCK = @as(c_int, 1);
pub const SIG_UNBLOCK = @as(c_int, 2);
pub const SIG_SETMASK = @as(c_int, 3);
pub const SI_USER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10001, .hex);
pub const SI_QUEUE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10002, .hex);
pub const SI_TIMER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10003, .hex);
pub const SI_ASYNCIO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004, .hex);
pub const SI_MESGQ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10005, .hex);
pub const SS_ONSTACK = @as(c_int, 0x0001);
pub const SS_DISABLE = @as(c_int, 0x0004);
pub const MINSIGSTKSZ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const SIGSTKSZ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 131072, .decimal);
pub const SV_ONSTACK = SA_ONSTACK;
pub const SV_INTERRUPT = SA_RESTART;
pub const SV_RESETHAND = SA_RESETHAND;
pub const SV_NODEFER = SA_NODEFER;
pub const SV_NOCLDSTOP = SA_NOCLDSTOP;
pub const SV_SIGINFO = SA_SIGINFO;
pub const sv_onstack = @compileError("unable to translate macro: undefined identifier `sv_flags`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/signal.h:361:9
pub inline fn sigmask(m: anytype) @TypeOf(@as(c_int, 1) << (m - @as(c_int, 1))) {
    _ = &m;
    return @as(c_int, 1) << (m - @as(c_int, 1));
}
pub const BADSIG = SIG_ERR;
pub const PSWP = @as(c_int, 0);
pub const PVM = @as(c_int, 4);
pub const PINOD = @as(c_int, 8);
pub const PRIBIO = @as(c_int, 16);
pub const PVFS = @as(c_int, 20);
pub const PZERO = @as(c_int, 22);
pub const PSOCK = @as(c_int, 24);
pub const PWAIT = @as(c_int, 32);
pub const PLOCK = @as(c_int, 36);
pub const PPAUSE = @as(c_int, 40);
pub const PUSER = @as(c_int, 50);
pub const MAXPRI = @as(c_int, 127);
pub const PRIMASK = @as(c_int, 0x0ff);
pub const PCATCH = @as(c_int, 0x100);
pub const PTTYBLOCK = @as(c_int, 0x200);
pub const PDROP = @as(c_int, 0x400);
pub const PSPIN = @as(c_int, 0x800);
pub const NBPW = @import("std").zig.c_translation.sizeof(c_int);
pub const CMASK = @as(c_int, 0o22);
pub const NODEV = @import("std").zig.c_translation.cast(dev_t, -@as(c_int, 1));
pub const CLBYTES = CLSIZE * NBPG;
pub const CLOFSET = (CLSIZE * NBPG) - @as(c_int, 1);
pub inline fn claligned(x: anytype) @TypeOf((@import("std").zig.c_translation.cast(c_int, x) & CLOFSET) == @as(c_int, 0)) {
    _ = &x;
    return (@import("std").zig.c_translation.cast(c_int, x) & CLOFSET) == @as(c_int, 0);
}
pub const CLOFF = CLOFSET;
pub const CLSHIFT = PGSHIFT + CLSIZELOG2;
pub inline fn clbase(i: anytype) @TypeOf(i) {
    _ = &i;
    return i;
}
pub inline fn clrnd(i: anytype) @TypeOf(i) {
    _ = &i;
    return i;
}
pub const CBLOCK = @as(c_int, 64);
pub const CBQSIZE = @import("std").zig.c_translation.MacroArithmetic.div(CBLOCK, NBBY);
pub const CBSIZE = @compileError("unable to translate macro: undefined identifier `cblock`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/param.h:167:9
pub const CROUND = CBLOCK - @as(c_int, 1);
pub const MAXBSIZE = @as(c_int, 256) * @as(c_int, 4096);
pub const MAXPHYSIO = MAXPHYS;
pub const MAXFRAG = @as(c_int, 8);
pub const MAXPHYSIO_WIRED = (@as(c_int, 16) * @as(c_int, 1024)) * @as(c_int, 1024);
pub const MAXPATHLEN = PATH_MAX;
pub const MAXSYMLINKS = @as(c_int, 32);
pub const setbit = @compileError("unable to translate C expr: expected ')' instead got '|='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/param.h:200:9
pub const clrbit = @compileError("unable to translate C expr: expected ')' instead got '&='");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/param.h:201:9
pub inline fn isset(a: anytype, i: anytype) @TypeOf(@import("std").zig.c_translation.cast([*c]u8, a)[@as(usize, @intCast(@import("std").zig.c_translation.MacroArithmetic.div(i, NBBY)))] & (@as(c_uint, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(i, NBBY))) {
    _ = &a;
    _ = &i;
    return @import("std").zig.c_translation.cast([*c]u8, a)[@as(usize, @intCast(@import("std").zig.c_translation.MacroArithmetic.div(i, NBBY)))] & (@as(c_uint, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(i, NBBY));
}
pub inline fn isclr(a: anytype, i: anytype) @TypeOf((@import("std").zig.c_translation.cast([*c]u8, a)[@as(usize, @intCast(@import("std").zig.c_translation.MacroArithmetic.div(i, NBBY)))] & (@as(c_uint, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(i, NBBY))) == @as(c_int, 0)) {
    _ = &a;
    _ = &i;
    return (@import("std").zig.c_translation.cast([*c]u8, a)[@as(usize, @intCast(@import("std").zig.c_translation.MacroArithmetic.div(i, NBBY)))] & (@as(c_uint, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(i, NBBY))) == @as(c_int, 0);
}
pub inline fn roundup(x: anytype, y: anytype) @TypeOf(if (@import("std").zig.c_translation.MacroArithmetic.rem(x, y) == @as(c_int, 0)) x else x + (y - @import("std").zig.c_translation.MacroArithmetic.rem(x, y))) {
    _ = &x;
    _ = &y;
    return if (@import("std").zig.c_translation.MacroArithmetic.rem(x, y) == @as(c_int, 0)) x else x + (y - @import("std").zig.c_translation.MacroArithmetic.rem(x, y));
}
pub inline fn powerof2(x: anytype) @TypeOf(((x - @as(c_int, 1)) & x) == @as(c_int, 0)) {
    _ = &x;
    return ((x - @as(c_int, 1)) & x) == @as(c_int, 0);
}
pub inline fn MIN(a: anytype, b: anytype) @TypeOf(if (a < b) a else b) {
    _ = &a;
    _ = &b;
    return if (a < b) a else b;
}
pub inline fn MAX(a: anytype, b: anytype) @TypeOf(if (a > b) a else b) {
    _ = &a;
    _ = &b;
    return if (a > b) a else b;
}
pub const FSHIFT = @as(c_int, 11);
pub const FSCALE = @as(c_int, 1) << FSHIFT;
pub const _BSM_AUDIT_H = "";
pub const AUDIT_RECORD_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x828a0f1b, .hex);
pub const MAX_AUDIT_RECORDS = @as(c_int, 20);
pub const MAXAUDITDATA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex) - @as(c_int, 1);
pub const MAX_AUDIT_RECORD_SIZE = MAXAUDITDATA;
pub const MIN_AUDIT_FILE_SIZE = @as(c_int, 512) * @as(c_int, 1024);
pub const AUDIT_HARD_LIMIT_FREE_BLOCKS = @as(c_int, 4);
pub const AUDIT_TRIGGER_MIN = @as(c_int, 1);
pub const AUDIT_TRIGGER_LOW_SPACE = @as(c_int, 1);
pub const AUDIT_TRIGGER_ROTATE_KERNEL = @as(c_int, 2);
pub const AUDIT_TRIGGER_READ_FILE = @as(c_int, 3);
pub const AUDIT_TRIGGER_CLOSE_AND_DIE = @as(c_int, 4);
pub const AUDIT_TRIGGER_NO_SPACE = @as(c_int, 5);
pub const AUDIT_TRIGGER_ROTATE_USER = @as(c_int, 6);
pub const AUDIT_TRIGGER_INITIALIZE = @as(c_int, 7);
pub const AUDIT_TRIGGER_EXPIRE_TRAILS = @as(c_int, 8);
pub const AUDIT_TRIGGER_MAX = @as(c_int, 8);
pub const AUDITDEV_FILENAME = "audit";
pub const AUDIT_TRIGGER_FILE = "/dev/" ++ AUDITDEV_FILENAME;
pub const AU_DEFAUDITID = @import("std").zig.c_translation.cast(uid_t, -@as(c_int, 1));
pub const AU_DEFAUDITSID = @as(c_int, 0);
pub const AU_ASSIGN_ASID = -@as(c_int, 1);
pub const AT_IPC_MSG = @import("std").zig.c_translation.cast(u8, @as(c_int, 1));
pub const AT_IPC_SEM = @import("std").zig.c_translation.cast(u8, @as(c_int, 2));
pub const AT_IPC_SHM = @import("std").zig.c_translation.cast(u8, @as(c_int, 3));
pub const AUC_UNSET = @as(c_int, 0);
pub const AUC_AUDITING = @as(c_int, 1);
pub const AUC_NOAUDIT = @as(c_int, 2);
pub const AUC_DISABLED = -@as(c_int, 1);
pub const A_OLDGETPOLICY = @as(c_int, 2);
pub const A_OLDSETPOLICY = @as(c_int, 3);
pub const A_GETKMASK = @as(c_int, 4);
pub const A_SETKMASK = @as(c_int, 5);
pub const A_OLDGETQCTRL = @as(c_int, 6);
pub const A_OLDSETQCTRL = @as(c_int, 7);
pub const A_GETCWD = @as(c_int, 8);
pub const A_GETCAR = @as(c_int, 9);
pub const A_GETSTAT = @as(c_int, 12);
pub const A_SETSTAT = @as(c_int, 13);
pub const A_SETUMASK = @as(c_int, 14);
pub const A_SETSMASK = @as(c_int, 15);
pub const A_OLDGETCOND = @as(c_int, 20);
pub const A_OLDSETCOND = @as(c_int, 21);
pub const A_GETCLASS = @as(c_int, 22);
pub const A_SETCLASS = @as(c_int, 23);
pub const A_GETPINFO = @as(c_int, 24);
pub const A_SETPMASK = @as(c_int, 25);
pub const A_SETFSIZE = @as(c_int, 26);
pub const A_GETFSIZE = @as(c_int, 27);
pub const A_GETPINFO_ADDR = @as(c_int, 28);
pub const A_GETKAUDIT = @as(c_int, 29);
pub const A_SETKAUDIT = @as(c_int, 30);
pub const A_SENDTRIGGER = @as(c_int, 31);
pub const A_GETSINFO_ADDR = @as(c_int, 32);
pub const A_GETPOLICY = @as(c_int, 33);
pub const A_SETPOLICY = @as(c_int, 34);
pub const A_GETQCTRL = @as(c_int, 35);
pub const A_SETQCTRL = @as(c_int, 36);
pub const A_GETCOND = @as(c_int, 37);
pub const A_SETCOND = @as(c_int, 38);
pub const A_GETSFLAGS = @as(c_int, 39);
pub const A_SETSFLAGS = @as(c_int, 40);
pub const A_GETCTLMODE = @as(c_int, 41);
pub const A_SETCTLMODE = @as(c_int, 42);
pub const A_GETEXPAFTER = @as(c_int, 43);
pub const A_SETEXPAFTER = @as(c_int, 44);
pub const AUDIT_CNT = @as(c_int, 0x0001);
pub const AUDIT_AHLT = @as(c_int, 0x0002);
pub const AUDIT_ARGV = @as(c_int, 0x0004);
pub const AUDIT_ARGE = @as(c_int, 0x0008);
pub const AUDIT_SEQ = @as(c_int, 0x0010);
pub const AUDIT_WINDATA = @as(c_int, 0x0020);
pub const AUDIT_USER = @as(c_int, 0x0040);
pub const AUDIT_GROUP = @as(c_int, 0x0080);
pub const AUDIT_TRAIL = @as(c_int, 0x0100);
pub const AUDIT_PATH = @as(c_int, 0x0200);
pub const AUDIT_SCNT = @as(c_int, 0x0400);
pub const AUDIT_PUBLIC = @as(c_int, 0x0800);
pub const AUDIT_ZONENAME = @as(c_int, 0x1000);
pub const AUDIT_PERZONE = @as(c_int, 0x2000);
pub const AQ_HIWATER = @as(c_int, 100);
pub const AQ_MAXHIGH = @as(c_int, 10000);
pub const AQ_LOWATER = @as(c_int, 10);
pub const AQ_BUFSZ = MAXAUDITDATA;
pub const AQ_MAXBUFSZ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1048576, .decimal);
pub const AU_FS_MINFREE = @as(c_int, 20);
pub const AU_IPv4 = @as(c_int, 4);
pub const AU_IPv6 = @as(c_int, 16);
pub const AU_CLASS_MASK_RESERVED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const AUDIT_CTLMODE_NORMAL = @import("std").zig.c_translation.cast(u8, @as(c_int, 1));
pub const AUDIT_CTLMODE_EXTERNAL = @import("std").zig.c_translation.cast(u8, @as(c_int, 2));
pub const AUDIT_EXPIRE_OP_AND = @import("std").zig.c_translation.cast(u8, @as(c_int, 0));
pub const AUDIT_EXPIRE_OP_OR = @import("std").zig.c_translation.cast(u8, @as(c_int, 1));
pub const __AUDIT_API_DEPRECATED = @compileError("unable to translate macro: undefined identifier `macos`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/bsm/audit.h:362:9
pub const _MACH_PORT_H_ = "";
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H_ = "";
pub const __WORDSIZE = @as(c_int, 64);
pub const _UINT8_T = "";
pub const _UINT16_T = "";
pub const _INTMAX_T = "";
pub const _UINTMAX_T = "";
pub inline fn INT8_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub inline fn INT16_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub inline fn INT32_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
pub inline fn UINT8_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub inline fn UINT16_C(v: anytype) @TypeOf(v) {
    _ = &v;
    return v;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = @as(c_longlong, 9223372036854775807);
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const INT32_MIN = -INT32_MAX - @as(c_int, 1);
pub const INT64_MIN = -INT64_MAX - @as(c_int, 1);
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = @as(c_ulonglong, 18446744073709551615);
pub const INT_LEAST8_MIN = INT8_MIN;
pub const INT_LEAST16_MIN = INT16_MIN;
pub const INT_LEAST32_MIN = INT32_MIN;
pub const INT_LEAST64_MIN = INT64_MIN;
pub const INT_LEAST8_MAX = INT8_MAX;
pub const INT_LEAST16_MAX = INT16_MAX;
pub const INT_LEAST32_MAX = INT32_MAX;
pub const INT_LEAST64_MAX = INT64_MAX;
pub const UINT_LEAST8_MAX = UINT8_MAX;
pub const UINT_LEAST16_MAX = UINT16_MAX;
pub const UINT_LEAST32_MAX = UINT32_MAX;
pub const UINT_LEAST64_MAX = UINT64_MAX;
pub const INT_FAST8_MIN = INT8_MIN;
pub const INT_FAST16_MIN = INT16_MIN;
pub const INT_FAST32_MIN = INT32_MIN;
pub const INT_FAST64_MIN = INT64_MIN;
pub const INT_FAST8_MAX = INT8_MAX;
pub const INT_FAST16_MAX = INT16_MAX;
pub const INT_FAST32_MAX = INT32_MAX;
pub const INT_FAST64_MAX = INT64_MAX;
pub const UINT_FAST8_MAX = UINT8_MAX;
pub const UINT_FAST16_MAX = UINT16_MAX;
pub const UINT_FAST32_MAX = UINT32_MAX;
pub const UINT_FAST64_MAX = UINT64_MAX;
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INTPTR_MIN = -INTPTR_MAX - @as(c_int, 1);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MAX = INTMAX_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = UINTMAX_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTMAX_MIN = -INTMAX_MAX - @as(c_int, 1);
pub const PTRDIFF_MIN = INTMAX_MIN;
pub const PTRDIFF_MAX = INTMAX_MAX;
pub const SIZE_MAX = UINTPTR_MAX;
pub const RSIZE_MAX = SIZE_MAX >> @as(c_int, 1);
pub const WCHAR_MAX = __WCHAR_MAX__;
pub const WCHAR_MIN = -WCHAR_MAX - @as(c_int, 1);
pub const WINT_MIN = INT32_MIN;
pub const WINT_MAX = INT32_MAX;
pub const SIG_ATOMIC_MIN = INT32_MIN;
pub const SIG_ATOMIC_MAX = INT32_MAX;
pub const _MACH_BOOLEAN_H_ = "";
pub const _MACH_MACHINE_BOOLEAN_H_ = "";
pub const _MACH_ARM_BOOLEAN_H_ = "";
pub const TRUE = @as(c_int, 1);
pub const FALSE = @as(c_int, 0);
pub const _MACH_MACHINE_VM_TYPES_H_ = "";
pub const _MACH_ARM_VM_TYPES_H_ = "";
pub const MACH_MSG_TYPE_INTEGER_T = @compileError("unable to translate macro: undefined identifier `MACH_MSG_TYPE_INTEGER_32`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/arm/vm_types.h:158:9
pub const _MACH_PORT_T = "";
pub const MACH_PORT_NULL = @as(c_int, 0);
pub const MACH_PORT_DEAD = @import("std").zig.c_translation.cast(mach_port_name_t, ~@as(c_int, 0));
pub inline fn MACH_PORT_VALID(name: anytype) @TypeOf((name != MACH_PORT_NULL) and (name != MACH_PORT_DEAD)) {
    _ = &name;
    return (name != MACH_PORT_NULL) and (name != MACH_PORT_DEAD);
}
pub inline fn MACH_PORT_INDEX(name: anytype) @TypeOf(name >> @as(c_int, 8)) {
    _ = &name;
    return name >> @as(c_int, 8);
}
pub inline fn MACH_PORT_GEN(name: anytype) @TypeOf((name & @as(c_int, 0xff)) << @as(c_int, 24)) {
    _ = &name;
    return (name & @as(c_int, 0xff)) << @as(c_int, 24);
}
pub inline fn MACH_PORT_MAKE(index: anytype, gen: anytype) @TypeOf((index << @as(c_int, 8)) | (gen >> @as(c_int, 24))) {
    _ = &index;
    _ = &gen;
    return (index << @as(c_int, 8)) | (gen >> @as(c_int, 24));
}
pub const MACH_PORT_RIGHT_SEND = @import("std").zig.c_translation.cast(mach_port_right_t, @as(c_int, 0));
pub const MACH_PORT_RIGHT_RECEIVE = @import("std").zig.c_translation.cast(mach_port_right_t, @as(c_int, 1));
pub const MACH_PORT_RIGHT_SEND_ONCE = @import("std").zig.c_translation.cast(mach_port_right_t, @as(c_int, 2));
pub const MACH_PORT_RIGHT_PORT_SET = @import("std").zig.c_translation.cast(mach_port_right_t, @as(c_int, 3));
pub const MACH_PORT_RIGHT_DEAD_NAME = @import("std").zig.c_translation.cast(mach_port_right_t, @as(c_int, 4));
pub const MACH_PORT_RIGHT_LABELH = @import("std").zig.c_translation.cast(mach_port_right_t, @as(c_int, 5));
pub const MACH_PORT_RIGHT_NUMBER = @import("std").zig.c_translation.cast(mach_port_right_t, @as(c_int, 6));
pub inline fn MACH_PORT_TYPE(right: anytype) mach_port_type_t {
    _ = &right;
    return @import("std").zig.c_translation.cast(mach_port_type_t, @import("std").zig.c_translation.cast(mach_port_type_t, @as(c_int, 1)) << (right + @import("std").zig.c_translation.cast(mach_port_right_t, @as(c_int, 16))));
}
pub const MACH_PORT_TYPE_NONE = @import("std").zig.c_translation.cast(mach_port_type_t, @as(c_long, 0));
pub const MACH_PORT_TYPE_SEND = MACH_PORT_TYPE(MACH_PORT_RIGHT_SEND);
pub const MACH_PORT_TYPE_RECEIVE = MACH_PORT_TYPE(MACH_PORT_RIGHT_RECEIVE);
pub const MACH_PORT_TYPE_SEND_ONCE = MACH_PORT_TYPE(MACH_PORT_RIGHT_SEND_ONCE);
pub const MACH_PORT_TYPE_PORT_SET = MACH_PORT_TYPE(MACH_PORT_RIGHT_PORT_SET);
pub const MACH_PORT_TYPE_DEAD_NAME = MACH_PORT_TYPE(MACH_PORT_RIGHT_DEAD_NAME);
pub const MACH_PORT_TYPE_LABELH = MACH_PORT_TYPE(MACH_PORT_RIGHT_LABELH);
pub const MACH_PORT_TYPE_DNREQUEST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const MACH_PORT_TYPE_SPREQUEST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const MACH_PORT_TYPE_SPREQUEST_DELAYED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const MACH_PORT_TYPE_SEND_RECEIVE = MACH_PORT_TYPE_SEND | MACH_PORT_TYPE_RECEIVE;
pub const MACH_PORT_TYPE_SEND_RIGHTS = MACH_PORT_TYPE_SEND | MACH_PORT_TYPE_SEND_ONCE;
pub const MACH_PORT_TYPE_PORT_RIGHTS = MACH_PORT_TYPE_SEND_RIGHTS | MACH_PORT_TYPE_RECEIVE;
pub const MACH_PORT_TYPE_PORT_OR_DEAD = MACH_PORT_TYPE_PORT_RIGHTS | MACH_PORT_TYPE_DEAD_NAME;
pub const MACH_PORT_TYPE_ALL_RIGHTS = MACH_PORT_TYPE_PORT_OR_DEAD | MACH_PORT_TYPE_PORT_SET;
pub const MACH_PORT_SRIGHTS_NONE = @as(c_int, 0);
pub const MACH_PORT_SRIGHTS_PRESENT = @as(c_int, 1);
pub const MACH_PORT_QLIMIT_ZERO = @as(c_int, 0);
pub const MACH_PORT_QLIMIT_BASIC = @as(c_int, 5);
pub const MACH_PORT_QLIMIT_SMALL = @as(c_int, 16);
pub const MACH_PORT_QLIMIT_LARGE = @as(c_int, 1024);
pub const MACH_PORT_QLIMIT_KERNEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65534, .decimal);
pub const MACH_PORT_QLIMIT_MIN = MACH_PORT_QLIMIT_ZERO;
pub const MACH_PORT_QLIMIT_DEFAULT = MACH_PORT_QLIMIT_BASIC;
pub const MACH_PORT_QLIMIT_MAX = MACH_PORT_QLIMIT_LARGE;
pub const MACH_PORT_STATUS_FLAG_TEMPOWNER = @as(c_int, 0x01);
pub const MACH_PORT_STATUS_FLAG_GUARDED = @as(c_int, 0x02);
pub const MACH_PORT_STATUS_FLAG_STRICT_GUARD = @as(c_int, 0x04);
pub const MACH_PORT_STATUS_FLAG_IMP_DONATION = @as(c_int, 0x08);
pub const MACH_PORT_STATUS_FLAG_REVIVE = @as(c_int, 0x10);
pub const MACH_PORT_STATUS_FLAG_TASKPTR = @as(c_int, 0x20);
pub const MACH_PORT_STATUS_FLAG_GUARD_IMMOVABLE_RECEIVE = @as(c_int, 0x40);
pub const MACH_PORT_STATUS_FLAG_NO_GRANT = @as(c_int, 0x80);
pub const MACH_PORT_LIMITS_INFO = @as(c_int, 1);
pub const MACH_PORT_RECEIVE_STATUS = @as(c_int, 2);
pub const MACH_PORT_DNREQUESTS_SIZE = @as(c_int, 3);
pub const MACH_PORT_TEMPOWNER = @as(c_int, 4);
pub const MACH_PORT_IMPORTANCE_RECEIVER = @as(c_int, 5);
pub const MACH_PORT_DENAP_RECEIVER = @as(c_int, 6);
pub const MACH_PORT_INFO_EXT = @as(c_int, 7);
pub const MACH_PORT_GUARD_INFO = @as(c_int, 8);
pub const MACH_PORT_SERVICE_THROTTLED = @as(c_int, 9);
pub const MACH_PORT_LIMITS_INFO_COUNT = @import("std").zig.c_translation.cast(natural_t, @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(mach_port_limits_t), @import("std").zig.c_translation.sizeof(natural_t)));
pub const MACH_PORT_RECEIVE_STATUS_COUNT = @import("std").zig.c_translation.cast(natural_t, @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(mach_port_status_t), @import("std").zig.c_translation.sizeof(natural_t)));
pub const MACH_PORT_DNREQUESTS_SIZE_COUNT = @as(c_int, 1);
pub const MACH_PORT_INFO_EXT_COUNT = @import("std").zig.c_translation.cast(natural_t, @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(mach_port_info_ext_t), @import("std").zig.c_translation.sizeof(natural_t)));
pub const MACH_PORT_GUARD_INFO_COUNT = @import("std").zig.c_translation.cast(natural_t, @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(mach_port_guard_info_t), @import("std").zig.c_translation.sizeof(natural_t)));
pub const MACH_PORT_SERVICE_THROTTLED_COUNT = @as(c_int, 1);
pub const MACH_SERVICE_PORT_INFO_STRING_NAME_MAX_BUF_LEN = @as(c_int, 255);
pub const MACH_SERVICE_PORT_INFO_COUNT = @import("std").zig.c_translation.cast(u8, @import("std").zig.c_translation.MacroArithmetic.div(@import("std").zig.c_translation.sizeof(mach_service_port_info_data_t), @import("std").zig.c_translation.sizeof(u8)));
pub const MPO_CONTEXT_AS_GUARD = @as(c_int, 0x01);
pub const MPO_QLIMIT = @as(c_int, 0x02);
pub const MPO_TEMPOWNER = @as(c_int, 0x04);
pub const MPO_IMPORTANCE_RECEIVER = @as(c_int, 0x08);
pub const MPO_INSERT_SEND_RIGHT = @as(c_int, 0x10);
pub const MPO_STRICT = @as(c_int, 0x20);
pub const MPO_DENAP_RECEIVER = @as(c_int, 0x40);
pub const MPO_IMMOVABLE_RECEIVE = @as(c_int, 0x80);
pub const MPO_FILTER_MSG = @as(c_int, 0x100);
pub const MPO_TG_BLOCK_TRACKING = @as(c_int, 0x200);
pub const MPO_SERVICE_PORT = @as(c_int, 0x400);
pub const MPO_CONNECTION_PORT = @as(c_int, 0x800);
pub const MPO_REPLY_PORT = @as(c_int, 0x1000);
pub const MPO_ENFORCE_REPLY_PORT_SEMANTICS = @as(c_int, 0x2000);
pub const MPO_PROVISIONAL_REPLY_PORT = @as(c_int, 0x4000);
pub const MPO_EXCEPTION_PORT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const GUARD_TYPE_MACH_PORT = @as(c_int, 0x1);
pub const MAX_FATAL_kGUARD_EXC_CODE = kGUARD_EXC_MSG_FILTERED;
pub const MAX_OPTIONAL_kGUARD_EXC_CODE = kGUARD_EXC_RCV_INVALID_NAME;
pub const MPG_FLAGS_NONE = @as(c_ulonglong, 0x00);
pub const MPG_FLAGS_STRICT_REPLY_INVALID_REPLY_DISP = @as(c_ulonglong, 0x01) << @as(c_int, 56);
pub const MPG_FLAGS_STRICT_REPLY_INVALID_REPLY_PORT = @as(c_ulonglong, 0x02) << @as(c_int, 56);
pub const MPG_FLAGS_STRICT_REPLY_INVALID_VOUCHER = @as(c_ulonglong, 0x04) << @as(c_int, 56);
pub const MPG_FLAGS_STRICT_REPLY_NO_BANK_ATTR = @as(c_ulonglong, 0x08) << @as(c_int, 56);
pub const MPG_FLAGS_STRICT_REPLY_MISMATCHED_PERSONA = @as(c_ulonglong, 0x10) << @as(c_int, 56);
pub const MPG_FLAGS_STRICT_REPLY_MASK = @as(c_ulonglong, 0xff) << @as(c_int, 56);
pub const MPG_FLAGS_MOD_REFS_PINNED_DEALLOC = @as(c_ulonglong, 0x01) << @as(c_int, 56);
pub const MPG_FLAGS_MOD_REFS_PINNED_DESTROY = @as(c_ulonglong, 0x02) << @as(c_int, 56);
pub const MPG_FLAGS_MOD_REFS_PINNED_COPYIN = @as(c_ulonglong, 0x04) << @as(c_int, 56);
pub const MPG_FLAGS_IMMOVABLE_PINNED = @as(c_ulonglong, 0x01) << @as(c_int, 56);
pub const MPG_STRICT = @as(c_int, 0x01);
pub const MPG_IMMOVABLE_RECEIVE = @as(c_int, 0x02);
pub const _KAUTH_CRED_T = "";
pub const CRF_NOMEMBERD = @as(c_int, 0x00000001);
pub const CRF_MAC_ENFORCE = @as(c_int, 0x00000002);
pub const XUCRED_VERSION = @as(c_int, 0);
pub const cr_gid = @compileError("unable to translate macro: undefined identifier `cr_groups`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/ucred.h:108:9
pub const NOCRED = @import("std").zig.c_translation.cast(kauth_cred_t, @as(c_int, 0));
pub const FSCRED = @import("std").zig.c_translation.cast(kauth_cred_t, -@as(c_int, 1));
pub inline fn IS_VALID_CRED(_cr: anytype) @TypeOf((_cr != NOCRED) and (_cr != FSCRED)) {
    _ = &_cr;
    return (_cr != NOCRED) and (_cr != FSCRED);
}
pub const _SYS_PROC_H_ = "";
pub const _SYS_QUEUE_H_ = "";
pub inline fn __improbable(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const QMD_TRACE_ELEM = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:174:9
pub const QMD_TRACE_HEAD = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:175:9
pub const TRACEBUF = "";
pub const TRASHIT = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:177:9
pub const __MISMATCH_TAGS_PUSH = "";
pub const __MISMATCH_TAGS_POP = "";
pub const __NULLABILITY_COMPLETENESS_PUSH = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:223:9
pub const __NULLABILITY_COMPLETENESS_POP = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:226:9
pub const SLIST_HEAD = @compileError("unable to translate macro: untranslatable usage of arg `name`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:236:9
pub const SLIST_HEAD_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:245:9
pub const SLIST_ENTRY = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:248:9
pub inline fn SLIST_EMPTY(head: anytype) @TypeOf(head.*.slh_first == NULL) {
    _ = &head;
    return head.*.slh_first == NULL;
}
pub inline fn SLIST_FIRST(head: anytype) @TypeOf(head.*.slh_first) {
    _ = &head;
    return head.*.slh_first;
}
pub const SLIST_FOREACH = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:264:9
pub const SLIST_FOREACH_SAFE = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:269:9
pub const SLIST_FOREACH_PREVPTR = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:274:9
pub const SLIST_INIT = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:279:9
pub const SLIST_INSERT_AFTER = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:283:9
pub const SLIST_INSERT_HEAD = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:288:9
pub inline fn SLIST_NEXT(elm: anytype, field: anytype) @TypeOf(elm.*.field.sle_next) {
    _ = &elm;
    _ = &field;
    return elm.*.field.sle_next;
}
pub const SLIST_REMOVE = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:295:9
pub const SLIST_REMOVE_AFTER = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:313:9
pub const SLIST_REMOVE_HEAD = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:318:9
pub const STAILQ_HEAD = @compileError("unable to translate macro: untranslatable usage of arg `name`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:325:9
pub const STAILQ_HEAD_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:335:9
pub const STAILQ_ENTRY = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:338:9
pub const STAILQ_CONCAT = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:350:9
pub inline fn STAILQ_EMPTY(head: anytype) @TypeOf(head.*.stqh_first == NULL) {
    _ = &head;
    return head.*.stqh_first == NULL;
}
pub inline fn STAILQ_FIRST(head: anytype) @TypeOf(head.*.stqh_first) {
    _ = &head;
    return head.*.stqh_first;
}
pub const STAILQ_FOREACH = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:362:9
pub const STAILQ_FOREACH_SAFE = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:368:9
pub const STAILQ_INIT = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:373:9
pub const STAILQ_INSERT_AFTER = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:378:9
pub const STAILQ_INSERT_HEAD = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:384:9
pub const STAILQ_INSERT_TAIL = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:390:9
pub const STAILQ_LAST = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:396:9
pub inline fn STAILQ_NEXT(elm: anytype, field: anytype) @TypeOf(elm.*.field.stqe_next) {
    _ = &elm;
    _ = &field;
    return elm.*.field.stqe_next;
}
pub const STAILQ_REMOVE = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:408:9
pub const STAILQ_REMOVE_HEAD = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:426:9
pub const STAILQ_REMOVE_HEAD_UNTIL = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:432:9
pub const STAILQ_REMOVE_AFTER = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:437:9
pub const STAILQ_SWAP = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:443:9
pub const LIST_HEAD = @compileError("unable to translate macro: untranslatable usage of arg `name`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:465:9
pub const LIST_HEAD_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:474:9
pub const LIST_ENTRY = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:477:9
pub const LIST_CHECK_HEAD = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:491:9
pub const LIST_CHECK_NEXT = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:492:9
pub const LIST_CHECK_PREV = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:493:9
pub inline fn LIST_EMPTY(head: anytype) @TypeOf(head.*.lh_first == NULL) {
    _ = &head;
    return head.*.lh_first == NULL;
}
pub inline fn LIST_FIRST(head: anytype) @TypeOf(head.*.lh_first) {
    _ = &head;
    return head.*.lh_first;
}
pub const LIST_FOREACH = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:499:9
pub const LIST_FOREACH_SAFE = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:504:9
pub const LIST_INIT = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:509:9
pub const LIST_INSERT_AFTER = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:513:9
pub const LIST_INSERT_BEFORE = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:522:9
pub const LIST_INSERT_HEAD = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:530:9
pub inline fn LIST_NEXT(elm: anytype, field: anytype) @TypeOf(elm.*.field.le_next) {
    _ = &elm;
    _ = &field;
    return elm.*.field.le_next;
}
pub const LIST_REMOVE = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:540:9
pub const LIST_SWAP = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:551:9
pub const TAILQ_HEAD = @compileError("unable to translate macro: untranslatable usage of arg `name`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:569:9
pub const TAILQ_HEAD_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:580:9
pub const TAILQ_ENTRY = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:583:9
pub const TAILQ_CHECK_HEAD = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:597:9
pub const TAILQ_CHECK_NEXT = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:598:9
pub const TAILQ_CHECK_PREV = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:599:9
pub const TAILQ_CONCAT = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:601:9
pub inline fn TAILQ_EMPTY(head: anytype) @TypeOf(head.*.tqh_first == NULL) {
    _ = &head;
    return head.*.tqh_first == NULL;
}
pub inline fn TAILQ_FIRST(head: anytype) @TypeOf(head.*.tqh_first) {
    _ = &head;
    return head.*.tqh_first;
}
pub const TAILQ_FOREACH = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:616:9
pub const TAILQ_FOREACH_SAFE = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:621:9
pub const TAILQ_FOREACH_REVERSE = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:626:9
pub const TAILQ_FOREACH_REVERSE_SAFE = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:631:9
pub const TAILQ_INIT = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:637:9
pub const TAILQ_INSERT_AFTER = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:644:9
pub const TAILQ_INSERT_BEFORE = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:659:9
pub const TAILQ_INSERT_HEAD = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:669:9
pub const TAILQ_INSERT_TAIL = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:682:9
pub const TAILQ_LAST = @compileError("unable to translate macro: untranslatable usage of arg `headname`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:691:9
pub inline fn TAILQ_NEXT(elm: anytype, field: anytype) @TypeOf(elm.*.field.tqe_next) {
    _ = &elm;
    _ = &field;
    return elm.*.field.tqe_next;
}
pub const TAILQ_PREV = @compileError("unable to translate macro: untranslatable usage of arg `headname`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:700:9
pub const TAILQ_REMOVE = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:707:9
pub const TAILQ_SWAP = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:726:9
pub const CIRCLEQ_HEAD = @compileError("unable to translate macro: untranslatable usage of arg `name`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:751:9
pub const CIRCLEQ_ENTRY = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:761:9
pub const CIRCLEQ_CHECK_HEAD = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:774:9
pub const CIRCLEQ_CHECK_NEXT = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:775:9
pub const CIRCLEQ_CHECK_PREV = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:776:9
pub inline fn CIRCLEQ_EMPTY(head: anytype) @TypeOf(head.*.cqh_first == @import("std").zig.c_translation.cast(?*anyopaque, head)) {
    _ = &head;
    return head.*.cqh_first == @import("std").zig.c_translation.cast(?*anyopaque, head);
}
pub inline fn CIRCLEQ_FIRST(head: anytype) @TypeOf(head.*.cqh_first) {
    _ = &head;
    return head.*.cqh_first;
}
pub const CIRCLEQ_FOREACH = @compileError("unable to translate C expr: unexpected token 'for'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:782:9
pub const CIRCLEQ_INIT = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:787:9
pub const CIRCLEQ_INSERT_AFTER = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:792:9
pub const CIRCLEQ_INSERT_BEFORE = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:803:9
pub const CIRCLEQ_INSERT_HEAD = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:814:9
pub const CIRCLEQ_INSERT_TAIL = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:825:9
pub inline fn CIRCLEQ_LAST(head: anytype) @TypeOf(head.*.cqh_last) {
    _ = &head;
    return head.*.cqh_last;
}
pub inline fn CIRCLEQ_NEXT(elm: anytype, field: anytype) @TypeOf(elm.*.field.cqe_next) {
    _ = &elm;
    _ = &field;
    return elm.*.field.cqe_next;
}
pub inline fn CIRCLEQ_PREV(elm: anytype, field: anytype) @TypeOf(elm.*.field.cqe_prev) {
    _ = &elm;
    _ = &field;
    return elm.*.field.cqe_prev;
}
pub const CIRCLEQ_REMOVE = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/queue.h:841:9
pub const _SYS_LOCK_H_ = "";
pub const _SYS_EVENT_H_ = "";
pub const EVFILT_READ = -@as(c_int, 1);
pub const EVFILT_WRITE = -@as(c_int, 2);
pub const EVFILT_AIO = -@as(c_int, 3);
pub const EVFILT_VNODE = -@as(c_int, 4);
pub const EVFILT_PROC = -@as(c_int, 5);
pub const EVFILT_SIGNAL = -@as(c_int, 6);
pub const EVFILT_TIMER = -@as(c_int, 7);
pub const EVFILT_MACHPORT = -@as(c_int, 8);
pub const EVFILT_FS = -@as(c_int, 9);
pub const EVFILT_USER = -@as(c_int, 10);
pub const EVFILT_VM = -@as(c_int, 12);
pub const EVFILT_EXCEPT = -@as(c_int, 15);
pub const EVFILT_SYSCOUNT = @as(c_int, 18);
pub const EVFILT_THREADMARKER = EVFILT_SYSCOUNT;
pub const EV_SET = @compileError("unable to translate macro: undefined identifier `__kevp__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/event.h:107:9
pub const EV_SET64 = @compileError("unable to translate macro: undefined identifier `__kevp__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/event.h:117:9
pub const KEVENT_FLAG_NONE = @as(c_int, 0x000000);
pub const KEVENT_FLAG_IMMEDIATE = @as(c_int, 0x000001);
pub const KEVENT_FLAG_ERROR_EVENTS = @as(c_int, 0x000002);
pub const EV_ADD = @as(c_int, 0x0001);
pub const EV_DELETE = @as(c_int, 0x0002);
pub const EV_ENABLE = @as(c_int, 0x0004);
pub const EV_DISABLE = @as(c_int, 0x0008);
pub const EV_ONESHOT = @as(c_int, 0x0010);
pub const EV_CLEAR = @as(c_int, 0x0020);
pub const EV_RECEIPT = @as(c_int, 0x0040);
pub const EV_DISPATCH = @as(c_int, 0x0080);
pub const EV_UDATA_SPECIFIC = @as(c_int, 0x0100);
pub const EV_DISPATCH2 = EV_DISPATCH | EV_UDATA_SPECIFIC;
pub const EV_VANISHED = @as(c_int, 0x0200);
pub const EV_SYSFLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xF000, .hex);
pub const EV_FLAG0 = @as(c_int, 0x1000);
pub const EV_FLAG1 = @as(c_int, 0x2000);
pub const EV_EOF = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const EV_ERROR = @as(c_int, 0x4000);
pub const EV_POLL = EV_FLAG0;
pub const EV_OOBAND = EV_FLAG1;
pub const NOTE_TRIGGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const NOTE_FFNOP = @as(c_int, 0x00000000);
pub const NOTE_FFAND = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const NOTE_FFOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const NOTE_FFCOPY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex);
pub const NOTE_FFCTRLMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex);
pub const NOTE_FFLAGSMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00ffffff, .hex);
pub const NOTE_LOWAT = @as(c_int, 0x00000001);
pub const NOTE_OOB = @as(c_int, 0x00000002);
pub const NOTE_DELETE = @as(c_int, 0x00000001);
pub const NOTE_WRITE = @as(c_int, 0x00000002);
pub const NOTE_EXTEND = @as(c_int, 0x00000004);
pub const NOTE_ATTRIB = @as(c_int, 0x00000008);
pub const NOTE_LINK = @as(c_int, 0x00000010);
pub const NOTE_RENAME = @as(c_int, 0x00000020);
pub const NOTE_REVOKE = @as(c_int, 0x00000040);
pub const NOTE_NONE = @as(c_int, 0x00000080);
pub const NOTE_FUNLOCK = @as(c_int, 0x00000100);
pub const NOTE_LEASE_DOWNGRADE = @as(c_int, 0x00000200);
pub const NOTE_LEASE_RELEASE = @as(c_int, 0x00000400);
pub const NOTE_EXIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const NOTE_FORK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const NOTE_EXEC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const NOTE_REAP = @import("std").zig.c_translation.cast(c_uint, eNoteReapDeprecated);
pub const NOTE_SIGNAL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const NOTE_EXITSTATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const NOTE_EXIT_DETAIL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const NOTE_PDATAMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x000fffff, .hex);
pub const NOTE_PCTRLMASK = ~NOTE_PDATAMASK;
pub const NOTE_EXIT_REPARENTED = @import("std").zig.c_translation.cast(c_uint, eNoteExitReparentedDeprecated);
pub const NOTE_EXIT_DETAIL_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00070000, .hex);
pub const NOTE_EXIT_DECRYPTFAIL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const NOTE_EXIT_MEMORY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const NOTE_EXIT_CSERROR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const NOTE_VM_PRESSURE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const NOTE_VM_PRESSURE_TERMINATE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const NOTE_VM_PRESSURE_SUDDEN_TERMINATE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const NOTE_VM_ERROR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const NOTE_SECONDS = @as(c_int, 0x00000001);
pub const NOTE_USECONDS = @as(c_int, 0x00000002);
pub const NOTE_NSECONDS = @as(c_int, 0x00000004);
pub const NOTE_ABSOLUTE = @as(c_int, 0x00000008);
pub const NOTE_LEEWAY = @as(c_int, 0x00000010);
pub const NOTE_CRITICAL = @as(c_int, 0x00000020);
pub const NOTE_BACKGROUND = @as(c_int, 0x00000040);
pub const NOTE_MACH_CONTINUOUS_TIME = @as(c_int, 0x00000080);
pub const NOTE_MACHTIME = @as(c_int, 0x00000100);
pub const NOTE_TRACK = @as(c_int, 0x00000001);
pub const NOTE_TRACKERR = @as(c_int, 0x00000002);
pub const NOTE_CHILD = @as(c_int, 0x00000004);
pub const p_forw = @compileError("unable to translate macro: undefined identifier `p_un`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/proc.h:99:9
pub const p_back = @compileError("unable to translate macro: undefined identifier `p_un`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/proc.h:100:9
pub const p_starttime = @compileError("unable to translate macro: undefined identifier `p_un`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/proc.h:101:9
pub const SIDL = @as(c_int, 1);
pub const SRUN = @as(c_int, 2);
pub const SSLEEP = @as(c_int, 3);
pub const SSTOP = @as(c_int, 4);
pub const SZOMB = @as(c_int, 5);
pub const P_ADVLOCK = @as(c_int, 0x00000001);
pub const P_CONTROLT = @as(c_int, 0x00000002);
pub const P_LP64 = @as(c_int, 0x00000004);
pub const P_NOCLDSTOP = @as(c_int, 0x00000008);
pub const P_PPWAIT = @as(c_int, 0x00000010);
pub const P_PROFIL = @as(c_int, 0x00000020);
pub const P_SELECT = @as(c_int, 0x00000040);
pub const P_CONTINUED = @as(c_int, 0x00000080);
pub const P_SUGID = @as(c_int, 0x00000100);
pub const P_SYSTEM = @as(c_int, 0x00000200);
pub const P_TIMEOUT = @as(c_int, 0x00000400);
pub const P_TRACED = @as(c_int, 0x00000800);
pub const P_DISABLE_ASLR = @as(c_int, 0x00001000);
pub const P_WEXIT = @as(c_int, 0x00002000);
pub const P_EXEC = @as(c_int, 0x00004000);
pub const P_OWEUPC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const P_AFFINITY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const P_TRANSLATED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const P_CLASSIC = P_TRANSLATED;
pub const P_DELAYIDLESLEEP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const P_CHECKOPENEVT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const P_DEPENDENCY_CAPABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const P_REBOOT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const P_RESV6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const P_RESV7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const P_THCWD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const P_RESV9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const P_ADOPTPERSONA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const P_RESV11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const P_NOSHLIB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const P_FORCEQUOTA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const P_NOCLDWAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const P_NOREMOTEHANG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const P_INMEM = @as(c_int, 0);
pub const P_NOSWAP = @as(c_int, 0);
pub const P_PHYSIO = @as(c_int, 0);
pub const P_FSTRACE = @as(c_int, 0);
pub const P_SSTEP = @as(c_int, 0);
pub const P_DIRTY_TRACK = @as(c_int, 0x00000001);
pub const P_DIRTY_ALLOW_IDLE_EXIT = @as(c_int, 0x00000002);
pub const P_DIRTY_DEFER = @as(c_int, 0x00000004);
pub const P_DIRTY = @as(c_int, 0x00000008);
pub const P_DIRTY_SHUTDOWN = @as(c_int, 0x00000010);
pub const P_DIRTY_TERMINATED = @as(c_int, 0x00000020);
pub const P_DIRTY_BUSY = @as(c_int, 0x00000040);
pub const P_DIRTY_MARKED = @as(c_int, 0x00000080);
pub const P_DIRTY_AGING_IN_PROGRESS = @as(c_int, 0x00000100);
pub const P_DIRTY_LAUNCH_IN_PROGRESS = @as(c_int, 0x00000200);
pub const P_DIRTY_DEFER_ALWAYS = @as(c_int, 0x00000400);
pub const P_DIRTY_SHUTDOWN_ON_CLEAN = @as(c_int, 0x00000800);
pub const P_DIRTY_IS_DIRTY = P_DIRTY | P_DIRTY_SHUTDOWN;
pub const P_DIRTY_IDLE_EXIT_ENABLED = P_DIRTY_TRACK | P_DIRTY_ALLOW_IDLE_EXIT;
pub const _SYS_VM_H = "";
pub const CTL_MAXNAME = @as(c_int, 12);
pub const CTLTYPE = @as(c_int, 0xf);
pub const CTLTYPE_NODE = @as(c_int, 1);
pub const CTLTYPE_INT = @as(c_int, 2);
pub const CTLTYPE_STRING = @as(c_int, 3);
pub const CTLTYPE_QUAD = @as(c_int, 4);
pub const CTLTYPE_OPAQUE = @as(c_int, 5);
pub const CTLTYPE_STRUCT = CTLTYPE_OPAQUE;
pub const CTLFLAG_RD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const CTLFLAG_WR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const CTLFLAG_RW = CTLFLAG_RD | CTLFLAG_WR;
pub const CTLFLAG_NOLOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const CTLFLAG_ANYBODY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const CTLFLAG_SECURE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const CTLFLAG_MASKED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const CTLFLAG_NOAUTO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const CTLFLAG_KERN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const CTLFLAG_LOCKED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const CTLFLAG_OID2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const CTLFLAG_EXPERIMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const OID_AUTO = -@as(c_int, 1);
pub const OID_AUTO_START = @as(c_int, 100);
pub const SYSCTL_DEF_ENABLED = "";
pub const CTL_UNSPEC = @as(c_int, 0);
pub const CTL_KERN = @as(c_int, 1);
pub const CTL_VM = @as(c_int, 2);
pub const CTL_VFS = @as(c_int, 3);
pub const CTL_NET = @as(c_int, 4);
pub const CTL_DEBUG = @as(c_int, 5);
pub const CTL_HW = @as(c_int, 6);
pub const CTL_MACHDEP = @as(c_int, 7);
pub const CTL_USER = @as(c_int, 8);
pub const CTL_MAXID = @as(c_int, 9);
pub const CTL_NAMES = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/sysctl.h:193:9
pub const KERN_OSTYPE = @as(c_int, 1);
pub const KERN_OSRELEASE = @as(c_int, 2);
pub const KERN_OSREV = @as(c_int, 3);
pub const KERN_VERSION = @as(c_int, 4);
pub const KERN_MAXVNODES = @as(c_int, 5);
pub const KERN_MAXPROC = @as(c_int, 6);
pub const KERN_MAXFILES = @as(c_int, 7);
pub const KERN_ARGMAX = @as(c_int, 8);
pub const KERN_SECURELVL = @as(c_int, 9);
pub const KERN_HOSTNAME = @as(c_int, 10);
pub const KERN_HOSTID = @as(c_int, 11);
pub const KERN_CLOCKRATE = @as(c_int, 12);
pub const KERN_VNODE = @as(c_int, 13);
pub const KERN_PROC = @as(c_int, 14);
pub const KERN_FILE = @as(c_int, 15);
pub const KERN_PROF = @as(c_int, 16);
pub const KERN_POSIX1 = @as(c_int, 17);
pub const KERN_NGROUPS = @as(c_int, 18);
pub const KERN_JOB_CONTROL = @as(c_int, 19);
pub const KERN_SAVED_IDS = @as(c_int, 20);
pub const KERN_BOOTTIME = @as(c_int, 21);
pub const KERN_NISDOMAINNAME = @as(c_int, 22);
pub const KERN_DOMAINNAME = KERN_NISDOMAINNAME;
pub const KERN_MAXPARTITIONS = @as(c_int, 23);
pub const KERN_KDEBUG = @as(c_int, 24);
pub const KERN_UPDATEINTERVAL = @as(c_int, 25);
pub const KERN_OSRELDATE = @as(c_int, 26);
pub const KERN_NTP_PLL = @as(c_int, 27);
pub const KERN_BOOTFILE = @as(c_int, 28);
pub const KERN_MAXFILESPERPROC = @as(c_int, 29);
pub const KERN_MAXPROCPERUID = @as(c_int, 30);
pub const KERN_DUMPDEV = @as(c_int, 31);
pub const KERN_IPC = @as(c_int, 32);
pub const KERN_DUMMY = @as(c_int, 33);
pub const KERN_PS_STRINGS = @as(c_int, 34);
pub const KERN_USRSTACK32 = @as(c_int, 35);
pub const KERN_LOGSIGEXIT = @as(c_int, 36);
pub const KERN_SYMFILE = @as(c_int, 37);
pub const KERN_PROCARGS = @as(c_int, 38);
pub const KERN_NETBOOT = @as(c_int, 40);
pub const KERN_SYSV = @as(c_int, 42);
pub const KERN_AFFINITY = @as(c_int, 43);
pub const KERN_TRANSLATE = @as(c_int, 44);
pub const KERN_CLASSIC = KERN_TRANSLATE;
pub const KERN_EXEC = @as(c_int, 45);
pub const KERN_CLASSICHANDLER = KERN_EXEC;
pub const KERN_AIOMAX = @as(c_int, 46);
pub const KERN_AIOPROCMAX = @as(c_int, 47);
pub const KERN_AIOTHREADS = @as(c_int, 48);
pub const KERN_PROCARGS2 = @as(c_int, 49);
pub const KERN_COREFILE = @as(c_int, 50);
pub const KERN_COREDUMP = @as(c_int, 51);
pub const KERN_SUGID_COREDUMP = @as(c_int, 52);
pub const KERN_PROCDELAYTERM = @as(c_int, 53);
pub const KERN_SHREG_PRIVATIZABLE = @as(c_int, 54);
pub const KERN_LOW_PRI_WINDOW = @as(c_int, 56);
pub const KERN_LOW_PRI_DELAY = @as(c_int, 57);
pub const KERN_POSIX = @as(c_int, 58);
pub const KERN_USRSTACK64 = @as(c_int, 59);
pub const KERN_NX_PROTECTION = @as(c_int, 60);
pub const KERN_TFP = @as(c_int, 61);
pub const KERN_PROCNAME = @as(c_int, 62);
pub const KERN_THALTSTACK = @as(c_int, 63);
pub const KERN_SPECULATIVE_READS = @as(c_int, 64);
pub const KERN_OSVERSION = @as(c_int, 65);
pub const KERN_SAFEBOOT = @as(c_int, 66);
pub const KERN_RAGEVNODE = @as(c_int, 68);
pub const KERN_TTY = @as(c_int, 69);
pub const KERN_CHECKOPENEVT = @as(c_int, 70);
pub const KERN_THREADNAME = @as(c_int, 71);
pub const KERN_MAXID = @as(c_int, 72);
pub const KERN_USRSTACK = KERN_USRSTACK64;
pub const KERN_RAGE_PROC = @as(c_int, 1);
pub const KERN_RAGE_THREAD = @as(c_int, 2);
pub const KERN_UNRAGE_PROC = @as(c_int, 3);
pub const KERN_UNRAGE_THREAD = @as(c_int, 4);
pub const KERN_OPENEVT_PROC = @as(c_int, 1);
pub const KERN_UNOPENEVT_PROC = @as(c_int, 2);
pub const KERN_TFP_POLICY = @as(c_int, 1);
pub const KERN_TFP_POLICY_DENY = @as(c_int, 0);
pub const KERN_TFP_POLICY_DEFAULT = @as(c_int, 2);
pub const KERN_KDEFLAGS = @as(c_int, 1);
pub const KERN_KDDFLAGS = @as(c_int, 2);
pub const KERN_KDENABLE = @as(c_int, 3);
pub const KERN_KDSETBUF = @as(c_int, 4);
pub const KERN_KDGETBUF = @as(c_int, 5);
pub const KERN_KDSETUP = @as(c_int, 6);
pub const KERN_KDREMOVE = @as(c_int, 7);
pub const KERN_KDSETREG = @as(c_int, 8);
pub const KERN_KDGETREG = @as(c_int, 9);
pub const KERN_KDREADTR = @as(c_int, 10);
pub const KERN_KDPIDTR = @as(c_int, 11);
pub const KERN_KDTHRMAP = @as(c_int, 12);
pub const KERN_KDPIDEX = @as(c_int, 14);
pub const KERN_KDSETRTCDEC = @as(c_int, 15);
pub const KERN_KDGETENTROPY = @as(c_int, 16);
pub const KERN_KDWRITETR = @as(c_int, 17);
pub const KERN_KDWRITEMAP = @as(c_int, 18);
pub const KERN_KDTEST = @as(c_int, 19);
pub const KERN_KDREADCURTHRMAP = @as(c_int, 21);
pub const KERN_KDSET_TYPEFILTER = @as(c_int, 22);
pub const KERN_KDBUFWAIT = @as(c_int, 23);
pub const KERN_KDCPUMAP = @as(c_int, 24);
pub const KERN_KDCPUMAP_EXT = @as(c_int, 25);
pub const KERN_KDSET_EDM = @as(c_int, 26);
pub const KERN_KDGET_EDM = @as(c_int, 27);
pub const KERN_KDWRITETR_V3 = @as(c_int, 28);
pub const CTL_KERN_NAMES = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/sysctl.h:346:9
pub const CTL_VFS_NAMES = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/sysctl.h:424:9
pub const KERN_PROC_ALL = @as(c_int, 0);
pub const KERN_PROC_PID = @as(c_int, 1);
pub const KERN_PROC_PGRP = @as(c_int, 2);
pub const KERN_PROC_SESSION = @as(c_int, 3);
pub const KERN_PROC_TTY = @as(c_int, 4);
pub const KERN_PROC_UID = @as(c_int, 5);
pub const KERN_PROC_RUID = @as(c_int, 6);
pub const KERN_PROC_LCID = @as(c_int, 7);
pub const KERN_VFSNSPACE_HANDLE_PROC = @as(c_int, 1);
pub const KERN_VFSNSPACE_UNHANDLE_PROC = @as(c_int, 2);
pub const WMESGLEN = @as(c_int, 7);
pub const EPROC_CTTY = @as(c_int, 0x01);
pub const EPROC_SLEADER = @as(c_int, 0x02);
pub const COMAPT_MAXLOGNAME = @as(c_int, 12);
pub const KIPC_MAXSOCKBUF = @as(c_int, 1);
pub const KIPC_SOCKBUF_WASTE = @as(c_int, 2);
pub const KIPC_SOMAXCONN = @as(c_int, 3);
pub const KIPC_MAX_LINKHDR = @as(c_int, 4);
pub const KIPC_MAX_PROTOHDR = @as(c_int, 5);
pub const KIPC_MAX_HDR = @as(c_int, 6);
pub const KIPC_MAX_DATALEN = @as(c_int, 7);
pub const KIPC_MBSTAT = @as(c_int, 8);
pub const KIPC_NMBCLUSTERS = @as(c_int, 9);
pub const KIPC_SOQLIMITCOMPAT = @as(c_int, 10);
pub const VM_METER = @as(c_int, 1);
pub const VM_LOADAVG = @as(c_int, 2);
pub const VM_MACHFACTOR = @as(c_int, 4);
pub const VM_SWAPUSAGE = @as(c_int, 5);
pub const VM_MAXID = @as(c_int, 6);
pub const CTL_VM_NAMES = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/sysctl.h:525:9
pub const LSCALE = @as(c_int, 1000);
pub const HW_MACHINE = @as(c_int, 1);
pub const HW_MODEL = @as(c_int, 2);
pub const HW_NCPU = @as(c_int, 3);
pub const HW_BYTEORDER = @as(c_int, 4);
pub const HW_PHYSMEM = @as(c_int, 5);
pub const HW_USERMEM = @as(c_int, 6);
pub const HW_PAGESIZE = @as(c_int, 7);
pub const HW_DISKNAMES = @as(c_int, 8);
pub const HW_DISKSTATS = @as(c_int, 9);
pub const HW_EPOCH = @as(c_int, 10);
pub const HW_FLOATINGPT = @as(c_int, 11);
pub const HW_MACHINE_ARCH = @as(c_int, 12);
pub const HW_VECTORUNIT = @as(c_int, 13);
pub const HW_BUS_FREQ = @as(c_int, 14);
pub const HW_CPU_FREQ = @as(c_int, 15);
pub const HW_CACHELINE = @as(c_int, 16);
pub const HW_L1ICACHESIZE = @as(c_int, 17);
pub const HW_L1DCACHESIZE = @as(c_int, 18);
pub const HW_L2SETTINGS = @as(c_int, 19);
pub const HW_L2CACHESIZE = @as(c_int, 20);
pub const HW_L3SETTINGS = @as(c_int, 21);
pub const HW_L3CACHESIZE = @as(c_int, 22);
pub const HW_TB_FREQ = @as(c_int, 23);
pub const HW_MEMSIZE = @as(c_int, 24);
pub const HW_AVAILCPU = @as(c_int, 25);
pub const HW_TARGET = @as(c_int, 26);
pub const HW_PRODUCT = @as(c_int, 27);
pub const HW_MAXID = @as(c_int, 28);
pub const CTL_HW_NAMES = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/sysctl.h:587:9
pub const USER_CS_PATH = @as(c_int, 1);
pub const USER_BC_BASE_MAX = @as(c_int, 2);
pub const USER_BC_DIM_MAX = @as(c_int, 3);
pub const USER_BC_SCALE_MAX = @as(c_int, 4);
pub const USER_BC_STRING_MAX = @as(c_int, 5);
pub const USER_COLL_WEIGHTS_MAX = @as(c_int, 6);
pub const USER_EXPR_NEST_MAX = @as(c_int, 7);
pub const USER_LINE_MAX = @as(c_int, 8);
pub const USER_RE_DUP_MAX = @as(c_int, 9);
pub const USER_POSIX2_VERSION = @as(c_int, 10);
pub const USER_POSIX2_C_BIND = @as(c_int, 11);
pub const USER_POSIX2_C_DEV = @as(c_int, 12);
pub const USER_POSIX2_CHAR_TERM = @as(c_int, 13);
pub const USER_POSIX2_FORT_DEV = @as(c_int, 14);
pub const USER_POSIX2_FORT_RUN = @as(c_int, 15);
pub const USER_POSIX2_LOCALEDEF = @as(c_int, 16);
pub const USER_POSIX2_SW_DEV = @as(c_int, 17);
pub const USER_POSIX2_UPE = @as(c_int, 18);
pub const USER_STREAM_MAX = @as(c_int, 19);
pub const USER_TZNAME_MAX = @as(c_int, 20);
pub const USER_MAXID = @as(c_int, 21);
pub const CTL_USER_NAMES = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/sysctl.h:751:9
pub const CTL_DEBUG_NAME = @as(c_int, 0);
pub const CTL_DEBUG_VALUE = @as(c_int, 1);
pub const CTL_DEBUG_MAXID = @as(c_int, 20);
pub const _DLFCN_H_ = "";
pub const __STDBOOL_H = "";
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const @"bool" = bool;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const __DYLDDL_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/dlfcn.h:39:9
pub const __DYLDDL_DLSYM_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `driverkit`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/dlfcn.h:41:9
pub const RTLD_LAZY = @as(c_int, 0x1);
pub const RTLD_NOW = @as(c_int, 0x2);
pub const RTLD_LOCAL = @as(c_int, 0x4);
pub const RTLD_GLOBAL = @as(c_int, 0x8);
pub const RTLD_NOLOAD = @as(c_int, 0x10);
pub const RTLD_NODELETE = @as(c_int, 0x80);
pub const RTLD_FIRST = @as(c_int, 0x100);
pub const RTLD_NEXT = @import("std").zig.c_translation.cast(?*anyopaque, -@as(c_int, 1));
pub const RTLD_DEFAULT = @import("std").zig.c_translation.cast(?*anyopaque, -@as(c_int, 2));
pub const RTLD_SELF = @import("std").zig.c_translation.cast(?*anyopaque, -@as(c_int, 3));
pub const RTLD_MAIN_ONLY = @import("std").zig.c_translation.cast(?*anyopaque, -@as(c_int, 5));
pub const _LIBPROC_H_ = "";
pub const _SYS_STAT_H_ = "";
pub const __DARWIN_STRUCT_STAT64_TIMES = @compileError("unable to translate macro: undefined identifier `st_atimespec`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/stat.h:128:9
pub const __DARWIN_STRUCT_STAT64 = @compileError("unable to translate macro: undefined identifier `st_dev`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/stat.h:158:9
pub const st_atime = @compileError("unable to translate macro: undefined identifier `st_atimespec`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/stat.h:231:9
pub const st_mtime = @compileError("unable to translate macro: undefined identifier `st_mtimespec`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/stat.h:232:9
pub const st_ctime = @compileError("unable to translate macro: undefined identifier `st_ctimespec`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/stat.h:233:9
pub const st_birthtime = @compileError("unable to translate macro: undefined identifier `st_birthtimespec`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/stat.h:234:9
pub const S_IFMT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o170000, .octal);
pub const S_IFIFO = @as(c_int, 0o010000);
pub const S_IFCHR = @as(c_int, 0o020000);
pub const S_IFDIR = @as(c_int, 0o040000);
pub const S_IFBLK = @as(c_int, 0o060000);
pub const S_IFREG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o100000, .octal);
pub const S_IFLNK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o120000, .octal);
pub const S_IFSOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o140000, .octal);
pub const S_IFWHT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o160000, .octal);
pub const S_IRWXU = @as(c_int, 0o000700);
pub const S_IRUSR = @as(c_int, 0o000400);
pub const S_IWUSR = @as(c_int, 0o000200);
pub const S_IXUSR = @as(c_int, 0o000100);
pub const S_IRWXG = @as(c_int, 0o000070);
pub const S_IRGRP = @as(c_int, 0o000040);
pub const S_IWGRP = @as(c_int, 0o000020);
pub const S_IXGRP = @as(c_int, 0o000010);
pub const S_IRWXO = @as(c_int, 0o000007);
pub const S_IROTH = @as(c_int, 0o000004);
pub const S_IWOTH = @as(c_int, 0o000002);
pub const S_IXOTH = @as(c_int, 0o000001);
pub const S_ISUID = @as(c_int, 0o004000);
pub const S_ISGID = @as(c_int, 0o002000);
pub const S_ISVTX = @as(c_int, 0o001000);
pub const S_ISTXT = S_ISVTX;
pub const S_IREAD = S_IRUSR;
pub const S_IWRITE = S_IWUSR;
pub const S_IEXEC = S_IXUSR;
pub inline fn S_ISBLK(m: anytype) @TypeOf((m & S_IFMT) == S_IFBLK) {
    _ = &m;
    return (m & S_IFMT) == S_IFBLK;
}
pub inline fn S_ISCHR(m: anytype) @TypeOf((m & S_IFMT) == S_IFCHR) {
    _ = &m;
    return (m & S_IFMT) == S_IFCHR;
}
pub inline fn S_ISDIR(m: anytype) @TypeOf((m & S_IFMT) == S_IFDIR) {
    _ = &m;
    return (m & S_IFMT) == S_IFDIR;
}
pub inline fn S_ISFIFO(m: anytype) @TypeOf((m & S_IFMT) == S_IFIFO) {
    _ = &m;
    return (m & S_IFMT) == S_IFIFO;
}
pub inline fn S_ISREG(m: anytype) @TypeOf((m & S_IFMT) == S_IFREG) {
    _ = &m;
    return (m & S_IFMT) == S_IFREG;
}
pub inline fn S_ISLNK(m: anytype) @TypeOf((m & S_IFMT) == S_IFLNK) {
    _ = &m;
    return (m & S_IFMT) == S_IFLNK;
}
pub inline fn S_ISSOCK(m: anytype) @TypeOf((m & S_IFMT) == S_IFSOCK) {
    _ = &m;
    return (m & S_IFMT) == S_IFSOCK;
}
pub inline fn S_ISWHT(m: anytype) @TypeOf((m & S_IFMT) == S_IFWHT) {
    _ = &m;
    return (m & S_IFMT) == S_IFWHT;
}
pub inline fn S_TYPEISMQ(buf: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &buf;
    return @as(c_int, 0);
}
pub inline fn S_TYPEISSEM(buf: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &buf;
    return @as(c_int, 0);
}
pub inline fn S_TYPEISSHM(buf: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &buf;
    return @as(c_int, 0);
}
pub inline fn S_TYPEISTMO(buf: anytype) @TypeOf(@as(c_int, 0)) {
    _ = &buf;
    return @as(c_int, 0);
}
pub const ACCESSPERMS = (S_IRWXU | S_IRWXG) | S_IRWXO;
pub const ALLPERMS = ((((S_ISUID | S_ISGID) | S_ISTXT) | S_IRWXU) | S_IRWXG) | S_IRWXO;
pub const DEFFILEMODE = ((((S_IRUSR | S_IWUSR) | S_IRGRP) | S_IWGRP) | S_IROTH) | S_IWOTH;
pub const S_BLKSIZE = @as(c_int, 512);
pub const UF_SETTABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000ffff, .hex);
pub const UF_NODUMP = @as(c_int, 0x00000001);
pub const UF_IMMUTABLE = @as(c_int, 0x00000002);
pub const UF_APPEND = @as(c_int, 0x00000004);
pub const UF_OPAQUE = @as(c_int, 0x00000008);
pub const UF_COMPRESSED = @as(c_int, 0x00000020);
pub const UF_TRACKED = @as(c_int, 0x00000040);
pub const UF_DATAVAULT = @as(c_int, 0x00000080);
pub const UF_HIDDEN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const SF_SUPPORTED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x009f0000, .hex);
pub const SF_SETTABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x3fff0000, .hex);
pub const SF_SYNTHETIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex);
pub const SF_ARCHIVED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const SF_IMMUTABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const SF_APPEND = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const SF_RESTRICTED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const SF_NOUNLINK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const SF_FIRMLINK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const SF_DATALESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const EF_MAY_SHARE_BLOCKS = @as(c_int, 0x00000001);
pub const EF_NO_XATTRS = @as(c_int, 0x00000002);
pub const EF_IS_SYNC_ROOT = @as(c_int, 0x00000004);
pub const EF_IS_PURGEABLE = @as(c_int, 0x00000008);
pub const EF_IS_SPARSE = @as(c_int, 0x00000010);
pub const EF_IS_SYNTHETIC = @as(c_int, 0x00000020);
pub const EF_SHARES_ALL_BLOCKS = @as(c_int, 0x00000040);
pub const UTIME_NOW = -@as(c_int, 1);
pub const UTIME_OMIT = -@as(c_int, 2);
pub const _FILESEC_T = "";
pub const _SYS_MOUNT_H_ = "";
pub const _SYS_ATTR_H_ = "";
pub const FSOPT_NOFOLLOW = @as(c_int, 0x00000001);
pub const FSOPT_NOINMEMUPDATE = @as(c_int, 0x00000002);
pub const FSOPT_REPORT_FULLSIZE = @as(c_int, 0x00000004);
pub const FSOPT_PACK_INVAL_ATTRS = @as(c_int, 0x00000008);
pub const FSOPT_ATTR_CMN_EXTENDED = @as(c_int, 0x00000020);
pub const FSOPT_RETURN_REALDEV = @as(c_int, 0x00000200);
pub const FSOPT_NOFOLLOW_ANY = @as(c_int, 0x00000800);
pub const SEARCHFS_MAX_SEARCHPARMS = @as(c_int, 4096);
pub const _FSOBJ_ID_T = "";
pub const ATTR_BIT_MAP_COUNT = @as(c_int, 5);
pub const ATTRIBUTE_SET_INIT = @compileError("unable to translate C expr: unexpected token 'do'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/attr.h:98:9
pub const VOL_CAPABILITIES_FORMAT = @as(c_int, 0);
pub const VOL_CAPABILITIES_INTERFACES = @as(c_int, 1);
pub const VOL_CAPABILITIES_RESERVED1 = @as(c_int, 2);
pub const VOL_CAPABILITIES_RESERVED2 = @as(c_int, 3);
pub const ATTR_MAX_BUFFER = @as(c_int, 8192);
pub const ATTR_MAX_BUFFER_LONGPATHS = @compileError("unable to translate macro: undefined identifier `MAXLONGPATHLEN`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/attr.h:136:9
pub const VOL_CAP_FMT_PERSISTENTOBJECTIDS = @as(c_int, 0x00000001);
pub const VOL_CAP_FMT_SYMBOLICLINKS = @as(c_int, 0x00000002);
pub const VOL_CAP_FMT_HARDLINKS = @as(c_int, 0x00000004);
pub const VOL_CAP_FMT_JOURNAL = @as(c_int, 0x00000008);
pub const VOL_CAP_FMT_JOURNAL_ACTIVE = @as(c_int, 0x00000010);
pub const VOL_CAP_FMT_NO_ROOT_TIMES = @as(c_int, 0x00000020);
pub const VOL_CAP_FMT_SPARSE_FILES = @as(c_int, 0x00000040);
pub const VOL_CAP_FMT_ZERO_RUNS = @as(c_int, 0x00000080);
pub const VOL_CAP_FMT_CASE_SENSITIVE = @as(c_int, 0x00000100);
pub const VOL_CAP_FMT_CASE_PRESERVING = @as(c_int, 0x00000200);
pub const VOL_CAP_FMT_FAST_STATFS = @as(c_int, 0x00000400);
pub const VOL_CAP_FMT_2TB_FILESIZE = @as(c_int, 0x00000800);
pub const VOL_CAP_FMT_OPENDENYMODES = @as(c_int, 0x00001000);
pub const VOL_CAP_FMT_HIDDEN_FILES = @as(c_int, 0x00002000);
pub const VOL_CAP_FMT_PATH_FROM_ID = @as(c_int, 0x00004000);
pub const VOL_CAP_FMT_NO_VOLUME_SIZES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const VOL_CAP_FMT_DECMPFS_COMPRESSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const VOL_CAP_FMT_64BIT_OBJECT_IDS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const VOL_CAP_FMT_DIR_HARDLINKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const VOL_CAP_FMT_DOCUMENT_ID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const VOL_CAP_FMT_WRITE_GENERATION_COUNT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const VOL_CAP_FMT_NO_IMMUTABLE_FILES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const VOL_CAP_FMT_NO_PERMISSIONS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const VOL_CAP_FMT_SHARED_SPACE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const VOL_CAP_FMT_VOL_GROUPS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const VOL_CAP_FMT_SEALED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const VOL_CAP_FMT_CLONE_MAPPING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const VOL_CAP_INT_SEARCHFS = @as(c_int, 0x00000001);
pub const VOL_CAP_INT_ATTRLIST = @as(c_int, 0x00000002);
pub const VOL_CAP_INT_NFSEXPORT = @as(c_int, 0x00000004);
pub const VOL_CAP_INT_READDIRATTR = @as(c_int, 0x00000008);
pub const VOL_CAP_INT_EXCHANGEDATA = @as(c_int, 0x00000010);
pub const VOL_CAP_INT_COPYFILE = @as(c_int, 0x00000020);
pub const VOL_CAP_INT_ALLOCATE = @as(c_int, 0x00000040);
pub const VOL_CAP_INT_VOL_RENAME = @as(c_int, 0x00000080);
pub const VOL_CAP_INT_ADVLOCK = @as(c_int, 0x00000100);
pub const VOL_CAP_INT_FLOCK = @as(c_int, 0x00000200);
pub const VOL_CAP_INT_EXTENDED_SECURITY = @as(c_int, 0x00000400);
pub const VOL_CAP_INT_USERACCESS = @as(c_int, 0x00000800);
pub const VOL_CAP_INT_MANLOCK = @as(c_int, 0x00001000);
pub const VOL_CAP_INT_NAMEDSTREAMS = @as(c_int, 0x00002000);
pub const VOL_CAP_INT_EXTENDED_ATTR = @as(c_int, 0x00004000);
pub const VOL_CAP_INT_CLONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const VOL_CAP_INT_SNAPSHOT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const VOL_CAP_INT_RENAME_SWAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const VOL_CAP_INT_RENAME_EXCL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const VOL_CAP_INT_RENAME_OPENFAIL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const VOL_CAP_INT_RENAME_SECLUDE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const VOL_CAP_INT_ATTRIBUTION_TAG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const VOL_CAP_INT_PUNCHHOLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const ATTR_CMN_NAME = @as(c_int, 0x00000001);
pub const ATTR_CMN_DEVID = @as(c_int, 0x00000002);
pub const ATTR_CMN_FSID = @as(c_int, 0x00000004);
pub const ATTR_CMN_OBJTYPE = @as(c_int, 0x00000008);
pub const ATTR_CMN_OBJTAG = @as(c_int, 0x00000010);
pub const ATTR_CMN_OBJID = @as(c_int, 0x00000020);
pub const ATTR_CMN_OBJPERMANENTID = @as(c_int, 0x00000040);
pub const ATTR_CMN_PAROBJID = @as(c_int, 0x00000080);
pub const ATTR_CMN_SCRIPT = @as(c_int, 0x00000100);
pub const ATTR_CMN_CRTIME = @as(c_int, 0x00000200);
pub const ATTR_CMN_MODTIME = @as(c_int, 0x00000400);
pub const ATTR_CMN_CHGTIME = @as(c_int, 0x00000800);
pub const ATTR_CMN_ACCTIME = @as(c_int, 0x00001000);
pub const ATTR_CMN_BKUPTIME = @as(c_int, 0x00002000);
pub const ATTR_CMN_FNDRINFO = @as(c_int, 0x00004000);
pub const ATTR_CMN_OWNERID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const ATTR_CMN_GRPID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const ATTR_CMN_ACCESSMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const ATTR_CMN_FLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const ATTR_CMN_GEN_COUNT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const ATTR_CMN_DOCUMENT_ID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const ATTR_CMN_USERACCESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const ATTR_CMN_EXTENDED_SECURITY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const ATTR_CMN_UUID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const ATTR_CMN_GRPUUID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const ATTR_CMN_FILEID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const ATTR_CMN_PARENTID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const ATTR_CMN_FULLPATH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const ATTR_CMN_ADDEDTIME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const ATTR_CMN_ERROR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const ATTR_CMN_DATA_PROTECT_FLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const ATTR_CMN_RETURNED_ATTRS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const ATTR_CMN_VALIDMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFF, .hex);
pub const ATTR_CMN_SETMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x51C7FF00, .hex);
pub const ATTR_CMN_VOLSETMASK = @as(c_int, 0x00006700);
pub const ATTR_VOL_FSTYPE = @as(c_int, 0x00000001);
pub const ATTR_VOL_SIGNATURE = @as(c_int, 0x00000002);
pub const ATTR_VOL_SIZE = @as(c_int, 0x00000004);
pub const ATTR_VOL_SPACEFREE = @as(c_int, 0x00000008);
pub const ATTR_VOL_SPACEAVAIL = @as(c_int, 0x00000010);
pub const ATTR_VOL_MINALLOCATION = @as(c_int, 0x00000020);
pub const ATTR_VOL_ALLOCATIONCLUMP = @as(c_int, 0x00000040);
pub const ATTR_VOL_IOBLOCKSIZE = @as(c_int, 0x00000080);
pub const ATTR_VOL_OBJCOUNT = @as(c_int, 0x00000100);
pub const ATTR_VOL_FILECOUNT = @as(c_int, 0x00000200);
pub const ATTR_VOL_DIRCOUNT = @as(c_int, 0x00000400);
pub const ATTR_VOL_MAXOBJCOUNT = @as(c_int, 0x00000800);
pub const ATTR_VOL_MOUNTPOINT = @as(c_int, 0x00001000);
pub const ATTR_VOL_NAME = @as(c_int, 0x00002000);
pub const ATTR_VOL_MOUNTFLAGS = @as(c_int, 0x00004000);
pub const ATTR_VOL_MOUNTEDDEVICE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const ATTR_VOL_ENCODINGSUSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const ATTR_VOL_CAPABILITIES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const ATTR_VOL_UUID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const ATTR_VOL_MOUNTEXTFLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const ATTR_VOL_FSTYPENAME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const ATTR_VOL_FSSUBTYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const ATTR_VOL_OWNER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const ATTR_VOL_SPACEUSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const ATTR_VOL_QUOTA_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const ATTR_VOL_RESERVED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const ATTR_VOL_ATTRIBUTES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const ATTR_VOL_INFO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const ATTR_VOL_VALIDMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xF0FFFFFF, .hex);
pub const ATTR_VOL_SETMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80002000, .hex);
pub const ATTR_DIR_LINKCOUNT = @as(c_int, 0x00000001);
pub const ATTR_DIR_ENTRYCOUNT = @as(c_int, 0x00000002);
pub const ATTR_DIR_MOUNTSTATUS = @as(c_int, 0x00000004);
pub const ATTR_DIR_ALLOCSIZE = @as(c_int, 0x00000008);
pub const ATTR_DIR_IOBLOCKSIZE = @as(c_int, 0x00000010);
pub const ATTR_DIR_DATALENGTH = @as(c_int, 0x00000020);
pub const DIR_MNTSTATUS_MNTPOINT = @as(c_int, 0x00000001);
pub const DIR_MNTSTATUS_TRIGGER = @as(c_int, 0x00000002);
pub const ATTR_DIR_VALIDMASK = @as(c_int, 0x0000003f);
pub const ATTR_DIR_SETMASK = @as(c_int, 0x00000000);
pub const ATTR_FILE_LINKCOUNT = @as(c_int, 0x00000001);
pub const ATTR_FILE_TOTALSIZE = @as(c_int, 0x00000002);
pub const ATTR_FILE_ALLOCSIZE = @as(c_int, 0x00000004);
pub const ATTR_FILE_IOBLOCKSIZE = @as(c_int, 0x00000008);
pub const ATTR_FILE_DEVTYPE = @as(c_int, 0x00000020);
pub const ATTR_FILE_FORKCOUNT = @as(c_int, 0x00000080);
pub const ATTR_FILE_FORKLIST = @as(c_int, 0x00000100);
pub const ATTR_FILE_DATALENGTH = @as(c_int, 0x00000200);
pub const ATTR_FILE_DATAALLOCSIZE = @as(c_int, 0x00000400);
pub const ATTR_FILE_RSRCLENGTH = @as(c_int, 0x00001000);
pub const ATTR_FILE_RSRCALLOCSIZE = @as(c_int, 0x00002000);
pub const ATTR_FILE_VALIDMASK = @as(c_int, 0x000037FF);
pub const ATTR_FILE_SETMASK = @as(c_int, 0x00000020);
pub const ATTR_CMNEXT_RELPATH = @as(c_int, 0x00000004);
pub const ATTR_CMNEXT_PRIVATESIZE = @as(c_int, 0x00000008);
pub const ATTR_CMNEXT_LINKID = @as(c_int, 0x00000010);
pub const ATTR_CMNEXT_NOFIRMLINKPATH = @as(c_int, 0x00000020);
pub const ATTR_CMNEXT_REALDEVID = @as(c_int, 0x00000040);
pub const ATTR_CMNEXT_REALFSID = @as(c_int, 0x00000080);
pub const ATTR_CMNEXT_CLONEID = @as(c_int, 0x00000100);
pub const ATTR_CMNEXT_EXT_FLAGS = @as(c_int, 0x00000200);
pub const ATTR_CMNEXT_RECURSIVE_GENCOUNT = @as(c_int, 0x00000400);
pub const ATTR_CMNEXT_ATTRIBUTION_TAG = @as(c_int, 0x00000800);
pub const ATTR_CMNEXT_CLONE_REFCNT = @as(c_int, 0x00001000);
pub const ATTR_CMNEXT_VALIDMASK = @as(c_int, 0x00001ffc);
pub const ATTR_CMNEXT_SETMASK = @as(c_int, 0x00000000);
pub const ATTR_FORK_TOTALSIZE = @as(c_int, 0x00000001);
pub const ATTR_FORK_ALLOCSIZE = @as(c_int, 0x00000002);
pub const ATTR_FORK_RESERVED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex);
pub const ATTR_FORK_VALIDMASK = @as(c_int, 0x00000003);
pub const ATTR_FORK_SETMASK = @as(c_int, 0x00000000);
pub const ATTR_CMN_NAMEDATTRCOUNT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const ATTR_CMN_NAMEDATTRLIST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const ATTR_FILE_CLUMPSIZE = @as(c_int, 0x00000010);
pub const ATTR_FILE_FILETYPE = @as(c_int, 0x00000040);
pub const ATTR_FILE_DATAEXTENTS = @as(c_int, 0x00000800);
pub const ATTR_FILE_RSRCEXTENTS = @as(c_int, 0x00004000);
pub const ATTR_BULK_REQUIRED = ATTR_CMN_NAME | ATTR_CMN_RETURNED_ATTRS;
pub const SRCHFS_START = @as(c_int, 0x00000001);
pub const SRCHFS_MATCHPARTIALNAMES = @as(c_int, 0x00000002);
pub const SRCHFS_MATCHDIRS = @as(c_int, 0x00000004);
pub const SRCHFS_MATCHFILES = @as(c_int, 0x00000008);
pub const SRCHFS_SKIPLINKS = @as(c_int, 0x00000010);
pub const SRCHFS_SKIPINVISIBLE = @as(c_int, 0x00000020);
pub const SRCHFS_SKIPPACKAGES = @as(c_int, 0x00000040);
pub const SRCHFS_SKIPINAPPROPRIATE = @as(c_int, 0x00000080);
pub const SRCHFS_NEGATEPARAMS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const SRCHFS_VALIDOPTIONSMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x800000FF, .hex);
pub const FST_EOF = -@as(c_int, 1);
pub const __OS_BASE__ = "";
pub const OS_NORETURN = @compileError("unable to translate macro: undefined identifier `__noreturn__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:45:9
pub const OS_NOTHROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:46:9
pub const OS_NONNULL1 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:47:9
pub const OS_NONNULL2 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:48:9
pub const OS_NONNULL3 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:49:9
pub const OS_NONNULL4 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:50:9
pub const OS_NONNULL5 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:51:9
pub const OS_NONNULL6 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:52:9
pub const OS_NONNULL7 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:53:9
pub const OS_NONNULL8 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:54:9
pub const OS_NONNULL9 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:55:9
pub const OS_NONNULL10 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:56:9
pub const OS_NONNULL11 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:57:9
pub const OS_NONNULL12 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:58:9
pub const OS_NONNULL13 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:59:9
pub const OS_NONNULL14 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:60:9
pub const OS_NONNULL15 = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:61:9
pub const OS_NONNULL_ALL = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:62:9
pub const OS_SENTINEL = @compileError("unable to translate macro: undefined identifier `__sentinel__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:63:9
pub const OS_PURE = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:64:9
pub const OS_CONST = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:65:9
pub const OS_WARN_RESULT = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:66:9
pub const OS_MALLOC = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:67:9
pub const OS_USED = @compileError("unable to translate macro: undefined identifier `__used__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:68:9
pub const OS_UNUSED = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:69:9
pub const OS_COLD = @compileError("unable to translate macro: undefined identifier `__cold__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:70:9
pub const OS_WEAK = @compileError("unable to translate macro: undefined identifier `__weak__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:71:9
pub const OS_WEAK_IMPORT = @compileError("unable to translate macro: undefined identifier `__weak_import__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:72:9
pub const OS_NOINLINE = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:73:9
pub const OS_ALWAYS_INLINE = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:74:9
pub const OS_TRANSPARENT_UNION = @compileError("unable to translate macro: undefined identifier `__transparent_union__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:75:9
pub const OS_ALIGNED = @compileError("unable to translate macro: undefined identifier `__aligned__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:76:9
pub const OS_FORMAT_PRINTF = @compileError("unable to translate macro: undefined identifier `__format__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:77:9
pub const OS_EXPORT = @compileError("unable to translate macro: undefined identifier `__visibility__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:78:9
pub const OS_INLINE = @compileError("unable to translate C expr: unexpected token 'static'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:79:9
pub inline fn OS_EXPECT(x: anytype, v: anytype) @TypeOf(__builtin_expect(x, v)) {
    _ = &x;
    _ = &v;
    return __builtin_expect(x, v);
}
pub const OS_NOESCAPE = @compileError("unable to translate macro: undefined identifier `__noescape__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:121:9
pub const OS_FALLTHROUGH = @compileError("unable to translate macro: undefined identifier `__fallthrough__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:129:9
pub const OS_ASSUME_NONNULL_BEGIN = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:135:9
pub const OS_ASSUME_NONNULL_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:136:9
pub inline fn OS_COMPILER_CAN_ASSUME(expr: anytype) @TypeOf(__builtin_assume(expr)) {
    _ = &expr;
    return __builtin_assume(expr);
}
pub const OS_OVERLOADABLE = @compileError("unable to translate macro: undefined identifier `__overloadable__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:149:9
pub const OS_ANALYZER_SUPPRESS = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:157:9
pub const __OS_ENUM_ATTR = @compileError("unable to translate macro: undefined identifier `enum_extensibility`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:161:9
pub const __OS_ENUM_ATTR_CLOSED = @compileError("unable to translate macro: undefined identifier `enum_extensibility`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:162:9
pub const __OS_OPTIONS_ATTR = @compileError("unable to translate macro: undefined identifier `flag_enum`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:176:9
pub const OS_ENUM = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:183:9
pub const OS_CLOSED_ENUM = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:185:9
pub const OS_OPTIONS = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:187:9
pub const OS_CLOSED_OPTIONS = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:189:9
pub const OS_SWIFT_UNAVAILABLE = @compileError("unable to translate macro: undefined identifier `__availability__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:240:9
pub const OS_SWIFT_UNAVAILABLE_FROM_ASYNC = @compileError("unable to translate macro: undefined identifier `__swift_attr__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:247:9
pub const OS_SWIFT_NONISOLATED = @compileError("unable to translate macro: undefined identifier `__swift_attr__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:249:9
pub const OS_SWIFT_NONISOLATED_UNSAFE = @compileError("unable to translate macro: undefined identifier `__swift_attr__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:250:9
pub const OS_REFINED_FOR_SWIFT = @compileError("unable to translate macro: undefined identifier `__swift_private__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:258:10
pub const OS_SWIFT_NAME = @compileError("unable to translate macro: undefined identifier `__swift_name__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:264:10
pub const __OS_STRINGIFY = @compileError("unable to translate C expr: unexpected token '#'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:269:9
pub inline fn OS_STRINGIFY(s: anytype) @TypeOf(__OS_STRINGIFY(s)) {
    _ = &s;
    return __OS_STRINGIFY(s);
}
pub const __OS_CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:271:9
pub inline fn OS_CONCAT(x: anytype, y: anytype) @TypeOf(__OS_CONCAT(x, y)) {
    _ = &x;
    _ = &y;
    return __OS_CONCAT(x, y);
}
pub const os_prevent_tail_call_optimization = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:275:9
pub inline fn os_is_compile_time_constant(expr: anytype) @TypeOf(__builtin_constant_p(expr)) {
    _ = &expr;
    return __builtin_constant_p(expr);
}
pub const os_compiler_barrier = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:277:9
pub const OS_NOT_TAIL_CALLED = @compileError("unable to translate macro: undefined identifier `__not_tail_called__`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/base.h:285:9
pub const OS_ASSUME_PTR_ABI_SINGLE_BEGIN = __ASSUME_PTR_ABI_SINGLE_BEGIN;
pub const OS_ASSUME_PTR_ABI_SINGLE_END = __ASSUME_PTR_ABI_SINGLE_END;
pub const OS_UNSAFE_INDEXABLE = "";
pub const OS_HEADER_INDEXABLE = "";
pub inline fn OS_COUNTED_BY(N: anytype) @TypeOf(__counted_by(N)) {
    _ = &N;
    return __counted_by(N);
}
pub inline fn OS_SIZED_BY(N: anytype) @TypeOf(__sized_by(N)) {
    _ = &N;
    return __sized_by(N);
}
pub const _FSID_T = "";
pub const _GRAFTDMG_UN_ = "";
pub const GRAFTDMG_SECURE_BOOT_CRYPTEX_ARGS_VERSION = @as(c_int, 1);
pub const MAX_GRAFT_ARGS_SIZE = @as(c_int, 512);
pub const SBC_PRESERVE_MOUNT = @as(c_int, 0x0001);
pub const SBC_ALTERNATE_SHARED_REGION = @as(c_int, 0x0002);
pub const SBC_SYSTEM_CONTENT = @as(c_int, 0x0004);
pub const SBC_PANIC_ON_AUTHFAIL = @as(c_int, 0x0008);
pub const SBC_STRICT_AUTH = @as(c_int, 0x0010);
pub const SBC_PRESERVE_GRAFT = @as(c_int, 0x0020);
pub const _MOUNT_T = "";
pub const _VNODE_T = "";
pub const MFSNAMELEN = @as(c_int, 15);
pub const MFSTYPENAMELEN = @as(c_int, 16);
pub const MNAMELEN = MAXPATHLEN;
pub const MNT_EXT_ROOT_DATA_VOL = @as(c_int, 0x00000001);
pub const MNT_EXT_FSKIT = @as(c_int, 0x00000002);
pub const __DARWIN_STRUCT_STATFS64 = @compileError("unable to translate macro: undefined identifier `f_bsize`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/mount.h:105:9
pub const MNT_RDONLY = @as(c_int, 0x00000001);
pub const MNT_SYNCHRONOUS = @as(c_int, 0x00000002);
pub const MNT_NOEXEC = @as(c_int, 0x00000004);
pub const MNT_NOSUID = @as(c_int, 0x00000008);
pub const MNT_NODEV = @as(c_int, 0x00000010);
pub const MNT_UNION = @as(c_int, 0x00000020);
pub const MNT_ASYNC = @as(c_int, 0x00000040);
pub const MNT_CPROTECT = @as(c_int, 0x00000080);
pub const MNT_EXPORTED = @as(c_int, 0x00000100);
pub const MNT_REMOVABLE = @as(c_int, 0x00000200);
pub const MNT_QUARANTINE = @as(c_int, 0x00000400);
pub const MNT_LOCAL = @as(c_int, 0x00001000);
pub const MNT_QUOTA = @as(c_int, 0x00002000);
pub const MNT_ROOTFS = @as(c_int, 0x00004000);
pub const MNT_DOVOLFS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const MNT_DONTBROWSE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const MNT_IGNORE_OWNERSHIP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const MNT_AUTOMOUNTED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const MNT_JOURNALED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const MNT_NOUSERXATTR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const MNT_DEFWRITE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const MNT_MULTILABEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const MNT_NOFOLLOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const MNT_NOATIME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const MNT_SNAPSHOT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const MNT_STRICTATIME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const MNT_UNKNOWNPERMISSIONS = MNT_IGNORE_OWNERSHIP;
pub const MNT_VISFLAGMASK = ((((((((((((((((((((((((MNT_RDONLY | MNT_SYNCHRONOUS) | MNT_NOEXEC) | MNT_NOSUID) | MNT_NODEV) | MNT_UNION) | MNT_ASYNC) | MNT_EXPORTED) | MNT_QUARANTINE) | MNT_LOCAL) | MNT_QUOTA) | MNT_REMOVABLE) | MNT_ROOTFS) | MNT_DOVOLFS) | MNT_DONTBROWSE) | MNT_IGNORE_OWNERSHIP) | MNT_AUTOMOUNTED) | MNT_JOURNALED) | MNT_NOUSERXATTR) | MNT_DEFWRITE) | MNT_MULTILABEL) | MNT_NOFOLLOW) | MNT_NOATIME) | MNT_STRICTATIME) | MNT_SNAPSHOT) | MNT_CPROTECT;
pub const MNT_UPDATE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const MNT_NOBLOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const MNT_RELOAD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const MNT_FORCE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const MNT_CMDFLAGS = ((MNT_UPDATE | MNT_NOBLOCK) | MNT_RELOAD) | MNT_FORCE;
pub const VFS_GENERIC = @as(c_int, 0);
pub const VFS_NUMMNTOPS = @as(c_int, 1);
pub const VFS_MAXTYPENUM = @as(c_int, 1);
pub const VFS_CONF = @as(c_int, 2);
pub const MNT_WAIT = @as(c_int, 1);
pub const MNT_NOWAIT = @as(c_int, 2);
pub const MNT_DWAIT = @as(c_int, 4);
pub const VFS_CTL_VERS1 = @as(c_int, 0x01);
pub const VFS_CTL_OSTATFS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010001, .hex);
pub const VFS_CTL_UMOUNT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010002, .hex);
pub const VFS_CTL_QUERY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010003, .hex);
pub const VFS_CTL_NEWADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010004, .hex);
pub const VFS_CTL_TIMEO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010005, .hex);
pub const VFS_CTL_NOLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010006, .hex);
pub const VFS_CTL_SADDR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010007, .hex);
pub const VFS_CTL_DISC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010008, .hex);
pub const VFS_CTL_SERVERINFO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010009, .hex);
pub const VFS_CTL_NSTATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0001000A, .hex);
pub const VFS_CTL_STATFS64 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0001000B, .hex);
pub const VFS_CTL_STATFS = VFS_CTL_STATFS64;
pub const VQ_NOTRESP = @as(c_int, 0x0001);
pub const VQ_NEEDAUTH = @as(c_int, 0x0002);
pub const VQ_LOWDISK = @as(c_int, 0x0004);
pub const VQ_MOUNT = @as(c_int, 0x0008);
pub const VQ_UNMOUNT = @as(c_int, 0x0010);
pub const VQ_DEAD = @as(c_int, 0x0020);
pub const VQ_ASSIST = @as(c_int, 0x0040);
pub const VQ_NOTRESPLOCK = @as(c_int, 0x0080);
pub const VQ_UPDATE = @as(c_int, 0x0100);
pub const VQ_VERYLOWDISK = @as(c_int, 0x0200);
pub const VQ_SYNCEVENT = @as(c_int, 0x0400);
pub const VQ_SERVEREVENT = @as(c_int, 0x0800);
pub const VQ_QUOTA = @as(c_int, 0x1000);
pub const VQ_NEARLOWDISK = @as(c_int, 0x2000);
pub const VQ_DESIRED_DISK = @as(c_int, 0x4000);
pub const VQ_FREE_SPACE_CHANGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const VQ_PURGEABLE_SPACE_CHANGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000, .hex);
pub const VQ_FLAG20000 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000, .hex);
pub const NFS_MAX_FH_SIZE = NFSV4_MAX_FH_SIZE;
pub const NFSV4_MAX_FH_SIZE = @as(c_int, 128);
pub const NFSV3_MAX_FH_SIZE = @as(c_int, 64);
pub const NFSV2_MAX_FH_SIZE = @as(c_int, 32);
pub const CRYPTEX_AUTH_STRUCT_VERSION = @as(c_int, 2);
pub const _SYS_RESOURCE_H_ = "";
pub const PRIO_PROCESS = @as(c_int, 0);
pub const PRIO_PGRP = @as(c_int, 1);
pub const PRIO_USER = @as(c_int, 2);
pub const PRIO_DARWIN_THREAD = @as(c_int, 3);
pub const PRIO_DARWIN_PROCESS = @as(c_int, 4);
pub const PRIO_MIN = -@as(c_int, 20);
pub const PRIO_MAX = @as(c_int, 20);
pub const PRIO_DARWIN_BG = @as(c_int, 0x1000);
pub const PRIO_DARWIN_NONUI = @as(c_int, 0x1001);
pub const RUSAGE_SELF = @as(c_int, 0);
pub const RUSAGE_CHILDREN = -@as(c_int, 1);
pub const ru_first = @compileError("unable to translate macro: undefined identifier `ru_ixrss`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/resource.h:164:9
pub const ru_last = @compileError("unable to translate macro: undefined identifier `ru_nivcsw`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/resource.h:178:9
pub const RUSAGE_INFO_V0 = @as(c_int, 0);
pub const RUSAGE_INFO_V1 = @as(c_int, 1);
pub const RUSAGE_INFO_V2 = @as(c_int, 2);
pub const RUSAGE_INFO_V3 = @as(c_int, 3);
pub const RUSAGE_INFO_V4 = @as(c_int, 4);
pub const RUSAGE_INFO_V5 = @as(c_int, 5);
pub const RUSAGE_INFO_V6 = @as(c_int, 6);
pub const RUSAGE_INFO_CURRENT = RUSAGE_INFO_V6;
pub const RU_PROC_RUNS_RESLIDE = @as(c_int, 0x00000001);
pub const RLIM_INFINITY = (@import("std").zig.c_translation.cast(__uint64_t, @as(c_int, 1)) << @as(c_int, 63)) - @as(c_int, 1);
pub const RLIM_SAVED_MAX = RLIM_INFINITY;
pub const RLIM_SAVED_CUR = RLIM_INFINITY;
pub const RLIMIT_CPU = @as(c_int, 0);
pub const RLIMIT_FSIZE = @as(c_int, 1);
pub const RLIMIT_DATA = @as(c_int, 2);
pub const RLIMIT_STACK = @as(c_int, 3);
pub const RLIMIT_CORE = @as(c_int, 4);
pub const RLIMIT_AS = @as(c_int, 5);
pub const RLIMIT_RSS = RLIMIT_AS;
pub const RLIMIT_MEMLOCK = @as(c_int, 6);
pub const RLIMIT_NPROC = @as(c_int, 7);
pub const RLIMIT_NOFILE = @as(c_int, 8);
pub const RLIM_NLIMITS = @as(c_int, 9);
pub const _RLIMIT_POSIX_FLAG = @as(c_int, 0x1000);
pub const RLIMIT_WAKEUPS_MONITOR = @as(c_int, 0x1);
pub const RLIMIT_CPU_USAGE_MONITOR = @as(c_int, 0x2);
pub const RLIMIT_THREAD_CPULIMITS = @as(c_int, 0x3);
pub const RLIMIT_FOOTPRINT_INTERVAL = @as(c_int, 0x4);
pub const WAKEMON_ENABLE = @as(c_int, 0x01);
pub const WAKEMON_DISABLE = @as(c_int, 0x02);
pub const WAKEMON_GET_PARAMS = @as(c_int, 0x04);
pub const WAKEMON_SET_DEFAULTS = @as(c_int, 0x08);
pub const WAKEMON_MAKE_FATAL = @as(c_int, 0x10);
pub const CPUMON_MAKE_FATAL = @as(c_int, 0x1000);
pub const FOOTPRINT_INTERVAL_RESET = @as(c_int, 0x1);
pub const IOPOL_TYPE_DISK = @as(c_int, 0);
pub const IOPOL_TYPE_VFS_ATIME_UPDATES = @as(c_int, 2);
pub const IOPOL_TYPE_VFS_MATERIALIZE_DATALESS_FILES = @as(c_int, 3);
pub const IOPOL_TYPE_VFS_STATFS_NO_DATA_VOLUME = @as(c_int, 4);
pub const IOPOL_TYPE_VFS_TRIGGER_RESOLVE = @as(c_int, 5);
pub const IOPOL_TYPE_VFS_IGNORE_CONTENT_PROTECTION = @as(c_int, 6);
pub const IOPOL_TYPE_VFS_IGNORE_PERMISSIONS = @as(c_int, 7);
pub const IOPOL_TYPE_VFS_SKIP_MTIME_UPDATE = @as(c_int, 8);
pub const IOPOL_TYPE_VFS_ALLOW_LOW_SPACE_WRITES = @as(c_int, 9);
pub const IOPOL_TYPE_VFS_DISALLOW_RW_FOR_O_EVTONLY = @as(c_int, 10);
pub const IOPOL_SCOPE_PROCESS = @as(c_int, 0);
pub const IOPOL_SCOPE_THREAD = @as(c_int, 1);
pub const IOPOL_SCOPE_DARWIN_BG = @as(c_int, 2);
pub const IOPOL_DEFAULT = @as(c_int, 0);
pub const IOPOL_IMPORTANT = @as(c_int, 1);
pub const IOPOL_PASSIVE = @as(c_int, 2);
pub const IOPOL_THROTTLE = @as(c_int, 3);
pub const IOPOL_UTILITY = @as(c_int, 4);
pub const IOPOL_STANDARD = @as(c_int, 5);
pub const IOPOL_APPLICATION = IOPOL_STANDARD;
pub const IOPOL_NORMAL = IOPOL_IMPORTANT;
pub const IOPOL_ATIME_UPDATES_DEFAULT = @as(c_int, 0);
pub const IOPOL_ATIME_UPDATES_OFF = @as(c_int, 1);
pub const IOPOL_MATERIALIZE_DATALESS_FILES_DEFAULT = @as(c_int, 0);
pub const IOPOL_MATERIALIZE_DATALESS_FILES_OFF = @as(c_int, 1);
pub const IOPOL_MATERIALIZE_DATALESS_FILES_ON = @as(c_int, 2);
pub const IOPOL_VFS_STATFS_NO_DATA_VOLUME_DEFAULT = @as(c_int, 0);
pub const IOPOL_VFS_STATFS_FORCE_NO_DATA_VOLUME = @as(c_int, 1);
pub const IOPOL_VFS_TRIGGER_RESOLVE_DEFAULT = @as(c_int, 0);
pub const IOPOL_VFS_TRIGGER_RESOLVE_OFF = @as(c_int, 1);
pub const IOPOL_VFS_CONTENT_PROTECTION_DEFAULT = @as(c_int, 0);
pub const IOPOL_VFS_CONTENT_PROTECTION_IGNORE = @as(c_int, 1);
pub const IOPOL_VFS_IGNORE_PERMISSIONS_OFF = @as(c_int, 0);
pub const IOPOL_VFS_IGNORE_PERMISSIONS_ON = @as(c_int, 1);
pub const IOPOL_VFS_SKIP_MTIME_UPDATE_OFF = @as(c_int, 0);
pub const IOPOL_VFS_SKIP_MTIME_UPDATE_ON = @as(c_int, 1);
pub const IOPOL_VFS_SKIP_MTIME_UPDATE_IGNORE = @as(c_int, 2);
pub const IOPOL_VFS_ALLOW_LOW_SPACE_WRITES_OFF = @as(c_int, 0);
pub const IOPOL_VFS_ALLOW_LOW_SPACE_WRITES_ON = @as(c_int, 1);
pub const IOPOL_VFS_DISALLOW_RW_FOR_O_EVTONLY_DEFAULT = @as(c_int, 0);
pub const IOPOL_VFS_DISALLOW_RW_FOR_O_EVTONLY_ON = @as(c_int, 1);
pub const IOPOL_VFS_NOCACHE_WRITE_FS_BLKSIZE_DEFAULT = @as(c_int, 0);
pub const IOPOL_VFS_NOCACHE_WRITE_FS_BLKSIZE_ON = @as(c_int, 1);
pub const _MACH_MESSAGE_H_ = "";
pub const _MACH_KERN_RETURN_H_ = "";
pub const _MACH_MACHINE_KERN_RETURN_H_ = "";
pub const _MACH_ARM_KERN_RETURN_H_ = "";
pub const KERN_SUCCESS = @as(c_int, 0);
pub const KERN_INVALID_ADDRESS = @as(c_int, 1);
pub const KERN_PROTECTION_FAILURE = @as(c_int, 2);
pub const KERN_NO_SPACE = @as(c_int, 3);
pub const KERN_INVALID_ARGUMENT = @as(c_int, 4);
pub const KERN_FAILURE = @as(c_int, 5);
pub const KERN_RESOURCE_SHORTAGE = @as(c_int, 6);
pub const KERN_NOT_RECEIVER = @as(c_int, 7);
pub const KERN_NO_ACCESS = @as(c_int, 8);
pub const KERN_MEMORY_FAILURE = @as(c_int, 9);
pub const KERN_MEMORY_ERROR = @as(c_int, 10);
pub const KERN_ALREADY_IN_SET = @as(c_int, 11);
pub const KERN_NOT_IN_SET = @as(c_int, 12);
pub const KERN_NAME_EXISTS = @as(c_int, 13);
pub const KERN_ABORTED = @as(c_int, 14);
pub const KERN_INVALID_NAME = @as(c_int, 15);
pub const KERN_INVALID_TASK = @as(c_int, 16);
pub const KERN_INVALID_RIGHT = @as(c_int, 17);
pub const KERN_INVALID_VALUE = @as(c_int, 18);
pub const KERN_UREFS_OVERFLOW = @as(c_int, 19);
pub const KERN_INVALID_CAPABILITY = @as(c_int, 20);
pub const KERN_RIGHT_EXISTS = @as(c_int, 21);
pub const KERN_INVALID_HOST = @as(c_int, 22);
pub const KERN_MEMORY_PRESENT = @as(c_int, 23);
pub const KERN_MEMORY_DATA_MOVED = @as(c_int, 24);
pub const KERN_MEMORY_RESTART_COPY = @as(c_int, 25);
pub const KERN_INVALID_PROCESSOR_SET = @as(c_int, 26);
pub const KERN_POLICY_LIMIT = @as(c_int, 27);
pub const KERN_INVALID_POLICY = @as(c_int, 28);
pub const KERN_INVALID_OBJECT = @as(c_int, 29);
pub const KERN_ALREADY_WAITING = @as(c_int, 30);
pub const KERN_DEFAULT_SET = @as(c_int, 31);
pub const KERN_EXCEPTION_PROTECTED = @as(c_int, 32);
pub const KERN_INVALID_LEDGER = @as(c_int, 33);
pub const KERN_INVALID_MEMORY_CONTROL = @as(c_int, 34);
pub const KERN_INVALID_SECURITY = @as(c_int, 35);
pub const KERN_NOT_DEPRESSED = @as(c_int, 36);
pub const KERN_TERMINATED = @as(c_int, 37);
pub const KERN_LOCK_SET_DESTROYED = @as(c_int, 38);
pub const KERN_LOCK_UNSTABLE = @as(c_int, 39);
pub const KERN_LOCK_OWNED = @as(c_int, 40);
pub const KERN_LOCK_OWNED_SELF = @as(c_int, 41);
pub const KERN_SEMAPHORE_DESTROYED = @as(c_int, 42);
pub const KERN_RPC_SERVER_TERMINATED = @as(c_int, 43);
pub const KERN_RPC_TERMINATE_ORPHAN = @as(c_int, 44);
pub const KERN_RPC_CONTINUE_ORPHAN = @as(c_int, 45);
pub const KERN_NOT_SUPPORTED = @as(c_int, 46);
pub const KERN_NODE_DOWN = @as(c_int, 47);
pub const KERN_NOT_WAITING = @as(c_int, 48);
pub const KERN_OPERATION_TIMED_OUT = @as(c_int, 49);
pub const KERN_CODESIGN_ERROR = @as(c_int, 50);
pub const KERN_POLICY_STATIC = @as(c_int, 51);
pub const KERN_INSUFFICIENT_BUFFER_SIZE = @as(c_int, 52);
pub const KERN_DENIED = @as(c_int, 53);
pub const KERN_MISSING_KC = @as(c_int, 54);
pub const KERN_INVALID_KC = @as(c_int, 55);
pub const KERN_NOT_FOUND = @as(c_int, 56);
pub const KERN_RETURN_MAX = @as(c_int, 0x100);
pub const MACH_MSG_TIMEOUT_NONE = @import("std").zig.c_translation.cast(mach_msg_timeout_t, @as(c_int, 0));
pub const MACH_MSGH_BITS_ZERO = @as(c_int, 0x00000000);
pub const MACH_MSGH_BITS_REMOTE_MASK = @as(c_int, 0x0000001f);
pub const MACH_MSGH_BITS_LOCAL_MASK = @as(c_int, 0x00001f00);
pub const MACH_MSGH_BITS_VOUCHER_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x001f0000, .hex);
pub const MACH_MSGH_BITS_PORTS_MASK = (MACH_MSGH_BITS_REMOTE_MASK | MACH_MSGH_BITS_LOCAL_MASK) | MACH_MSGH_BITS_VOUCHER_MASK;
pub const MACH_MSGH_BITS_COMPLEX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x80000000, .hex);
pub const MACH_MSGH_BITS_USER = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x801f1f1f, .hex);
pub const MACH_MSGH_BITS_RAISEIMP = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x20000000, .hex);
pub const MACH_MSGH_BITS_DENAP = MACH_MSGH_BITS_RAISEIMP;
pub const MACH_MSGH_BITS_IMPHOLDASRT = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x10000000, .hex);
pub const MACH_MSGH_BITS_DENAPHOLDASRT = MACH_MSGH_BITS_IMPHOLDASRT;
pub const MACH_MSGH_BITS_CIRCULAR = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x10000000, .hex);
pub const MACH_MSGH_BITS_USED = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xb01f1f1f, .hex);
pub inline fn MACH_MSGH_BITS(remote: anytype, local: anytype) @TypeOf(remote | (local << @as(c_int, 8))) {
    _ = &remote;
    _ = &local;
    return remote | (local << @as(c_int, 8));
}
pub inline fn MACH_MSGH_BITS_SET_PORTS(remote: anytype, local: anytype, voucher: anytype) @TypeOf(((remote & MACH_MSGH_BITS_REMOTE_MASK) | ((local << @as(c_int, 8)) & MACH_MSGH_BITS_LOCAL_MASK)) | ((voucher << @as(c_int, 16)) & MACH_MSGH_BITS_VOUCHER_MASK)) {
    _ = &remote;
    _ = &local;
    _ = &voucher;
    return ((remote & MACH_MSGH_BITS_REMOTE_MASK) | ((local << @as(c_int, 8)) & MACH_MSGH_BITS_LOCAL_MASK)) | ((voucher << @as(c_int, 16)) & MACH_MSGH_BITS_VOUCHER_MASK);
}
pub inline fn MACH_MSGH_BITS_SET(remote: anytype, local: anytype, voucher: anytype, other: anytype) @TypeOf(MACH_MSGH_BITS_SET_PORTS(remote, local, voucher) | (other & ~MACH_MSGH_BITS_PORTS_MASK)) {
    _ = &remote;
    _ = &local;
    _ = &voucher;
    _ = &other;
    return MACH_MSGH_BITS_SET_PORTS(remote, local, voucher) | (other & ~MACH_MSGH_BITS_PORTS_MASK);
}
pub inline fn MACH_MSGH_BITS_REMOTE(bits: anytype) @TypeOf(bits & MACH_MSGH_BITS_REMOTE_MASK) {
    _ = &bits;
    return bits & MACH_MSGH_BITS_REMOTE_MASK;
}
pub inline fn MACH_MSGH_BITS_LOCAL(bits: anytype) @TypeOf((bits & MACH_MSGH_BITS_LOCAL_MASK) >> @as(c_int, 8)) {
    _ = &bits;
    return (bits & MACH_MSGH_BITS_LOCAL_MASK) >> @as(c_int, 8);
}
pub inline fn MACH_MSGH_BITS_VOUCHER(bits: anytype) @TypeOf((bits & MACH_MSGH_BITS_VOUCHER_MASK) >> @as(c_int, 16)) {
    _ = &bits;
    return (bits & MACH_MSGH_BITS_VOUCHER_MASK) >> @as(c_int, 16);
}
pub inline fn MACH_MSGH_BITS_PORTS(bits: anytype) @TypeOf(bits & MACH_MSGH_BITS_PORTS_MASK) {
    _ = &bits;
    return bits & MACH_MSGH_BITS_PORTS_MASK;
}
pub inline fn MACH_MSGH_BITS_OTHER(bits: anytype) @TypeOf(bits & ~MACH_MSGH_BITS_PORTS_MASK) {
    _ = &bits;
    return bits & ~MACH_MSGH_BITS_PORTS_MASK;
}
pub inline fn MACH_MSGH_BITS_HAS_REMOTE(bits: anytype) @TypeOf(MACH_MSGH_BITS_REMOTE(bits) != MACH_MSGH_BITS_ZERO) {
    _ = &bits;
    return MACH_MSGH_BITS_REMOTE(bits) != MACH_MSGH_BITS_ZERO;
}
pub inline fn MACH_MSGH_BITS_HAS_LOCAL(bits: anytype) @TypeOf(MACH_MSGH_BITS_LOCAL(bits) != MACH_MSGH_BITS_ZERO) {
    _ = &bits;
    return MACH_MSGH_BITS_LOCAL(bits) != MACH_MSGH_BITS_ZERO;
}
pub inline fn MACH_MSGH_BITS_HAS_VOUCHER(bits: anytype) @TypeOf(MACH_MSGH_BITS_VOUCHER(bits) != MACH_MSGH_BITS_ZERO) {
    _ = &bits;
    return MACH_MSGH_BITS_VOUCHER(bits) != MACH_MSGH_BITS_ZERO;
}
pub inline fn MACH_MSGH_BITS_IS_COMPLEX(bits: anytype) @TypeOf((bits & MACH_MSGH_BITS_COMPLEX) != MACH_MSGH_BITS_ZERO) {
    _ = &bits;
    return (bits & MACH_MSGH_BITS_COMPLEX) != MACH_MSGH_BITS_ZERO;
}
pub inline fn MACH_MSGH_BITS_RAISED_IMPORTANCE(bits: anytype) @TypeOf((bits & MACH_MSGH_BITS_RAISEIMP) != MACH_MSGH_BITS_ZERO) {
    _ = &bits;
    return (bits & MACH_MSGH_BITS_RAISEIMP) != MACH_MSGH_BITS_ZERO;
}
pub inline fn MACH_MSGH_BITS_HOLDS_IMPORTANCE_ASSERTION(bits: anytype) @TypeOf((bits & MACH_MSGH_BITS_IMPHOLDASRT) != MACH_MSGH_BITS_ZERO) {
    _ = &bits;
    return (bits & MACH_MSGH_BITS_IMPHOLDASRT) != MACH_MSGH_BITS_ZERO;
}
pub const MACH_MSG_SIZE_NULL = @import("std").zig.c_translation.cast([*c]mach_msg_size_t, @as(c_int, 0));
pub const MACH_MSG_PRIORITY_UNSPECIFIED = @import("std").zig.c_translation.cast(mach_msg_priority_t, @as(c_int, 0));
pub const MACH_MSG_TYPE_MOVE_RECEIVE = @as(c_int, 16);
pub const MACH_MSG_TYPE_MOVE_SEND = @as(c_int, 17);
pub const MACH_MSG_TYPE_MOVE_SEND_ONCE = @as(c_int, 18);
pub const MACH_MSG_TYPE_COPY_SEND = @as(c_int, 19);
pub const MACH_MSG_TYPE_MAKE_SEND = @as(c_int, 20);
pub const MACH_MSG_TYPE_MAKE_SEND_ONCE = @as(c_int, 21);
pub const MACH_MSG_TYPE_COPY_RECEIVE = @as(c_int, 22);
pub const MACH_MSG_TYPE_DISPOSE_RECEIVE = @as(c_int, 24);
pub const MACH_MSG_TYPE_DISPOSE_SEND = @as(c_int, 25);
pub const MACH_MSG_TYPE_DISPOSE_SEND_ONCE = @as(c_int, 26);
pub const MACH_MSG_PHYSICAL_COPY = @as(c_int, 0);
pub const MACH_MSG_VIRTUAL_COPY = @as(c_int, 1);
pub const MACH_MSG_ALLOCATE = @as(c_int, 2);
pub const MACH_MSG_OVERWRITE = @as(c_int, 3);
pub const MACH_MSG_GUARD_FLAGS_NONE = @as(c_int, 0x0000);
pub const MACH_MSG_GUARD_FLAGS_IMMOVABLE_RECEIVE = @as(c_int, 0x0001);
pub const MACH_MSG_GUARD_FLAGS_UNGUARDED_ON_SEND = @as(c_int, 0x0002);
pub const MACH_MSG_GUARD_FLAGS_MASK = @as(c_int, 0x0003);
pub const MACH_MSG_PORT_DESCRIPTOR = @as(c_int, 0);
pub const MACH_MSG_OOL_DESCRIPTOR = @as(c_int, 1);
pub const MACH_MSG_OOL_PORTS_DESCRIPTOR = @as(c_int, 2);
pub const MACH_MSG_OOL_VOLATILE_DESCRIPTOR = @as(c_int, 3);
pub const MACH_MSG_GUARDED_PORT_DESCRIPTOR = @as(c_int, 4);
pub const MACH_MSG_DESCRIPTOR_MAX = MACH_MSG_GUARDED_PORT_DESCRIPTOR;
pub const __ipc_desc_sign = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:289:9
pub const MACH_MSG_BODY_NULL = @import("std").zig.c_translation.cast([*c]mach_msg_body_t, @as(c_int, 0));
pub const MACH_MSG_DESCRIPTOR_NULL = @import("std").zig.c_translation.cast([*c]mach_msg_descriptor_t, @as(c_int, 0));
pub const msgh_reserved = @compileError("unable to translate macro: undefined identifier `msgh_voucher_port`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:432:9
pub const MACH_MSG_NULL = @import("std").zig.c_translation.cast([*c]mach_msg_header_t, @as(c_int, 0));
pub const MACH_MSG_TRAILER_FORMAT_0 = @as(c_int, 0);
pub const INVALID_AUDIT_TOKEN_VALUE = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:504:9
pub const MACH_MSG_FILTER_POLICY_ALLOW = @import("std").zig.c_translation.cast(mach_msg_filter_id, @as(c_int, 0));
pub const MACH_MSG_TRAILER_MINIMUM_SIZE = @import("std").zig.c_translation.sizeof(mach_msg_trailer_t);
pub const MAX_TRAILER_SIZE = @import("std").zig.c_translation.cast(mach_msg_size_t, @import("std").zig.c_translation.sizeof(mach_msg_max_trailer_t));
pub const MACH_MSG_TRAILER_FORMAT_0_SIZE = @import("std").zig.c_translation.sizeof(mach_msg_format_0_trailer_t);
pub const KERNEL_SECURITY_TOKEN_VALUE = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:580:11
pub const KERNEL_AUDIT_TOKEN_VALUE = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:583:11
pub const MACH_MSG_HEADER_EMPTY = @compileError("unable to translate C expr: unexpected token '}'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:588:9
pub inline fn round_msg(x: anytype) @TypeOf(((@import("std").zig.c_translation.cast(mach_msg_size_t, x) + @import("std").zig.c_translation.sizeof(natural_t)) - @as(c_int, 1)) & ~(@import("std").zig.c_translation.sizeof(natural_t) - @as(c_int, 1))) {
    _ = &x;
    return ((@import("std").zig.c_translation.cast(mach_msg_size_t, x) + @import("std").zig.c_translation.sizeof(natural_t)) - @as(c_int, 1)) & ~(@import("std").zig.c_translation.sizeof(natural_t) - @as(c_int, 1));
}
pub const MACH_MSG_SIZE_MAX = @import("std").zig.c_translation.cast(mach_msg_size_t, ~@as(c_int, 0));
pub const MACH_MSG_SIZE_RELIABLE = @import("std").zig.c_translation.cast(mach_msg_size_t, @as(c_int, 256)) * @as(c_int, 1024);
pub const MACH_MSGH_KIND_NORMAL = @as(c_int, 0x00000000);
pub const MACH_MSGH_KIND_NOTIFICATION = @as(c_int, 0x00000001);
pub const msgh_kind = @compileError("unable to translate macro: undefined identifier `msgh_seqno`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/mach/message.h:633:9
pub const mach_msg_kind_t = mach_port_seqno_t;
pub const MACH_MSG_TYPE_PORT_NONE = @as(c_int, 0);
pub const MACH_MSG_TYPE_PORT_NAME = @as(c_int, 15);
pub const MACH_MSG_TYPE_PORT_RECEIVE = MACH_MSG_TYPE_MOVE_RECEIVE;
pub const MACH_MSG_TYPE_PORT_SEND = MACH_MSG_TYPE_MOVE_SEND;
pub const MACH_MSG_TYPE_PORT_SEND_ONCE = MACH_MSG_TYPE_MOVE_SEND_ONCE;
pub const MACH_MSG_TYPE_LAST = @as(c_int, 22);
pub const MACH_MSG_TYPE_POLYMORPHIC = @import("std").zig.c_translation.cast(mach_msg_type_name_t, -@as(c_int, 1));
pub inline fn MACH_MSG_TYPE_PORT_ANY(x: anytype) @TypeOf((x >= MACH_MSG_TYPE_MOVE_RECEIVE) and (x <= MACH_MSG_TYPE_MAKE_SEND_ONCE)) {
    _ = &x;
    return (x >= MACH_MSG_TYPE_MOVE_RECEIVE) and (x <= MACH_MSG_TYPE_MAKE_SEND_ONCE);
}
pub inline fn MACH_MSG_TYPE_PORT_ANY_SEND(x: anytype) @TypeOf((x >= MACH_MSG_TYPE_MOVE_SEND) and (x <= MACH_MSG_TYPE_MAKE_SEND_ONCE)) {
    _ = &x;
    return (x >= MACH_MSG_TYPE_MOVE_SEND) and (x <= MACH_MSG_TYPE_MAKE_SEND_ONCE);
}
pub inline fn MACH_MSG_TYPE_PORT_ANY_SEND_ONCE(x: anytype) @TypeOf((x == MACH_MSG_TYPE_MOVE_SEND_ONCE) or (x == MACH_MSG_TYPE_MAKE_SEND_ONCE)) {
    _ = &x;
    return (x == MACH_MSG_TYPE_MOVE_SEND_ONCE) or (x == MACH_MSG_TYPE_MAKE_SEND_ONCE);
}
pub inline fn MACH_MSG_TYPE_PORT_ANY_RIGHT(x: anytype) @TypeOf((x >= MACH_MSG_TYPE_MOVE_RECEIVE) and (x <= MACH_MSG_TYPE_MOVE_SEND_ONCE)) {
    _ = &x;
    return (x >= MACH_MSG_TYPE_MOVE_RECEIVE) and (x <= MACH_MSG_TYPE_MOVE_SEND_ONCE);
}
pub const MACH_MSG_OPTION_NONE = @as(c_int, 0x00000000);
pub const MACH_SEND_MSG = @as(c_int, 0x00000001);
pub const MACH_RCV_MSG = @as(c_int, 0x00000002);
pub const MACH_RCV_LARGE = @as(c_int, 0x00000004);
pub const MACH_RCV_LARGE_IDENTITY = @as(c_int, 0x00000008);
pub const MACH_SEND_TIMEOUT = @as(c_int, 0x00000010);
pub const MACH_SEND_OVERRIDE = @as(c_int, 0x00000020);
pub const MACH_SEND_INTERRUPT = @as(c_int, 0x00000040);
pub const MACH_SEND_NOTIFY = @as(c_int, 0x00000080);
pub const MACH_SEND_ALWAYS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const MACH_SEND_FILTER_NONFATAL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const MACH_SEND_TRAILER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const MACH_SEND_NOIMPORTANCE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const MACH_SEND_NODENAP = MACH_SEND_NOIMPORTANCE;
pub const MACH_SEND_IMPORTANCE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const MACH_SEND_SYNC_OVERRIDE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const MACH_SEND_PROPAGATE_QOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const MACH_SEND_SYNC_USE_THRPRI = MACH_SEND_PROPAGATE_QOS;
pub const MACH_SEND_KERNEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const MACH_SEND_SYNC_BOOTSTRAP_CHECKIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const MACH_RCV_TIMEOUT = @as(c_int, 0x00000100);
pub const MACH_RCV_NOTIFY = @as(c_int, 0x00000000);
pub const MACH_RCV_INTERRUPT = @as(c_int, 0x00000400);
pub const MACH_RCV_VOUCHER = @as(c_int, 0x00000800);
pub const MACH_RCV_OVERWRITE = @as(c_int, 0x00000000);
pub const MACH_RCV_GUARDED_DESC = @as(c_int, 0x00001000);
pub const MACH_RCV_SYNC_WAIT = @as(c_int, 0x00004000);
pub const MACH_RCV_SYNC_PEEK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const MACH_MSG_STRICT_REPLY = @as(c_int, 0x00000200);
pub const MACH_RCV_TRAILER_NULL = @as(c_int, 0);
pub const MACH_RCV_TRAILER_SEQNO = @as(c_int, 1);
pub const MACH_RCV_TRAILER_SENDER = @as(c_int, 2);
pub const MACH_RCV_TRAILER_AUDIT = @as(c_int, 3);
pub const MACH_RCV_TRAILER_CTX = @as(c_int, 4);
pub const MACH_RCV_TRAILER_AV = @as(c_int, 7);
pub const MACH_RCV_TRAILER_LABELS = @as(c_int, 8);
pub inline fn MACH_RCV_TRAILER_TYPE(x: anytype) @TypeOf((x & @as(c_int, 0xf)) << @as(c_int, 28)) {
    _ = &x;
    return (x & @as(c_int, 0xf)) << @as(c_int, 28);
}
pub inline fn MACH_RCV_TRAILER_ELEMENTS(x: anytype) @TypeOf((x & @as(c_int, 0xf)) << @as(c_int, 24)) {
    _ = &x;
    return (x & @as(c_int, 0xf)) << @as(c_int, 24);
}
pub const MACH_RCV_TRAILER_MASK = @as(c_int, 0xf) << @as(c_int, 24);
pub inline fn GET_RCV_ELEMENTS(y: anytype) @TypeOf((y >> @as(c_int, 24)) & @as(c_int, 0xf)) {
    _ = &y;
    return (y >> @as(c_int, 24)) & @as(c_int, 0xf);
}
pub inline fn REQUESTED_TRAILER_SIZE_NATIVE(y: anytype) mach_msg_trailer_size_t {
    _ = &y;
    return @import("std").zig.c_translation.cast(mach_msg_trailer_size_t, if (GET_RCV_ELEMENTS(y) == MACH_RCV_TRAILER_NULL) @import("std").zig.c_translation.sizeof(mach_msg_trailer_t) else if (GET_RCV_ELEMENTS(y) == MACH_RCV_TRAILER_SEQNO) @import("std").zig.c_translation.sizeof(mach_msg_seqno_trailer_t) else if (GET_RCV_ELEMENTS(y) == MACH_RCV_TRAILER_SENDER) @import("std").zig.c_translation.sizeof(mach_msg_security_trailer_t) else if (GET_RCV_ELEMENTS(y) == MACH_RCV_TRAILER_AUDIT) @import("std").zig.c_translation.sizeof(mach_msg_audit_trailer_t) else if (GET_RCV_ELEMENTS(y) == MACH_RCV_TRAILER_CTX) @import("std").zig.c_translation.sizeof(mach_msg_context_trailer_t) else if (GET_RCV_ELEMENTS(y) == MACH_RCV_TRAILER_AV) @import("std").zig.c_translation.sizeof(mach_msg_mac_trailer_t) else @import("std").zig.c_translation.sizeof(mach_msg_max_trailer_t));
}
pub inline fn REQUESTED_TRAILER_SIZE(y: anytype) @TypeOf(REQUESTED_TRAILER_SIZE_NATIVE(y)) {
    _ = &y;
    return REQUESTED_TRAILER_SIZE_NATIVE(y);
}
pub const MACH_MSG_SUCCESS = @as(c_int, 0x00000000);
pub const MACH_MSG_MASK = @as(c_int, 0x00003e00);
pub const MACH_MSG_IPC_SPACE = @as(c_int, 0x00002000);
pub const MACH_MSG_VM_SPACE = @as(c_int, 0x00001000);
pub const MACH_MSG_IPC_KERNEL = @as(c_int, 0x00000800);
pub const MACH_MSG_VM_KERNEL = @as(c_int, 0x00000400);
pub const MACH_SEND_IN_PROGRESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000001, .hex);
pub const MACH_SEND_INVALID_DATA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000002, .hex);
pub const MACH_SEND_INVALID_DEST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000003, .hex);
pub const MACH_SEND_TIMED_OUT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000004, .hex);
pub const MACH_SEND_INVALID_VOUCHER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000005, .hex);
pub const MACH_SEND_INTERRUPTED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000007, .hex);
pub const MACH_SEND_MSG_TOO_SMALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000008, .hex);
pub const MACH_SEND_INVALID_REPLY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000009, .hex);
pub const MACH_SEND_INVALID_RIGHT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000000a, .hex);
pub const MACH_SEND_INVALID_NOTIFY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000000b, .hex);
pub const MACH_SEND_INVALID_MEMORY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000000c, .hex);
pub const MACH_SEND_NO_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000000d, .hex);
pub const MACH_SEND_TOO_LARGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000000e, .hex);
pub const MACH_SEND_INVALID_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000000f, .hex);
pub const MACH_SEND_INVALID_HEADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000010, .hex);
pub const MACH_SEND_INVALID_TRAILER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000011, .hex);
pub const MACH_SEND_INVALID_CONTEXT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000012, .hex);
pub const MACH_SEND_INVALID_OPTIONS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000013, .hex);
pub const MACH_SEND_INVALID_RT_OOL_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000015, .hex);
pub const MACH_SEND_NO_GRANT_DEST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000016, .hex);
pub const MACH_SEND_MSG_FILTERED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000017, .hex);
pub const MACH_SEND_AUX_TOO_SMALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000018, .hex);
pub const MACH_SEND_AUX_TOO_LARGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000019, .hex);
pub const MACH_RCV_IN_PROGRESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004001, .hex);
pub const MACH_RCV_INVALID_NAME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004002, .hex);
pub const MACH_RCV_TIMED_OUT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004003, .hex);
pub const MACH_RCV_TOO_LARGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004004, .hex);
pub const MACH_RCV_INTERRUPTED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004005, .hex);
pub const MACH_RCV_PORT_CHANGED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004006, .hex);
pub const MACH_RCV_INVALID_NOTIFY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004007, .hex);
pub const MACH_RCV_INVALID_DATA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004008, .hex);
pub const MACH_RCV_PORT_DIED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004009, .hex);
pub const MACH_RCV_IN_SET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000400a, .hex);
pub const MACH_RCV_HEADER_ERROR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000400b, .hex);
pub const MACH_RCV_BODY_ERROR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000400c, .hex);
pub const MACH_RCV_INVALID_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000400d, .hex);
pub const MACH_RCV_SCATTER_SMALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000400e, .hex);
pub const MACH_RCV_INVALID_TRAILER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000400f, .hex);
pub const MACH_RCV_IN_PROGRESS_TIMED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004011, .hex);
pub const MACH_RCV_INVALID_REPLY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004012, .hex);
pub const MACH_RCV_INVALID_ARGUMENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10004013, .hex);
pub const _SYS_PROC_INFO_H = "";
pub const _SYS_SOCKET_H_ = "";
pub const __CONSTRAINED_CTYPES__ = "";
pub const __CCT_DECLARE_CONSTRAINED_PTR_TYPE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/constrained_ctypes.h:596:9
pub const __CCT_DECLARE_CONSTRAINED_PTR_TYPES = @compileError("unable to translate C expr: unexpected token ''");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/constrained_ctypes.h:616:9
pub const _BSD_MACHINE__PARAM_H_ = "";
pub const _NET_NETKEV_H_ = "";
pub const KEV_INET_SUBCLASS = @as(c_int, 1);
pub const KEV_INET_NEW_ADDR = @as(c_int, 1);
pub const KEV_INET_CHANGED_ADDR = @as(c_int, 2);
pub const KEV_INET_ADDR_DELETED = @as(c_int, 3);
pub const KEV_INET_SIFDSTADDR = @as(c_int, 4);
pub const KEV_INET_SIFBRDADDR = @as(c_int, 5);
pub const KEV_INET_SIFNETMASK = @as(c_int, 6);
pub const KEV_INET_ARPCOLLISION = @as(c_int, 7);
pub const KEV_INET_PORTINUSE = @as(c_int, 8);
pub const KEV_INET_ARPRTRFAILURE = @as(c_int, 9);
pub const KEV_INET_ARPRTRALIVE = @as(c_int, 10);
pub const KEV_DL_SUBCLASS = @as(c_int, 2);
pub const KEV_DL_SIFFLAGS = @as(c_int, 1);
pub const KEV_DL_SIFMETRICS = @as(c_int, 2);
pub const KEV_DL_SIFMTU = @as(c_int, 3);
pub const KEV_DL_SIFPHYS = @as(c_int, 4);
pub const KEV_DL_SIFMEDIA = @as(c_int, 5);
pub const KEV_DL_SIFGENERIC = @as(c_int, 6);
pub const KEV_DL_ADDMULTI = @as(c_int, 7);
pub const KEV_DL_DELMULTI = @as(c_int, 8);
pub const KEV_DL_IF_ATTACHED = @as(c_int, 9);
pub const KEV_DL_IF_DETACHING = @as(c_int, 10);
pub const KEV_DL_IF_DETACHED = @as(c_int, 11);
pub const KEV_DL_LINK_OFF = @as(c_int, 12);
pub const KEV_DL_LINK_ON = @as(c_int, 13);
pub const KEV_DL_PROTO_ATTACHED = @as(c_int, 14);
pub const KEV_DL_PROTO_DETACHED = @as(c_int, 15);
pub const KEV_DL_LINK_ADDRESS_CHANGED = @as(c_int, 16);
pub const KEV_DL_WAKEFLAGS_CHANGED = @as(c_int, 17);
pub const KEV_DL_IF_IDLE_ROUTE_REFCNT = @as(c_int, 18);
pub const KEV_DL_IFCAP_CHANGED = @as(c_int, 19);
pub const KEV_DL_LINK_QUALITY_METRIC_CHANGED = @as(c_int, 20);
pub const KEV_DL_NODE_PRESENCE = @as(c_int, 21);
pub const KEV_DL_NODE_ABSENCE = @as(c_int, 22);
pub const KEV_DL_PRIMARY_ELECTED = @as(c_int, 23);
pub const KEV_DL_ISSUES = @as(c_int, 24);
pub const KEV_DL_IFDELEGATE_CHANGED = @as(c_int, 25);
pub const KEV_DL_AWDL_RESTRICTED = @as(c_int, 26);
pub const KEV_DL_AWDL_UNRESTRICTED = @as(c_int, 27);
pub const KEV_DL_RRC_STATE_CHANGED = @as(c_int, 28);
pub const KEV_DL_QOS_MODE_CHANGED = @as(c_int, 29);
pub const KEV_DL_LOW_POWER_MODE_CHANGED = @as(c_int, 30);
pub const KEV_DL_MASTER_ELECTED = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/net_kev.h:86:9
pub const KEV_INET6_SUBCLASS = @as(c_int, 6);
pub const KEV_INET6_NEW_USER_ADDR = @as(c_int, 1);
pub const KEV_INET6_CHANGED_ADDR = @as(c_int, 2);
pub const KEV_INET6_ADDR_DELETED = @as(c_int, 3);
pub const KEV_INET6_NEW_LL_ADDR = @as(c_int, 4);
pub const KEV_INET6_NEW_RTADV_ADDR = @as(c_int, 5);
pub const KEV_INET6_DEFROUTER = @as(c_int, 6);
pub const KEV_INET6_REQUEST_NAT64_PREFIX = @as(c_int, 7);
pub const _SA_FAMILY_T = "";
pub const _SOCKLEN_T = "";
pub const _STRUCT_IOVEC = "";
pub const SOCK_STREAM = @as(c_int, 1);
pub const SOCK_DGRAM = @as(c_int, 2);
pub const SOCK_RAW = @as(c_int, 3);
pub const SOCK_RDM = @as(c_int, 4);
pub const SOCK_SEQPACKET = @as(c_int, 5);
pub const SO_DEBUG = @as(c_int, 0x0001);
pub const SO_ACCEPTCONN = @as(c_int, 0x0002);
pub const SO_REUSEADDR = @as(c_int, 0x0004);
pub const SO_KEEPALIVE = @as(c_int, 0x0008);
pub const SO_DONTROUTE = @as(c_int, 0x0010);
pub const SO_BROADCAST = @as(c_int, 0x0020);
pub const SO_USELOOPBACK = @as(c_int, 0x0040);
pub const SO_LINGER = @as(c_int, 0x0080);
pub const SO_LINGER_SEC = @as(c_int, 0x1080);
pub const SO_OOBINLINE = @as(c_int, 0x0100);
pub const SO_REUSEPORT = @as(c_int, 0x0200);
pub const SO_TIMESTAMP = @as(c_int, 0x0400);
pub const SO_TIMESTAMP_MONOTONIC = @as(c_int, 0x0800);
pub const SO_DONTTRUNC = @as(c_int, 0x2000);
pub const SO_WANTMORE = @as(c_int, 0x4000);
pub const SO_WANTOOBFLAG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const SO_SNDBUF = @as(c_int, 0x1001);
pub const SO_RCVBUF = @as(c_int, 0x1002);
pub const SO_SNDLOWAT = @as(c_int, 0x1003);
pub const SO_RCVLOWAT = @as(c_int, 0x1004);
pub const SO_SNDTIMEO = @as(c_int, 0x1005);
pub const SO_RCVTIMEO = @as(c_int, 0x1006);
pub const SO_ERROR = @as(c_int, 0x1007);
pub const SO_TYPE = @as(c_int, 0x1008);
pub const SO_LABEL = @as(c_int, 0x1010);
pub const SO_PEERLABEL = @as(c_int, 0x1011);
pub const SO_NREAD = @as(c_int, 0x1020);
pub const SO_NKE = @as(c_int, 0x1021);
pub const SO_NOSIGPIPE = @as(c_int, 0x1022);
pub const SO_NOADDRERR = @as(c_int, 0x1023);
pub const SO_NWRITE = @as(c_int, 0x1024);
pub const SO_REUSESHAREUID = @as(c_int, 0x1025);
pub const SO_NOTIFYCONFLICT = @as(c_int, 0x1026);
pub const SO_UPCALLCLOSEWAIT = @as(c_int, 0x1027);
pub const SO_RANDOMPORT = @as(c_int, 0x1082);
pub const SO_NP_EXTENSIONS = @as(c_int, 0x1083);
pub const SO_NUMRCVPKT = @as(c_int, 0x1112);
pub const SO_NET_SERVICE_TYPE = @as(c_int, 0x1116);
pub const SO_NETSVC_MARKING_LEVEL = @as(c_int, 0x1119);
pub const SO_RESOLVER_SIGNATURE = @as(c_int, 0x1131);
pub const SO_BINDTODEVICE = @as(c_int, 0x1134);
pub const NET_SERVICE_TYPE_BE = @as(c_int, 0);
pub const NET_SERVICE_TYPE_BK = @as(c_int, 1);
pub const NET_SERVICE_TYPE_SIG = @as(c_int, 2);
pub const NET_SERVICE_TYPE_VI = @as(c_int, 3);
pub const NET_SERVICE_TYPE_VO = @as(c_int, 4);
pub const NET_SERVICE_TYPE_RV = @as(c_int, 5);
pub const NET_SERVICE_TYPE_AV = @as(c_int, 6);
pub const NET_SERVICE_TYPE_OAM = @as(c_int, 7);
pub const NET_SERVICE_TYPE_RD = @as(c_int, 8);
pub const NETSVC_MRKNG_UNKNOWN = @as(c_int, 0);
pub const NETSVC_MRKNG_LVL_L2 = @as(c_int, 1);
pub const NETSVC_MRKNG_LVL_L3L2_ALL = @as(c_int, 2);
pub const NETSVC_MRKNG_LVL_L3L2_BK = @as(c_int, 3);
pub const SAE_ASSOCID_ANY = @as(c_int, 0);
pub const SAE_ASSOCID_ALL = @import("std").zig.c_translation.cast(sae_associd_t, -@as(c_ulonglong, 1));
pub const SAE_CONNID_ANY = @as(c_int, 0);
pub const SAE_CONNID_ALL = @import("std").zig.c_translation.cast(sae_connid_t, -@as(c_ulonglong, 1));
pub const CONNECT_RESUME_ON_READ_WRITE = @as(c_int, 0x1);
pub const CONNECT_DATA_IDEMPOTENT = @as(c_int, 0x2);
pub const CONNECT_DATA_AUTHENTICATED = @as(c_int, 0x4);
pub const SONPX_SETOPTSHUT = @as(c_int, 0x000000001);
pub const SOL_SOCKET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex);
pub const AF_UNSPEC = @as(c_int, 0);
pub const AF_UNIX = @as(c_int, 1);
pub const AF_LOCAL = AF_UNIX;
pub const AF_INET = @as(c_int, 2);
pub const AF_IMPLINK = @as(c_int, 3);
pub const AF_PUP = @as(c_int, 4);
pub const AF_CHAOS = @as(c_int, 5);
pub const AF_NS = @as(c_int, 6);
pub const AF_ISO = @as(c_int, 7);
pub const AF_OSI = AF_ISO;
pub const AF_ECMA = @as(c_int, 8);
pub const AF_DATAKIT = @as(c_int, 9);
pub const AF_CCITT = @as(c_int, 10);
pub const AF_SNA = @as(c_int, 11);
pub const AF_DECnet = @as(c_int, 12);
pub const AF_DLI = @as(c_int, 13);
pub const AF_LAT = @as(c_int, 14);
pub const AF_HYLINK = @as(c_int, 15);
pub const AF_APPLETALK = @as(c_int, 16);
pub const AF_ROUTE = @as(c_int, 17);
pub const AF_LINK = @as(c_int, 18);
pub const pseudo_AF_XTP = @as(c_int, 19);
pub const AF_COIP = @as(c_int, 20);
pub const AF_CNT = @as(c_int, 21);
pub const pseudo_AF_RTIP = @as(c_int, 22);
pub const AF_IPX = @as(c_int, 23);
pub const AF_SIP = @as(c_int, 24);
pub const pseudo_AF_PIP = @as(c_int, 25);
pub const AF_NDRV = @as(c_int, 27);
pub const AF_ISDN = @as(c_int, 28);
pub const AF_E164 = AF_ISDN;
pub const pseudo_AF_KEY = @as(c_int, 29);
pub const AF_INET6 = @as(c_int, 30);
pub const AF_NATM = @as(c_int, 31);
pub const AF_SYSTEM = @as(c_int, 32);
pub const AF_NETBIOS = @as(c_int, 33);
pub const AF_PPP = @as(c_int, 34);
pub const pseudo_AF_HDRCMPLT = @as(c_int, 35);
pub const AF_RESERVED_36 = @as(c_int, 36);
pub const AF_IEEE80211 = @as(c_int, 37);
pub const AF_UTUN = @as(c_int, 38);
pub const AF_VSOCK = @as(c_int, 40);
pub const AF_MAX = @as(c_int, 41);
pub const SOCK_MAXADDRLEN = @as(c_int, 255);
pub const _SS_MAXSIZE = @as(c_int, 128);
pub const _SS_ALIGNSIZE = @import("std").zig.c_translation.sizeof(__int64_t);
pub const _SS_PAD1SIZE = (_SS_ALIGNSIZE - @import("std").zig.c_translation.sizeof(__uint8_t)) - @import("std").zig.c_translation.sizeof(sa_family_t);
pub const _SS_PAD2SIZE = (((_SS_MAXSIZE - @import("std").zig.c_translation.sizeof(__uint8_t)) - @import("std").zig.c_translation.sizeof(sa_family_t)) - _SS_PAD1SIZE) - _SS_ALIGNSIZE;
pub const PF_UNSPEC = AF_UNSPEC;
pub const PF_LOCAL = AF_LOCAL;
pub const PF_UNIX = PF_LOCAL;
pub const PF_INET = AF_INET;
pub const PF_IMPLINK = AF_IMPLINK;
pub const PF_PUP = AF_PUP;
pub const PF_CHAOS = AF_CHAOS;
pub const PF_NS = AF_NS;
pub const PF_ISO = AF_ISO;
pub const PF_OSI = AF_ISO;
pub const PF_ECMA = AF_ECMA;
pub const PF_DATAKIT = AF_DATAKIT;
pub const PF_CCITT = AF_CCITT;
pub const PF_SNA = AF_SNA;
pub const PF_DECnet = AF_DECnet;
pub const PF_DLI = AF_DLI;
pub const PF_LAT = AF_LAT;
pub const PF_HYLINK = AF_HYLINK;
pub const PF_APPLETALK = AF_APPLETALK;
pub const PF_ROUTE = AF_ROUTE;
pub const PF_LINK = AF_LINK;
pub const PF_XTP = pseudo_AF_XTP;
pub const PF_COIP = AF_COIP;
pub const PF_CNT = AF_CNT;
pub const PF_SIP = AF_SIP;
pub const PF_IPX = AF_IPX;
pub const PF_RTIP = pseudo_AF_RTIP;
pub const PF_PIP = pseudo_AF_PIP;
pub const PF_NDRV = AF_NDRV;
pub const PF_ISDN = AF_ISDN;
pub const PF_KEY = pseudo_AF_KEY;
pub const PF_INET6 = AF_INET6;
pub const PF_NATM = AF_NATM;
pub const PF_SYSTEM = AF_SYSTEM;
pub const PF_NETBIOS = AF_NETBIOS;
pub const PF_PPP = AF_PPP;
pub const PF_RESERVED_36 = AF_RESERVED_36;
pub const PF_UTUN = AF_UTUN;
pub const PF_VSOCK = AF_VSOCK;
pub const PF_MAX = AF_MAX;
pub const PF_VLAN = @import("std").zig.c_translation.cast(u32, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x766c616e, .hex));
pub const PF_BOND = @import("std").zig.c_translation.cast(u32, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x626f6e64, .hex));
pub const NET_MAXID = AF_MAX;
pub const NET_RT_DUMP = @as(c_int, 1);
pub const NET_RT_FLAGS = @as(c_int, 2);
pub const NET_RT_IFLIST = @as(c_int, 3);
pub const NET_RT_STAT = @as(c_int, 4);
pub const NET_RT_TRASH = @as(c_int, 5);
pub const NET_RT_IFLIST2 = @as(c_int, 6);
pub const NET_RT_DUMP2 = @as(c_int, 7);
pub const NET_RT_FLAGS_PRIV = @as(c_int, 10);
pub const NET_RT_MAXID = @as(c_int, 11);
pub const SOMAXCONN = @as(c_int, 128);
pub const MSG_OOB = @as(c_int, 0x1);
pub const MSG_PEEK = @as(c_int, 0x2);
pub const MSG_DONTROUTE = @as(c_int, 0x4);
pub const MSG_EOR = @as(c_int, 0x8);
pub const MSG_TRUNC = @as(c_int, 0x10);
pub const MSG_CTRUNC = @as(c_int, 0x20);
pub const MSG_WAITALL = @as(c_int, 0x40);
pub const MSG_DONTWAIT = @as(c_int, 0x80);
pub const MSG_EOF = @as(c_int, 0x100);
pub const MSG_WAITSTREAM = @as(c_int, 0x200);
pub const MSG_FLUSH = @as(c_int, 0x400);
pub const MSG_HOLD = @as(c_int, 0x800);
pub const MSG_SEND = @as(c_int, 0x1000);
pub const MSG_HAVEMORE = @as(c_int, 0x2000);
pub const MSG_RCVMORE = @as(c_int, 0x4000);
pub const MSG_NEEDSA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000, .hex);
pub const MSG_NOSIGNAL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000, .hex);
pub inline fn CMSG_DATA(cmsg: anytype) @TypeOf(@import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) {
    _ = &cmsg;
    return @import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr));
}
pub inline fn CMSG_FIRSTHDR(mhdr: anytype) @TypeOf(if (mhdr.*.msg_controllen >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_long, 0))) {
    _ = &mhdr;
    return if (mhdr.*.msg_controllen >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_long, 0));
}
pub inline fn CMSG_NXTHDR(mhdr: anytype, cmsg: anytype) @TypeOf(if (@import("std").zig.c_translation.cast([*c]u8, cmsg) == @import("std").zig.c_translation.cast([*c]u8, @as(c_long, 0))) CMSG_FIRSTHDR(mhdr) else if (((@import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.cast(__uint32_t, cmsg.*.cmsg_len))) + __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) > (@import("std").zig.c_translation.cast([*c]u8, mhdr.*.msg_control) + mhdr.*.msg_controllen)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_long, 0)) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.cast(__uint32_t, cmsg.*.cmsg_len))))) {
    _ = &mhdr;
    _ = &cmsg;
    return if (@import("std").zig.c_translation.cast([*c]u8, cmsg) == @import("std").zig.c_translation.cast([*c]u8, @as(c_long, 0))) CMSG_FIRSTHDR(mhdr) else if (((@import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.cast(__uint32_t, cmsg.*.cmsg_len))) + __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) > (@import("std").zig.c_translation.cast([*c]u8, mhdr.*.msg_control) + mhdr.*.msg_controllen)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_long, 0)) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @import("std").zig.c_translation.cast(?*anyopaque, @import("std").zig.c_translation.cast([*c]u8, cmsg) + __DARWIN_ALIGN32(@import("std").zig.c_translation.cast(__uint32_t, cmsg.*.cmsg_len))));
}
pub inline fn CMSG_SPACE(l: anytype) @TypeOf(__DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + __DARWIN_ALIGN32(l)) {
    _ = &l;
    return __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + __DARWIN_ALIGN32(l);
}
pub inline fn CMSG_LEN(l: anytype) @TypeOf(__DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + l) {
    _ = &l;
    return __DARWIN_ALIGN32(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + l;
}
pub const SCM_RIGHTS = @as(c_int, 0x01);
pub const SCM_TIMESTAMP = @as(c_int, 0x02);
pub const SCM_CREDS = @as(c_int, 0x03);
pub const SCM_TIMESTAMP_MONOTONIC = @as(c_int, 0x04);
pub const SHUT_RD = @as(c_int, 0);
pub const SHUT_WR = @as(c_int, 1);
pub const SHUT_RDWR = @as(c_int, 2);
pub const _SYS_UN_H_ = "";
pub const SOL_LOCAL = @as(c_int, 0);
pub const LOCAL_PEERCRED = @as(c_int, 0x001);
pub const LOCAL_PEERPID = @as(c_int, 0x002);
pub const LOCAL_PEEREPID = @as(c_int, 0x003);
pub const LOCAL_PEERUUID = @as(c_int, 0x004);
pub const LOCAL_PEEREUUID = @as(c_int, 0x005);
pub const LOCAL_PEERTOKEN = @as(c_int, 0x006);
pub const SUN_LEN = @compileError("unable to translate macro: undefined identifier `strlen`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/un.h:101:9
pub const KPI_KERN_CONTROL_H = "";
pub const KEV_CTL_SUBCLASS = @as(c_int, 2);
pub const KEV_CTL_REGISTERED = @as(c_int, 1);
pub const KEV_CTL_DEREGISTERED = @as(c_int, 2);
pub const CTLIOCGCOUNT = @compileError("unable to translate macro: undefined identifier `_IOR`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/kern_control.h:90:9
pub const CTLIOCGINFO = @compileError("unable to translate macro: undefined identifier `_IOWR`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/sys/kern_control.h:97:9
pub const MAX_KCTL_NAME = @as(c_int, 96);
pub const _NET_IF_H_ = "";
pub const IF_NAMESIZE = @as(c_int, 16);
pub const _NET_IF_VAR_H_ = "";
pub const APPLE_IF_FAM_LOOPBACK = @as(c_int, 1);
pub const APPLE_IF_FAM_ETHERNET = @as(c_int, 2);
pub const APPLE_IF_FAM_SLIP = @as(c_int, 3);
pub const APPLE_IF_FAM_TUN = @as(c_int, 4);
pub const APPLE_IF_FAM_VLAN = @as(c_int, 5);
pub const APPLE_IF_FAM_PPP = @as(c_int, 6);
pub const APPLE_IF_FAM_PVC = @as(c_int, 7);
pub const APPLE_IF_FAM_DISC = @as(c_int, 8);
pub const APPLE_IF_FAM_MDECAP = @as(c_int, 9);
pub const APPLE_IF_FAM_GIF = @as(c_int, 10);
pub const APPLE_IF_FAM_FAITH = @as(c_int, 11);
pub const APPLE_IF_FAM_STF = @as(c_int, 12);
pub const APPLE_IF_FAM_FIREWIRE = @as(c_int, 13);
pub const APPLE_IF_FAM_BOND = @as(c_int, 14);
pub const APPLE_IF_FAM_CELLULAR = @as(c_int, 15);
pub const APPLE_IF_FAM_UNUSED_16 = @as(c_int, 16);
pub const APPLE_IF_FAM_UTUN = @as(c_int, 17);
pub const APPLE_IF_FAM_IPSEC = @as(c_int, 18);
pub const IF_MINMTU = @as(c_int, 72);
pub const IF_MAXMTU = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const IFNAMSIZ = @as(c_int, 16);
pub const _STRUCT_TIMEVAL32 = struct_timeval32;
pub const IF_DATA_TIMEVAL = timeval32;
pub const IFF_UP = @as(c_int, 0x1);
pub const IFF_BROADCAST = @as(c_int, 0x2);
pub const IFF_DEBUG = @as(c_int, 0x4);
pub const IFF_LOOPBACK = @as(c_int, 0x8);
pub const IFF_POINTOPOINT = @as(c_int, 0x10);
pub const IFF_NOTRAILERS = @as(c_int, 0x20);
pub const IFF_RUNNING = @as(c_int, 0x40);
pub const IFF_NOARP = @as(c_int, 0x80);
pub const IFF_PROMISC = @as(c_int, 0x100);
pub const IFF_ALLMULTI = @as(c_int, 0x200);
pub const IFF_OACTIVE = @as(c_int, 0x400);
pub const IFF_SIMPLEX = @as(c_int, 0x800);
pub const IFF_LINK0 = @as(c_int, 0x1000);
pub const IFF_LINK1 = @as(c_int, 0x2000);
pub const IFF_LINK2 = @as(c_int, 0x4000);
pub const IFF_ALTPHYS = IFF_LINK2;
pub const IFF_MULTICAST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const IFCAP_RXCSUM = @as(c_int, 0x00001);
pub const IFCAP_TXCSUM = @as(c_int, 0x00002);
pub const IFCAP_VLAN_MTU = @as(c_int, 0x00004);
pub const IFCAP_VLAN_HWTAGGING = @as(c_int, 0x00008);
pub const IFCAP_JUMBO_MTU = @as(c_int, 0x00010);
pub const IFCAP_TSO4 = @as(c_int, 0x00020);
pub const IFCAP_TSO6 = @as(c_int, 0x00040);
pub const IFCAP_LRO = @as(c_int, 0x00080);
pub const IFCAP_AV = @as(c_int, 0x00100);
pub const IFCAP_TXSTATUS = @as(c_int, 0x00200);
pub const IFCAP_SKYWALK = @as(c_int, 0x00400);
pub const IFCAP_HW_TIMESTAMP = @as(c_int, 0x00800);
pub const IFCAP_SW_TIMESTAMP = @as(c_int, 0x01000);
pub const IFCAP_CSUM_PARTIAL = @as(c_int, 0x02000);
pub const IFCAP_CSUM_ZERO_INVERT = @as(c_int, 0x04000);
pub const IFCAP_LRO_NUM_SEG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000, .hex);
pub const IFCAP_HWCSUM = IFCAP_RXCSUM | IFCAP_TXCSUM;
pub const IFCAP_TSO = IFCAP_TSO4 | IFCAP_TSO6;
pub const IFCAP_VALID = ((((((((((((IFCAP_HWCSUM | IFCAP_TSO) | IFCAP_LRO) | IFCAP_VLAN_MTU) | IFCAP_VLAN_HWTAGGING) | IFCAP_JUMBO_MTU) | IFCAP_AV) | IFCAP_TXSTATUS) | IFCAP_SKYWALK) | IFCAP_SW_TIMESTAMP) | IFCAP_HW_TIMESTAMP) | IFCAP_CSUM_PARTIAL) | IFCAP_CSUM_ZERO_INVERT) | IFCAP_LRO_NUM_SEG;
pub const IFQ_MAXLEN = @as(c_int, 128);
pub const IFNET_SLOWHZ = @as(c_int, 1);
pub const IFQ_DEF_C_TARGET_DELAY = (@as(c_ulonglong, 10) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IFQ_DEF_C_UPDATE_INTERVAL = (@as(c_ulonglong, 100) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IFQ_DEF_L4S_TARGET_DELAY = (@as(c_ulonglong, 2) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IFQ_DEF_L4S_WIRELESS_TARGET_DELAY = (@as(c_ulonglong, 15) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IFQ_DEF_L4S_UPDATE_INTERVAL = (@as(c_ulonglong, 100) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IFQ_LL_C_TARGET_DELAY = (@as(c_ulonglong, 10) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IFQ_LL_C_UPDATE_INTERVAL = (@as(c_ulonglong, 100) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IFQ_LL_L4S_TARGET_DELAY = (@as(c_ulonglong, 2) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IFQ_LL_L4S_WIRELESS_TARGET_DELAY = (@as(c_ulonglong, 15) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IFQ_LL_L4S_UPDATE_INTERVAL = (@as(c_ulonglong, 100) * @as(c_int, 1000)) * @as(c_int, 1000);
pub const IF_WAKE_ON_MAGIC_PACKET = @as(c_int, 0x01);
pub const IFRTYPE_FUNCTIONAL_UNKNOWN = @as(c_int, 0);
pub const IFRTYPE_FUNCTIONAL_LOOPBACK = @as(c_int, 1);
pub const IFRTYPE_FUNCTIONAL_WIRED = @as(c_int, 2);
pub const IFRTYPE_FUNCTIONAL_WIFI_INFRA = @as(c_int, 3);
pub const IFRTYPE_FUNCTIONAL_WIFI_AWDL = @as(c_int, 4);
pub const IFRTYPE_FUNCTIONAL_CELLULAR = @as(c_int, 5);
pub const IFRTYPE_FUNCTIONAL_INTCOPROC = @as(c_int, 6);
pub const IFRTYPE_FUNCTIONAL_COMPANIONLINK = @as(c_int, 7);
pub const IFRTYPE_FUNCTIONAL_MANAGEMENT = @as(c_int, 8);
pub const IFRTYPE_FUNCTIONAL_LAST = @as(c_int, 8);
pub const ifr_addr = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:336:9
pub const ifr_dstaddr = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:337:9
pub const ifr_broadaddr = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:338:9
pub const ifr_flags = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:340:9
pub const ifr_metric = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:345:9
pub const ifr_mtu = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:346:9
pub const ifr_phys = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:347:9
pub const ifr_media = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:348:9
pub const ifr_data = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:349:9
pub const ifr_devmtu = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:350:9
pub const ifr_intval = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:351:9
pub const ifr_kpi = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:352:9
pub const ifr_wake_flags = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:353:9
pub const ifr_route_refcnt = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:354:9
pub const ifr_reqcap = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:355:9
pub const ifr_curcap = @compileError("unable to translate macro: undefined identifier `ifr_ifru`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:356:9
pub inline fn _SIZEOF_ADDR_IFREQ(ifr: anytype) @TypeOf(if (ifr.ifr_addr.sa_len > @import("std").zig.c_translation.sizeof(struct_sockaddr)) (@import("std").zig.c_translation.sizeof(struct_ifreq) - @import("std").zig.c_translation.sizeof(struct_sockaddr)) + ifr.ifr_addr.sa_len else @import("std").zig.c_translation.sizeof(struct_ifreq)) {
    _ = &ifr;
    return if (ifr.ifr_addr.sa_len > @import("std").zig.c_translation.sizeof(struct_sockaddr)) (@import("std").zig.c_translation.sizeof(struct_ifreq) - @import("std").zig.c_translation.sizeof(struct_sockaddr)) + ifr.ifr_addr.sa_len else @import("std").zig.c_translation.sizeof(struct_ifreq);
}
pub const IFSTATMAX = @as(c_int, 800);
pub const ifc_buf = @compileError("unable to translate macro: undefined identifier `ifc_ifcu`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:436:9
pub const ifc_req = @compileError("unable to translate macro: undefined identifier `ifc_ifcu`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/net/if.h:437:9
pub const _NET_ROUTE_H_ = "";
pub const RTM_RTTUNIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal);
pub const RTF_UP = @as(c_int, 0x1);
pub const RTF_GATEWAY = @as(c_int, 0x2);
pub const RTF_HOST = @as(c_int, 0x4);
pub const RTF_REJECT = @as(c_int, 0x8);
pub const RTF_DYNAMIC = @as(c_int, 0x10);
pub const RTF_MODIFIED = @as(c_int, 0x20);
pub const RTF_DONE = @as(c_int, 0x40);
pub const RTF_DELCLONE = @as(c_int, 0x80);
pub const RTF_CLONING = @as(c_int, 0x100);
pub const RTF_XRESOLVE = @as(c_int, 0x200);
pub const RTF_LLINFO = @as(c_int, 0x400);
pub const RTF_STATIC = @as(c_int, 0x800);
pub const RTF_BLACKHOLE = @as(c_int, 0x1000);
pub const RTF_NOIFREF = @as(c_int, 0x2000);
pub const RTF_PROTO2 = @as(c_int, 0x4000);
pub const RTF_PROTO1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const RTF_PRCLONING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000, .hex);
pub const RTF_WASCLONED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000, .hex);
pub const RTF_PROTO3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000, .hex);
pub const RTF_PINNED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x100000, .hex);
pub const RTF_LOCAL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x200000, .hex);
pub const RTF_BROADCAST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x400000, .hex);
pub const RTF_MULTICAST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x800000, .hex);
pub const RTF_IFSCOPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1000000, .hex);
pub const RTF_CONDEMNED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x2000000, .hex);
pub const RTF_IFREF = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x4000000, .hex);
pub const RTF_PROXY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000000, .hex);
pub const RTF_ROUTER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const RTF_DEAD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const RTF_GLOBAL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const RTPRF_OURS = RTF_PROTO3;
pub inline fn IS_DIRECT_HOSTROUTE(rt: anytype) @TypeOf((rt.*.rt_flags & (RTF_HOST | RTF_GATEWAY)) == RTF_HOST) {
    _ = &rt;
    return (rt.*.rt_flags & (RTF_HOST | RTF_GATEWAY)) == RTF_HOST;
}
pub inline fn IS_DYNAMIC_DIRECT_HOSTROUTE(rt: anytype) @TypeOf((rt.*.rt_flags & (((((RTF_CLONING | RTF_PRCLONING) | RTF_HOST) | RTF_LLINFO) | RTF_WASCLONED) | RTF_GATEWAY)) == ((RTF_HOST | RTF_LLINFO) | RTF_WASCLONED)) {
    _ = &rt;
    return (rt.*.rt_flags & (((((RTF_CLONING | RTF_PRCLONING) | RTF_HOST) | RTF_LLINFO) | RTF_WASCLONED) | RTF_GATEWAY)) == ((RTF_HOST | RTF_LLINFO) | RTF_WASCLONED);
}
pub inline fn IS_LOCALNET_ROUTE(rt: anytype) @TypeOf(!((rt.*.rt_flags & RTF_LOCAL) != 0) and (((rt.*.rt_flags & (RTF_HOST | RTF_GATEWAY)) == RTF_HOST) or ((rt.*.rt_flags & (RTF_MULTICAST | RTF_BROADCAST)) != 0))) {
    _ = &rt;
    return !((rt.*.rt_flags & RTF_LOCAL) != 0) and (((rt.*.rt_flags & (RTF_HOST | RTF_GATEWAY)) == RTF_HOST) or ((rt.*.rt_flags & (RTF_MULTICAST | RTF_BROADCAST)) != 0));
}
pub const RTM_VERSION = @as(c_int, 5);
pub const RTM_ADD = @as(c_int, 0x1);
pub const RTM_DELETE = @as(c_int, 0x2);
pub const RTM_CHANGE = @as(c_int, 0x3);
pub const RTM_GET = @as(c_int, 0x4);
pub const RTM_LOSING = @as(c_int, 0x5);
pub const RTM_REDIRECT = @as(c_int, 0x6);
pub const RTM_MISS = @as(c_int, 0x7);
pub const RTM_LOCK = @as(c_int, 0x8);
pub const RTM_OLDADD = @as(c_int, 0x9);
pub const RTM_OLDDEL = @as(c_int, 0xa);
pub const RTM_RESOLVE = @as(c_int, 0xb);
pub const RTM_NEWADDR = @as(c_int, 0xc);
pub const RTM_DELADDR = @as(c_int, 0xd);
pub const RTM_IFINFO = @as(c_int, 0xe);
pub const RTM_NEWMADDR = @as(c_int, 0xf);
pub const RTM_DELMADDR = @as(c_int, 0x10);
pub const RTM_IFINFO2 = @as(c_int, 0x12);
pub const RTM_NEWMADDR2 = @as(c_int, 0x13);
pub const RTM_GET2 = @as(c_int, 0x14);
pub const RTV_MTU = @as(c_int, 0x1);
pub const RTV_HOPCOUNT = @as(c_int, 0x2);
pub const RTV_EXPIRE = @as(c_int, 0x4);
pub const RTV_RPIPE = @as(c_int, 0x8);
pub const RTV_SPIPE = @as(c_int, 0x10);
pub const RTV_SSTHRESH = @as(c_int, 0x20);
pub const RTV_RTT = @as(c_int, 0x40);
pub const RTV_RTTVAR = @as(c_int, 0x80);
pub const RTA_DST = @as(c_int, 0x1);
pub const RTA_GATEWAY = @as(c_int, 0x2);
pub const RTA_NETMASK = @as(c_int, 0x4);
pub const RTA_GENMASK = @as(c_int, 0x8);
pub const RTA_IFP = @as(c_int, 0x10);
pub const RTA_IFA = @as(c_int, 0x20);
pub const RTA_AUTHOR = @as(c_int, 0x40);
pub const RTA_BRD = @as(c_int, 0x80);
pub const RTAX_DST = @as(c_int, 0);
pub const RTAX_GATEWAY = @as(c_int, 1);
pub const RTAX_NETMASK = @as(c_int, 2);
pub const RTAX_GENMASK = @as(c_int, 3);
pub const RTAX_IFP = @as(c_int, 4);
pub const RTAX_IFA = @as(c_int, 5);
pub const RTAX_AUTHOR = @as(c_int, 6);
pub const RTAX_BRD = @as(c_int, 7);
pub const RTAX_MAX = @as(c_int, 8);
pub const _NETINET_IN_H_ = "";
pub const IPPROTO_IP = @as(c_int, 0);
pub const IPPROTO_HOPOPTS = @as(c_int, 0);
pub const IPPROTO_ICMP = @as(c_int, 1);
pub const IPPROTO_IGMP = @as(c_int, 2);
pub const IPPROTO_GGP = @as(c_int, 3);
pub const IPPROTO_IPV4 = @as(c_int, 4);
pub const IPPROTO_IPIP = IPPROTO_IPV4;
pub const IPPROTO_TCP = @as(c_int, 6);
pub const IPPROTO_ST = @as(c_int, 7);
pub const IPPROTO_EGP = @as(c_int, 8);
pub const IPPROTO_PIGP = @as(c_int, 9);
pub const IPPROTO_RCCMON = @as(c_int, 10);
pub const IPPROTO_NVPII = @as(c_int, 11);
pub const IPPROTO_PUP = @as(c_int, 12);
pub const IPPROTO_ARGUS = @as(c_int, 13);
pub const IPPROTO_EMCON = @as(c_int, 14);
pub const IPPROTO_XNET = @as(c_int, 15);
pub const IPPROTO_CHAOS = @as(c_int, 16);
pub const IPPROTO_UDP = @as(c_int, 17);
pub const IPPROTO_MUX = @as(c_int, 18);
pub const IPPROTO_MEAS = @as(c_int, 19);
pub const IPPROTO_HMP = @as(c_int, 20);
pub const IPPROTO_PRM = @as(c_int, 21);
pub const IPPROTO_IDP = @as(c_int, 22);
pub const IPPROTO_TRUNK1 = @as(c_int, 23);
pub const IPPROTO_TRUNK2 = @as(c_int, 24);
pub const IPPROTO_LEAF1 = @as(c_int, 25);
pub const IPPROTO_LEAF2 = @as(c_int, 26);
pub const IPPROTO_RDP = @as(c_int, 27);
pub const IPPROTO_IRTP = @as(c_int, 28);
pub const IPPROTO_TP = @as(c_int, 29);
pub const IPPROTO_BLT = @as(c_int, 30);
pub const IPPROTO_NSP = @as(c_int, 31);
pub const IPPROTO_INP = @as(c_int, 32);
pub const IPPROTO_SEP = @as(c_int, 33);
pub const IPPROTO_3PC = @as(c_int, 34);
pub const IPPROTO_IDPR = @as(c_int, 35);
pub const IPPROTO_XTP = @as(c_int, 36);
pub const IPPROTO_DDP = @as(c_int, 37);
pub const IPPROTO_CMTP = @as(c_int, 38);
pub const IPPROTO_TPXX = @as(c_int, 39);
pub const IPPROTO_IL = @as(c_int, 40);
pub const IPPROTO_IPV6 = @as(c_int, 41);
pub const IPPROTO_SDRP = @as(c_int, 42);
pub const IPPROTO_ROUTING = @as(c_int, 43);
pub const IPPROTO_FRAGMENT = @as(c_int, 44);
pub const IPPROTO_IDRP = @as(c_int, 45);
pub const IPPROTO_RSVP = @as(c_int, 46);
pub const IPPROTO_GRE = @as(c_int, 47);
pub const IPPROTO_MHRP = @as(c_int, 48);
pub const IPPROTO_BHA = @as(c_int, 49);
pub const IPPROTO_ESP = @as(c_int, 50);
pub const IPPROTO_AH = @as(c_int, 51);
pub const IPPROTO_INLSP = @as(c_int, 52);
pub const IPPROTO_SWIPE = @as(c_int, 53);
pub const IPPROTO_NHRP = @as(c_int, 54);
pub const IPPROTO_ICMPV6 = @as(c_int, 58);
pub const IPPROTO_NONE = @as(c_int, 59);
pub const IPPROTO_DSTOPTS = @as(c_int, 60);
pub const IPPROTO_AHIP = @as(c_int, 61);
pub const IPPROTO_CFTP = @as(c_int, 62);
pub const IPPROTO_HELLO = @as(c_int, 63);
pub const IPPROTO_SATEXPAK = @as(c_int, 64);
pub const IPPROTO_KRYPTOLAN = @as(c_int, 65);
pub const IPPROTO_RVD = @as(c_int, 66);
pub const IPPROTO_IPPC = @as(c_int, 67);
pub const IPPROTO_ADFS = @as(c_int, 68);
pub const IPPROTO_SATMON = @as(c_int, 69);
pub const IPPROTO_VISA = @as(c_int, 70);
pub const IPPROTO_IPCV = @as(c_int, 71);
pub const IPPROTO_CPNX = @as(c_int, 72);
pub const IPPROTO_CPHB = @as(c_int, 73);
pub const IPPROTO_WSN = @as(c_int, 74);
pub const IPPROTO_PVP = @as(c_int, 75);
pub const IPPROTO_BRSATMON = @as(c_int, 76);
pub const IPPROTO_ND = @as(c_int, 77);
pub const IPPROTO_WBMON = @as(c_int, 78);
pub const IPPROTO_WBEXPAK = @as(c_int, 79);
pub const IPPROTO_EON = @as(c_int, 80);
pub const IPPROTO_VMTP = @as(c_int, 81);
pub const IPPROTO_SVMTP = @as(c_int, 82);
pub const IPPROTO_VINES = @as(c_int, 83);
pub const IPPROTO_TTP = @as(c_int, 84);
pub const IPPROTO_IGP = @as(c_int, 85);
pub const IPPROTO_DGP = @as(c_int, 86);
pub const IPPROTO_TCF = @as(c_int, 87);
pub const IPPROTO_IGRP = @as(c_int, 88);
pub const IPPROTO_OSPFIGP = @as(c_int, 89);
pub const IPPROTO_SRPC = @as(c_int, 90);
pub const IPPROTO_LARP = @as(c_int, 91);
pub const IPPROTO_MTP = @as(c_int, 92);
pub const IPPROTO_AX25 = @as(c_int, 93);
pub const IPPROTO_IPEIP = @as(c_int, 94);
pub const IPPROTO_MICP = @as(c_int, 95);
pub const IPPROTO_SCCSP = @as(c_int, 96);
pub const IPPROTO_ETHERIP = @as(c_int, 97);
pub const IPPROTO_ENCAP = @as(c_int, 98);
pub const IPPROTO_APES = @as(c_int, 99);
pub const IPPROTO_GMTP = @as(c_int, 100);
pub const IPPROTO_PIM = @as(c_int, 103);
pub const IPPROTO_IPCOMP = @as(c_int, 108);
pub const IPPROTO_PGM = @as(c_int, 113);
pub const IPPROTO_SCTP = @as(c_int, 132);
pub const IPPROTO_DIVERT = @as(c_int, 254);
pub const IPPROTO_RAW = @as(c_int, 255);
pub const IPPROTO_MAX = @as(c_int, 256);
pub const IPPROTO_DONE = @as(c_int, 257);
pub const __DARWIN_IPPORT_RESERVED = @as(c_int, 1024);
pub const IPPORT_RESERVED = __DARWIN_IPPORT_RESERVED;
pub const IPPORT_USERRESERVED = @as(c_int, 5000);
pub const IPPORT_HIFIRSTAUTO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 49152, .decimal);
pub const IPPORT_HILASTAUTO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const IPPORT_RESERVEDSTART = @as(c_int, 600);
pub const INADDR_ANY = @import("std").zig.c_translation.cast(u_int32_t, @as(c_int, 0x00000000));
pub const INADDR_BROADCAST = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex));
pub inline fn IN_CLASSA(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex)) == @as(c_int, 0)) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex)) == @as(c_int, 0);
}
pub const IN_CLASSA_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex);
pub const IN_CLASSA_NSHIFT = @as(c_int, 24);
pub const IN_CLASSA_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00ffffff, .hex);
pub const IN_CLASSA_MAX = @as(c_int, 128);
pub inline fn IN_CLASSB(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex)) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
}
pub const IN_CLASSB_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff0000, .hex);
pub const IN_CLASSB_NSHIFT = @as(c_int, 16);
pub const IN_CLASSB_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0000ffff, .hex);
pub const IN_CLASSB_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub inline fn IN_CLASSC(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex)) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex);
}
pub const IN_CLASSC_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff00, .hex);
pub const IN_CLASSC_NSHIFT = @as(c_int, 8);
pub const IN_CLASSC_HOST = @as(c_int, 0x000000ff);
pub inline fn IN_CLASSD(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex);
}
pub const IN_CLASSD_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex);
pub const IN_CLASSD_NSHIFT = @as(c_int, 28);
pub const IN_CLASSD_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0fffffff, .hex);
pub inline fn IN_MULTICAST(i: anytype) @TypeOf(IN_CLASSD(i)) {
    _ = &i;
    return IN_CLASSD(i);
}
pub inline fn IN_EXPERIMENTAL(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex);
}
pub inline fn IN_BADCLASS(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex);
}
pub const INADDR_LOOPBACK = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7f000001, .hex));
pub const INADDR_NONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex);
pub const INADDR_UNSPEC_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex));
pub const INADDR_ALLHOSTS_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000001, .hex));
pub const INADDR_ALLRTRS_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000002, .hex));
pub const INADDR_ALLRPTS_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000016, .hex));
pub const INADDR_CARP_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000012, .hex));
pub const INADDR_PFSYNC_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe00000f0, .hex));
pub const INADDR_ALLMDNS_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe00000fb, .hex));
pub const INADDR_MAX_LOCAL_GROUP = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe00000ff, .hex));
pub const IN_LINKLOCALNETNUM = @import("std").zig.c_translation.cast(u_int32_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xA9FE0000, .hex));
pub inline fn IN_LINKLOCAL(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & IN_CLASSB_NET) == IN_LINKLOCALNETNUM) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & IN_CLASSB_NET) == IN_LINKLOCALNETNUM;
}
pub inline fn IN_LOOPBACK(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7f000000, .hex)) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7f000000, .hex);
}
pub inline fn IN_ZERONET(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex)) == @as(c_int, 0)) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex)) == @as(c_int, 0);
}
pub inline fn IN_PRIVATE(i: anytype) @TypeOf((((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0a000000, .hex)) or ((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xfff00000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xac100000, .hex))) or ((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff0000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0a80000, .hex))) {
    _ = &i;
    return (((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0a000000, .hex)) or ((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xfff00000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xac100000, .hex))) or ((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff0000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0a80000, .hex));
}
pub inline fn IN_LOCAL_GROUP(i: anytype) @TypeOf((@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff00, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) {
    _ = &i;
    return (@import("std").zig.c_translation.cast(u_int32_t, i) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff00, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex);
}
pub inline fn IN_ANY_LOCAL(i: anytype) @TypeOf((IN_LINKLOCAL(i) != 0) or (IN_LOCAL_GROUP(i) != 0)) {
    _ = &i;
    return (IN_LINKLOCAL(i) != 0) or (IN_LOCAL_GROUP(i) != 0);
}
pub const IN_LOOPBACKNET = @as(c_int, 127);
pub const IN_ARE_ADDR_EQUAL = @compileError("unable to translate macro: undefined identifier `bcmp`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet/in.h:382:9
pub const INET_ADDRSTRLEN = @as(c_int, 16);
pub const IP_OPTIONS = @as(c_int, 1);
pub const IP_HDRINCL = @as(c_int, 2);
pub const IP_TOS = @as(c_int, 3);
pub const IP_TTL = @as(c_int, 4);
pub const IP_RECVOPTS = @as(c_int, 5);
pub const IP_RECVRETOPTS = @as(c_int, 6);
pub const IP_RECVDSTADDR = @as(c_int, 7);
pub const IP_RETOPTS = @as(c_int, 8);
pub const IP_MULTICAST_IF = @as(c_int, 9);
pub const IP_MULTICAST_TTL = @as(c_int, 10);
pub const IP_MULTICAST_LOOP = @as(c_int, 11);
pub const IP_ADD_MEMBERSHIP = @as(c_int, 12);
pub const IP_DROP_MEMBERSHIP = @as(c_int, 13);
pub const IP_MULTICAST_VIF = @as(c_int, 14);
pub const IP_RSVP_ON = @as(c_int, 15);
pub const IP_RSVP_OFF = @as(c_int, 16);
pub const IP_RSVP_VIF_ON = @as(c_int, 17);
pub const IP_RSVP_VIF_OFF = @as(c_int, 18);
pub const IP_PORTRANGE = @as(c_int, 19);
pub const IP_RECVIF = @as(c_int, 20);
pub const IP_IPSEC_POLICY = @as(c_int, 21);
pub const IP_FAITH = @as(c_int, 22);
pub const IP_STRIPHDR = @as(c_int, 23);
pub const IP_RECVTTL = @as(c_int, 24);
pub const IP_BOUND_IF = @as(c_int, 25);
pub const IP_PKTINFO = @as(c_int, 26);
pub const IP_RECVPKTINFO = IP_PKTINFO;
pub const IP_RECVTOS = @as(c_int, 27);
pub const IP_DONTFRAG = @as(c_int, 28);
pub const IP_FW_ADD = @as(c_int, 40);
pub const IP_FW_DEL = @as(c_int, 41);
pub const IP_FW_FLUSH = @as(c_int, 42);
pub const IP_FW_ZERO = @as(c_int, 43);
pub const IP_FW_GET = @as(c_int, 44);
pub const IP_FW_RESETLOG = @as(c_int, 45);
pub const IP_OLD_FW_ADD = @as(c_int, 50);
pub const IP_OLD_FW_DEL = @as(c_int, 51);
pub const IP_OLD_FW_FLUSH = @as(c_int, 52);
pub const IP_OLD_FW_ZERO = @as(c_int, 53);
pub const IP_OLD_FW_GET = @as(c_int, 54);
pub const IP_NAT__XXX = @as(c_int, 55);
pub const IP_OLD_FW_RESETLOG = @as(c_int, 56);
pub const IP_DUMMYNET_CONFIGURE = @as(c_int, 60);
pub const IP_DUMMYNET_DEL = @as(c_int, 61);
pub const IP_DUMMYNET_FLUSH = @as(c_int, 62);
pub const IP_DUMMYNET_GET = @as(c_int, 64);
pub const IP_TRAFFIC_MGT_BACKGROUND = @as(c_int, 65);
pub const IP_MULTICAST_IFINDEX = @as(c_int, 66);
pub const IP_ADD_SOURCE_MEMBERSHIP = @as(c_int, 70);
pub const IP_DROP_SOURCE_MEMBERSHIP = @as(c_int, 71);
pub const IP_BLOCK_SOURCE = @as(c_int, 72);
pub const IP_UNBLOCK_SOURCE = @as(c_int, 73);
pub const IP_MSFILTER = @as(c_int, 74);
pub const MCAST_JOIN_GROUP = @as(c_int, 80);
pub const MCAST_LEAVE_GROUP = @as(c_int, 81);
pub const MCAST_JOIN_SOURCE_GROUP = @as(c_int, 82);
pub const MCAST_LEAVE_SOURCE_GROUP = @as(c_int, 83);
pub const MCAST_BLOCK_SOURCE = @as(c_int, 84);
pub const MCAST_UNBLOCK_SOURCE = @as(c_int, 85);
pub const IP_DEFAULT_MULTICAST_TTL = @as(c_int, 1);
pub const IP_DEFAULT_MULTICAST_LOOP = @as(c_int, 1);
pub const IP_MIN_MEMBERSHIPS = @as(c_int, 31);
pub const IP_MAX_MEMBERSHIPS = @as(c_int, 4095);
pub const IP_MAX_GROUP_SRC_FILTER = @as(c_int, 512);
pub const IP_MAX_SOCK_SRC_FILTER = @as(c_int, 128);
pub const IP_MAX_SOCK_MUTE_FILTER = @as(c_int, 128);
pub const __MSFILTERREQ_DEFINED = "";
pub const MCAST_UNDEFINED = @as(c_int, 0);
pub const MCAST_INCLUDE = @as(c_int, 1);
pub const MCAST_EXCLUDE = @as(c_int, 2);
pub const IP_PORTRANGE_DEFAULT = @as(c_int, 0);
pub const IP_PORTRANGE_HIGH = @as(c_int, 1);
pub const IP_PORTRANGE_LOW = @as(c_int, 2);
pub const IPPROTO_MAXID = IPPROTO_AH + @as(c_int, 1);
pub const IPCTL_FORWARDING = @as(c_int, 1);
pub const IPCTL_SENDREDIRECTS = @as(c_int, 2);
pub const IPCTL_DEFTTL = @as(c_int, 3);
pub const IPCTL_RTEXPIRE = @as(c_int, 5);
pub const IPCTL_RTMINEXPIRE = @as(c_int, 6);
pub const IPCTL_RTMAXCACHE = @as(c_int, 7);
pub const IPCTL_SOURCEROUTE = @as(c_int, 8);
pub const IPCTL_DIRECTEDBROADCAST = @as(c_int, 9);
pub const IPCTL_INTRQMAXLEN = @as(c_int, 10);
pub const IPCTL_INTRQDROPS = @as(c_int, 11);
pub const IPCTL_STATS = @as(c_int, 12);
pub const IPCTL_ACCEPTSOURCEROUTE = @as(c_int, 13);
pub const IPCTL_FASTFORWARDING = @as(c_int, 14);
pub const IPCTL_KEEPFAITH = @as(c_int, 15);
pub const IPCTL_GIF_TTL = @as(c_int, 16);
pub const IPCTL_MAXID = @as(c_int, 17);
pub const __KAME_NETINET_IN_H_INCLUDED_ = "";
pub const _NETINET6_IN6_H_ = "";
pub const __KAME__ = "";
pub const __KAME_VERSION = "2009/apple-darwin";
pub const IPV6PORT_RESERVED = @as(c_int, 1024);
pub const IPV6PORT_ANONMIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 49152, .decimal);
pub const IPV6PORT_ANONMAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const IPV6PORT_RESERVEDMIN = @as(c_int, 600);
pub const IPV6PORT_RESERVEDMAX = IPV6PORT_RESERVED - @as(c_int, 1);
pub const s6_addr = @compileError("unable to translate macro: undefined identifier `__u6_addr`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:160:9
pub const INET6_ADDRSTRLEN = @as(c_int, 46);
pub const SIN6_LEN = "";
pub const IN6ADDR_ANY_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:185:9
pub const IN6ADDR_LOOPBACK_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:188:9
pub const IN6ADDR_NODELOCAL_ALLNODES_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:192:9
pub const IN6ADDR_INTFACELOCAL_ALLNODES_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:195:9
pub const IN6ADDR_LINKLOCAL_ALLNODES_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:198:9
pub const IN6ADDR_LINKLOCAL_ALLROUTERS_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:201:9
pub const IN6ADDR_LINKLOCAL_ALLV2ROUTERS_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:204:9
pub const IN6ADDR_V4MAPPED_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:207:9
pub const IN6ADDR_MULTICAST_PREFIX = @compileError("unable to translate macro: undefined identifier `IN6MASK8`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:210:9
pub const IN6_ARE_ADDR_EQUAL = @compileError("unable to translate macro: undefined identifier `memcmp`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:229:9
pub const IN6_IS_ADDR_UNSPECIFIED = @compileError("unable to translate C expr: unexpected token 'const'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:238:9
pub const IN6_IS_ADDR_LOOPBACK = @compileError("unable to translate C expr: unexpected token 'const'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:247:9
pub const IN6_IS_ADDR_V4COMPAT = @compileError("unable to translate C expr: unexpected token 'const'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:256:9
pub const IN6_IS_ADDR_V4MAPPED = @compileError("unable to translate C expr: unexpected token 'const'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/netinet6/in6.h:266:9
pub inline fn IN6_IS_ADDR_6TO4(x: anytype) @TypeOf(ntohs(x.*.s6_addr16[@as(usize, @intCast(@as(c_int, 0)))]) == @as(c_int, 0x2002)) {
    _ = &x;
    return ntohs(x.*.s6_addr16[@as(usize, @intCast(@as(c_int, 0)))]) == @as(c_int, 0x2002);
}
pub const __IPV6_ADDR_SCOPE_NODELOCAL = @as(c_int, 0x01);
pub const __IPV6_ADDR_SCOPE_INTFACELOCAL = @as(c_int, 0x01);
pub const __IPV6_ADDR_SCOPE_LINKLOCAL = @as(c_int, 0x02);
pub const __IPV6_ADDR_SCOPE_SITELOCAL = @as(c_int, 0x05);
pub const __IPV6_ADDR_SCOPE_ORGLOCAL = @as(c_int, 0x08);
pub const __IPV6_ADDR_SCOPE_GLOBAL = @as(c_int, 0x0e);
pub inline fn IN6_IS_ADDR_LINKLOCAL(a: anytype) @TypeOf((a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xfe)) and ((a.*.s6_addr[@as(usize, @intCast(@as(c_int, 1)))] & @as(c_int, 0xc0)) == @as(c_int, 0x80))) {
    _ = &a;
    return (a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xfe)) and ((a.*.s6_addr[@as(usize, @intCast(@as(c_int, 1)))] & @as(c_int, 0xc0)) == @as(c_int, 0x80));
}
pub inline fn IN6_IS_ADDR_SITELOCAL(a: anytype) @TypeOf((a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xfe)) and ((a.*.s6_addr[@as(usize, @intCast(@as(c_int, 1)))] & @as(c_int, 0xc0)) == @as(c_int, 0xc0))) {
    _ = &a;
    return (a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xfe)) and ((a.*.s6_addr[@as(usize, @intCast(@as(c_int, 1)))] & @as(c_int, 0xc0)) == @as(c_int, 0xc0));
}
pub inline fn IN6_IS_ADDR_MULTICAST(a: anytype) @TypeOf(a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xff)) {
    _ = &a;
    return a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xff);
}
pub inline fn IPV6_ADDR_MC_FLAGS(a: anytype) @TypeOf(a.*.s6_addr[@as(usize, @intCast(@as(c_int, 1)))] & @as(c_int, 0xf0)) {
    _ = &a;
    return a.*.s6_addr[@as(usize, @intCast(@as(c_int, 1)))] & @as(c_int, 0xf0);
}
pub const IPV6_ADDR_MC_FLAGS_TRANSIENT = @as(c_int, 0x10);
pub const IPV6_ADDR_MC_FLAGS_PREFIX = @as(c_int, 0x20);
pub const IPV6_ADDR_MC_FLAGS_UNICAST_BASED = IPV6_ADDR_MC_FLAGS_TRANSIENT | IPV6_ADDR_MC_FLAGS_PREFIX;
pub inline fn IN6_IS_ADDR_UNICAST_BASED_MULTICAST(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (IPV6_ADDR_MC_FLAGS(a) == IPV6_ADDR_MC_FLAGS_UNICAST_BASED)) {
    _ = &a;
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (IPV6_ADDR_MC_FLAGS(a) == IPV6_ADDR_MC_FLAGS_UNICAST_BASED);
}
pub inline fn IN6_IS_ADDR_UNIQUE_LOCAL(a: anytype) @TypeOf((a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xfc)) or (a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xfd))) {
    _ = &a;
    return (a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xfc)) or (a.*.s6_addr[@as(usize, @intCast(@as(c_int, 0)))] == @as(c_int, 0xfd));
}
pub inline fn __IPV6_ADDR_MC_SCOPE(a: anytype) @TypeOf(a.*.s6_addr[@as(usize, @intCast(@as(c_int, 1)))] & @as(c_int, 0x0f)) {
    _ = &a;
    return a.*.s6_addr[@as(usize, @intCast(@as(c_int, 1)))] & @as(c_int, 0x0f);
}
pub inline fn IN6_IS_ADDR_MC_NODELOCAL(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_NODELOCAL)) {
    _ = &a;
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_NODELOCAL);
}
pub inline fn IN6_IS_ADDR_MC_LINKLOCAL(a: anytype) @TypeOf(((IN6_IS_ADDR_MULTICAST(a) != 0) and (IPV6_ADDR_MC_FLAGS(a) != IPV6_ADDR_MC_FLAGS_UNICAST_BASED)) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_LINKLOCAL)) {
    _ = &a;
    return ((IN6_IS_ADDR_MULTICAST(a) != 0) and (IPV6_ADDR_MC_FLAGS(a) != IPV6_ADDR_MC_FLAGS_UNICAST_BASED)) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_LINKLOCAL);
}
pub inline fn IN6_IS_ADDR_MC_SITELOCAL(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_SITELOCAL)) {
    _ = &a;
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_SITELOCAL);
}
pub inline fn IN6_IS_ADDR_MC_ORGLOCAL(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_ORGLOCAL)) {
    _ = &a;
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_ORGLOCAL);
}
pub inline fn IN6_IS_ADDR_MC_GLOBAL(a: anytype) @TypeOf((IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_GLOBAL)) {
    _ = &a;
    return (IN6_IS_ADDR_MULTICAST(a) != 0) and (__IPV6_ADDR_MC_SCOPE(a) == __IPV6_ADDR_SCOPE_GLOBAL);
}
pub const IPV6_SOCKOPT_RESERVED1 = @as(c_int, 3);
pub const IPV6_UNICAST_HOPS = @as(c_int, 4);
pub const IPV6_MULTICAST_IF = @as(c_int, 9);
pub const IPV6_MULTICAST_HOPS = @as(c_int, 10);
pub const IPV6_MULTICAST_LOOP = @as(c_int, 11);
pub const IPV6_JOIN_GROUP = @as(c_int, 12);
pub const IPV6_LEAVE_GROUP = @as(c_int, 13);
pub const IPV6_PORTRANGE = @as(c_int, 14);
pub const ICMP6_FILTER = @as(c_int, 18);
pub const IPV6_2292PKTINFO = @as(c_int, 19);
pub const IPV6_2292HOPLIMIT = @as(c_int, 20);
pub const IPV6_2292NEXTHOP = @as(c_int, 21);
pub const IPV6_2292HOPOPTS = @as(c_int, 22);
pub const IPV6_2292DSTOPTS = @as(c_int, 23);
pub const IPV6_2292RTHDR = @as(c_int, 24);
pub const IPV6_2292PKTOPTIONS = @as(c_int, 25);
pub const IPV6_CHECKSUM = @as(c_int, 26);
pub const IPV6_V6ONLY = @as(c_int, 27);
pub const IPV6_BINDV6ONLY = IPV6_V6ONLY;
pub const IPV6_IPSEC_POLICY = @as(c_int, 28);
pub const IPV6_FAITH = @as(c_int, 29);
pub const IPV6_FW_ADD = @as(c_int, 30);
pub const IPV6_FW_DEL = @as(c_int, 31);
pub const IPV6_FW_FLUSH = @as(c_int, 32);
pub const IPV6_FW_ZERO = @as(c_int, 33);
pub const IPV6_FW_GET = @as(c_int, 34);
pub const IPV6_RECVTCLASS = @as(c_int, 35);
pub const IPV6_TCLASS = @as(c_int, 36);
pub const IPV6_BOUND_IF = @as(c_int, 125);
pub const IPV6_RTHDR_LOOSE = @as(c_int, 0);
pub const IPV6_RTHDR_STRICT = @as(c_int, 1);
pub const IPV6_RTHDR_TYPE_0 = @as(c_int, 0);
pub const IPV6_DEFAULT_MULTICAST_HOPS = @as(c_int, 1);
pub const IPV6_DEFAULT_MULTICAST_LOOP = @as(c_int, 1);
pub const IPV6_MIN_MEMBERSHIPS = @as(c_int, 31);
pub const IPV6_MAX_MEMBERSHIPS = @as(c_int, 4095);
pub const IPV6_MAX_GROUP_SRC_FILTER = @as(c_int, 512);
pub const IPV6_MAX_SOCK_SRC_FILTER = @as(c_int, 128);
pub const IPV6_PORTRANGE_DEFAULT = @as(c_int, 0);
pub const IPV6_PORTRANGE_HIGH = @as(c_int, 1);
pub const IPV6_PORTRANGE_LOW = @as(c_int, 2);
pub const IPV6PROTO_MAXID = IPPROTO_PIM + @as(c_int, 1);
pub const IPV6CTL_FORWARDING = @as(c_int, 1);
pub const IPV6CTL_SENDREDIRECTS = @as(c_int, 2);
pub const IPV6CTL_DEFHLIM = @as(c_int, 3);
pub const IPV6CTL_FORWSRCRT = @as(c_int, 5);
pub const IPV6CTL_STATS = @as(c_int, 6);
pub const IPV6CTL_MRTSTATS = @as(c_int, 7);
pub const IPV6CTL_MRTPROTO = @as(c_int, 8);
pub const IPV6CTL_MAXFRAGPACKETS = @as(c_int, 9);
pub const IPV6CTL_SOURCECHECK = @as(c_int, 10);
pub const IPV6CTL_SOURCECHECK_LOGINT = @as(c_int, 11);
pub const IPV6CTL_ACCEPT_RTADV = @as(c_int, 12);
pub const IPV6CTL_KEEPFAITH = @as(c_int, 13);
pub const IPV6CTL_LOG_INTERVAL = @as(c_int, 14);
pub const IPV6CTL_HDRNESTLIMIT = @as(c_int, 15);
pub const IPV6CTL_DAD_COUNT = @as(c_int, 16);
pub const IPV6CTL_AUTO_FLOWLABEL = @as(c_int, 17);
pub const IPV6CTL_DEFMCASTHLIM = @as(c_int, 18);
pub const IPV6CTL_GIF_HLIM = @as(c_int, 19);
pub const IPV6CTL_KAME_VERSION = @as(c_int, 20);
pub const IPV6CTL_USE_DEPRECATED = @as(c_int, 21);
pub const IPV6CTL_RR_PRUNE = @as(c_int, 22);
pub const IPV6CTL_V6ONLY = @as(c_int, 24);
pub const IPV6CTL_RTEXPIRE = @as(c_int, 25);
pub const IPV6CTL_RTMINEXPIRE = @as(c_int, 26);
pub const IPV6CTL_RTMAXCACHE = @as(c_int, 27);
pub const IPV6CTL_USETEMPADDR = @as(c_int, 32);
pub const IPV6CTL_TEMPPLTIME = @as(c_int, 33);
pub const IPV6CTL_TEMPVLTIME = @as(c_int, 34);
pub const IPV6CTL_AUTO_LINKLOCAL = @as(c_int, 35);
pub const IPV6CTL_RIP6STATS = @as(c_int, 36);
pub const IPV6CTL_PREFER_TEMPADDR = @as(c_int, 37);
pub const IPV6CTL_ADDRCTLPOLICY = @as(c_int, 38);
pub const IPV6CTL_USE_DEFAULTZONE = @as(c_int, 39);
pub const IPV6CTL_MAXFRAGS = @as(c_int, 41);
pub const IPV6CTL_MCAST_PMTU = @as(c_int, 44);
pub const IPV6CTL_NEIGHBORGCTHRESH = @as(c_int, 46);
pub const IPV6CTL_MAXIFPREFIXES = @as(c_int, 47);
pub const IPV6CTL_MAXIFDEFROUTERS = @as(c_int, 48);
pub const IPV6CTL_MAXDYNROUTES = @as(c_int, 49);
pub const ICMPV6CTL_ND6_ONLINKNSRFC4861 = @as(c_int, 50);
pub const IPV6CTL_ULA_USETEMPADDR = @as(c_int, 51);
pub const IPV6CTL_MAXID = @as(c_int, 51);
pub const _NETINET_TCP_H_ = "";
pub const tcp6_seq = tcp_seq;
pub const tcp6hdr = tcphdr;
pub const TH_FIN = @as(c_int, 0x01);
pub const TH_SYN = @as(c_int, 0x02);
pub const TH_RST = @as(c_int, 0x04);
pub const TH_PUSH = @as(c_int, 0x08);
pub const TH_ACK = @as(c_int, 0x10);
pub const TH_URG = @as(c_int, 0x20);
pub const TH_ECE = @as(c_int, 0x40);
pub const TH_CWR = @as(c_int, 0x80);
pub const TH_AE = @as(c_int, 0x100);
pub const TH_FLAGS = (((((TH_FIN | TH_SYN) | TH_RST) | TH_ACK) | TH_URG) | TH_ECE) | TH_CWR;
pub const TH_FLAGS_ALL = TH_FLAGS | TH_PUSH;
pub const TH_ACCEPT = ((TH_FIN | TH_SYN) | TH_RST) | TH_ACK;
pub const TH_ACE = (TH_AE | TH_CWR) | TH_ECE;
pub const TCPOPT_EOL = @as(c_int, 0);
pub const TCPOPT_NOP = @as(c_int, 1);
pub const TCPOPT_MAXSEG = @as(c_int, 2);
pub const TCPOLEN_MAXSEG = @as(c_int, 4);
pub const TCPOPT_WINDOW = @as(c_int, 3);
pub const TCPOLEN_WINDOW = @as(c_int, 3);
pub const TCPOPT_SACK_PERMITTED = @as(c_int, 4);
pub const TCPOLEN_SACK_PERMITTED = @as(c_int, 2);
pub const TCPOPT_SACK = @as(c_int, 5);
pub const TCPOLEN_SACK = @as(c_int, 8);
pub const TCPOPT_TIMESTAMP = @as(c_int, 8);
pub const TCPOLEN_TIMESTAMP = @as(c_int, 10);
pub const TCPOLEN_TSTAMP_APPA = TCPOLEN_TIMESTAMP + @as(c_int, 2);
pub const TCPOPT_TSTAMP_HDR = (((TCPOPT_NOP << @as(c_int, 24)) | (TCPOPT_NOP << @as(c_int, 16))) | (TCPOPT_TIMESTAMP << @as(c_int, 8))) | TCPOLEN_TIMESTAMP;
pub const MAX_TCPOPTLEN = @as(c_int, 40);
pub const TCPOPT_CC = @as(c_int, 11);
pub const TCPOPT_CCNEW = @as(c_int, 12);
pub const TCPOPT_CCECHO = @as(c_int, 13);
pub const TCPOLEN_CC = @as(c_int, 6);
pub const TCPOLEN_CC_APPA = TCPOLEN_CC + @as(c_int, 2);
pub inline fn TCPOPT_CC_HDR(ccopt: anytype) @TypeOf((((TCPOPT_NOP << @as(c_int, 24)) | (TCPOPT_NOP << @as(c_int, 16))) | (ccopt << @as(c_int, 8))) | TCPOLEN_CC) {
    _ = &ccopt;
    return (((TCPOPT_NOP << @as(c_int, 24)) | (TCPOPT_NOP << @as(c_int, 16))) | (ccopt << @as(c_int, 8))) | TCPOLEN_CC;
}
pub const TCPOPT_SIGNATURE = @as(c_int, 19);
pub const TCPOLEN_SIGNATURE = @as(c_int, 18);
pub const TCPOPT_FASTOPEN = @as(c_int, 34);
pub const TCPOLEN_FASTOPEN_REQ = @as(c_int, 2);
pub const TCPOPT_ACCECN0 = @as(c_int, 172);
pub const TCPOPT_ACCECN1 = @as(c_int, 174);
pub const TCPOLEN_ACCECN_EMPTY = @as(c_int, 2);
pub const TCPOLEN_ACCECN_COUNTER = @as(c_int, 3);
pub const TCPOPT_SACK_PERMIT_HDR = (((TCPOPT_NOP << @as(c_int, 24)) | (TCPOPT_NOP << @as(c_int, 16))) | (TCPOPT_SACK_PERMITTED << @as(c_int, 8))) | TCPOLEN_SACK_PERMITTED;
pub const TCPOPT_SACK_HDR = ((TCPOPT_NOP << @as(c_int, 24)) | (TCPOPT_NOP << @as(c_int, 16))) | (TCPOPT_SACK << @as(c_int, 8));
pub const MAX_SACK_BLKS = @as(c_int, 6);
pub const TCP_MAX_SACK = @as(c_int, 4);
pub const TCP_MSS = @as(c_int, 512);
pub const TCP_MINMSS = @as(c_int, 216);
pub const TCP6_MSS = @as(c_int, 1024);
pub const TCP_MAXWIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const TTCP_CLIENT_SND_WND = @as(c_int, 4096);
pub const TCP_MAX_WINSHIFT = @as(c_int, 14);
pub const TCP_MAXHLEN = @as(c_int, 0xf) << @as(c_int, 2);
pub const TCP_MAXOLEN = TCP_MAXHLEN - @import("std").zig.c_translation.sizeof(struct_tcphdr);
pub const TCP_NODELAY = @as(c_int, 0x01);
pub const TCP_MAXSEG = @as(c_int, 0x02);
pub const TCP_NOPUSH = @as(c_int, 0x04);
pub const TCP_NOOPT = @as(c_int, 0x08);
pub const TCP_KEEPALIVE = @as(c_int, 0x10);
pub const TCP_CONNECTIONTIMEOUT = @as(c_int, 0x20);
pub const PERSIST_TIMEOUT = @as(c_int, 0x40);
pub const TCP_RXT_CONNDROPTIME = @as(c_int, 0x80);
pub const TCP_RXT_FINDROP = @as(c_int, 0x100);
pub const TCP_KEEPINTVL = @as(c_int, 0x101);
pub const TCP_KEEPCNT = @as(c_int, 0x102);
pub const TCP_SENDMOREACKS = @as(c_int, 0x103);
pub const TCP_ENABLE_ECN = @as(c_int, 0x104);
pub const TCP_FASTOPEN = @as(c_int, 0x105);
pub const TCP_CONNECTION_INFO = @as(c_int, 0x106);
pub const TCP_NOTSENT_LOWAT = @as(c_int, 0x201);
pub const TCPCI_OPT_TIMESTAMPS = @as(c_int, 0x00000001);
pub const TCPCI_OPT_SACK = @as(c_int, 0x00000002);
pub const TCPCI_OPT_WSCALE = @as(c_int, 0x00000004);
pub const TCPCI_OPT_ECN = @as(c_int, 0x00000008);
pub const TCPCI_FLAG_LOSSRECOVERY = @as(c_int, 0x00000001);
pub const TCPCI_FLAG_REORDERING_DETECTED = @as(c_int, 0x00000002);
pub const _MACH_MACHINE_H_ = "";
pub const CPU_STATE_MAX = @as(c_int, 4);
pub const CPU_STATE_USER = @as(c_int, 0);
pub const CPU_STATE_SYSTEM = @as(c_int, 1);
pub const CPU_STATE_IDLE = @as(c_int, 2);
pub const CPU_STATE_NICE = @as(c_int, 3);
pub const CPU_ARCH_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex);
pub const CPU_ARCH_ABI64 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const CPU_ARCH_ABI64_32 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const CPU_TYPE_ANY = @import("std").zig.c_translation.cast(cpu_type_t, -@as(c_int, 1));
pub const CPU_TYPE_VAX = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 1));
pub const CPU_TYPE_MC680x0 = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 6));
pub const CPU_TYPE_X86 = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 7));
pub const CPU_TYPE_I386 = CPU_TYPE_X86;
pub const CPU_TYPE_X86_64 = CPU_TYPE_X86 | CPU_ARCH_ABI64;
pub const CPU_TYPE_MC98000 = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 10));
pub const CPU_TYPE_HPPA = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 11));
pub const CPU_TYPE_ARM = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 12));
pub const CPU_TYPE_ARM64 = CPU_TYPE_ARM | CPU_ARCH_ABI64;
pub const CPU_TYPE_ARM64_32 = CPU_TYPE_ARM | CPU_ARCH_ABI64_32;
pub const CPU_TYPE_MC88000 = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 13));
pub const CPU_TYPE_SPARC = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 14));
pub const CPU_TYPE_I860 = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 15));
pub const CPU_TYPE_POWERPC = @import("std").zig.c_translation.cast(cpu_type_t, @as(c_int, 18));
pub const CPU_TYPE_POWERPC64 = CPU_TYPE_POWERPC | CPU_ARCH_ABI64;
pub const CPU_SUBTYPE_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex);
pub const CPU_SUBTYPE_LIB64 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const CPU_SUBTYPE_PTRAUTH_ABI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const CPU_SUBTYPE_ANY = @import("std").zig.c_translation.cast(cpu_subtype_t, -@as(c_int, 1));
pub const CPU_SUBTYPE_MULTIPLE = @import("std").zig.c_translation.cast(cpu_subtype_t, -@as(c_int, 1));
pub const CPU_SUBTYPE_LITTLE_ENDIAN = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_BIG_ENDIAN = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_THREADTYPE_NONE = @import("std").zig.c_translation.cast(cpu_threadtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_VAX_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_VAX780 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_VAX785 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 2));
pub const CPU_SUBTYPE_VAX750 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 3));
pub const CPU_SUBTYPE_VAX730 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 4));
pub const CPU_SUBTYPE_UVAXI = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 5));
pub const CPU_SUBTYPE_UVAXII = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 6));
pub const CPU_SUBTYPE_VAX8200 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 7));
pub const CPU_SUBTYPE_VAX8500 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 8));
pub const CPU_SUBTYPE_VAX8600 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 9));
pub const CPU_SUBTYPE_VAX8650 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 10));
pub const CPU_SUBTYPE_VAX8800 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 11));
pub const CPU_SUBTYPE_UVAXIII = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 12));
pub const CPU_SUBTYPE_MC680x0_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_MC68030 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_MC68040 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 2));
pub const CPU_SUBTYPE_MC68030_ONLY = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 3));
pub inline fn CPU_SUBTYPE_INTEL(f: anytype, m: anytype) @TypeOf(@import("std").zig.c_translation.cast(cpu_subtype_t, f) + (m << @as(c_int, 4))) {
    _ = &f;
    _ = &m;
    return @import("std").zig.c_translation.cast(cpu_subtype_t, f) + (m << @as(c_int, 4));
}
pub const CPU_SUBTYPE_I386_ALL = CPU_SUBTYPE_INTEL(@as(c_int, 3), @as(c_int, 0));
pub const CPU_SUBTYPE_386 = CPU_SUBTYPE_INTEL(@as(c_int, 3), @as(c_int, 0));
pub const CPU_SUBTYPE_486 = CPU_SUBTYPE_INTEL(@as(c_int, 4), @as(c_int, 0));
pub const CPU_SUBTYPE_486SX = CPU_SUBTYPE_INTEL(@as(c_int, 4), @as(c_int, 8));
pub const CPU_SUBTYPE_586 = CPU_SUBTYPE_INTEL(@as(c_int, 5), @as(c_int, 0));
pub const CPU_SUBTYPE_PENT = CPU_SUBTYPE_INTEL(@as(c_int, 5), @as(c_int, 0));
pub const CPU_SUBTYPE_PENTPRO = CPU_SUBTYPE_INTEL(@as(c_int, 6), @as(c_int, 1));
pub const CPU_SUBTYPE_PENTII_M3 = CPU_SUBTYPE_INTEL(@as(c_int, 6), @as(c_int, 3));
pub const CPU_SUBTYPE_PENTII_M5 = CPU_SUBTYPE_INTEL(@as(c_int, 6), @as(c_int, 5));
pub const CPU_SUBTYPE_CELERON = CPU_SUBTYPE_INTEL(@as(c_int, 7), @as(c_int, 6));
pub const CPU_SUBTYPE_CELERON_MOBILE = CPU_SUBTYPE_INTEL(@as(c_int, 7), @as(c_int, 7));
pub const CPU_SUBTYPE_PENTIUM_3 = CPU_SUBTYPE_INTEL(@as(c_int, 8), @as(c_int, 0));
pub const CPU_SUBTYPE_PENTIUM_3_M = CPU_SUBTYPE_INTEL(@as(c_int, 8), @as(c_int, 1));
pub const CPU_SUBTYPE_PENTIUM_3_XEON = CPU_SUBTYPE_INTEL(@as(c_int, 8), @as(c_int, 2));
pub const CPU_SUBTYPE_PENTIUM_M = CPU_SUBTYPE_INTEL(@as(c_int, 9), @as(c_int, 0));
pub const CPU_SUBTYPE_PENTIUM_4 = CPU_SUBTYPE_INTEL(@as(c_int, 10), @as(c_int, 0));
pub const CPU_SUBTYPE_PENTIUM_4_M = CPU_SUBTYPE_INTEL(@as(c_int, 10), @as(c_int, 1));
pub const CPU_SUBTYPE_ITANIUM = CPU_SUBTYPE_INTEL(@as(c_int, 11), @as(c_int, 0));
pub const CPU_SUBTYPE_ITANIUM_2 = CPU_SUBTYPE_INTEL(@as(c_int, 11), @as(c_int, 1));
pub const CPU_SUBTYPE_XEON = CPU_SUBTYPE_INTEL(@as(c_int, 12), @as(c_int, 0));
pub const CPU_SUBTYPE_XEON_MP = CPU_SUBTYPE_INTEL(@as(c_int, 12), @as(c_int, 1));
pub inline fn CPU_SUBTYPE_INTEL_FAMILY(x: anytype) @TypeOf(x & @as(c_int, 15)) {
    _ = &x;
    return x & @as(c_int, 15);
}
pub const CPU_SUBTYPE_INTEL_FAMILY_MAX = @as(c_int, 15);
pub inline fn CPU_SUBTYPE_INTEL_MODEL(x: anytype) @TypeOf(x >> @as(c_int, 4)) {
    _ = &x;
    return x >> @as(c_int, 4);
}
pub const CPU_SUBTYPE_INTEL_MODEL_ALL = @as(c_int, 0);
pub const CPU_SUBTYPE_X86_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 3));
pub const CPU_SUBTYPE_X86_64_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 3));
pub const CPU_SUBTYPE_X86_ARCH1 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 4));
pub const CPU_SUBTYPE_X86_64_H = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 8));
pub const CPU_THREADTYPE_INTEL_HTT = @import("std").zig.c_translation.cast(cpu_threadtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_MIPS_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_MIPS_R2300 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_MIPS_R2600 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 2));
pub const CPU_SUBTYPE_MIPS_R2800 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 3));
pub const CPU_SUBTYPE_MIPS_R2000a = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 4));
pub const CPU_SUBTYPE_MIPS_R2000 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 5));
pub const CPU_SUBTYPE_MIPS_R3000a = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 6));
pub const CPU_SUBTYPE_MIPS_R3000 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 7));
pub const CPU_SUBTYPE_MC98000_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_MC98601 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_HPPA_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_HPPA_7100 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_HPPA_7100LC = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_MC88000_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_MC88100 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_MC88110 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 2));
pub const CPU_SUBTYPE_SPARC_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_I860_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_I860_860 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_POWERPC_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_POWERPC_601 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_POWERPC_602 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 2));
pub const CPU_SUBTYPE_POWERPC_603 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 3));
pub const CPU_SUBTYPE_POWERPC_603e = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 4));
pub const CPU_SUBTYPE_POWERPC_603ev = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 5));
pub const CPU_SUBTYPE_POWERPC_604 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 6));
pub const CPU_SUBTYPE_POWERPC_604e = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 7));
pub const CPU_SUBTYPE_POWERPC_620 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 8));
pub const CPU_SUBTYPE_POWERPC_750 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 9));
pub const CPU_SUBTYPE_POWERPC_7400 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 10));
pub const CPU_SUBTYPE_POWERPC_7450 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 11));
pub const CPU_SUBTYPE_POWERPC_970 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 100));
pub const CPU_SUBTYPE_ARM_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_ARM_V4T = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 5));
pub const CPU_SUBTYPE_ARM_V6 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 6));
pub const CPU_SUBTYPE_ARM_V5TEJ = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 7));
pub const CPU_SUBTYPE_ARM_XSCALE = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 8));
pub const CPU_SUBTYPE_ARM_V7 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 9));
pub const CPU_SUBTYPE_ARM_V7F = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 10));
pub const CPU_SUBTYPE_ARM_V7S = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 11));
pub const CPU_SUBTYPE_ARM_V7K = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 12));
pub const CPU_SUBTYPE_ARM_V8 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 13));
pub const CPU_SUBTYPE_ARM_V6M = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 14));
pub const CPU_SUBTYPE_ARM_V7M = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 15));
pub const CPU_SUBTYPE_ARM_V7EM = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 16));
pub const CPU_SUBTYPE_ARM_V8M = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 17));
pub const CPU_SUBTYPE_ARM64_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_ARM64_V8 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPU_SUBTYPE_ARM64E = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 2));
pub const CPU_SUBTYPE_ARM64_PTR_AUTH_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0f000000, .hex);
pub inline fn CPU_SUBTYPE_ARM64_PTR_AUTH_VERSION(x: anytype) @TypeOf((x & CPU_SUBTYPE_ARM64_PTR_AUTH_MASK) >> @as(c_int, 24)) {
    _ = &x;
    return (x & CPU_SUBTYPE_ARM64_PTR_AUTH_MASK) >> @as(c_int, 24);
}
pub const CPU_SUBTYPE_ARM64_32_ALL = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 0));
pub const CPU_SUBTYPE_ARM64_32_V8 = @import("std").zig.c_translation.cast(cpu_subtype_t, @as(c_int, 1));
pub const CPUFAMILY_UNKNOWN = @as(c_int, 0);
pub const CPUFAMILY_POWERPC_G3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xcee41549, .hex);
pub const CPUFAMILY_POWERPC_G4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x77c184ae, .hex);
pub const CPUFAMILY_POWERPC_G5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xed76d8aa, .hex);
pub const CPUFAMILY_INTEL_6_13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xaa33392b, .hex);
pub const CPUFAMILY_INTEL_PENRYN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x78ea4fbc, .hex);
pub const CPUFAMILY_INTEL_NEHALEM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6b5a4cd2, .hex);
pub const CPUFAMILY_INTEL_WESTMERE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x573b5eec, .hex);
pub const CPUFAMILY_INTEL_SANDYBRIDGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x5490b78c, .hex);
pub const CPUFAMILY_INTEL_IVYBRIDGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1f65e835, .hex);
pub const CPUFAMILY_INTEL_HASWELL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10b282dc, .hex);
pub const CPUFAMILY_INTEL_BROADWELL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x582ed09c, .hex);
pub const CPUFAMILY_INTEL_SKYLAKE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x37fc219f, .hex);
pub const CPUFAMILY_INTEL_KABYLAKE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0f817246, .hex);
pub const CPUFAMILY_INTEL_ICELAKE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x38435547, .hex);
pub const CPUFAMILY_INTEL_COMETLAKE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1cf8a03e, .hex);
pub const CPUFAMILY_ARM_9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe73283ae, .hex);
pub const CPUFAMILY_ARM_11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8ff620d8, .hex);
pub const CPUFAMILY_ARM_XSCALE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x53b005f5, .hex);
pub const CPUFAMILY_ARM_12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xbd1b0ae9, .hex);
pub const CPUFAMILY_ARM_13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x0cc90e64, .hex);
pub const CPUFAMILY_ARM_14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x96077ef1, .hex);
pub const CPUFAMILY_ARM_15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xa8511bca, .hex);
pub const CPUFAMILY_ARM_SWIFT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1e2d6381, .hex);
pub const CPUFAMILY_ARM_CYCLONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x37a09642, .hex);
pub const CPUFAMILY_ARM_TYPHOON = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x2c91a47e, .hex);
pub const CPUFAMILY_ARM_TWISTER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x92fb37c8, .hex);
pub const CPUFAMILY_ARM_HURRICANE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x67ceee93, .hex);
pub const CPUFAMILY_ARM_MONSOON_MISTRAL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe81e7ef6, .hex);
pub const CPUFAMILY_ARM_VORTEX_TEMPEST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x07d34b9f, .hex);
pub const CPUFAMILY_ARM_LIGHTNING_THUNDER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x462504d2, .hex);
pub const CPUFAMILY_ARM_FIRESTORM_ICESTORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x1b588bb3, .hex);
pub const CPUFAMILY_ARM_BLIZZARD_AVALANCHE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xda33d83d, .hex);
pub const CPUFAMILY_ARM_EVEREST_SAWTOOTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8765edea, .hex);
pub const CPUFAMILY_ARM_IBIZA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xfa33415e, .hex);
pub const CPUFAMILY_ARM_PALMA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x72015832, .hex);
pub const CPUFAMILY_ARM_COLL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x2876f5b5, .hex);
pub const CPUFAMILY_ARM_LOBOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x5f4dea93, .hex);
pub const CPUFAMILY_ARM_DONAN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x6f5129ac, .hex);
pub const CPUFAMILY_ARM_BRAVA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x17d5b93a, .hex);
pub const CPUFAMILY_ARM_TAHITI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x75d4acb9, .hex);
pub const CPUFAMILY_ARM_TUPAI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x204526d0, .hex);
pub const CPUSUBFAMILY_UNKNOWN = @as(c_int, 0);
pub const CPUSUBFAMILY_ARM_HP = @as(c_int, 1);
pub const CPUSUBFAMILY_ARM_HG = @as(c_int, 2);
pub const CPUSUBFAMILY_ARM_M = @as(c_int, 3);
pub const CPUSUBFAMILY_ARM_HS = @as(c_int, 4);
pub const CPUSUBFAMILY_ARM_HC_HD = @as(c_int, 5);
pub const CPUSUBFAMILY_ARM_HA = @as(c_int, 6);
pub const CPUFAMILY_INTEL_6_23 = CPUFAMILY_INTEL_PENRYN;
pub const CPUFAMILY_INTEL_6_26 = CPUFAMILY_INTEL_NEHALEM;
pub const PROC_ALL_PIDS = @as(c_int, 1);
pub const PROC_PGRP_ONLY = @as(c_int, 2);
pub const PROC_TTY_ONLY = @as(c_int, 3);
pub const PROC_UID_ONLY = @as(c_int, 4);
pub const PROC_RUID_ONLY = @as(c_int, 5);
pub const PROC_PPID_ONLY = @as(c_int, 6);
pub const PROC_KDBG_ONLY = @as(c_int, 7);
pub const PROC_FLAG_SYSTEM = @as(c_int, 1);
pub const PROC_FLAG_TRACED = @as(c_int, 2);
pub const PROC_FLAG_INEXIT = @as(c_int, 4);
pub const PROC_FLAG_PPWAIT = @as(c_int, 8);
pub const PROC_FLAG_LP64 = @as(c_int, 0x10);
pub const PROC_FLAG_SLEADER = @as(c_int, 0x20);
pub const PROC_FLAG_CTTY = @as(c_int, 0x40);
pub const PROC_FLAG_CONTROLT = @as(c_int, 0x80);
pub const PROC_FLAG_THCWD = @as(c_int, 0x100);
pub const PROC_FLAG_PC_THROTTLE = @as(c_int, 0x200);
pub const PROC_FLAG_PC_SUSP = @as(c_int, 0x400);
pub const PROC_FLAG_PC_KILL = @as(c_int, 0x600);
pub const PROC_FLAG_PC_MASK = @as(c_int, 0x600);
pub const PROC_FLAG_PA_THROTTLE = @as(c_int, 0x800);
pub const PROC_FLAG_PA_SUSP = @as(c_int, 0x1000);
pub const PROC_FLAG_PSUGID = @as(c_int, 0x2000);
pub const PROC_FLAG_EXEC = @as(c_int, 0x4000);
pub const MAXTHREADNAMESIZE = @as(c_int, 64);
pub const PROC_REGION_SUBMAP = @as(c_int, 1);
pub const PROC_REGION_SHARED = @as(c_int, 2);
pub const SM_COW = @as(c_int, 1);
pub const SM_PRIVATE = @as(c_int, 2);
pub const SM_EMPTY = @as(c_int, 3);
pub const SM_SHARED = @as(c_int, 4);
pub const SM_TRUESHARED = @as(c_int, 5);
pub const SM_PRIVATE_ALIASED = @as(c_int, 6);
pub const SM_SHARED_ALIASED = @as(c_int, 7);
pub const SM_LARGE_PAGE = @as(c_int, 8);
pub const TH_STATE_RUNNING = @as(c_int, 1);
pub const TH_STATE_STOPPED = @as(c_int, 2);
pub const TH_STATE_WAITING = @as(c_int, 3);
pub const TH_STATE_UNINTERRUPTIBLE = @as(c_int, 4);
pub const TH_STATE_HALTED = @as(c_int, 5);
pub const TH_FLAGS_SWAPPED = @as(c_int, 0x1);
pub const TH_FLAGS_IDLE = @as(c_int, 0x2);
pub const WQ_EXCEEDED_CONSTRAINED_THREAD_LIMIT = @as(c_int, 0x1);
pub const WQ_EXCEEDED_TOTAL_THREAD_LIMIT = @as(c_int, 0x2);
pub const WQ_FLAGS_AVAILABLE = @as(c_int, 0x4);
pub const WQ_EXCEEDED_COOPERATIVE_THREAD_LIMIT = @as(c_int, 0x8);
pub const WQ_EXCEEDED_ACTIVE_CONSTRAINED_THREAD_LIMIT = @as(c_int, 0x10);
pub const PROC_FP_SHARED = @as(c_int, 1);
pub const PROC_FP_CLEXEC = @as(c_int, 2);
pub const PROC_FP_GUARDED = @as(c_int, 4);
pub const PROC_FP_CLFORK = @as(c_int, 8);
pub const PROC_FI_GUARD_CLOSE = @as(c_uint, 1) << @as(c_int, 0);
pub const PROC_FI_GUARD_DUP = @as(c_uint, 1) << @as(c_int, 1);
pub const PROC_FI_GUARD_SOCKET_IPC = @as(c_uint, 1) << @as(c_int, 2);
pub const PROC_FI_GUARD_FILEPORT = @as(c_uint, 1) << @as(c_int, 3);
pub const INI_IPV4 = @as(c_int, 0x1);
pub const INI_IPV6 = @as(c_int, 0x2);
pub const TSI_T_REXMT = @as(c_int, 0);
pub const TSI_T_PERSIST = @as(c_int, 1);
pub const TSI_T_KEEP = @as(c_int, 2);
pub const TSI_T_2MSL = @as(c_int, 3);
pub const TSI_T_NTIMERS = @as(c_int, 4);
pub const TSI_S_CLOSED = @as(c_int, 0);
pub const TSI_S_LISTEN = @as(c_int, 1);
pub const TSI_S_SYN_SENT = @as(c_int, 2);
pub const TSI_S_SYN_RECEIVED = @as(c_int, 3);
pub const TSI_S_ESTABLISHED = @as(c_int, 4);
pub const TSI_S__CLOSE_WAIT = @as(c_int, 5);
pub const TSI_S_FIN_WAIT_1 = @as(c_int, 6);
pub const TSI_S_CLOSING = @as(c_int, 7);
pub const TSI_S_LAST_ACK = @as(c_int, 8);
pub const TSI_S_FIN_WAIT_2 = @as(c_int, 9);
pub const TSI_S_TIME_WAIT = @as(c_int, 10);
pub const TSI_S_RESERVED = @as(c_int, 11);
pub const SOI_S_NOFDREF = @as(c_int, 0x0001);
pub const SOI_S_ISCONNECTED = @as(c_int, 0x0002);
pub const SOI_S_ISCONNECTING = @as(c_int, 0x0004);
pub const SOI_S_ISDISCONNECTING = @as(c_int, 0x0008);
pub const SOI_S_CANTSENDMORE = @as(c_int, 0x0010);
pub const SOI_S_CANTRCVMORE = @as(c_int, 0x0020);
pub const SOI_S_RCVATMARK = @as(c_int, 0x0040);
pub const SOI_S_PRIV = @as(c_int, 0x0080);
pub const SOI_S_NBIO = @as(c_int, 0x0100);
pub const SOI_S_ASYNC = @as(c_int, 0x0200);
pub const SOI_S_INCOMP = @as(c_int, 0x0800);
pub const SOI_S_COMP = @as(c_int, 0x1000);
pub const SOI_S_ISDISCONNECTED = @as(c_int, 0x2000);
pub const SOI_S_DRAINING = @as(c_int, 0x4000);
pub const PROC_KQUEUE_SELECT = @as(c_int, 0x0001);
pub const PROC_KQUEUE_SLEEP = @as(c_int, 0x0002);
pub const PROC_KQUEUE_32 = @as(c_int, 0x0008);
pub const PROC_KQUEUE_64 = @as(c_int, 0x0010);
pub const PROC_KQUEUE_QOS = @as(c_int, 0x0020);
pub const PROX_FDTYPE_ATALK = @as(c_int, 0);
pub const PROX_FDTYPE_VNODE = @as(c_int, 1);
pub const PROX_FDTYPE_SOCKET = @as(c_int, 2);
pub const PROX_FDTYPE_PSHM = @as(c_int, 3);
pub const PROX_FDTYPE_PSEM = @as(c_int, 4);
pub const PROX_FDTYPE_KQUEUE = @as(c_int, 5);
pub const PROX_FDTYPE_PIPE = @as(c_int, 6);
pub const PROX_FDTYPE_FSEVENTS = @as(c_int, 7);
pub const PROX_FDTYPE_NETPOLICY = @as(c_int, 9);
pub const PROX_FDTYPE_CHANNEL = @as(c_int, 10);
pub const PROX_FDTYPE_NEXUS = @as(c_int, 11);
pub const PROC_CHANNEL_TYPE_USER_PIPE = @as(c_int, 0);
pub const PROC_CHANNEL_TYPE_KERNEL_PIPE = @as(c_int, 1);
pub const PROC_CHANNEL_TYPE_NET_IF = @as(c_int, 2);
pub const PROC_CHANNEL_TYPE_FLOW_SWITCH = @as(c_int, 3);
pub const PROC_CHANNEL_FLAGS_MONITOR_TX = @as(c_int, 0x1);
pub const PROC_CHANNEL_FLAGS_MONITOR_RX = @as(c_int, 0x2);
pub const PROC_CHANNEL_FLAGS_MONITOR_NO_COPY = @as(c_int, 0x4);
pub const PROC_CHANNEL_FLAGS_EXCLUSIVE = @as(c_int, 0x10);
pub const PROC_CHANNEL_FLAGS_USER_PACKET_POOL = @as(c_int, 0x20);
pub const PROC_CHANNEL_FLAGS_DEFUNCT_OK = @as(c_int, 0x40);
pub const PROC_CHANNEL_FLAGS_LOW_LATENCY = @as(c_int, 0x80);
pub const PROC_CHANNEL_FLAGS_MONITOR = PROC_CHANNEL_FLAGS_MONITOR_TX | PROC_CHANNEL_FLAGS_MONITOR_RX;
pub const PROC_PIDLISTFDS = @as(c_int, 1);
pub const PROC_PIDLISTFD_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_fdinfo);
pub const PROC_PIDTASKALLINFO = @as(c_int, 2);
pub const PROC_PIDTASKALLINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_taskallinfo);
pub const PROC_PIDTBSDINFO = @as(c_int, 3);
pub const PROC_PIDTBSDINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_bsdinfo);
pub const PROC_PIDTASKINFO = @as(c_int, 4);
pub const PROC_PIDTASKINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_taskinfo);
pub const PROC_PIDTHREADINFO = @as(c_int, 5);
pub const PROC_PIDTHREADINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_threadinfo);
pub const PROC_PIDLISTTHREADS = @as(c_int, 6);
pub const PROC_PIDLISTTHREADS_SIZE = @as(c_int, 2) * @import("std").zig.c_translation.sizeof(u32);
pub const PROC_PIDREGIONINFO = @as(c_int, 7);
pub const PROC_PIDREGIONINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_regioninfo);
pub const PROC_PIDREGIONPATHINFO = @as(c_int, 8);
pub const PROC_PIDREGIONPATHINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_regionwithpathinfo);
pub const PROC_PIDVNODEPATHINFO = @as(c_int, 9);
pub const PROC_PIDVNODEPATHINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_vnodepathinfo);
pub const PROC_PIDTHREADPATHINFO = @as(c_int, 10);
pub const PROC_PIDTHREADPATHINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_threadwithpathinfo);
pub const PROC_PIDPATHINFO = @as(c_int, 11);
pub const PROC_PIDPATHINFO_SIZE = MAXPATHLEN;
pub const PROC_PIDPATHINFO_MAXSIZE = @as(c_int, 4) * MAXPATHLEN;
pub const PROC_PIDWORKQUEUEINFO = @as(c_int, 12);
pub const PROC_PIDWORKQUEUEINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_workqueueinfo);
pub const PROC_PIDT_SHORTBSDINFO = @as(c_int, 13);
pub const PROC_PIDT_SHORTBSDINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_bsdshortinfo);
pub const PROC_PIDLISTFILEPORTS = @as(c_int, 14);
pub const PROC_PIDLISTFILEPORTS_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_fileportinfo);
pub const PROC_PIDTHREADID64INFO = @as(c_int, 15);
pub const PROC_PIDTHREADID64INFO_SIZE = @import("std").zig.c_translation.sizeof(struct_proc_threadinfo);
pub const PROC_PID_RUSAGE = @as(c_int, 16);
pub const PROC_PID_RUSAGE_SIZE = @as(c_int, 0);
pub const PROC_PIDFDVNODEINFO = @as(c_int, 1);
pub const PROC_PIDFDVNODEINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_vnode_fdinfo);
pub const PROC_PIDFDVNODEPATHINFO = @as(c_int, 2);
pub const PROC_PIDFDVNODEPATHINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_vnode_fdinfowithpath);
pub const PROC_PIDFDSOCKETINFO = @as(c_int, 3);
pub const PROC_PIDFDSOCKETINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_socket_fdinfo);
pub const PROC_PIDFDPSEMINFO = @as(c_int, 4);
pub const PROC_PIDFDPSEMINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_psem_fdinfo);
pub const PROC_PIDFDPSHMINFO = @as(c_int, 5);
pub const PROC_PIDFDPSHMINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_pshm_fdinfo);
pub const PROC_PIDFDPIPEINFO = @as(c_int, 6);
pub const PROC_PIDFDPIPEINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_pipe_fdinfo);
pub const PROC_PIDFDKQUEUEINFO = @as(c_int, 7);
pub const PROC_PIDFDKQUEUEINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_kqueue_fdinfo);
pub const PROC_PIDFDATALKINFO = @as(c_int, 8);
pub const PROC_PIDFDATALKINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_appletalk_fdinfo);
pub const PROC_PIDFDCHANNELINFO = @as(c_int, 10);
pub const PROC_PIDFDCHANNELINFO_SIZE = @import("std").zig.c_translation.sizeof(struct_channel_fdinfo);
pub const PROC_PIDFILEPORTVNODEPATHINFO = @as(c_int, 2);
pub const PROC_PIDFILEPORTVNODEPATHINFO_SIZE = PROC_PIDFDVNODEPATHINFO_SIZE;
pub const PROC_PIDFILEPORTSOCKETINFO = @as(c_int, 3);
pub const PROC_PIDFILEPORTSOCKETINFO_SIZE = PROC_PIDFDSOCKETINFO_SIZE;
pub const PROC_PIDFILEPORTPSHMINFO = @as(c_int, 5);
pub const PROC_PIDFILEPORTPSHMINFO_SIZE = PROC_PIDFDPSHMINFO_SIZE;
pub const PROC_PIDFILEPORTPIPEINFO = @as(c_int, 6);
pub const PROC_PIDFILEPORTPIPEINFO_SIZE = PROC_PIDFDPIPEINFO_SIZE;
pub const PROC_SELFSET_PCONTROL = @as(c_int, 1);
pub const PROC_SELFSET_THREADNAME = @as(c_int, 2);
pub const PROC_SELFSET_THREADNAME_SIZE = MAXTHREADNAMESIZE - @as(c_int, 1);
pub const PROC_SELFSET_VMRSRCOWNER = @as(c_int, 3);
pub const PROC_SELFSET_DELAYIDLESLEEP = @as(c_int, 4);
pub const PROC_DIRTYCONTROL_TRACK = @as(c_int, 1);
pub const PROC_DIRTYCONTROL_SET = @as(c_int, 2);
pub const PROC_DIRTYCONTROL_GET = @as(c_int, 3);
pub const PROC_DIRTYCONTROL_CLEAR = @as(c_int, 4);
pub const PROC_DIRTY_TRACK = @as(c_int, 0x1);
pub const PROC_DIRTY_ALLOW_IDLE_EXIT = @as(c_int, 0x2);
pub const PROC_DIRTY_DEFER = @as(c_int, 0x4);
pub const PROC_DIRTY_LAUNCH_IN_PROGRESS = @as(c_int, 0x8);
pub const PROC_DIRTY_DEFER_ALWAYS = @as(c_int, 0x10);
pub const PROC_DIRTY_SHUTDOWN_ON_CLEAN = @as(c_int, 0x20);
pub const PROC_DIRTY_TRACKED = @as(c_int, 0x1);
pub const PROC_DIRTY_ALLOWS_IDLE_EXIT = @as(c_int, 0x2);
pub const PROC_DIRTY_IS_DIRTY = @as(c_int, 0x4);
pub const PROC_DIRTY_LAUNCH_IS_IN_PROGRESS = @as(c_int, 0x8);
pub const PROC_UDATA_INFO_GET = @as(c_int, 1);
pub const PROC_UDATA_INFO_SET = @as(c_int, 2);
pub const __OS_AVAILABILITY__ = "";
pub const API_TO_BE_DEPRECATED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const API_TO_BE_DEPRECATED_MACOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const API_TO_BE_DEPRECATED_IOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const API_TO_BE_DEPRECATED_TVOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const API_TO_BE_DEPRECATED_WATCHOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const API_TO_BE_DEPRECATED_DRIVERKIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const API_TO_BE_DEPRECATED_VISIONOS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 100000, .decimal);
pub const API_AVAILABLE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:104:13
pub const API_AVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:105:13
pub const API_AVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:106:13
pub const API_DEPRECATED = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:127:13
pub const API_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:128:13
pub const API_DEPRECATED_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:130:13
pub const API_DEPRECATED_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:131:13
pub const API_DEPRECATED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:133:13
pub const API_DEPRECATED_WITH_REPLACEMENT_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:134:13
pub const API_OBSOLETED = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:154:13
pub const API_OBSOLETED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:155:13
pub const API_OBSOLETED_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:157:13
pub const API_OBSOLETED_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:158:13
pub const API_OBSOLETED_WITH_REPLACEMENT_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:160:13
pub const API_OBSOLETED_WITH_REPLACEMENT_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:161:13
pub const API_UNAVAILABLE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:172:13
pub const API_UNAVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:174:13
pub const API_UNAVAILABLE_END = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:175:13
pub const SPI_AVAILABLE = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:264:11
pub const SPI_AVAILABLE_BEGIN = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:268:11
pub const SPI_AVAILABLE_END = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:272:11
pub const SPI_DEPRECATED = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:276:11
pub const SPI_DEPRECATED_WITH_REPLACEMENT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /nix/store/harnmjs9gfjdrdyj7yizcncq7ipfpbvh-zig-0.15.2/lib/zig/libc/include/any-macos-any/os/availability.h:280:11
pub const PROC_LISTPIDSPATH_PATH_IS_VOLUME = @as(c_int, 1);
pub const PROC_LISTPIDSPATH_EXCLUDE_EVTONLY = @as(c_int, 2);
pub const PROC_SETPC_NONE = @as(c_int, 0);
pub const PROC_SETPC_THROTTLEMEM = @as(c_int, 1);
pub const PROC_SETPC_SUSPEND = @as(c_int, 2);
pub const PROC_SETPC_TERMINATE = @as(c_int, 3);
pub const PROC_CSM_ALL = @as(c_int, 0x0001);
pub const PROC_CSM_NOSMT = @as(c_int, 0x0002);
pub const PROC_CSM_TECS = @as(c_int, 0x0004);
pub const __darwin_pthread_handler_rec = struct___darwin_pthread_handler_rec;
pub const _opaque_pthread_attr_t = struct__opaque_pthread_attr_t;
pub const _opaque_pthread_cond_t = struct__opaque_pthread_cond_t;
pub const _opaque_pthread_condattr_t = struct__opaque_pthread_condattr_t;
pub const _opaque_pthread_mutex_t = struct__opaque_pthread_mutex_t;
pub const _opaque_pthread_mutexattr_t = struct__opaque_pthread_mutexattr_t;
pub const _opaque_pthread_once_t = struct__opaque_pthread_once_t;
pub const _opaque_pthread_rwlock_t = struct__opaque_pthread_rwlock_t;
pub const _opaque_pthread_rwlockattr_t = struct__opaque_pthread_rwlockattr_t;
pub const _opaque_pthread_t = struct__opaque_pthread_t;
pub const accessx_descriptor = struct_accessx_descriptor;
pub const timespec = struct_timespec;
pub const timeval = struct_timeval;
pub const attrlist = struct_attrlist;
pub const fssearchblock = struct_fssearchblock;
pub const searchstate = struct_searchstate;
pub const group = struct_group;
pub const sudo_conv_message = struct_sudo_conv_message;
pub const sudo_conv_reply = struct_sudo_conv_reply;
pub const sudo_conv_callback = struct_sudo_conv_callback;
pub const sudo_hook = struct_sudo_hook;
pub const sudo_plugin_event = struct_sudo_plugin_event;
pub const passwd = struct_passwd;
pub const policy_plugin = struct_policy_plugin;
pub const io_plugin = struct_io_plugin;
pub const audit_plugin = struct_audit_plugin;
pub const approval_plugin = struct_approval_plugin;
pub const sudoers_group_plugin = struct_sudoers_group_plugin;
pub const pam_message = struct_pam_message;
pub const pam_response = struct_pam_response;
pub const pam_conv = struct_pam_conv;
pub const pam_handle = struct_pam_handle;
pub const pam_repository = struct_pam_repository;
pub const pam_module = struct_pam_module;
pub const timeval64 = struct_timeval64;
pub const itimerval = struct_itimerval;
pub const clockinfo = struct_clockinfo;
pub const tm = struct_tm;
pub const __darwin_arm_exception_state = struct___darwin_arm_exception_state;
pub const __darwin_arm_exception_state64 = struct___darwin_arm_exception_state64;
pub const __darwin_arm_exception_state64_v2 = struct___darwin_arm_exception_state64_v2;
pub const __darwin_arm_thread_state = struct___darwin_arm_thread_state;
pub const __darwin_arm_thread_state64 = struct___darwin_arm_thread_state64;
pub const __darwin_arm_vfp_state = struct___darwin_arm_vfp_state;
pub const __darwin_arm_neon_state64 = struct___darwin_arm_neon_state64;
pub const __darwin_arm_neon_state = struct___darwin_arm_neon_state;
pub const __arm_pagein_state = struct___arm_pagein_state;
pub const __darwin_arm_sme_state = struct___darwin_arm_sme_state;
pub const __darwin_arm_sve_z_state = struct___darwin_arm_sve_z_state;
pub const __darwin_arm_sve_p_state = struct___darwin_arm_sve_p_state;
pub const __darwin_arm_sme_za_state = struct___darwin_arm_sme_za_state;
pub const __darwin_arm_sme2_state = struct___darwin_arm_sme2_state;
pub const __arm_legacy_debug_state = struct___arm_legacy_debug_state;
pub const __darwin_arm_debug_state32 = struct___darwin_arm_debug_state32;
pub const __darwin_arm_debug_state64 = struct___darwin_arm_debug_state64;
pub const __darwin_arm_cpmu_state64 = struct___darwin_arm_cpmu_state64;
pub const __darwin_mcontext32 = struct___darwin_mcontext32;
pub const __darwin_mcontext64 = struct___darwin_mcontext64;
pub const __darwin_sigaltstack = struct___darwin_sigaltstack;
pub const __darwin_ucontext = struct___darwin_ucontext;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const __siginfo = struct___siginfo;
pub const __sigaction_u = union___sigaction_u;
pub const __sigaction = struct___sigaction;
pub const sigaction = struct_sigaction;
pub const sigvec = struct_sigvec;
pub const sigstack = struct_sigstack;
pub const au_tid = struct_au_tid;
pub const au_tid_addr = struct_au_tid_addr;
pub const au_mask = struct_au_mask;
pub const auditinfo = struct_auditinfo;
pub const auditinfo_addr = struct_auditinfo_addr;
pub const auditpinfo = struct_auditpinfo;
pub const auditpinfo_addr = struct_auditpinfo_addr;
pub const au_session = struct_au_session;
pub const au_expire_after = struct_au_expire_after;
pub const au_token = struct_au_token;
pub const au_qctrl = struct_au_qctrl;
pub const audit_stat = struct_audit_stat;
pub const audit_fstat = struct_audit_fstat;
pub const au_evclass_map = struct_au_evclass_map;
pub const audit_session_flags = enum_audit_session_flags;
pub const mach_port_status = struct_mach_port_status;
pub const mach_port_limits = struct_mach_port_limits;
pub const mach_port_info_ext = struct_mach_port_info_ext;
pub const mach_port_guard_info = struct_mach_port_guard_info;
pub const mach_port_qos = struct_mach_port_qos;
pub const mach_service_port_info = struct_mach_service_port_info;
pub const mach_port_options = struct_mach_port_options;
pub const mach_port_guard_exception_codes = enum_mach_port_guard_exception_codes;
pub const label = struct_label;
pub const ucred = struct_ucred;
pub const posix_cred = struct_posix_cred;
pub const xucred = struct_xucred;
pub const kevent64_s = struct_kevent64_s;
pub const knote = struct_knote;
pub const klist = struct_klist;
pub const session = struct_session;
pub const pgrp = struct_pgrp;
pub const proc = struct_proc;
pub const vmspace = struct_vmspace;
pub const vnode = struct_vnode;
pub const rusage = struct_rusage;
pub const extern_proc = struct_extern_proc;
pub const ctlname = struct_ctlname;
pub const _pcred = struct__pcred;
pub const _ucred = struct__ucred;
pub const kinfo_proc = struct_kinfo_proc;
pub const xsw_usage = struct_xsw_usage;
pub const loadavg = struct_loadavg;
pub const dl_info = struct_dl_info;
pub const ostat = struct_ostat;
pub const _filesec = struct__filesec;
pub const fsobj_id = struct_fsobj_id;
pub const attribute_set = struct_attribute_set;
pub const attrreference = struct_attrreference;
pub const diskextent = struct_diskextent;
pub const vol_capabilities_attr = struct_vol_capabilities_attr;
pub const vol_attributes_attr = struct_vol_attributes_attr;
pub const fsid = struct_fsid;
pub const secure_boot_cryptex_args = struct_secure_boot_cryptex_args;
pub const graft_args = union_graft_args;
pub const vfsstatfs = struct_vfsstatfs;
pub const vfsconf = struct_vfsconf;
pub const vfsidctl = struct_vfsidctl;
pub const vfsquery = struct_vfsquery;
pub const vfs_server = struct_vfs_server;
pub const netfs_status = struct_netfs_status;
pub const fhandle = struct_fhandle;
pub const rusage_info_v0 = struct_rusage_info_v0;
pub const rusage_info_v1 = struct_rusage_info_v1;
pub const rusage_info_v2 = struct_rusage_info_v2;
pub const rusage_info_v3 = struct_rusage_info_v3;
pub const rusage_info_v4 = struct_rusage_info_v4;
pub const rusage_info_v5 = struct_rusage_info_v5;
pub const rusage_info_v6 = struct_rusage_info_v6;
pub const rlimit = struct_rlimit;
pub const proc_rlimit_control_wakeupmon = struct_proc_rlimit_control_wakeupmon;
pub const iovec = struct_iovec;
pub const sockaddr = struct_sockaddr;
pub const sa_endpoints = struct_sa_endpoints;
pub const linger = struct_linger;
pub const so_np_extensions = struct_so_np_extensions;
pub const __sockaddr_header = struct___sockaddr_header;
pub const sockproto = struct_sockproto;
pub const sockaddr_storage = struct_sockaddr_storage;
pub const msghdr = struct_msghdr;
pub const cmsghdr = struct_cmsghdr;
pub const sf_hdtr = struct_sf_hdtr;
pub const sockaddr_un = struct_sockaddr_un;
pub const ctl_event_data = struct_ctl_event_data;
pub const ctl_info = struct_ctl_info;
pub const sockaddr_ctl = struct_sockaddr_ctl;
pub const net_event_data = struct_net_event_data;
pub const timeval32 = struct_timeval32;
pub const if_data = struct_if_data;
pub const if_data64 = struct_if_data64;
pub const ifnet_interface_advisory = struct_ifnet_interface_advisory;
pub const ifqueue = struct_ifqueue;
pub const if_clonereq = struct_if_clonereq;
pub const if_msghdr = struct_if_msghdr;
pub const ifa_msghdr = struct_ifa_msghdr;
pub const ifma_msghdr = struct_ifma_msghdr;
pub const if_msghdr2 = struct_if_msghdr2;
pub const ifma_msghdr2 = struct_ifma_msghdr2;
pub const ifdevmtu = struct_ifdevmtu;
pub const ifkpi = struct_ifkpi;
pub const ifreq = struct_ifreq;
pub const ifaliasreq = struct_ifaliasreq;
pub const rslvmulti_req = struct_rslvmulti_req;
pub const ifmediareq = struct_ifmediareq;
pub const ifdrv = struct_ifdrv;
pub const ifstat = struct_ifstat;
pub const ifconf = struct_ifconf;
pub const kev_dl_proto_data = struct_kev_dl_proto_data;
pub const rt_metrics = struct_rt_metrics;
pub const rtstat = struct_rtstat;
pub const rt_msghdr = struct_rt_msghdr;
pub const rt_msghdr2 = struct_rt_msghdr2;
pub const rt_msghdr_prelude = struct_rt_msghdr_prelude;
pub const rt_addrinfo = struct_rt_addrinfo;
pub const in_addr = struct_in_addr;
pub const sockaddr_in = struct_sockaddr_in;
pub const ip_opts = struct_ip_opts;
pub const ip_mreq = struct_ip_mreq;
pub const ip_mreqn = struct_ip_mreqn;
pub const ip_mreq_source = struct_ip_mreq_source;
pub const group_req = struct_group_req;
pub const group_source_req = struct_group_source_req;
pub const __msfilterreq = struct___msfilterreq;
pub const in_pktinfo = struct_in_pktinfo;
pub const in6_addr = struct_in6_addr;
pub const sockaddr_in6 = struct_sockaddr_in6;
pub const ipv6_mreq = struct_ipv6_mreq;
pub const in6_pktinfo = struct_in6_pktinfo;
pub const ip6_mtuinfo = struct_ip6_mtuinfo;
pub const tcphdr = struct_tcphdr;
pub const tcp_connection_info = struct_tcp_connection_info;
pub const proc_bsdinfo = struct_proc_bsdinfo;
pub const proc_bsdshortinfo = struct_proc_bsdshortinfo;
pub const proc_taskinfo = struct_proc_taskinfo;
pub const proc_taskallinfo = struct_proc_taskallinfo;
pub const proc_threadinfo = struct_proc_threadinfo;
pub const proc_regioninfo = struct_proc_regioninfo;
pub const proc_workqueueinfo = struct_proc_workqueueinfo;
pub const proc_fileinfo = struct_proc_fileinfo;
pub const proc_exitreasonbasicinfo = struct_proc_exitreasonbasicinfo;
pub const proc_exitreasoninfo = struct_proc_exitreasoninfo;
pub const vinfo_stat = struct_vinfo_stat;
pub const vnode_info = struct_vnode_info;
pub const vnode_info_path = struct_vnode_info_path;
pub const vnode_fdinfo = struct_vnode_fdinfo;
pub const vnode_fdinfowithpath = struct_vnode_fdinfowithpath;
pub const proc_regionwithpathinfo = struct_proc_regionwithpathinfo;
pub const proc_regionpath = struct_proc_regionpath;
pub const proc_vnodepathinfo = struct_proc_vnodepathinfo;
pub const proc_threadwithpathinfo = struct_proc_threadwithpathinfo;
pub const in4in6_addr = struct_in4in6_addr;
pub const in_sockinfo = struct_in_sockinfo;
pub const tcp_sockinfo = struct_tcp_sockinfo;
pub const un_sockinfo = struct_un_sockinfo;
pub const ndrv_info = struct_ndrv_info;
pub const kern_event_info = struct_kern_event_info;
pub const kern_ctl_info = struct_kern_ctl_info;
pub const vsock_sockinfo = struct_vsock_sockinfo;
pub const sockbuf_info = struct_sockbuf_info;
pub const socket_info = struct_socket_info;
pub const socket_fdinfo = struct_socket_fdinfo;
pub const psem_info = struct_psem_info;
pub const psem_fdinfo = struct_psem_fdinfo;
pub const pshm_info = struct_pshm_info;
pub const pshm_fdinfo = struct_pshm_fdinfo;
pub const pipe_info = struct_pipe_info;
pub const pipe_fdinfo = struct_pipe_fdinfo;
pub const kqueue_info = struct_kqueue_info;
pub const kqueue_dyninfo = struct_kqueue_dyninfo;
pub const kqueue_fdinfo = struct_kqueue_fdinfo;
pub const appletalk_info = struct_appletalk_info;
pub const appletalk_fdinfo = struct_appletalk_fdinfo;
pub const proc_fdinfo = struct_proc_fdinfo;
pub const proc_fileportinfo = struct_proc_fileportinfo;
pub const proc_channel_info = struct_proc_channel_info;
pub const channel_fdinfo = struct_channel_fdinfo;
