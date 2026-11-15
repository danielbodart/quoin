#!/usr/bin/env bash
# Evaluates the flake's outputs for every system CI does not build on,
# aarch64-linux and aarch64-darwin: every package, the dev shell and every
# check but the VM tests, down to their derivations, without building anything. CI builds
# x86_64-linux only, so this is what keeps an evaluation error on arm64 or
# a Mac from landing unseen. The Go packages exist only where
# nix/release.json does (flake.nix), so CI runs this after
# scripts/nix-local-release.sh has written one.
#
# usage: scripts/nix-eval-systems.sh     (from anywhere in the repository)
set -euo pipefail
unset CDPATH

cd "$(git rev-parse --show-toplevel)"

built=x86_64-linux
names() { nix eval --json ".#$1" --apply builtins.attrNames | jq -r '.[]'; }
# Not the VM tests: each makes its throwaway keys in a derivation built for
# its system and reads them at evaluation time (tests/*.nix), so it can only
# be evaluated on that system.
vms='[ "signer" "sudo-gate" "sudo-remote" "policy" ]'
drvs="xs: builtins.mapAttrs (_: x: x.drvPath) (removeAttrs xs $vms)"

for out in packages devShells checks; do
    mapfile -t systems < <(names "$out")
    for sys in "${systems[@]}"; do
        [ "$sys" != "$built" ] || continue
        nix eval --json ".#$out.$sys" --apply "$drvs" >/dev/null
        echo "$sys: $out evaluate"
    done
done
