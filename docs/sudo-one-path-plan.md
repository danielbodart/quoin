# One path for local and remote sudo (plan)

Status: built, uncommitted. The agreed design, after three security
reviews and a pass through each finding with Dan.

## Principles

1. **Local and remote work the same, where possible.** One decision, the
   same rules, danger lines, windows and presence check, and the same
   detail in the question. Only the transport is different. Where they
   differ (macOS, below), the plan says so.
2. **The baseline:** stock sudo with `SUDO_ASKPASS` set to zenity, and a
   stock ssh-agent. quoin is never less secure than this. Anything more
   is hardening.
3. **The threat:** an agent that makes a mistake or goes a little rogue,
   and accidental credential leaks. It is not hostile code running as
   the user. Hostile code goes in a strict chase tier, or in flong.
   Harden for other users, for files on disk and for raised privileges.
   Do not harden against the user's own processes when that costs
   complexity or usability.
4. **Tools compose.** The administrator decides. A NOPASSWD rule, or a
   key in `remoteKeys`, is the administrator's choice. quoin documents it
   and does not stop it.
5. A sudo with a tty stays stock sudo. That is the human's way out.

## 1. One decision

`approve()` and `approveRemote()` become one function. It describes the
sudo, applies the host and project exec rules, and finds the danger lines,
the warnings and the window. The result is one of these:

- **allow**: an allow rule matches. The sudo runs with no question, local
  or remote, and the plugin does not contact the agent.
- **refuse**: a refuse rule matches. The refusal line is the same as now,
  local or remote.
- **dialog**: the sudo needs a presence check. A dialog can open a
  window, except for a danger or a warning.
- **question**: Allow or Refuse with no presence check. This is for an
  `ask` rule, or for a sudo inside a window. A danger inside a window is a
  question too, as today. galley never takes focus, so every answer is a
  deliberate act.

Only the next step is different. Locally, the gate posts to this host's
galley, as now. Remotely, the gate sends the decided question through the
agent and gets back a signed answer (section 2).

The gate reads the project from the chain on this host. The process that
ran sudo is a shell or a claude, and it is dumpable.

Unchanged:

- The login and mosey exemption. A sudo under one with no forwarded agent
  goes to stock sudo, which is the baseline.
- An answer that comes after its window ends still counts.
- Nothing that waits for a person times out.

## 2. The remote request: a signed answer

The request is an agent extension, `quoin-sudo@quoin`. OpenSSH and mosey
pass it on as opaque bytes. mosey replays the captured bind first. The
signer returns an answer record that holds what the person chose, signed
together with the gate's message. This is the transport for richer
answers in the future too: new fields are added, never new versions.

```
request  = byte 27 || string "quoin-sudo@quoin" || string key_blob || string message
message  = today's quoin-sudo-v1 layout, plus critical fields (sorted):
  !decision    "dialog" | "question"
  !presence    "required" | "none"
  !rule        string pattern || string source       (when a rule asked)
  !window      uint32 max seconds (0 = none)
  !window-key  key blob                              (when a window made it a question)
reply    = byte 6 || string answer || string signature    ; anything else refuses
answer   = string "quoin-sudo-answer-v1" || string fields, all critical, sorted:
  !decision  "allow" | "refuse"
  !hops      list of (string host_key_blob || byte fwd)   ; empty = unbound
  !presence  "verified" | "none"
  !window    uint32 seconds
signed   = message || answer   ; the message verbatim, starting with the old magic
```

The gate accepts the answer only when all of these hold:

- The signature verifies over its own message bytes followed by the
  answer.
- The key is a listed key. If `!window-key` is set, it must be that key.
- The answer parses strictly.
- The decision is allow.
- Presence is verified when the message requires it.
- The window is at most `!window`, and it is above 0 only for a dialog
  with presence verified.
- The last hop is this host's key, or there are no hops.

Invariants:

- The signed bytes start with the `quoin-sudo-v1` magic. On the plain sign
  path, the signer refuses any data with that magic, unasked.
- There is no fallback to a plain sign. A stock agent cannot show the
  question or collect the answers, so it cannot approve a remote sudo.
  This is structural. For a machine without quoin-signer, use `ssh -t`
  and the host's password, or a NOPASSWD rule.
- The room for the message is `MaxSize - (1+4+16+4+longest+4)`, in
  `internal/sudogate/remote.go` and `sudo/quoin_sudo_darwin.zig`.

