module github.com/danielbodart/quoin

// The oldest Go a consumer is likely to have. Both nixpkgs branches in play --
// nixos-26.05, which nix-config pins, and nixos-unstable -- ship 1.26.7, so
// 1.26 is the floor and there is nothing to gain by claiming a newer one.
// Written as 1.26.0 rather than 1.26.7 so that any patch release of the
// toolchain satisfies it.
go 1.26.0

require (
	github.com/danielbodart/galley v0.30.22-0.20261013085913-4f8859f2327b
	github.com/foxboron/go-tpm-keyfiles v0.0.0-20260427185012-515ba073c4c1
	github.com/google/go-tpm v0.9.9-0.20260124013517-8f8f42cba0de
	golang.org/x/crypto v0.57.0
	golang.org/x/sys v0.48.0
	pgregory.net/rapid v1.3.0
)
