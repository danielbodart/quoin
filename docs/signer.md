# quoin-signer

An SSH agent whose keys live in the TPM. It signs without asking for the
main process of a unit you trust with its own logins, for a terminal tab
ssh-ing to a host in
`/etc/ssh/ssh_known_hosts`, for any program's login to a host you allow by
name, here or in the project's signed policy file, and for git's commit
signatures. Everything else is asked in galley: Allow once, Allow for a time
you pick, Refuse, or, from a project, Always.

```
$ git push                          # typed in a tab, github.com in ssh_known_hosts
                                    # signed, nothing asked

claude> git push                    # galley: "ssh to github.com"
                                    #   [Refuse] [Allow once] [Allow for 15 minutes ▾]

claude> git push                    # with ssh.hosts."github.com" = "allow"
                                    # signed, nothing asked

claude> git push                    # in ~/Projects/foo, courier on
                                    # galley: "ssh to github.com", with the diff
                                    #   [Refuse] [Allow once] [Allow for …] [Always]
                                    # Always: ~/Projects/foo/chase.json and its
                                    # .sig written, and the next push is silent
```

## Setup

```nix
{
  imports = [ inputs.quoin.nixosModules.signer ];

  services.quoin.signer = {
    enable = true;
    forUser = "alice";
  };
}
```

Then point the user's `SSH_AUTH_SOCK` at `/run/quoin-signer/agent`, and
let galley take questions from the signer:

```nix
services.galley.services = { quoin-signer = "SSH signer"; };   # home-manager
systemd.tmpfiles.rules = [ "d /run/galley-ask 0755 alice alice -" ];
```

The signer's user was `ssh-signer`. Its uid, 951, is the same, so the key
files it owns still work, but galley's services must name `quoin-signer`.

The signer starts with no keys, and on its first connection, which makes
its key directory. Start it, then move a key made by stock `ssh-tpm-keygen`
into place:

```
sudo systemctl start quoin-signer
sudo install -o quoin-signer -g quoin-signer -m 0600 ~/.ssh/id_ecdsa.tpm /var/lib/quoin-signer/
sudo systemctl restart quoin-signer
ssh-add -l
```

Only `quoin-signer` may open the TPM: evaluation fails if any normal user is
in `tss`. Log out and in after leaving it.

## Options

| Option | Default | Meaning |
|---|---|---|
| `enable` | `false` | Run the signer. |
| `forUser` | `"dan"` | The only user served, and whose galley is asked. |
| `terminal` | `"allow"` | A tab's direct sign to a host in `ssh_known_hosts`: `allow` or `ask`. |
| `sshsig.<namespace>` | `{ git = "allow"; }` | A direct SSHSIG sign in that namespace: `allow` or `ask`. Any other namespace is asked, Allow once. |
| `ssh.hosts.<name>` | `{ }` | A direct login from any program to the host key listed under `name` in `ssh_known_hosts`, or under a name the pattern `name` matches: `allow` or `ask`. |
| `loginSigners` | `[ ]` | System units, `name.service`, whose main process, run as `forUser`, has its logins signed unasked. |
| `policySigners` | `[ ]` | System units whose main process, run as `forUser`, may send a `policy-sign` marked `approved`, which is signed unasked, and nothing else. |

`ssh.hosts` keys may be patterns: `*` alone is one label, `*` within a
label any run of it (`*-ap`), and `**` as the first label one or more
labels (`**.bodar.com`). A literal key beats a pattern; between patterns,
more whole literal labels win, then more literal bytes in the labels with
a `*`, then one without `**`; at a tie `ask` wins.

With `services.quoin.policy.courier.enable` (see [policy.md](policy.md)),
the signer also reads the asking program's project policy file, offers
Always, and serves `quoin policy sign`. It needs no option of its own:
the module writes the `policy` section below from `services.quoin.policy`.

The options are written to `/etc/quoin/signer.json`, which
`quoin-signer serve -config` reads, keys named as the options are:

```json
{ "forUser": "alice", "terminal": "allow", "sshsig": { "git": "allow" },
  "ssh": { "hosts": { "github.com": "allow" } },
  "loginSigners": [ "frisket.service" ], "policySigners": [ "frisket.service" ],
  "policy": { "courier": "/run/quoin-courier/sock",
              "allowedSigners": "/etc/quoin/allowed_signers", "fileName": "chase.json" } }
```

A key it does not know, a value other than `allow` or `ask`, a host key
that is not a name or a pattern of one, a `policy` path that is not
absolute, or a unit that is not `name.service`, is listed twice or whose
name is longer than 15 bytes stops it starting; the build runs
`quoin-signer check` on the file first. `quoin-signer schema` prints its
JSON Schema.

