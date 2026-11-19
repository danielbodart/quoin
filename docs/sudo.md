# quoin-sudo

Gates sudo when no terminal is asking. Each such sudo is one galley item
showing the resolved command. Outside a window it is a dialog that takes
your password, which opens a window for that claude for a time you pick.
Inside the window every command is still shown and asked, with no
password.

```
claude> sudo systemctl restart foo  # galley: "sudo systemctl restart foo"
                                    #   Password [••••]  Remember for [15] [minutes ▾]  [Cancel] [Allow]
quoin-sudo: password remembered for this claude until 16:40

claude> sudo journalctl -u foo      # galley: "sudo journalctl -u foo"   [Refuse] [Allow]

claude> sudo systemctl stop sshd    # galley, danger: "touches a unit that guards this machine"
                                    #   [Refuse] [Allow]   (never opens a window)

$ sudo id                           # in a terminal: stock sudo, the gate never sees it
```

## Setup

```nix
{
  imports = [ inputs.quoin.nixosModules.sudo ];

  services.quoin.sudo = {
    enable = true;
    forUser = "alice";
  };
}
```

Let galley take questions from the gate:

```nix
services.galley.services = { sudo-gate = "sudo"; };   # home-manager
systemd.tmpfiles.rules = [ "d /run/galley-ask 0755 alice alice -" ];
```

Unset `SUDO_ASKPASS` for anything that runs sudo with no terminal: a sudo
the gate does not take (the gate stopped, `-v`) would run it.

Keep at least five generations in the boot menu before the first switch
(`configurationLimit` null or `>= 5`): a broken sudo is fixed from the
previous generation.

## Options

| Option | Default | Meaning |
|---|---|---|
| `enable` | `false` | The plugin line in `/etc/sudo.conf`, the PAM rule, the `quoin-sudo` PAM service, the sudoers defaults and the gate. |
| `forUser` | `"dan"` | The gated user, and whose galley is asked. |
| `remoteKeys` | `[ ]` | SSH public key lines whose signature approves a remote sudo (below); empty is remote mode off. |
| `danger.<pattern>` | `{ }` | Danger rules beside the built-in catalogue (below): `reason` for any command the pattern matches, `args.<glob>` for one with an argument the glob matches. |
| `exec.<pattern>.answer` | | The host's exec rules ([Rules](#rules)): `allow`, `ask` or `refuse` for a resolved command the pattern matches. |
| `exec.<pattern>.runAs` | `"root"` | The user the rule's commands run as; a sudo as anyone else is not the rule's. |

With `services.quoin.policy.courier.enable`, the file also gets
`policy`: the courier's socket, `/etc/quoin/allowed_signers` and the
policy file's name, and the gate reads the project a sudo is run in.

The options are written to `/etc/quoin/sudo.json`, which
`quoin-sudo serve -config` reads, keys named as the options are:

```json
{ "forUser": "alice", "remoteKeys": [ "ecdsa-sha2-nistp256 AAAA… alice@laptop" ],
  "danger": { "reboot **": { "reason": "reboots this machine" },
              "systemctl **": { "args": { "postgresql*": "touches the database" } } },
  "exec": { "/run/current-system/sw/bin/journalctl **": { "runAs": "root", "answer": "allow" } },
  "policy": { "courier": "/run/quoin-courier/sock",
              "allowedSigners": "/etc/quoin/allowed_signers", "fileName": "chase.json" } }
```

