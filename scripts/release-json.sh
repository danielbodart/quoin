#!/usr/bin/env bash
# Prints nix/release.json for a release: its version, and for each Nix
# system each binary's release asset URL and the asset's hash in the SRI
# form fetchurl takes. flake.nix's packages are those files fetched, not a
# build from source, so a flake pinned at github:danielbodart/quoin/v<V>
# installs the very binaries the release carries, saying they are V.
#
# usage: scripts/release-json.sh VERSION SHA256SUMS
#
# SHA256SUMS is the one scripts/release-assets.sh wrote: every binary of
# every platform must be in it exactly once, under its asset's name. CI's
# release job commits the output as the tag's own commit, a child of the
# released trunk commit (ci.yml's release job says why); CI's nix job
# writes one for the binaries its own run built, for the VM tests.
set -euo pipefail
unset CDPATH

if [ $# -ne 2 ]; then
    echo "usage: scripts/release-json.sh VERSION SHA256SUMS" >&2
    exit 2
fi
version=$1
sums=$2

if ! [[ $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "release-json: '$version' is not MAJOR.MINOR.PATCH" >&2
    exit 2
fi

# The asset's GOOS-GOARCH and the Nix system it serves, and the binaries,
# in the order they are written.
pairs=(linux-amd64:x86_64-linux linux-arm64:aarch64-linux)
bins=(quoin quoin-signer quoin-sudo quoin-courier fakegalley agenttamper)

# A hex SHA-256 as SRI, sha256-<base64 of the 32 bytes>, without nix (the
# release job has none): bash's printf writes each \xHH as its byte.
sri() {
    local hex=$1 esc='' i
    for ((i = 0; i < ${#hex}; i += 2)); do esc+="\\x${hex:i:2}"; done
    printf 'sha256-%s' "$(printf '%b' "$esc" | base64 | tr -d '\n')"
}

printf '{\n  "version": "%s",\n  "assets": {\n' "$version"
for ((p = 0; p < ${#pairs[@]}; p++)); do
    platform=${pairs[p]%%:*}
    system=${pairs[p]#*:}
    printf '    "%s": {\n' "$system"
    for ((b = 0; b < ${#bins[@]}; b++)); do
        name="${bins[b]}-$version-$platform"
        mapfile -t hex < <(awk -v n="$name" '$2 == n || $2 == "*" n { print $1 }' "$sums")
        if [ ${#hex[@]} -ne 1 ] || ! [[ ${hex[0]} =~ ^[0-9a-f]{64}$ ]]; then
            echo "release-json: want one sha256 for $name in $sums, found ${#hex[@]}" >&2
            exit 1
        fi
        sep=,
        [ $((b + 1)) -lt ${#bins[@]} ] || sep=
        printf '      "%s": {\n        "url": "https://github.com/danielbodart/quoin/releases/download/v%s/%s",\n        "hash": "%s"\n      }%s\n' \
            "${bins[b]}" "$version" "$name" "$(sri "${hex[0]}")" "$sep"
    done
    sep=,
    [ $((p + 1)) -lt ${#pairs[@]} ] || sep=
    printf '    }%s\n' "$sep"
done
printf '  }\n}\n'
