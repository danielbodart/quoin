#!/usr/bin/env bash
# quoin's static binaries for every platform a release ships for, into
# dist/<os>-<arch>/, with the version stamped in: the four the package
# installs (quoin, quoin-signer, quoin-sudo, quoin-courier) and the two test
# tools the VM tests and nix-config's lockout check run (fakegalley,
# agenttamper). These are the release's assets and the flake's packages
# (flake.nix): Nix installs these very files rather than building its own.
#
# usage: scripts/build.sh [os/arch ...]     (default: linux/amd64 linux/arm64)
#
# The version is scripts/version.sh's, or QUOIN_VERSION's if set: outside
# CI its patch is the time, so a local build that is to be laid out as a
# release (scripts/release-assets.sh VERSION ...) names the version once and
# passes it to both.
#
# Linux only: the signer, the courier and the gate are Linux's (TPM, /proc,
# systemd), and a Mac's sudo is approved by the Zig plugin alone, which the
# flake still builds from source (nix/sudo-zig-darwin.nix).
set -euo pipefail
unset CDPATH

cd "$(git rev-parse --show-toplevel)"

version=${QUOIN_VERSION:-$(scripts/version.sh)}
targets=("$@")
[ ${#targets[@]} -gt 0 ] || targets=(linux/amd64 linux/arm64)

# The package path of each binary, named as the binary is.
programs=(cmd/quoin cmd/quoin-signer cmd/quoin-sudo cmd/quoin-courier tests/fakegalley tests/agenttamper)

for target in "${targets[@]}"; do
    os=${target%/*}
    arch=${target#*/}
    out="dist/$os-$arch"
    mkdir -p "$out"
    for p in "${programs[@]}"; do
        # A STATIC BINARY. Each gatekeeper runs as a systemd unit with
        # ProtectSystem=strict, and the sudo gate answers a plugin that sudo
        # loads as root. cgo would drag in glibc's NSS, which resolves names
        # through whatever the host's nsswitch.conf says: exactly the kind of
        # implicit configuration a gatekeeper should not have. -trimpath so
        # the binary names no path on the machine that built it.
        CGO_ENABLED=0 GOOS=$os GOARCH=$arch go build -trimpath \
            -ldflags "-s -w -X main.version=$version" \
            -o "$out/${p##*/}" "./$p"
    done
    echo "$out: $version"
done
