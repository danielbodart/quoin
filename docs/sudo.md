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
services.galley.services = { quoin-sudo = "sudo"; };   # home-manager
systemd.tmpfiles.rules = [ "d /run/galley-ask 0755 alice alice -" ];
```

The gate's user was `sudo-gate`. Its uid, 952, is the same, but galley's
services must name `quoin-sudo`.

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
| `remoteKeys` | `[ ]` | Each of your machines' signer keys, as SSH public key lines, whose signed answer approves a remote sudo ([Remote mode](#remote-mode)); empty is remote mode off. |
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
  other galley process is a refusal. Only whoever opened a window answers
  inside it: here that galley process, for a remote sudo the key that
  signed the dialog's answer ([Remote mode](#remote-mode)). A window of
  one kind never covers a sudo of the other; that sudo gets the dialog.
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
  asked as it is with no rules. A remote sudo is decided by the same
  rules ([Remote mode](#remote-mode)).
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
                                    #   key SHA256:… (laptop)
                                    #   [desktop's chain: PID / Process / Command]
                                    #   Password for dan [••••]  Remember for [15] [minutes ▾]  [Cancel] [Allow]
quoin-sudo: password remembered for this claude until 16:40
```

On a host whose gate has `remoteKeys`, a sudo of `forUser`'s with no tty
whose `SSH_AUTH_SOCK` is a forwarded agent is asked through that agent,
and approved by a signed answer from one of those keys:

```nix
services.quoin.sudo.remoteKeys = [ "ecdsa-sha2-nistp256 AAAA… alice@laptop" ];
```

