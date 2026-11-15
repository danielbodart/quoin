#!/usr/bin/env bash
# Whether the commit checked out is due a release: prints true and exits 0
# if anything a release is built from changed since the last release, else
# prints false and exits 1. With no release yet, it is due. CI's release job
# and the weekly update ask it (mise run release-due).
#
# A release is the binaries scripts/build.sh compiles with the Go mise.toml
# pins (the flake installs those, flake.nix), the flake and its modules,
# which a consumer pins the tag for, and the Go module, which frisket and
# chase compile against. Every path below is released:
#
#   cmd courier execrule hostpattern internal peer policysign projpolicy
#   sdnotify sudo go.mod go.sum      the Go module, and the Zig plugin (sudo/)
#   tests/fakegalley tests/agenttamper   the test tools a release ships
#   VERSION scripts/version.sh       what the binaries say they are
#   scripts/build.sh                 how they are built
#   flake.nix nix                    how a consumer pinning the tag installs
#                                    them, and the modules
#
# and, from mise.toml, only the Go pin: a bump of shellcheck changes no
# binary. flake.lock (a consumer follows its own nixpkgs), the docs, the VM
# tests and the workflows are not released, nor is nix/release.json, which
# a release adds on its tag's own commit.
set -euo pipefail
unset CDPATH
shopt -s inherit_errexit

cd "$(git rev-parse --show-toplevel)"

paths=(cmd courier execrule hostpattern internal peer policysign projpolicy sdnotify sudo go.mod go.sum
    tests/fakegalley tests/agenttamper VERSION scripts/version.sh scripts/build.sh flake.nix nix)

due() { echo true; exit 0; }

# The trunk commit the last release was made from, which is the parent of
# its tag's commit, not the tag's own commit (scripts/last-release.sh):
# that adds nix/release.json, which is the release's output, not its input.
read -r _ last < <(scripts/last-release.sh) || due

# nix/release.json is never on trunk, so it never counts, though nix does.
[ -z "$(git diff --name-only "$last" HEAD -- "${paths[@]}" ':!nix/release.json')" ] || due

# The `go = "..."` line of mise.toml's [tools] at a revision, empty if
# there is none.
gopin() {
    git show "$1:mise.toml" 2>/dev/null |
        sed -n -E '/^\[tools\]/,/^\[/s/^"?go"? *= *"([^"]*)".*$/\1/p'
}
[ "$(gopin "$last")" = "$(gopin HEAD)" ] || due

echo false
exit 1