A key it does not know (a rule's spelt in another case included), a
remote key that does not parse, or a danger or exec rule that does not
compile stops it starting; the build runs `quoin-sudo
check` on the file first, and a change restarts the gate. `quoin-sudo
schema` prints its JSON Schema.

The module sets `Defaults noninteractive_auth` and `Defaults
timestamp_type=tty`, and evaluation fails when:

- sudo's auth stack is anything but the helper, `pam_unix`, `pam_deny`,
  or the `quoin-sudo` PAM service's anything but `pam_unix`, `pam_deny`;
- sudoers sets another `timestamp_type` (`!tty_tickets` included), or
  `rootpw`, `targetpw`, `runaspw`, `intercept` or `log_subcmds` (as
  options or as `INTERCEPT:` and `LOG_SUBCMDS:` tags);
- `kernel.yama.ptrace_scope` is 0.

The plugin is built against `security.sudo.package`, and `/etc/sudo.conf`
is built only once `quoin-sudo-check-plugin` has loaded the plugin as sudo
would and found an audit plugin for this sudo's version.

## What is gated

A sudo of `forUser`'s with no tty, not under an ssh login or in a mosey
session, and not `-v` or `-l`. Everything else is stock sudo: a terminal,
another user, root, `ssh host 'sudo -S …'`, unless remote mode takes it.
An ssh login is the user's `sshd-session` under root's in the sudo's
chain; a mosey session is the user's `mosey --serve=spawner` in it,
known by its argv since its comm is `exe`.

A gated sudo skips `pam_unix` and asks the gate. With no tty, `-S`, `-A`,
a sudoers ticket and NOPASSWD are all ignored: the dialog's password is
the one checked. `sudo -n` gets the dialog too.

- **A rule matching** (the host's or the project's, [Rules](#rules)):
  allowed with no password, asked with none, or refused, but never for
  a danger or a warning.
- **Outside a window**: the dialog. A wrong password brings it back. A
  verified one runs the command and, with a time above 0, opens a window.
- **Inside a window**: a question, Allow or Refuse. The window is
  keyed on the claude and pinned to the galley process that took the
  password; it ends at its time, or when either exits. An Allow from any
  other galley process is a refusal.
- **Danger**: a `systemctl` on `quoin*`, `galley*`, `sshd*`,
  `nftables*` or `debug-shell*`, a command matching a `danger` rule, a
  program outside `/run/current-system/sw/bin`, `/run/wrappers/bin` and
  `/etc/profiles/per-user/<user>/bin`, or a `<shell> -c STRING` (`sh`,
  `bash`, `dash`, `zsh`, `ksh`, `mksh`, `fish`, …), `sudo -s`, `sudo -i`
  or `env` whose inner command is either or cannot be read. A shell run
  any other way (`bash -lc`, `sh -c -- …`, `bash script.sh`, a bare
  `sudo -s`) cannot be read. Shown with galley's danger banner, always
  asked, never opens a window; its dialog has no time field. The
  catalogue's units are quoin's own and those any host has; a host adds
  the units that guard it besides, frisket's say, as `danger` rules:
  `danger."systemctl **".args."frisket*" = "touches a unit that guards this machine";`
- **Warning**: a process chain cut short, or launched straight from
  `systemd --user`. No time field.
- Variables outside the allowlist (`HOME`, `PATH`, `TERM`, `LANG`,
  `LC_*`, `DISPLAY`, `SUDO_*`, `LS_COLORS`, `XDG_CURRENT_DESKTOP`, …)
  are shown in a block of their own under the command, each cut to 80
  characters, and keep the request from any exec rule.

A refusal is sudo's own line:

```
sudo: quoin_audit: unable to log accept event: cancelled
```

A sudo that is killed withdraws its item; until it runs the command, sudo
holds SIGTERM, SIGINT, SIGHUP and SIGQUIT, so only SIGKILL does. Nothing
that waits on you times out: a sudo waits until it is answered or killed.
The check-in waits too: a gate that is down refuses it at once, and one
that keeps crashing is given up on by systemd, whose closing the socket
fails the sudos waiting on it.

## Rules

Exec rules answer a sudo before any dialog: the host's, from
`services.quoin.sudo.exec`, and the project's, from the `sudo`
section of the signed `chase.json` the sudo is run in.

```nix
services.quoin.sudo.exec = {
  "/run/current-system/sw/bin/journalctl **".answer = "allow";
  "/run/current-system/sw/bin/journalctl ** [arg --vacuum*]".answer = "ask";
  "/run/current-system/sw/bin/reboot **".answer = "refuse";
};
```

```json
{ "version": 2,
  "sudo": { "exec": { "/run/current-system/sw/bin/systemctl restart foo.service": { "runAs": "root", "answer": "ask" },
                      "/run/current-system/sw/bin/reboot **": null } } }
```

```
claude> sudo journalctl -u foo      # runs: no dialog, no password
claude> sudo systemctl restart foo  # galley: "asked, with no password, by the project rule …"  [Refuse] [Allow]
claude> sudo shutdown now           # no rule: the password dialog, as ever
claude> sudo systemctl stop sshd    # danger: the dialog, whatever a rule says
```

- **Patterns** are execrule's, over the resolved command: the program's
  absolute path, as the dialog shows it, then its arguments. `*` is one
  word, a last `**` any number; ` [arg GLOB]` after a pattern makes an
  arg rule, which only asks or refuses, for a command with an argument
  the glob matches (`*` any run of characters but `/`). A literal pattern
  beats a pattern, a narrower one a wider one, and an arg rule only makes
  the answer stricter. A pattern whose first word is not an absolute,
  clean path could never match, and is refused.
- **Answers**: `allow` runs the command with no question and no password;
  `ask` is a plain Allow/Refuse question with no password, inside a
  window or not, which opens no window; `refuse` is sudo's own refusal
  line, naming the rule
  (`unable to log accept event: refused by the host rule /run/current-system/sw/bin/reboot **`).
  No rule matching is the dialog, or the window's question, as without
  rules. An arg rule asking about a command no command rule matches
  leaves it the dialog: the password is the stricter.
- **runAs**: a rule is for the user it names, root by default; a
  `sudo -u lp` is decided by `lp`'s rules alone.
- **Never a rule's**, fixed in the gate whatever any rule says: a danger
  (the catalogue, a `danger` rule, a program outside the root-owned
  directories, an unreadable shell command), a warning (a chain cut short
  or launched from `systemd --user`), a command the gate did not see
  whole, one with a variable outside the allowlist, and a shell,
  `sudo -s`, `sudo -i` or `env`, whose command is another's. Each is
  asked as it is with no rules. Remote mode reads no rules.
- **The project** is the one the courier finds above the working
  directory of the process that ran sudo ([policy.md](policy.md)). Its
  `sudo.exec` is merged over the host's with RFC 7396's merge patch: a
  pattern the host has is replaced, `null` takes it away, a new one is
  added. A project may set `exec` alone. The file counts only when
  `chase.json.sig` verifies against `/etc/quoin/allowed_signers` in
  the project's namespace, the one the courier names (a worktree's is its
  repository's); unsigned, not verifying, or with a `sudo` section a
  project may not set, it is ignored with one
  `project policy ignored` journal line, and the host's rules decide. No
  project, or the courier down, is the host's rules.
- The journal's `decision` has `source` `host rule` or `project rule`,
  with `rule` (the pattern), `answer` and the project's `root`; an
  answered `ask` has `source` `galley` and `rule_source`.

There is no Always for sudo: a project's rule is written into
`chase.json` by hand, or by an agent, and signed (`quoin policy sign`).

## Remote mode

```
claude@laptop> ssh -A desktop sudo systemctl restart foo
                                    # laptop's galley: "sudo systemctl restart foo on desktop"
                                    #   /run/current-system/sw/bin/systemctl restart foo
                                    #   dan as root in /home/dan
                                    #   from here: claude ← ssh -A desktop sudo systemctl restart foo
                                    #   [desktop's chain: PID / Process / Command]
                                    #   [Refuse] [Allow]
```

On a host whose gate has `remoteKeys`, a sudo of `forUser`'s with no tty
whose `SSH_AUTH_SOCK` is a forwarded agent is approved by a signature from
one of those keys:

```nix
services.quoin.sudo.remoteKeys = [ "ecdsa-sha2-nistp256 AAAA… alice@laptop" ];
```

The keys are written to `/etc/quoin/sudo.json` and `remote` is
added to the plugin line; there are no new PAM lines. The client needs
only `ForwardAgent` for the host.

The agent is forwarded when the process serving `SSH_AUTH_SOCK` is a
forwarder. At open the plugin connects to the socket as the invoking user,
takes the listener's pid and uid from `SO_PEERCRED`, and reads its program
from `/proc/<pid>/exe` as root (an `sshd-session` is not dumpable, so the
user cannot). It is a forwarder when it runs as the invoking user and its
program is `sshd-session` (`sshd` before OpenSSH 9.8) or mosey (`mosey` or
nixpkgs' `.mosey-wrapped`, wherever it lives, `~/.local/bin` included).
The connection is kept and the signature asked on it, so the sudo opens
one forwarded channel, not two, and closed as soon as the agent answers,
so the command sudo runs after (`sudo -b`, a long job) holds no channel,
nor `ssh`, open. This is who serves the agent, not what the
chain looks like, so a sudo reparented away from its login (`setsid`,
tmux) or run under mosey, whose spawner is no `sshd-session`, is remote
all the same. The connect never waits: a listener with a full backlog is
no agent. A Mac asks the same question with its own calls
([macOS](#macos)).

The gate classifies the command as for a local sudo and hands the plugin a
message to sign, `quoin-sudo-v1`: a nonce, the host's keys, then named
fields -- the user, the runas user, the cwd, the resolved command, the
danger lines, the variables outside the allowlist, and the sudo's process
chain as the plugin read it as root, up to 16 links. A message over the agent's limit
has the chain's command lines left out from the top of the chain down
until it fits, and says so; the command, danger lines and variables are
never cut, and what still does not fit is refused, "command too long for
the gate". The plugin connects
to the forwarded agent as the invoking user and asks for a plain signature
with the first listed key the agent holds. quoin-signer on the client
asks every time, naming the host from `/etc/ssh/ssh_known_hosts`, and
refuses unless its forwarded session is bound to one of the message's host
keys; no grant or window skips it. A stock agent holding a listed key
signs without asking.

quoin-signer asks it as the host would ask that sudo locally, by the same
builder (`internal/sudoq`): the host's chain is the table, the title ends
"on <host>", and the chain of the ssh on this machine is shown only on
lines of its own, each `from here: `, whose warnings raise a normal
question to a warning. A message that does not read strictly is refused
unasked.

**Fields, not versions.** The message grows by adding fields, never by a
new magic. A field's key is marked critical with a `!`; a signer that
meets a critical field it does not know refuses the sudo unasked, naming
it, and one that meets an unmarked field it does not know drops it, the
journal naming it in `fields_ignored`. Every field today is critical,
since each is part of what is approved. A field may go unmarked only when
a signer could leave it unshown without changing what is approved -- a
hint, say, or something that only adds to the picture -- and never when
anything else is left out or relaxed because it is there. That is no
downgrade: the gate alone writes the message and checks the signature
over its own bytes, so nothing between can strip a field, and an older
signer asks what it always asked.

**Upgrading from the first layout.** Before the fields, the message was
the user, runas, cwd and command, a level and its reasons. A signer from
then reads today's message as that layout, finds it malformed and
refuses; a signer now refuses a message from a gate of then. Neither asks
anything else, so a remote sudo between a host and a laptop on either
side of this change is refused until both are updated, in either order.

A sudo with a tty (`ssh -t`) asks the host's own password, as stock. No
forwarded agent, no `remoteKeys`, or the gate down is stock too: "a
terminal is required". So is an agent that is not forwarded -- an
`ssh-agent` started in the login, a relay of another program's or another
user's, a socket nobody listens on -- for a sudo in an ssh login or a
mosey session, which never asks the host's own galley. A detached sudo
with no forwarded agent is gated locally, as any other. The agent refusing, failing or holding no listed
key refuses the sudo:

```
quoin-sudo: the forwarded agent refused
sudo: quoin_audit: unable to log accept event
```

## macOS

A Mac takes remote mode alone, from nix-darwin:

```nix
imports = [ quoin.darwinModules.sudo ];
services.quoin.sudo = {
  enable = true;
  remoteKeys = [ "ecdsa-sha2-nistp256 AAAA… alice@laptop" ];
};
```

A Mac has no galley of its own to ask and is reached over ssh, so there is
no local mode and no gate daemon: remote mode reads no rules, and the
plugin (`sudo/quoin_sudo_darwin.zig`) does the gate's remote half in sudo's
own process. It is the Linux plugin and gate, step for step:

- **open** arms on the gated user, not `-l` or `-v`, no tty, `remote`,
  an absolute `SSH_AUTH_SOCK` served by a forwarder, and listed keys that
  parse. Any miss is stock sudo. Who serves the agent is asked as on
  Linux, with the Mac's calls: the plugin connects as the invoking user,
  takes the listener's uid from `LOCAL_PEERCRED` and its pid from
  `LOCAL_PEERPID`, and reads its program as root with `proc_pidpath`; a
  forwarder is the user's own `sshd-session`, `sshd` or mosey, wherever
  it lives. So a sudo under mosey, or reparented away from its login, is
  remote on a Mac too. The connection is kept for the signature, closed as soon as the agent answers, and the
  connect never waits. A drop to the user or a restore that fails
  refuses the sudo.
- **PAM**: `quoin_sudo_pam.so`, `sufficient`, first in `sudo_local` (macOS
  has no `pam_exec`). The Linux helper's tests, then, where it asks the
  gate whether its sudo checked in, it asks the plugin in the same sudo
  whether it armed. A plugin that is not loaded or not armed is the
  password.
- **accept** builds the `quoin-sudo-v1` message from sudoers' `command_info` and the
  chain above sudo, byte for byte as `internal/sudomsg`
  (`sudo/sudomsg.zig`, held to the Go golden), cut to fit as the gate cuts
  it, has the forwarded agent sign it on open's connection, and verifies
  the signature itself. The chain is read with `sysctl` where Linux reads
  `/proc`: each link's `kinfo_proc` twice, its start time the check that
  the pid was not reused, and its argv with `KERN_PROCARGS2` between the
  two reads, so the client's table shows the Mac's command lines as a
  Linux host's. A refusal and every failure -- no agent, a hang-up,
  garbage, no listed key, a bad signature -- refuse the sudo, as the gate
  does; none falls back to the password. Nothing waits on a timer.

The listed keys are nistp256 or ed25519, the two Zig's std verifies; a
line of any other type fails the file, and remote mode is off. The module
adds `Defaults noninteractive_auth` and `Defaults timestamp_type=tty`, as
on Linux, so `sudo -n` reaches the gate and a no-tty sudo leaves no ticket;
it refuses another `timestamp_type`. The danger catalogue is not ported
yet: a Mac's message has no danger lines and no variable lines, so its
question is never a danger, and a warning only when its chain is cut
short.

`sudo.conf` names the plugin from the store with `keys=` the listed keys'
file. A `Plugin` line sudo cannot load makes every sudo fatal, so the
activation runs `quoin-sudo-check-plugin PLUGIN SYMBOL PAM_MODULE KEYS`
first, before `/etc` changes, and a failure fails the switch:

- the plugin and the module root-owned, not group- or world-writable, and
  their code signatures verifying (`codesign --verify --strict`);
- the keys parsing;
- `quoin-sudo-load`, arm64e as Apple's sudo is, with Apple's libpam
  loaded as sudo has it, loading both with every symbol bound, the symbol an
  audit plugin of sudo's API major, a sudo the plugin cannot arm for
  (a terminal's, another user's, remote off) opened, unarmed and accepted,
  and the module ignoring a call with no handle.

Decision records go to `/var/log/quoin-sudo.log`, one line each, with the
gate's fields: the nonce, the host key fingerprints, user, runas, cwd,
argv, the chain's comm names as `chain`, `cmdlines_left_out=true` when
command lines were cut to fit, the key that signed, `outcome` and
`source`. Not the unified log:
`os_log` and `syslog` read their format string from the plugin's dylib,
which logd's sandbox may not, and every record reads `<compose failure>`.

**Rollback.** `services.quoin.sudo.enable = false` and a switch. A
`Plugin` line sudo cannot load fails every sudo, a terminal's too, which
is what the pre-flight is for; past it, recovery is at the console.

## Journal

```
journalctl -u quoin-sudo -o cat | jq 'select(.msg == "decision")'
```

One `decision` record per answer: the chain, the anchor, the program and
argv, danger reasons, environment lines, the outcome, and its `source`
(`galley`, `window`, `verified`, `wrong password`, `cancelled`, `nobody`,
`not the pinned galley`, `hung up`, `host rule`, `project rule`). A password appears only as its length.
A remote sudo's records have `remote` set, the message's fields (`user`,
`runas`, `cwd`, `argv`, `danger`, `env`), the `level` the
gate gave it, `cmdlines_left_out` when the chain's command lines were cut
to fit, `truncated` when the plugin's request to the gate was, the host
key fingerprints as `host_keys`, the `nonce`, and the `key` that signed.

quoin-signer's record of a remote sudo (`journalctl -u quoin-signer`,
[signer.md](signer.md)) has the message's `user`, `runas`, `cwd`, `argv`,
`nonce`, `danger` and `env`, the `level` it asked at, the host's chain as
`remote_chain`, command lines and all, beside this machine's `chain`,
`remote_cut` when the host's chain was cut short, `cmdlines_left_out`,
and `fields_ignored`, the unmarked fields it did not know.

## Environment

With NixOS's sudoers, `env_reset` leaves the command, and the gate, this
from a caller with `TERM`, `DISPLAY`, `LANG`, `COLORTERM`, `XAUTHORITY`
and `FOO` set (recorded in the sudo VM test):

```
COLORTERM=truecolor
XAUTHORITY=/home/dan/.Xauthority
LANG=C.UTF-8
TERM=dumb
DISPLAY=:0
PATH=/run/wrappers/bin:/run/current-system/sw/bin
MAIL=/var/mail/root
LOGNAME=root
USER=root
HOME=/root
SHELL=/run/current-system/sw/bin/bash
SUDO_COMMAND=/run/current-system/sw/bin/env
SUDO_USER=dan
SUDO_UID=1000
SUDO_GID=100
SUDO_HOME=/home/dan
```

All of it is on the allowlist, so a plain sudo shows no variable lines.
A sudo from a desktop session also has `LS_COLORS`, `COLORS` and
`XDG_CURRENT_DESKTOP`, from sudo's own `env_keep`; they are on the
allowlist too, since they say how to colour and what desktop it is;
`FOO` arrives only with `--preserve-env=FOO`, and is shown. PAM's session
then adds root's NixOS environment (`GTK_PATH`, `INFOPATH`,
`LIBEXEC_PATH`, `LOCALE_ARCHIVE`, `NIX_PATH`, `TERMINFO_DIRS`, …) after
the gate has answered, so the gate never sees it.

## Recovery

**No-tty sudo says `quoin-sudo: gate not running`.** The gate socket is
down, or systemd gave up on a gate that kept crashing; sudo in a terminal
works as before. A stuck gate does not say this: its sudo waits.

```
systemctl status quoin-sudo.socket quoin-sudo.service
sudo systemctl restart quoin-sudo.socket
```

**No-tty sudo hangs.** galley or the gate is not answering. Kill the sudo
(`kill -KILL`), then check `journalctl -u quoin-sudo`.

**`no one to ask; use a terminal`.** galley is not running, or the socket
at `/run/galley-ask/<user>.sock` is not galley's.

**Rollback.** `services.quoin.sudo.enable = false` removes the
plugin line, the PAM rule and service and the sudoers defaults; set
`SUDO_ASKPASS` back if you use one.

**sudo broken everywhere.** Boot the previous generation from the boot
menu at the console.
