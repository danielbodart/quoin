#!/usr/bin/env bash
# The files a release carries: each binary scripts/build.sh made, for each
# platform, as a bare static executable named <binary>-<V>-<os>-<arch>, and
# SHA256SUMS over them all. scripts/release-json.sh reads that SHA256SUMS
# into nix/release.json, which is how flake.nix's packages fetch them.
#
# usage: scripts/release-assets.sh VERSION OUT [DIR ...]     (default DIR: dist)
#
# Each DIR is searched for <os>-<arch>/<binary>, as scripts/build.sh lays
# dist/ out, or as actions/download-artifact unpacks the build job's
# artifact. Every binary of every platform must be found exactly once, and
# each of the four quoin binaries this machine can run must say it is
# VERSION, so a release never carries a binary stamped with another version
# than its tag; the other platform's must at least contain VERSION's bytes,
# which -X main.version put there. (The test tools, fakegalley and
# agenttamper, have no version to stamp; they come from the same build.)
set -euo pipefail
unset CDPATH

if [ $# -lt 2 ]; then
    echo "usage: scripts/release-assets.sh VERSION OUT [DIR ...]" >&2
    exit 2
fi
version=$1
out=$2
shift 2
dirs=("$@")
[ ${#dirs[@]} -gt 0 ] || dirs=(dist)

if ! [[ $version =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "release-assets: '$version' is not MAJOR.MINOR.PATCH" >&2
    exit 2
fi

# As scripts/build.sh and scripts/release-json.sh name them.
platforms=(linux-amd64 linux-arm64)
stamped=(quoin quoin-signer quoin-sudo quoin-courier)
tools=(fakegalley agenttamper)

host_arch=$(uname -m)
case $host_arch in
x86_64) host_arch=amd64 ;;
aarch64 | arm64) host_arch=arm64 ;;
esac
host="$(uname -s | tr '[:upper:]' '[:lower:]')-$host_arch"

mkdir -p "$out"
names=()
checked=false
for platform in "${platforms[@]}"; do
    for bin in "${stamped[@]}" "${tools[@]}"; do
        found=()
        while IFS= read -r -d '' f; do found+=("$f"); done \
            < <(find "${dirs[@]}" -type f -path "*/$platform/$bin" -print0)
        if [ ${#found[@]} -ne 1 ]; then
            echo "release-assets: want exactly one $platform/$bin under ${dirs[*]}, found ${#found[@]}" >&2
            exit 1
        fi
        name="$bin-$version-$platform"
        asset="$out/$name"
        # 0755 because actions/upload-artifact does not keep the mode.
        install -m 0755 "${found[0]}" "$asset"
        names+=("$name")
        case " ${stamped[*]} " in *" $bin "*) ;; *) continue ;; esac
        if [ "$platform" = "$host" ]; then
            said=$("$asset" version)
            if [ "$said" != "$version" ]; then
                echo "release-assets: $platform's $bin says it is $said, not $version" >&2
                exit 1
            fi
            checked=true
        elif ! grep -qaF -- "$version" "$asset"; then
            echo "release-assets: $platform's $bin does not contain $version, so it was not stamped with it" >&2
            exit 1
        fi
    done
done
if ! $checked; then
    echo "release-assets: no binary for this machine ($host), so none was asked its version" >&2
    exit 1
fi

# sha256sum's own format, sorted by name.
(cd "$out" && sha256sum "${names[@]}" | LC_ALL=C sort -k2 >SHA256SUMS)
ls -l "$out"
