#!/usr/bin/env bash
# Tests scripts/release-json.sh against a known SHA256SUMS: the file it
# writes is the one flake.nix reads, with each hash in the SRI form
# `nix hash convert --hash-algo sha256 --to sri` gives (worked out with it
# once, and written here, since check runs where there may be no nix), and
# a SHA256SUMS missing a binary, or a version that is not one, makes
# nothing. Run by mise run check (the scripts-test task).
set -euo pipefail
unset CDPATH

script=$(cd "$(dirname "$0")" && pwd)/release-json.sh
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

failures=0
fail() { echo "FAIL: $*" >&2; failures=$((failures + 1)); }

# Each "hash" is the sha256 of the asset's own name, which is all a test
# of the layout needs.
cat >"$work/SHA256SUMS" <<'SUMS'
750c91b0a2d03d2d268c1c31b9816c976f2bf2752bc0180a96e1aaebb9527df9  agenttamper-0.101.30-linux-amd64
3235d5625fa12c4af3d4e8d8acecc207c0380b0cb201c3a9fb15f4af4466083b  agenttamper-0.101.30-linux-arm64
0a0c815b64c60a15f492c9da65be04aa15c1d16ce5d99577b2d57b661a1450a2  fakegalley-0.101.30-linux-amd64
aebf058974d870b1dfc9e67449b76798e49c9c871e8fcdf0d97edd2fc0ccf555  fakegalley-0.101.30-linux-arm64
e632c43806a6607ac49c718d838c7f5af044000b12498be6d61eb5c21616d864  quoin-0.101.30-linux-amd64
0952338fb3c22550efe4b0a316407bb0b83c22372007fbcf23ea66e020fefac5  quoin-0.101.30-linux-arm64
a7110402b72c87bb32fd64c3df131853f3c0371d8a2259bf65da8149a9bd7e6c  quoin-courier-0.101.30-linux-amd64
eeba1449697f0c413632ee675bd2201411a601415cd19ff8c9f6bf239e6f9d6e  quoin-courier-0.101.30-linux-arm64
2516b287e2f24976bd39af3664095b29066ccb05f65ae42fa4f440bbf9aca925  quoin-signer-0.101.30-linux-amd64
9f6a1c2bfd34f62fe63943f3708840aebd349c27971495dec2c85b680bfaeaf7  quoin-signer-0.101.30-linux-arm64
7291f741e92bd2a0a1e93859f9c2b711d2795afc5ed4a0a7abae67b5078ec3b2  quoin-sudo-0.101.30-linux-amd64
0e92efe257c28db813c9f88e6934126ff43f7505299d40509f44a2bfec2f0071  quoin-sudo-0.101.30-linux-arm64
SUMS

cat >"$work/want.json" <<'WANT'
{
  "version": "0.101.30",
  "assets": {
    "x86_64-linux": {
      "quoin": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/quoin-0.101.30-linux-amd64",
        "hash": "sha256-5jLEOAamYHrEnHGNg4x/WvBEAAsSSYvm1h61whYW2GQ="
      },
      "quoin-signer": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/quoin-signer-0.101.30-linux-amd64",
        "hash": "sha256-JRayh+LySXa9Oa82ZAlbKQZsywX2WuQvpPRAu/msqSU="
      },
      "quoin-sudo": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/quoin-sudo-0.101.30-linux-amd64",
        "hash": "sha256-cpH3Qekr0qCh6ThZ+cK3EdJ5Wvxe1KCnq65ntQeOw7I="
      },
      "quoin-courier": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/quoin-courier-0.101.30-linux-amd64",
        "hash": "sha256-pxEEArcsh7sy/WTD3xMYU/PANx2KIlm/ZdqBSam9fmw="
      },
      "fakegalley": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/fakegalley-0.101.30-linux-amd64",
        "hash": "sha256-CgyBW2TGChX0ksnaZb4EqhXB0Wzl2ZV3stV7ZhoUUKI="
      },
      "agenttamper": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/agenttamper-0.101.30-linux-amd64",
        "hash": "sha256-dQyRsKLQPS0mjBwxuYFsl28r8nUrwBgKluGq67lSffk="
      }
    },
    "aarch64-linux": {
      "quoin": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/quoin-0.101.30-linux-arm64",
        "hash": "sha256-CVIzj7PCJVDv5LCjFkB7sLg8IjcgB/vPI+pm4CD++sU="
      },
      "quoin-signer": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/quoin-signer-0.101.30-linux-arm64",
        "hash": "sha256-n2ocK/009i/mOUPzcIhArr00nCeXFJXewshbaAv66vc="
      },
      "quoin-sudo": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/quoin-sudo-0.101.30-linux-arm64",
        "hash": "sha256-DpLv4lfCjbgTyfiOaTQSb/Q/dQUpnUBQn0Siv+wvAHE="
      },
      "quoin-courier": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/quoin-courier-0.101.30-linux-arm64",
        "hash": "sha256-7roUSWl/DEE2Mu5nW9IgFBGmAUFc0Z/4yfa/I55vnW4="
      },
      "fakegalley": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/fakegalley-0.101.30-linux-arm64",
        "hash": "sha256-rr8FiXTYcLHfyeZ0SbdnmOScnIcej83w2X7dL8DM9VU="
      },
      "agenttamper": {
        "url": "https://github.com/danielbodart/quoin/releases/download/v0.101.30/agenttamper-0.101.30-linux-arm64",
        "hash": "sha256-MjXVYl+hLErz1OjYrOzCB8A4CwyyAcOp+xX0r0RmCDs="
      }
    }
  }
}
WANT

if ! "$script" 0.101.30 "$work/SHA256SUMS" >"$work/got.json"; then
    fail "a release's SHA256SUMS: refused"
elif ! diff -u "$work/want.json" "$work/got.json"; then
    fail "a release's SHA256SUMS: not the release.json flake.nix wants"
fi

grep -v fakegalley-0.101.30-linux-arm64 "$work/SHA256SUMS" >"$work/short"
if "$script" 0.101.30 "$work/short" >/dev/null 2>&1; then
    fail "a SHA256SUMS without linux-arm64's fakegalley: accepted"
fi

if "$script" 0.101.31 "$work/SHA256SUMS" >/dev/null 2>&1; then
    fail "another version's SHA256SUMS: accepted"
fi

if "$script" v0.101.30 "$work/SHA256SUMS" >/dev/null 2>&1; then
    fail "a version with a v: accepted"
fi

if [ $failures -gt 0 ]; then
    exit 1
fi
echo "release-json: ok"