### Trusted units

The signer trusts no program for being a particular program: only the main
process of a system unit the host names, run as `forUser`, and only for
what the list it is in says. A main process is known by its unit's cgroup,
its pid being the unit's `MainPID`, and its comm, which the kernel cuts at
15 bytes; so a child the main process starts, a process moved into the
unit's cgroup from elsewhere (which the kernel refuses a user anyway), and
a unit whose name could never be a comm are none of them trusted.

- **`loginSigners`**: a unit whose main process decides for itself which
  machines a session it runs may log into, such as an egress proxy with SSH
  routes of its own. Its bound and unbound logins are signed with no
  question, logged as source `unit`, galley or no galley.
- **`policySigners`**: a unit whose main process asks a person about a
  change to a project's policy file in a question of its own, with the
  diff, and sends the new bytes as a `policy-sign` marked `approved`. That
  is signed with no question of the signer's, the person's answer being the
  approval; there is no receipt, so this is the trust. A `policy-sign` from
  it without `approved` is refused unasked, and `approved` from anyone
  else is refused. Its logins are asked as anyone's are unless it is in
  `loginSigners` too.

frisket is the program these were made for: its main process holds a
sandbox's SSH routes and asks about a session's requests itself, so a host
running it sets both to `[ "frisket.service" ]`. They are two lists because
they are two trusts: a unit that logs a session into machines need not be
one whose word that a person approved a change is taken.

Beyond these, a forwarded sign (`ssh -A`) is asked unless it came through
`ssh.forwardedThrough` (below), and nothing is refused unasked but an SSHSIG in a `quoin-policy` namespace, which `check`
also refuses as an `sshsig` key, a `policy-sign` from another user
namespace, a remote sudo that is not asked as below, and any plain sign
over data that starts with a remote sudo's magic (`quoin-sudo-v1`).

### Remote sudo

