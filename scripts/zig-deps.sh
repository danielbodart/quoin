#!/usr/bin/env bash
# Moves each of sudo/build.zig.zon's dependencies to its upstream's latest
# release tag, by `zig fetch --save`, and works nix/sudo-zig.nix's zigDeps
# hash out again from them: builds checks.sudo-zig with lib.fakeHash and writes
# back the hash Nix reports. A dependency whose tags are named after the Zig
# they build with (zwanzig's v0.15.x, for Zig 0.15) moves within that minor
# only, as mise's tools move by patch, and none moves to a tag whose own
# minimum_zig_version is past our Zig's minor: a new Zig moves by hand, with
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
	# The newest tag that still builds with our Zig: its own build.zig.zon's
	# minimum_zig_version is no newer than our minor (minish's later tags
	# want Zig 0.16 and 0.17).
	latest=
	while read -r t; do
		[ -n "$t" ] || continue
		[ "$t" = "$tag" ] && break
		want=$(curl -fsSL "https://raw.githubusercontent.com/$owner/$repo/$t/build.zig.zon" |
			sed -n 's/.*\.minimum_zig_version = "\([0-9]*\.[0-9]*\)\..*/\1/p' || true)
		if [ -n "$want" ] && [ "$(printf '%s\n' "$want" "$zig_minor" | sort -V | tail -n1)" = "$zig_minor" ]; then
			latest=$t
			break
		fi
	done < <(sort -rV <<<"$tags")
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
# Only checks.sudo-zig (-Ddev=true) takes zigDeps: the plugin itself fetches
# nothing, so building it would never report the hash.
system=$(nix eval --impure --raw --expr builtins.currentSystem)
out=$(nix build --no-link ".#checks.$system.sudo-zig" 2>&1 || true)
got=$(sed -n 's/.*got: *//p' <<<"$out")
if [ -z "$got" ]; then
	sed -i "s|$fake|$old|" "$deps"
	tail -n 30 <<<"$out" >&2
	echo "zig-deps: no hash came out of the build; zigDeps is left as it was" >&2
	exit 1
fi
sed -i "s|$fake|$got|" "$deps"
echo "zigDeps $got" >&2
