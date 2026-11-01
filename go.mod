module github.com/danielbodart/quoin

// The oldest Go a consumer is likely to have. quoin itself builds with 1.27
// (mise.toml, and go_1_27 in flake.nix), but nothing here needs more than
// 1.26, so that stays the floor. Written as 1.26.0 so that any patch release
// of the toolchain satisfies it.
go 1.26.0

require (
	github.com/danielbodart/galley v0.35.27
	github.com/foxboron/go-tpm-keyfiles v0.0.0-20260902202739-8c9c2d1005f4
	github.com/google/go-tpm v0.9.9-0.20260124013517-8f8f42cba0de
	golang.org/x/crypto v0.58.0
	golang.org/x/sys v0.49.0
	pgregory.net/rapid v1.3.0
)