**Trust model (document it).** `remoteKeys` holds each machine's TPM key
(nix-config: `authorizedKeys.keyFiles`, which is `keys/<machine>/ssh-tpm.pub`).
So your machines form a network. Each host trusts each machine's
quoin-signer to say "approved, presence checked". A host is only as strict
as the weakest machine in the list. Root on one machine can sign
approvals for the others. With stock tools, root there could already use
your ssh keys and capture your password.

## 3. The presence check

The check proves that a person answered. Each machine checks it for the
person at that machine, and only the result crosses the wire. The secret
is never sent. So a click (as in Windows 11), a fingerprint or FIDO later
is a change on that one machine. The protocol stays the same.

- **Local:** as now. The plugin, inside sudo, runs PAM `quoin-sudo`.
- **Remote:** `quoin-presence`, a root helper on the signer's machine.
  It runs the same PAM service, `quoin-sudo`, so a change to the stack
  changes local and remote together.
  - The socket is `/run/quoin-presence/sock`, mode 0600, owned by the
    signer's user. The helper checks `SO_PEERCRED`.
  - `Accept=no`: it serves one request at a time. pam_unix's fail delay
    limits the guess rate, and there is no other backoff code.
  - forUser is an `ExecStart` argument from Nix. It is never uid 0, and
    never read from a file that the signer can write.
  - Request: a version byte, u16 len, then the secret (1 to the max
    length, no NUL, no newline). Reply: `P` or `F`, then close.
  - The secret is zeroed after use and never logged. `LimitCORE=0` is set
    on the helper and on the signer.
  - The helper runs as root for now, in the sandbox of the other quoin
    units and more: file modes do not hold uid 0, so it sees only what
    PAM needs (no /run but nscd, the wrappers and the journal, no /var
    or /nix/var, no host keys, its own network namespace) and cannot
    touch kernel knobs.
  - Later, with biometrics: answer only `PROMPT_ECHO_OFF`, one request id
    at a time, and show the id in galley.
- galley is trusted as it is today (your uid, in galley.service's
  cgroup). That is more than zenity had. Write one sentence on the limit:
  a process running as you that sets out to fake galley can.

## 4. Windows

A window is the "remember for N" in the dialog. For that time, the
claude's sudos skip the presence check, and each one is still asked. One
rule, local and remote: only whoever opened the window can answer inside
it.

- Locally, that is the galley process (pid and start time), as now.
- Remotely, that is the signing key (`!window-key`).
- A window of one kind does not cover a request of the other kind. That
  request gets a dialog.

## 5. The signer

- The `quoin-sudo@quoin` handler runs today's bind checks:
  - With no bind, it takes only a message naming this machine's own host
    keys, from a mosey client (the local mosey case, from the uncommitted
    change).
  - With a bind, the last bind must be forwarding and must name one of
    the message's host keys.
  - It refuses if it does not hold the requested key.
- The question comes from `sudoq`, from the message, as the host would
  show it locally. The title shows the whole route, "on B via A", from the
  binds and known_hosts. If that turns out to cost more than a display
  change, it is dropped.
- A `dialog` takes the secret and asks `quoin-presence`. A wrong secret
  brings the dialog back. The signer never caches a pass.
- It refuses, unasked, a message that has no `!decision`, `!presence` or
  `!window`.

## 6. macOS

The Mac is a build machine, administered remotely. It has no daemon, and
nothing outlives one sudo, so it has no windows and no rules. It always
sends `!decision dialog`, `!presence required` and `!window 0`. The plugin
checks the answer as the gate does, against a Go golden. When galley comes
to macOS, the Mac gets a gate service, and with it windows and rules.

## 7. Renames

The service users get quoin's names, so they do not read as parts of the
base system. Their uids stay the same, so the files they own still work.

- `ssh-signer` (951) becomes `quoin-signer`: `nix/signer.nix`, the example
  in `nix/policy.nix`, and the test in chase's `flake.nix:777`.
- `sudo-gate` (952) becomes `quoin-sudo`: `nix/sudo.nix`.

## 8. The uncommitted local-mosey change

Rework it, do not commit it as it is. Its check for an unbound message
for this host from a mosey client, and its tests, move to the section 5
handler. Its "local sudo" class, which asks with no rules and no presence
check, goes. A sudo in a local mosey session takes section 1 like any
other.

## Not done (decided)

- Hardening galley against a process running as you, and FIDO for now.
- A presence check for a danger inside a window.
- Gating the login and mosey exemption.
- Hop allow-lists (`ForwardedThrough` for sudo).
- A separate PAM service for the helper, and faillock.
- Forwarding galley itself in place of the agent. The agent already gives
  a path back, a hardware signature and proof of the host.