A remote sudo ([sudo.md](sudo.md#remote-mode)) comes as the agent
extension `quoin-sudo@quoin`: a key and the gate's message. It is asked
every time, never signed silently or by a grant, and answered with an
answer record signed together with the message (package `sudomsg`). It is
refused unasked when:

- the message does not parse strictly, has a critical field this signer
  does not know, or has no `!decision`, `!presence` or `!window`;
- on a connection with a bind, the last bind does not forward or names
  none of the message's host keys;
- on a connection with no bind, a host key it names is not this machine's
  own (`/etc/ssh/ssh_host_*_key.pub`, read each time), or the process that
  connected is not a mosey client (`mosey`, or `.mosey-wrapped`, by its
  name). A mosey session whose attached client runs in a terminal here
  relays that client's agent with no bind; an `ssh -A` that sends no
  session-bind, or another forwarder, may bring it from far off;
- this agent does not hold the key;
- it is a question that requires presence, or its `!window-key` is not the
  key: the gate would take neither answer.

It is asked as its host would ask it, by the gate's builder
(`internal/sudoq`): the rule that asked, if any, first; the host's chain
the table; the title "on B via A", the route from the binds' names in
`ssh_known_hosts`; this machine's chain on `from here: ` lines and the key
last. With no bind it is this machine's own sudo, asked as its gate asks
a local one: no host, no `from here: ` lines, no key.

- A **question** is Allow or Refuse. Allow answers presence `none`, no
  window.
- A **dialog** takes the password, as the gate's dialog does, and offers
  "remember for" when `!window` is above 0, at most that long. The signer
  sends the password to `quoin-presence` (`/run/quoin-presence/sock`: a
  version byte, 1, a big-endian uint16 length, the password, at most 1023
  bytes, no NUL or newline; it answers `P` or `F`) and zeroes it. A wrong
  password brings the dialog back, saying so; an empty one, or one that
  cannot go, brings it back as it was. A pass is never kept: every dialog
  asks the helper. A pass answers presence `verified` and the window
  chosen. No helper to ask refuses.

Refuse is a signed answer that refuses; a hang-up, no galley or no helper
is an extension failure. The answer's hops are the binds, none with no
bind. The gate checks the rest.

Every host that lists this machine's key in `remoteKeys` takes its
answer as "approved, presence checked", so your machines form a network,
each as strict as the weakest in its list ([sudo.md](sudo.md#remote-mode)).
A stock agent cannot answer the extension, so it approves no remote sudo.

The signer refuses a session-bind as OpenSSH's ssh-agent does: after one
that does not forward, and for a session id already bound to another host
key. The same bind again is kept once.

### Your own machines

**`ssh.forwardedThrough`** names hosts, by their name in `ssh_known_hosts`
or a pattern as `ssh.hosts`' names are: your own machines. A forwarded sign
whose every forwarded session-bind is to one of them is judged by `sshsig`
and `ssh.hosts` as a direct sign is (5 and 6 below), so in an `ssh -A`
session to one, a commit signature and a push to GitHub are what they would
be here: signed with no question, and journaled with `"forwarded":true`. A
hop through any other host, an unknown host key, remote sudo, and every
sign those rules do not allow are still asked. Only the host's rules apply:
the asking program is the ssh here, so its project says nothing about what
is signed at the far end. A machine there with a key of its own could sign
the same things unasked with it, so this widens nothing a session to it did
not already reach. None by default.

## What is asked

In order, the first that applies:

1. A peer other than `forUser`: refused.
2. A login whose session or host key is not the one ssh bound: refused.
   So is an SSHSIG in any namespace starting `quoin-policy`, from anyone,
   a trusted unit included, with the journal reason "a quoin-policy
   namespace is never signed raw": a project's policy is signed only where
   the signer sees its bytes (see [policy.md](policy.md)).
3. A login from the main process of a unit in `loginSigners`: signed.
4. A tab's shell running ssh, git, scp, sftp or rsync, to a known host,
   not forwarded: `terminal`.
5. Any program's login, not forwarded (or forwarded only through
   `ssh.forwardedThrough`) and its process chain not cut short, to a host key `ssh_known_hosts` lists under a name whose most
   specific `ssh.hosts` rule is `allow`: signed, as source `host`, or
   `project` when the rule is the project's. The rules are the host's with
   the project's `signer` section merged over them (RFC 7396: a project may
   add a rule, set one to `ask`, or delete one with `null`). A hashed
   entry, a pattern in `ssh_known_hosts` itself, or the same name with
   another key never matches.
6. An SSHSIG, not forwarded (or forwarded only through
   `ssh.forwardedThrough`): its namespace's value, the project's merged
   over the host's (`sshsig`, or `project`).
7. A live grant for this process, host key, key and forwarding: signed.
8. Otherwise: asked. With no galley to ask, refused.

The project is the asking program's (the anchor's): the courier reads its
working directory up to the nearest policy file, as
[policy.md](policy.md) says. Its file applies only when its signature
verifies against `/etc/quoin/allowed_signers` in the project's namespace,
the one the courier names (a worktree's is its repository's),
and its `signer` section sets only `ssh.hosts` and `sshsig`; otherwise it is
ignored, with one `project policy ignored` line per file, and the decision
is as if there were none. So is a cut chain, a chain with no anchor, and a
courier that is down or not configured. A forwarded sign is never covered
by a project, only by the host's rules through `ssh.forwardedThrough`.

A grant covers the asking program (a claude, a tab's shell) until the time
you picked; a forwarded question's grant covers forwarded signs only.

**Always** is offered on a grantable, direct question to a known host when
the project is known (the courier found its policy file, or the program is
in a git repository under the home, where the file would be), its file is
absent or verifies and is canonical, and a key here may sign in its
namespace. The question carries the diff of the file it would write, the
current one with `signer.ssh.hosts."<name>": "allow"` merged in, canonical
(`{"version": 2}` when there is none), `<name>` the host key's first name in
`ssh_known_hosts`, and says "Always allows `<name>` from `~/Projects/foo`,
signed into its chase.json." On Always the signer signs the new file in
`quoin-policy:<root>`, has the courier write it and its `.sig` if the file
is still the one read, and signs the login. If the write fails, a change
made meanwhile say, the login is still signed, once, and the journal's
`always` line and a galley notification say the rule was not saved. Always
grants nothing beyond the file: a later login is decided by it.

`quoin policy sign FILE` signs a file you edited, a rule widened to a
pattern say, through the agent extension `policy-sign@quoin` (package
`policysign`, which the signer's server and every client import): galley shows
the diff against the bytes the old `.sig` verifies over (`-old FILE`, else
git's `HEAD`), or against nothing, saying why, with Refuse and Allow once
only, and on Allow `FILE.sig` is written. FILE must already be canonical
(`quoin policy fmt`). It is refused unasked to a policy signer's main
process unless it sends the request `approved` -- a rule answered Always in
its own question -- and to a process in another user namespace, as a
sandbox's would be.
Allow once is the only choice for a sign ssh did not bind to a host, for an
SSHSIG, for a program launched straight from `systemd --user` or the
terminal server, and for a process chain cut short; galley shows the last
two with a warning. A question goes when
the ssh that asked exits.

A question shows the process chain from the asking program down. For a
commit's signature that is the claude or tab above `git commit`, since
git's `ssh-keygen -Y sign` is shown through; the decision, and the
journal's anchor, are still ssh-keygen's.

## Presence check

A remote sudo that needs a presence check asks, in galley, for your
password on this machine. The signer passes it to `quoin-presence`, a root
helper, and only the answer goes back. The password never leaves this
machine.

- It checks `forUser`'s password with PAM's `quoin-sudo` service, the one
  the sudo dialog runs, so a change to that stack changes local and remote
  together. `forUser` is in its `ExecStart`, and never root.
- `quoin-presence.socket` is `/run/quoin-presence/sock`, mode 0600, owned
  by `quoin-signer`, and the helper checks the peer's uid too
  (`SO_PEERCRED`). `Accept=no`: one request at a time, so pam_unix's fail
  delay limits the guesses.
- A request is a version byte (1), a big-endian u16 length, then the
  secret: 1 to 1023 bytes, no NUL, no newline. The reply is `P` (passed) or
  `F`, then the connection is closed. A malformed request, or a peer that
  is not the signer, is closed with no reply.
- The secret is zeroed after use and never logged: the journal has one line
  per request, its outcome. Neither the helper nor the signer dumps core
  (`LimitCORE=0`).
- It runs as root with no capabilities, in a sandbox that does not rest
  on file modes, which do not hold uid 0: no `/run` but nscd, the
  wrappers (`unix_chkpwd`) and the journal, no `/var` or `/nix/var`, no
  `/etc/ssh` or `/boot`, its own network namespace, and kernel knobs
  read-only. So it
  reaches no root-only socket (systemd's, D-Bus's, nix-daemon's, the
  gate's). A PAM module added to `quoin-sudo` that needs more (fprintd's
  D-Bus, a FIDO key's device) needs the sandbox opened for it.

galley is trusted as it is today: it runs as you, in `galley.service`'s
cgroup. That is more than zenity had. Its limit: a process running as you
that sets out to fake galley can.

## Journal

```
journalctl -u quoin-signer -o cat | jq 'select(.msg == "decision")'
```

One `decision` record per sign: the chain, the anchor, the destination, the
key, the outcome, and its `source` (`unit`, `terminal`, `host`,
`project`, `sshsig`, `grant`, `galley`, `always`, `nobody`, `hung up`,
`presence`), with `project`, `project_digest` and `project_applies` when a
project was read. A remote sudo's has `class` `remote sudo`, the message's
fields (`user`, `runas`, `cwd`, `argv`, `nonce`, `danger`, `env`,
`remote_chain`, `cmdlines_left_out`, `fields_ignored`, `host_keys`,
`decision`, `presence`, `window`, and `rule`, `rule_source` and
`window_key` when set), `through` for the hosts before the last, or `via`
`unbound relay` with no bind, `secrets_wrong`, and what it answered:
`answer`, `answer_presence`, `answer_window` and `hops`. A refusal unasked
is one `refused` line with its `reason`. An `always` line says whether Always's file was `written` or `not
saved`, and why; a `project policy ignored` line why a file did not apply. A failed sign is one `sign failed`
line with the TPM's cause; ssh itself only says `agent refused operation`.

## Commit signing from a sandbox

A program that serves sandboxes may pass git's commit signatures on to the
signer through a socket of its own that refuses everything else; frisket's
per-policy git signing socket is one (see
https://github.com/danielbodart/frisket#commit-signing-from-a-sandbox). The
signer sees such a sign as the serving program's, made under `sshsig.git`.

## Recovery

**TPM cleared, firmware update or new board.** Every sign fails with `TPM
cleared or a different chip`. Make a new key and swap it in:

```
sudo systemctl start quoin-signer-keygen
sudo cat /var/lib/quoin-signer/new/id_ecdsa.pub
sudo mv /var/lib/quoin-signer/new/id_ecdsa.tpm /var/lib/quoin-signer/
sudo systemctl restart quoin-signer
```

Authorize the new public key wherever the old one was (GitHub, your
servers, the other host), logging in with another machine's key; if every
machine lost its key, add it at each server's console. keygen refuses to
overwrite, so empty `new/` before it runs again.

**Dictionary-attack lockout.** Signs fail with `TPM is in
dictionary-attack lockout; signing resumes when it decays`. Wait for the
counter to decay, or clear it with the TPM's lockout auth:
`tpm2_dictionarylockout --clear-lockout`.

**Reinstall.** A key file from before is listed but never signs on another
chip or a cleared one; run keygen as above.

**Rollback.** `services.quoin.signer.enable = false`, and point
`SSH_AUTH_SOCK` back at your previous agent.
