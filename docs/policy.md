# A project's signed policy

A project may hold its own policy file, beside its code: `chase.json`, say,
with a section per component. It counts only when a stock SSHSIG beside it,
`chase.json.sig`, verifies over its exact bytes, by a key in root's
`/etc/quoin/allowed_signers`, in a namespace that names the project's
directory. The signer reads its `signer` section and the sudo gate its
`sudo` section; another program, frisket say, reads a section of its own
with the same package.

quoin does not name the file. The courier's `fileName` does, and the host's
configuration sets it.

## The signature

A plain armoured SSHSIG, as `ssh-keygen -Y sign` writes it, over the file's
bytes, in the namespace

| Project directory | Namespace |
|---|---|
| `~/Projects/foo` (under the home) | `quoin-policy:~/Projects/foo` |
| the home itself | `quoin-policy:~` |
| `/srv/foo` (anywhere else) | `quoin-policy:/srv/foo` |

so a signed file moved or copied to another project does not verify there.
Any change to the bytes, whitespace included, needs a new signature; the file
is kept in one canonical form so that only real changes do.

Checked by hand, with quoin or stock OpenSSH:

```
quoin policy verify ~/Projects/foo/chase.json
ssh-keygen -Y verify -f /etc/quoin/allowed_signers -I dan \
  -n 'quoin-policy:~/Projects/foo' -s chase.json.sig < chase.json
```

`verify` exits 0 when it verifies and otherwise says why not: no signature,
another project's namespace, a changed byte, a key no line allows. `-home`
and `-allowed-signers` stand in for `$HOME` and `/etc/quoin/allowed_signers`.

