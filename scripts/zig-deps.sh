#!/usr/bin/env bash
# Moves each of sudo/build.zig.zon's dependencies to its upstream's latest
# release tag, by `zig fetch --save`, and works nix/sudo-zig.nix's zigDeps
# hash out again from them: builds the plugin with lib.fakeHash and writes
# back the hash Nix reports. A dependency whose tags are named after the Zig
# they build with (zwanzig's v0.15.x, for Zig 0.15) moves within that minor
# only, as mise's tools move by patch: a new Zig moves by hand, with
# zig_0_NN in nix/sudo-zig.nix. The weekly update runs it, and the gate
# builds sudo-zig's check, which takes both, before anything is committed.
#
# Prints "NAME vOLD -> vNEW" for each dependency it moved.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

zon=sudo/build.zig.zon
deps=nix/sudo-zig.nix
zig_minor=$(sed -n 's/.*\.minimum_zig_version = "\([0-9]*\.[0-9]*\)\..*/\1/p' "$zon")
if [ -z "$zig_minor" ]; then
	echo "zig-deps: $zon has no minimum_zig_version" >&2
	exit 1
fi
zig() { nix shell --inputs-from . "nixpkgs#zig_${zig_minor/./_}" -c zig "$@"; }

# NAME OWNER REPO TAG, for each dependency taken from a GitHub tag's tarball.
mapfile -t pins < <(awk '
	/^ *\.[a-z0-9_]+ = \.\{/ { name = $1; sub(/^\./, "", name) }
	match($0, /"https:\/\/github\.com\/[^\/]+\/[^\/]+\/archive\/refs\/tags\/[^"]+\.tar\.gz"/) {
		url = substr($0, RSTART + 1, RLENGTH - 2)
		split(url, p, "/")
		tag = p[9]; sub(/\.tar\.gz$/, "", tag)
		print name, p[4], p[5], tag
	}' "$zon")

moved=false
for pin in "${pins[@]}"; do
	read -r name owner repo tag <<<"$pin"
	tags=$(git ls-remote --tags --refs "https://github.com/$owner/$repo" 'v*' | sed 's|.*refs/tags/||' |
		grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' || true)
	if [[ $tag == "v$zig_minor".* ]]; then
		tags=$(grep -E "^v${zig_minor//./\\.}\." <<<"$tags" || true)
	fi
	latest=$(sort -V <<<"$tags" | tail -n1)
	if [ -n "$latest" ] && [ "$latest" != "$tag" ]; then
		(cd sudo && zig fetch --save="$name" "https://github.com/$owner/$repo/archive/refs/tags/$latest.tar.gz")
		echo "$name $tag -> $latest"
		moved=true
	fi
done
$moved || exit 0

fake=sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
old=$(sed -n '/zigDeps = zig.fetchDeps/,/^  };/s/.*hash = "\(sha256-[^"]*\)";.*/\1/p' "$deps")
if [ "$(wc -l <<<"$old")" -ne 1 ] || [ -z "$old" ]; then
	echo "zig-deps: $deps must have exactly one zigDeps hash" >&2
	exit 1
fi
sed -i "s|$old|$fake|" "$deps"
got=$(nix build --no-link .#quoin-sudo-plugin 2>&1 | sed -n 's/.*got: *//p' || true)
if [ -z "$got" ]; then
	sed -i "s|$fake|$old|" "$deps"
	echo "zig-deps: no hash came out of the build; zigDeps is left as it was" >&2
	exit 1
fi
sed -i "s|$fake|$got|" "$deps"
echo "zigDeps $got" >&2
