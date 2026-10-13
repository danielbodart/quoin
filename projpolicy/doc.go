// Package projpolicy is a project's signed policy file: the canonical JSON
// it is signed in, the JSON Merge Patch that layers it, the SSHSIG sidecar
// beside it (file.sig, as stock ssh-keygen -Y sign writes it), the
// allowed_signers file that says whose signature counts, the namespace that
// binds a signature to the project's directory, finding the file above a
// working directory, and the signer's reading of the file's signer section.
//
// It is public so that every program that reads, formats, merges, signs or
// verifies the same file -- the launcher that writes it, the signer and the
// sudo gate that verify it, a proxy that writes what a person answered
// Always -- uses these functions rather than a copy that could drift: a
// policy one signs is one the others verify. docs/policy.md says what each
// means.
//
// Everything here is a pure function of its arguments and the files it is
// pointed at; nothing reads the environment.
package projpolicy