A raw SSHSIG in any namespace starting `quoin-policy` is refused unasked
by the signer (see [signer.md](signer.md#what-is-asked)). It signs a policy
only where it sees the bytes and galley shows the diff: Always on an ssh
question, `quoin policy sign`, and a policy signer's `approved` change:

```
quoin policy sign [-agent SOCKET] [-old FILE] ~/Projects/foo/chase.json
```

FILE must be canonical already (run `quoin policy fmt` and read what it
changed). The signer shows the change against the bytes the old `.sig`
verifies over, `-old FILE` or else git's `HEAD` of FILE, or against nothing
when there is no old signature or it does not verify over them, saying
which; Allow once writes `FILE.sig`. A key of your own still works too,
`ssh-keygen -Y sign -n …`, if the allowed signers name it.

## The canonical form

```
quoin policy fmt chase.json         # rewrite it
quoin policy fmt -check chase.json  # only say whether it is
```

Keys sorted, two-space indent, a newline at the end, no HTML escaping. A key
twice in one object, a number that is not an integer and bytes that are not
UTF-8 are refused rather than formatted.

## Allowed signers

`/etc/quoin/allowed_signers` is root's, from `services.quoin.policy.allowedSigners`,
and read with OpenSSH's meaning (`ssh-keygen(1)`, ALLOWED SIGNERS):

- principals are a pattern list, `*` and `?` globs, `!` negating;
- `namespaces="…"` is a pattern list the namespace must match, and with none
  a key may sign in any namespace;
- `valid-after=` and `valid-before=` are `YYYYMMDD[HHMM[SS]]`, local time, or
  UTC with a `Z`.

It is stricter in one way: a line that does not parse, an unknown option or a
`cert-authority` line refuses the whole file, and the build first (`quoin
policy signers FILE` lists what it read), since a line silently not applying
is a signer silently not trusted. Keep it apart from git's allowed signers.

```nix
services.quoin.policy.allowedSigners = [
  { principal = "dan"; key = "ecdsa-sha2-nistp256 AAAA…"; }  # namespaces="quoin-policy:*" added
  ''ops namespaces="quoin-policy:/srv/*" ssh-ed25519 AAAA…''  # a line as it is
];
```

## Finding the file

From a directory, the nearest one up to the home, both included, holding the
file. Nothing outside the home is ever a project, so neither `/` nor another
user's tree is searched; a symlink or a directory under the file's name is an
error rather than passed over, so a parent's policy never applies in its
place.

## The courier

The signer and the sudo gate run as their own users and cannot read your
home, so `quoin-courier.service` reads it for them. It runs as `forUser`,
with no network (`PrivateNetwork`, `AF_UNIX` only), the home the only path it
may write, on `/run/quoin-courier/sock`, socket-activated.

It answers only the system units its config names, each as the user it
names: a caller must have that uid and be in that unit's cgroup (by inode,
under `system.slice`). The signer adds `quoin-signer.service` as
`ssh-signer` and the gate `quoin-sudo.service` as `sudo-gate` when they are
enabled; another program's module adds its own unit, as frisket's does
`frisket.service` to write the rule a session's question was answered Always
with.

It is trusted for one thing, which project a process is in. It cannot forge a
policy, since every reader verifies the signature, and it writes only one
whose signature already verifies.

### Wire

One JSON request line, one JSON response line, per connection. Bytes are
base64, as Go's `encoding/json` writes `[]byte`. A response with `error`
set failed; a refused peer is answered `refused: …` before its request is
read. The messages are package `courier`'s `Request` and `Response`, which
the courier's server and every client import.

```
{"op":"read","pid":1234,"start":567890}
{"root":"/home/dan/Projects/foo","namespace":"quoin-policy:~/Projects/foo",
 "bytes":"ewog…","sig":"LS0t…","digest":"sha256:…"}
```

`read` takes an anchor, a pid and its start time (field 22 of
`/proc/<pid>/stat`). It refuses a pid that is no longer that process, is
not `forUser`'s, or has another root than the host's (a sandbox, whose
working directory names something else here), then finds the policy file
from its working directory. `sig` is absent when there is no signature beside the
file. No file up to the home has no `digest` and no `bytes`: its `root` and
`namespace` are the nearest directory up to the home holding `.git` (a
repository, or a worktree's file), where a first rule would be written, and
with none it is `{}`, no error.

```
{"op":"write","root":"/home/dan/Projects/foo","oldDigest":"sha256:…","bytes":"…","sig":"…"}
{"root":"/home/dan/Projects/foo","namespace":"quoin-policy:~/Projects/foo","digest":"sha256:…"}
```

`write` takes a root under the home, absolute and clean, bytes in the
canonical form and a signature that verifies over them in the root's
namespace against the allowed signers. It takes an exclusive `flock` on the
root, and refuses with "the policy file changed since it was read" unless the
file there is still the one `oldDigest` names (`""` for no file). Then it
writes both from temporary files beside them, renames the json into place
and then the sig, and syncs the directory. The files are `forUser`'s, mode
0644.

By hand, as a peer:

```
quoin-courier read PID [START]
quoin-courier write -root DIR -old DIGEST -file chase.json -sig chase.json.sig
```

### Options

| Option | Default | Meaning |
|---|---|---|
| `services.quoin.policy.fileName` | *required* | The policy file's name, its signature beside it with `.sig` added. |
| `services.quoin.policy.allowedSigners` | `[ ]` | `{ principal, key }`, or an allowed_signers line as it is. |
| `services.quoin.policy.courier.enable` | `false` | Run the courier. |
| `services.quoin.policy.courier.forUser` | `"dan"` | Whose projects, and who it runs as. |
| `services.quoin.policy.courier.peers.<unit>` | signer, gate | The user a system unit allowed to call runs as. |

They are written to `/etc/quoin/courier.json`, which `quoin-courier
serve -config` reads, keys named as the options are:

```json
{ "fileName": "chase.json", "allowedSigners": "/etc/quoin/allowed_signers",
  "peers": { "quoin-signer.service": "ssh-signer", "quoin-sudo.service": "sudo-gate" } }
```

A key it does not know, a `fileName` that is not a file name or ends in
`.sig`, an `allowedSigners` that is not absolute and clean, or a peer that is
not a `.service` stops it starting; the build runs `quoin-courier check` on
the file first, and `quoin-courier schema` prints its JSON Schema. Keep
sandboxes from `/run/quoin-courier` while it runs, as from the signer's,
the gate's and galley's sockets.

### Journal

```
journalctl -u quoin-courier -o cat | jq 'select(.msg == "read" or .msg == "write" or .msg == "refused")'
```

A `read` or `write` line per request with the peer's unit and pid, the
anchor or root, the digests and the `outcome` (`ok`, `written`, `refuse`
with `err`); a `refused` line per peer turned away, with the reason.

## The signer

With the courier on, the module gives the signer a `policy` section
(`courier`, `allowedSigners`, `fileName`), and for a direct, bound login or
SSHSIG from a chain not cut short it reads the asking program's project:

- The file applies when its `.sig` verifies, in the namespace the signer
  names from the root itself, against the allowed signers, and its `signer`
  section sets only `ssh.hosts` and `sshsig` (`allow`, `ask` or `null`),
  each key spelt exactly so, as `projpolicy.ParseSignerSection` reads it:
  an `ssh.hosts` key in the host grammar, and no `sshsig` namespace empty
  or starting `quoin-policy`. It is merged over the host's settings with
  `MergePatch`.
- Anything else is ignored with one `project policy ignored` line per file
  (by root, digest, signature and signers), and decided as if there were
  no file; so is a courier that is down or absent.
- Always, on an ssh question, signs `signer.ssh.hosts."<name>": "allow"`
  into the file and has the courier write it with the digest it read. A
  write that fails (the file changed meanwhile) still signs the login once,
  logs `always` `not saved`, and leaves a notification in galley.

`ssh.hosts` keys, the host's and a project's alike, may be patterns: `*`
alone one label, `*` within a label any run of it, `**` as the first label
one or more. See [signer.md](signer.md#what-is-asked) for the order and
the precedence.

## The sudo gate

With the courier on, the module gives the gate a `policy` section too, and
for a sudo an exec rule could decide (no danger, no warning) it reads the
project of the user's process nearest sudo: the shell that ran it, or,
past a `runuser` of root's, the nearest of the user's above.

- The file applies when its `.sig` verifies as for the signer, and its
  `sudo` section sets only `exec` (patterns to `{runAs, answer}` or
  `null`). It is merged over the host's `exec` with `MergePatch`.
- Anything else is ignored with one `project policy ignored` line per
  file, and decided by the host's rules; so is a courier that is down.
- No Always: a rule is written into the file and signed.

See [sudo.md](sudo.md#rules).

## Another program: policySigners

A program that asks a person about a request itself, with the diff of the
project's file the answer would write, may have its answer signed with no
second question: its unit, listed in `services.quoin.signer.policySigners`,
sends the new bytes over `policy-sign@quoin` with `approved` set
([signer.md](signer.md#trusted-units)), checks the signature against the
allowed signers, and has the courier write the file and its `.sig` with the
digest it read, its unit being one of the courier's peers. frisket's Always
on a session's question is this: see frisket's docs/policy.md.

## For other programs: packages projpolicy, courier and policysign

`github.com/danielbodart/quoin/projpolicy` is public, so chase and frisket
read, format, merge and verify the same way:

| Function | |
|---|---|
| `ParseSignature(armored)` | An armoured SSHSIG, strictly. |
| `Verify(message, armored, namespace, signers, principal, now)` | The principals whose lines allow it, or why not. `principal` `""` is any. |
| `Sign(rand, signer, namespace, message)` | The armoured SSHSIG `ssh-keygen -Y sign` would make, sha512. |
| `ParseAllowedSigners(b)`, `ReadAllowedSigners(path)` | The file, strictly. |
| `(*AllowedSigners).Allowed(key, principal, namespace, now)` | One key's lines. |
| `MatchPattern`, `MatchPatternList` | OpenSSH's `match_pattern` and `match_pattern_list`. |
| `Namespace(root, home)`, `RootName(root, home)` | `quoin-policy:~/rel`, and `~/rel`. |
| `Find(dir, home, name)` | The nearest directory up to home holding name; `ErrNotFound` when none. |
| `Load(root, home, name, signers)` | Bytes, digest, signature, whether it verifies and why not. |
| `ReadFile(path)` | A regular file, not through a symlink, at most 1 MiB. |
| `Decode`, `Encode`, `Format`, `Canonical` | Strict JSON and the canonical form. |
| `MergePatch(target, patch)` | RFC 7396, on decoded values; neither is changed. |
| `ParseSignerSection(b)` | A project's `signer` section as the signer reads it, or why the signer would ignore the file: chase checks a project's file by it. |
| `Digest(b)` | `sha256:<hex>`, `""` for a nil (absent) file. |

The SSHSIG and allowed-signers tests hold every line shape, principal,
namespace and verify time to stock `ssh-keygen -Y sign` and `-Y verify`,
which the flake's check requires.

`github.com/danielbodart/quoin/courier` is the courier's wire, both ends:
`Request`, `Response`, `OpRead`, `OpWrite`, `ErrChanged`, and `Read(ctx,
socket, pid, start)` and `Write(ctx, socket, root, oldDigest, bytes, sig)`
for a peer. `github.com/danielbodart/quoin/policysign` is the signer's
extension, both ends: `Extension`, `Request`, `Response`, `DecodeRequest`,
`Reply`, `ParseReply`, and `Sign(ctx, socket, request)`.
