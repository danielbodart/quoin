//! The one file that reads C headers: sudo's plugin API, PAM's, and the
//! libc id calls the drop for the agent's connect makes; on macOS also the
//! PAM module API, sysctl's kinfo_proc and dlfcn, which the darwin build
//! uses in place of /proc and the gate.

const builtin = @import("builtin");

pub const c = @cImport({
    @cDefine("_GNU_SOURCE", {});
    @cInclude("unistd.h");
    @cInclude("grp.h");
    @cInclude("sudo_plugin.h");
    @cInclude("security/pam_appl.h");
    if (builtin.os.tag == .macos) {
        @cInclude("security/pam_modules.h");
        @cInclude("sys/sysctl.h");
        @cInclude("dlfcn.h");
    }
});

pub const api_version: c_uint = (c.SUDO_API_VERSION_MAJOR << 16) | c.SUDO_API_VERSION_MINOR;
