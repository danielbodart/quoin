/* quoin-sudo-load PLUGIN SYMBOL PAM_MODULE KEYS: the loads of the darwin
 * pre-flight (quoin-sudo-check-plugin-darwin.zig), in C because they must
 * run in an arm64e process, as Apple's sudo is one, and Zig cannot build
 * arm64e. Loads the plugin with every symbol bound, checks SYMBOL is an
 * audit plugin of sudo's API major with open, accept and close, and that a
 * sudo it cannot arm for -- a terminal's, another user's, remote off -- is
 * opened, not armed and accepted, wherever this runs (an activation over
 * ssh is under sshd-session too). Then loads the PAM module, which must
 * export pam_sm_authenticate and pam_sm_setcred and ignore a call with no
 * handle. Exits 1 with the first failure on stderr. */
#include <dlfcn.h>
#include <stdio.h>
#include <security/pam_appl.h>
#include "sudo_plugin.h"

static int fail(const char *what, const char *detail) {
  fprintf(stderr, "quoin-sudo-load: %s%s%s\n", what, detail ? ": " : "", detail ? detail : "");
  return 1;
}

static int quiet(int type, const char *fmt, ...) { (void)type; (void)fmt; return 0; }

int main(int argc, char **argv) {
  if (argc != 5) return fail("usage: quoin-sudo-load PLUGIN SYMBOL PAM_MODULE KEYS", NULL);
  /* sudo has Apple's libpam loaded; the plugin and the PAM module bind PAM
   * from it, so this loads it first, as sudo has. */
  if (!dlopen("/usr/lib/libpam.2.dylib", RTLD_NOW | RTLD_GLOBAL)) return fail("cannot load Apple's libpam", dlerror());
  void *lib = dlopen(argv[1], RTLD_NOW | RTLD_LOCAL);
  if (!lib) return fail("the plugin does not load", dlerror());
  struct audit_plugin *p = dlsym(lib, argv[2]);
  if (!p) return fail("the plugin has no symbol", argv[2]);
  if (p->type != SUDO_AUDIT_PLUGIN) return fail("the symbol is not an audit plugin", argv[2]);
  if (SUDO_API_VERSION_GET_MAJOR(p->version) != SUDO_API_VERSION_MAJOR) return fail("the plugin is not of sudo's API major", NULL);
  if (!p->open || !p->accept || !p->close) return fail("the plugin's open, accept or close is missing", NULL);
  int (*armed)(void) = (int (*)(void))dlsym(lib, "quoin_sudo_armed");
  if (!armed) return fail("the plugin does not export quoin_sudo_armed", NULL);

  char keys[1100];
  snprintf(keys, sizeof keys, "keys=%s", argv[4]);
  char *on[] = { "user=dan", "remote", keys, NULL };
  char *off[] = { "user=dan", keys, NULL };
  char *sudo_argv[] = { "sudo", "/usr/bin/true", NULL };
  char *envp[] = { "PATH=/usr/bin:/bin", "SSH_AUTH_SOCK=/nonexistent/agent", NULL };
  char *info[] = { "command=/usr/bin/true", "runas_user=root", NULL };
  char *run[] = { "/usr/bin/true", NULL };
  struct { const char *what; char **opts; char *user_info[8]; } cases[] = {
    { "a terminal's sudo", on, { "user=dan", "uid=501", "gid=20", "tty=/dev/ttys000", "cwd=/", NULL } },
    { "another user's sudo", on, { "user=nobody", "uid=4294967294", "gid=4294967294", "cwd=/", NULL } },
    { "a sudo with remote off", off, { "user=dan", "uid=501", "gid=20", "cwd=/", NULL } },
  };
  for (size_t i = 0; i < sizeof cases / sizeof *cases; i++) {
    const char *err = NULL;
    int o = p->open(SUDO_API_VERSION, NULL, quiet, NULL, cases[i].user_info, 1, sudo_argv, envp, cases[i].opts, &err);
    int a = armed();
    int c = p->accept("sudoers_policy", SUDO_POLICY_PLUGIN, info, run, envp, &err);
    p->close(0, 0);
    if (o != 1 || a != 0 || c != 1) return fail("the plugin is not stock for", cases[i].what);
  }

  void *pam = dlopen(argv[3], RTLD_NOW | RTLD_LOCAL);
  if (!pam) return fail("the PAM module does not load", dlerror());
  int (*authenticate)(pam_handle_t *, int, int, const char **) =
      (int (*)(pam_handle_t *, int, int, const char **))dlsym(pam, "pam_sm_authenticate");
  if (!authenticate || !dlsym(pam, "pam_sm_setcred")) return fail("the PAM module does not export pam_sm_authenticate and pam_sm_setcred", NULL);
  const char *args[] = { "user=dan", "plugin=/nonexistent" };
  if (authenticate(NULL, 0, 2, args) != PAM_IGNORE) return fail("the PAM module does not ignore a call with no handle", NULL);
  return 0;
}