The keys are written to `/etc/quoin/sudo.json` and `remote` is
added to the plugin line; there are no new PAM lines. The client needs
`ForwardAgent` for the host, and quoin-signer as the agent
([signer.md](signer.md#remote-sudo)).

**One path.** The gate decides a remote sudo as it decides a local one:
the same host and project rules, danger lines, warnings and windows. An
`allow` or `refuse` rule answers at once, as locally, and the agent is
never asked. Everything else is asked, the same question, through the
agent in place of this host's galley:

- an `ask` rule's question is Allow or Refuse, with no password;
- outside a window, the dialog, which takes your password on the client
  and, as locally, offers a window unless the sudo is a danger or a
  warning;
- inside a window, the window's question.

The password is checked on the client, by `quoin-presence` for the
signer ([signer.md](signer.md#presence-check)), with the same PAM service
the plugin runs here: only "verified" crosses the wire, never the
password. It is the client's password, not this host's.

**Windows.** A remote dialog offers up to 24 hours, galley's longest. The
window is keyed on the sudo's claude on this host, as locally; for an
`ssh -A host 'sudo a && sudo b'` that is the login's `sshd-session`, so
it covers that login's sudos. Inside it the question goes to the key that
opened it alone; an answer signed by another key is refused. A local
window never covers a remote sudo, nor a remote one a local sudo. A
remote window ends at its time, or with its claude.

The agent is forwarded when the process serving `SSH_AUTH_SOCK` is a
forwarder. At open the plugin connects to the socket as the invoking user,
takes the listener's pid and uid from `SO_PEERCRED`, and reads its program
from `/proc/<pid>/exe` as root (an `sshd-session` is not dumpable, so the
user cannot). It is a forwarder when it runs as the invoking user and its
program is `sshd-session` (`sshd` before OpenSSH 9.8) or mosey (`mosey` or
nixpkgs' `.mosey-wrapped`, wherever it lives, `~/.local/bin` included).
The connection is kept and the question asked on it, so the sudo opens
one forwarded channel, not two, and closed as soon as the agent answers,
so the command sudo runs after (`sudo -b`, a long job) holds no channel,
nor `ssh`, open. A rule's answer closes it unused. This is who serves the
agent, not what the chain looks like, so a sudo reparented away from its
login (`setsid`, tmux) or run under mosey, whose spawner is no
`sshd-session`, is remote all the same. The connect never waits: a
listener with a full backlog is no agent. A Mac asks the same question
with its own calls ([macOS](#macos)).

**The message.** The gate classifies the command as for a local sudo and
hands the plugin a message, `quoin-sudo-v1`: a nonce, the host's keys,
then named fields -- the user, the runas user, the cwd, the resolved
command, the danger lines, the variables outside the allowlist, the
sudo's process chain as the plugin read it as root, up to 16 links, and
what the gate decided: `!decision` (`dialog` or `question`), `!presence`
(`required` or `none`), `!window` (the most seconds a window may be, 0
for none), `!rule` (the pattern and its source, when a rule asked) and
`!window-key` (the key that opened the window, when a window made it a
question). A message over the agent's limit has the chain's command lines
left out from the top of the chain down until it fits, and says so; the
command, danger lines and variables are never cut, and what still does
not fit is refused, "command too long for the gate".

The plugin connects to the forwarded agent as the invoking user and puts
the message, with the first listed key the agent holds, in the agent
extension `quoin-sudo@quoin`. OpenSSH and mosey pass it on as opaque
bytes. quoin-signer on the client asks it every time, as the host would
ask that sudo locally, by the same builder (`internal/sudoq`): the host's
chain is the table, the title ends "on <host>", or "on <host> via
<hosts>" through other hosts, from `/etc/ssh/ssh_known_hosts`, and the
chain of the ssh on this machine is shown only on lines of its own, each
`from here: `, whose warnings raise a normal question to a warning. It
refuses, unasked, a message that does not read strictly, and one whose
forwarded session is not bound to one of the message's host keys, or,
with no bind at all, is not this machine's own relayed by mosey
([below](#a-local-mosey-session)). No grant skips it.

It replies with an answer record, `quoin-sudo-answer-v1`: `!decision`
(`allow` or `refuse`), `!presence` (`verified` or `none`), `!window`
(the seconds chosen) and `!hops` (the session-binds the request came
through, each host key and whether it forwarded), signed with the key over
the message the gate sent, then the answer. The gate takes it only when:

- the key is a listed key, and the window's when `!window-key` is set;
- the signature verifies over its own message bytes, then the answer;
- the answer parses strictly;
- the decision is allow;
- presence is verified when the message requires it;
- the window is at most the message's, and above 0 only for a dialog
  with presence verified;
- the last hop is one of this host's keys, or there are no hops.

A dialog's answer with a window opens it for the signing key, and sudo
says until when, as locally.

**No plain sign.** The signer refuses, unasked, a plain sign of data that
starts with the `quoin-sudo-v1` magic, and the plugin never falls back to
one. A stock agent knows no `quoin-sudo@quoin` and cannot show the
question or take the password, so it cannot approve a remote sudo, even
holding a listed key: "the forwarded agent refused". For a machine
without quoin-signer, use `ssh -t` and the host's password, or a
`NOPASSWD` rule: the administrator's choice, which quoin does not stop.

**Trust.** `remoteKeys` holds each of your machines' signer keys (their
TPM keys), so your machines form a network: each host trusts each listed
machine's quoin-signer to say "approved, presence checked". A host is
only as strict as the weakest machine in its list. Root on one of them
can sign approvals for the others; with stock tools root there could
already use your ssh keys and capture your password.

**Fields, not versions.** The message grows by adding fields, never by a
new magic, and the answer the same way. A field's key is marked critical
with a `!`; a signer that meets a critical field it does not know refuses
the sudo unasked, naming it, and one that meets an unmarked field it does
not know drops it, the journal naming it in `fields_ignored`. Every field
today is critical, since each is part of what is approved, and every
answer field is too. A field may go unmarked only when a reader could
leave it unshown without changing what is approved -- a hint, say, or
something that only adds to the picture -- and never when anything else
is left out or relaxed because it is there. That is no downgrade: the
gate alone writes the message and checks the signature over its own
bytes, so nothing between can strip a field, and an older signer asks
what it always asked.

**Upgrading to the signed answer.** A gate from before asked for a plain
signature, which a signer now refuses for this magic; a gate now asks in
the extension, which a signer from before does not know. Either way the
sudo is refused, never approved, until both sides are updated, in either
order. The plugin and the gate on one host change in the same switch.

A sudo with a tty (`ssh -t`) asks the host's own password, as stock. No
forwarded agent, no `remoteKeys`, or the gate down is stock too: "a
terminal is required". So is an agent that is not forwarded -- an
`ssh-agent` started in the login, a relay of another program's or another
user's, a socket nobody listens on -- for a sudo in an ssh login or a
mosey session, which the gate never asks locally. A detached sudo
with no forwarded agent is gated locally, as any other. The agent
refusing, failing, knowing no extension or holding no listed key refuses
the sudo:

```
quoin-sudo: the forwarded agent refused
sudo: quoin_audit: unable to log accept event
```

So does your Cancel, signed (`cancelled`, as locally; Refuse on a
question is `refused`), and an answer the gate does not take
(`quoin-sudo: ` and why).

### A local mosey session

A sudo in a mosey session whose attached client runs in a terminal on
this machine (`mosey`, started here or taken back here) is remote too:
mosey serves its `SSH_AUTH_SOCK`, and its relay forwards that client's
own `SSH_AUTH_SOCK` with no bind, as no ssh connection was made. When
that is this machine's quoin-signer, the signer takes a message on a
connection with no bind when every host key it names is one of this
machine's (`/etc/ssh/ssh_host_*_key.pub`, read each time) and the process
that connected is a mosey client (`mosey`, or `.mosey-wrapped`, by its
name). It is decided as any other sudo, rules, dialog, windows and all,
and asked in this machine's galley by the same builder as the gate asks a
local sudo -- no "on <host>", no `from here: ` lines, the sudo's own chain
the table. The gate's `remoteKeys` must list this machine's own signer
key. Any other message with no bind is refused unasked: one that also
names another host's key, which may be that host's, and one relayed by
anything but mosey, since an `ssh -A` that sends no session-bind, or
another forwarder, may bring it from a machine that knows this one's
public host keys.

Where the sudo is asked follows the client attached when it runs, not
where the session started. A session attached from another machine over
ssh, a local `mosey` run inside an `ssh -A` login included, relays that
machine's agent, bound, and is asked there, "on <host>"; if that client
forwards no agent, the relay closes the connection and the sudo is
refused.

Only this host's gate makes the nonce, for a sudo already running here as
the user, and checks the answer over its own bytes, so a message made up
elsewhere approves nothing. Any process of the user can pick remote mode,
by pointing `SSH_AUTH_SOCK` at a mosey session's relay socket, or at a
relay of its own named `mosey`; it gets the decision a local sudo gets,
the rules and the password included, asked by the signer.

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
no local mode and no gate daemon. Nothing outlives one sudo, so it has no
rules and no windows: every sudo is the dialog, its password checked on
the client. When galley comes to macOS, the Mac gets a gate, and with it
windows and rules. The plugin (`sudo/quoin_sudo_darwin.zig`) does the
gate's remote half in sudo's own process. It is the Linux plugin and gate, step for step:

- **open** arms on the gated user, not `-l` or `-v`, no tty, `remote`,
  an absolute `SSH_AUTH_SOCK` served by a forwarder, and listed keys that
  parse. Any miss is stock sudo. Who serves the agent is asked as on
  Linux, with the Mac's calls: the plugin connects as the invoking user,
  takes the listener's uid from `LOCAL_PEERCRED` and its pid from
  `LOCAL_PEERPID`, and reads its program as root with `proc_pidpath`; a
  forwarder is the user's own `sshd-session`, `sshd` or mosey, wherever
  it lives. So a sudo under mosey, or reparented away from its login, is
  remote on a Mac too. The connection is kept for the answer, closed as
  soon as the agent answers, and the connect never waits. A drop to the user or a restore that fails
  refuses the sudo.
- **PAM**: `quoin_sudo_pam.so`, `sufficient`, first in `sudo_local` (macOS
  has no `pam_exec`). The Linux helper's tests, then, where it asks the
  gate whether its sudo checked in, it asks the plugin in the same sudo
  whether it armed. A plugin that is not loaded or not armed is the
  password.
- **accept** builds the `quoin-sudo-v1` message from sudoers'
  `command_info` and the chain above sudo, byte for byte as `internal/sudomsg`
  (`sudo/sudomsg.zig`, held to the Go golden), cut to fit as the gate cuts
  it, and asks it through the forwarded agent's `quoin-sudo@quoin`
  extension on open's connection. The Mac has no rules and no windows, so
  the message is always `!decision dialog`, `!presence required` and
  `!window 0`. The plugin checks the signed answer as the gate does, by
  the same code held to Go's cases: the signature over the message then
  the answer, by a listed key; the answer read strictly; an allow;
  presence verified; no window; and the last hop this host's key, or no
  hops. The chain is read with `sysctl` where Linux reads
  `/proc`: each link's `kinfo_proc` twice, its start time the check that
  the pid was not reused, and its argv with `KERN_PROCARGS2` between the
  two reads, so the client's table shows the Mac's command lines as a
  Linux host's. Your Cancel is `cancelled`, as on Linux, its `source`
  `signer`. A refusal and every failure -- no agent, a hang-up,
  garbage, no listed key, a bad signature, an answer that does not check
  -- refuse the sudo, as the gate does; none falls back to the password,
  and none to a plain sign, which a stock agent would give. Nothing waits
  on a timer.

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
command lines were cut to fit, the key that signed, the answer's `hops`,
`outcome`, `source` and a refusal's `reason`. Not the unified log:
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
key fingerprints as `host_keys`, the `nonce`, what was asked (`decision`,
`requires`, `offered`, `window_key`, and `rule` with `rule_source` when a
rule asked), and the `key` that signed. A rule's answer has the rule's
`source`; one that went to the agent has a `pending` record when the
message goes, then one with `source` `signature` (allowed), `signer`
(your refusal), `agent` (it refused or failed, with `reason`), `not a
listed key`, `signature did not verify` or `answer` (with `err`), and
what came back: `answered`, `presence`, `window`, `hops`, and
`window_until` when it opened a window.

quoin-signer's record of a remote sudo (`journalctl -u quoin-signer`,
[signer.md](signer.md)) has the message's `user`, `runas`, `cwd`, `argv`,
`nonce`, `danger` and `env`, the `level` it asked at, the host's chain as
`remote_chain`, command lines and all, beside this machine's `chain`,
`remote_cut` when the host's chain was cut short, `cmdlines_left_out`,
`fields_ignored`, the unmarked fields it did not know, the message's
host key fingerprints as `host_keys`, what was asked and what it answered
([signer.md](signer.md#journal)). Its `class` is `remote sudo`; a local
mosey session's has `destination` `this host` and `via` `unbound relay`,
its `chain` the mosey client's. One with no bind that is refused says why
in `reason`: `remote sudo on an
unbound connection` when its host keys are not this machine's alone (or
none of this machine's read: look for `host key unreadable`,
`host key skipped` or `host keys unreadable`), and
`this host's sudo on an unbound connection, not from a mosey client`.

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
