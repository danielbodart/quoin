# quoin

The host's gatekeepers. Three small daemons stand between the programs you
run -- a terminal, a claude, a proxy -- and what only you should be able to
approve: an SSH key, root, and a project's own rules. Each decides the cases
it can by itself and asks you, through [galley](https://github.com/danielbodart/galley),
about the rest.

> A *quoin* (said "coin") is the wedge a printer drives into the chase to
> lock the type in place. [chase](https://github.com/danielbodart/chase) holds
> the forme; quoin keeps anything in it from moving that should not.

- **quoin-signer** is an SSH agent whose keys live in the TPM, so no process
  can copy them. It signs without asking for a terminal tab ssh-ing to a
  known host, for a login to a host you allow, here or in the project's
  signed policy, for git's commit signatures, and for a unit you trust by
  name; anything else -- a claude's `git push`, a forwarded sign, a raw
  SSHSIG -- is a galley question: Allow once, Allow for a time you pick,
  Refuse, or, from a project, Always, which signs the rule into its policy
  file. See [docs/signer.md](docs/signer.md).
- **quoin-sudo** gates sudo when no terminal is asking. Each such sudo is a
  galley item showing the resolved command: a dialog that takes your
  password and opens a window for that claude for a time you pick, a plain
  question inside the window, and a danger question, never a window, for a
  command that touches what guards the machine. Exec rules, the host's and a
  signed project's, allow, ask about or refuse a command with no password.
  Over `ssh -A`, a sudo on another machine is approved by your own signer,
  asked on your own screen. A sudo in a terminal is stock sudo; the gate
  never sees it. See [docs/sudo.md](docs/sudo.md).
- **quoin-courier** carries a project's signed policy file, `chase.json`
  say, between your home and the gatekeepers, which run as their own users
  and cannot read it. It runs as you with no network, tells a gatekeeper
  which project a process is in, and writes a new file only when its
  signature already verifies. See [docs/policy.md](docs/policy.md).

And `quoin policy` is your own tool for that file: `verify`, `fmt`,
`signers`, and `sign`, which has the signer show you the change and sign it.

## How it fits

- **galley** is the only way quoin asks. Each gatekeeper puts its question
  through galley's services socket with galley's own client,
  `github.com/danielbodart/galley/services`, which checks the window on the
  other end is your `galley.service`. No galley, nobody to ask: the
  question is refused.
- **frisket** keeps credentials out of sandboxes. It imports quoin's public
  packages -- `projpolicy`, `courier`, `policysign`, `execrule`,
  `hostpattern`, `peer` -- rather than copies of them, so the two speak the
  same wire in lock step. Its main process holds a sandbox's SSH routes and
  asks about a session's requests itself, so a host running both lists
  `frisket.service` in the signer's `loginSigners`, to sign its logins
  unasked, and `policySigners`, to sign a rule a person answered Always in
  frisket's own question.
- **chase** launches the sandboxes and writes a project's policy. It checks
  a project's `sudo` section with package `sudo`'s `CompileExec`, and
  reads, formats and verifies the file with `projpolicy`, as the
  gatekeepers do.

quoin imports nothing of frisket, chase or flong, and trusts no program for
being a particular program: a unit is trusted only when the host names it.

## Example

```nix
{
  inputs.quoin.url = "github:danielbodart/quoin";

  outputs = { nixpkgs, quoin, ... }: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        quoin.nixosModules.default
        {
          services.quoin.signer = {
            enable = true;
            forUser = "alice";
            ssh.hosts."github.com" = "allow";
          };
          services.quoin.sudo = {
            enable = true;
            forUser = "alice";
            exec."/run/current-system/sw/bin/journalctl **".answer = "allow";
          };
          services.quoin.policy = {
            fileName = "chase.json";
            allowedSigners = [{ principal = "alice"; key = "ecdsa-sha2-nistp256 AAAA…"; }];
            courier = { enable = true; forUser = "alice"; };
          };
        }
      ];
    };
  };
}
```

Then point `SSH_AUTH_SOCK` at `/run/quoin-signer/agent`, move a key made by
`ssh-tpm-keygen` into `/var/lib/quoin-signer`, and let galley take questions
from `ssh-signer` and `sudo-gate` ([docs/signer.md](docs/signer.md#setup),
[docs/sudo.md](docs/sudo.md#setup)).

## NixOS modules

| Module | Options | Runs |
|---|---|---|
| `nixosModules.signer` | `services.quoin.signer`: `enable`, `forUser`, `terminal`, `sshsig`, `ssh.hosts`, `loginSigners`, `policySigners` | `quoin-signer.socket` at `/run/quoin-signer/agent`, `quoin-signer.service` as `ssh-signer`, `quoin-signer-keygen.service` |
| `nixosModules.sudo` | `services.quoin.sudo`: `enable`, `forUser`, `remoteKeys`, `danger`, `exec` | the plugin line in `/etc/sudo.conf`, the PAM rule and the `quoin-sudo` PAM service, `quoin-sudo.socket` at `/run/quoin-sudo/gate.sock`, `quoin-sudo.service` as `sudo-gate` |
| `nixosModules.policy` | `services.quoin.policy`: `fileName`, `allowedSigners`, `courier.enable`, `courier.forUser`, `courier.peers` | `/etc/quoin/allowed_signers`, `quoin-courier.socket` at `/run/quoin-courier/sock`, `quoin-courier.service` as `forUser` |
| `nixosModules.default` | all three | |

The signer and the gate import the policy module and name themselves the
courier's peers. Each daemon's settings are written to `/etc/quoin/signer.json`,
`/etc/quoin/sudo.json` and `/etc/quoin/courier.json`, keys named as the
options are, checked by the daemon's own `check` when the system builds and
read strictly by its `serve`: a key it does not know stops it starting, and
a change restarts it. Each daemon's `schema` prints its file's JSON Schema.

## Packages for other programs

Every package outside `internal/` is public, for a program that must read,
check or speak what quoin does in the same way:

| Package | |
|---|---|
| `projpolicy` | A project's signed policy file: strict JSON, the canonical form, RFC 7396 `MergePatch`, SSHSIG signing and verifying, OpenSSH's allowed signers, the `quoin-policy:<root>` namespace, finding and loading the file. |
| `courier` | The courier's wire, both ends: its request and response, and `Read` and `Write` for a peer. |
| `policysign` | The signer's `policy-sign@quoin` agent extension, both ends: its request and response, and `Sign`, which asks the signer to sign a policy file. |
| `execrule` | Command patterns: a rule's words, `*` and `**`, `[arg GLOB]` rules, specificity, and how a shell command is read into simple commands, with its own `Rule`, `Operation` and `Spec` types for a program's policy to embed. |
| `sudo` | The gate's danger catalogue and its exec rules: `Danger`, `CompileExec`, `CheckExec`. |
| `hostpattern` | The host-key grammar: a name, `*` one label, `*` within a label, `**` first; a literal beating a pattern. |
| `peer` | Who is on the other end of a unix socket: credentials, pidfd, cgroup, the process chain, a unit's main process, user namespaces. |
| `sdnotify` | Socket activation and readiness, systemd's way. |

## Threat model

In short: a program you run, a claude or anything it starts, may be hostile
and runs as you. It cannot read the TPM key, which only `ssh-signer` can
open; it cannot forge which process asked, which the signer and the gate read
from the kernel (peer credentials, pidfds, cgroups) rather than from the
program; it cannot answer its own question, since only your `galley.service`
is asked and the gate pins the galley that took your password; and it cannot
make a project's file count by writing it, since every reader verifies its
signature against root's allowed signers in a namespace naming the project.
A terminal is trusted as it always was. What each gatekeeper refuses, signs
and asks, and why, is in [docs/signer.md](docs/signer.md),
[docs/sudo.md](docs/sudo.md) and [docs/policy.md](docs/policy.md); the
design, written while these lived in frisket, is
[docs/signer-and-sudo-plan.md](docs/signer-and-sudo-plan.md).

## Development

```console
$ nix develop          # go, gopls, golangci-lint, swtpm, ssh-keygen, zig
$ go test ./...        # QUOIN_REQUIRE_SWTPM=1 and QUOIN_REQUIRE_SSH_KEYGEN=1
                       # fail rather than skip without them
$ nix flake check      # build, tests with and without -race, vet, gofmt,
                       # the Zig's tests and analysis, the modules'
                       # evaluation, and the signer, sudo-gate, sudo-remote
                       # and policy VM tests
```

## Licence

MIT.
