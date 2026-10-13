// Command quoin is the person's own tool for a project's signed policy file:
// verifying one as the gatekeepers will, writing it in the canonical form it
// is signed in, reading an allowed signers file, and having quoin-signer
// sign one by hand, which galley asks about. It holds no key and serves
// nothing; the signer, the gate and the courier are their own binaries.
package main

import (
	"errors"
	"flag"
	"fmt"
	"os"
)

const usage = `quoin -- a project's signed policy file, by hand

  quoin policy verify [-allowed-signers FILE] [-home DIR] POLICY
        Verify POLICY.sig over POLICY's exact bytes, in the namespace of
        POLICY's directory, quoin-policy:~/rel under DIR (default $HOME)
        and quoin-policy:/abs/path elsewhere, against the allowed signers
        (default ` + defaultAllowedSigners + `). Exits 0 when it verifies,
        else says why not.

  quoin policy fmt [-check] POLICY
        Rewrite POLICY in the canonical form a policy is signed in: keys
        sorted, two-space indent, a newline at the end, integers only. With
        -check, only say whether it already is.

  quoin policy signers FILE
        Read an allowed signers file as verify would, and list its lines.

  quoin policy sign [-agent SOCKET] [-old FILE] POLICY
        Have quoin-signer sign POLICY, already canonical, in its directory's
        namespace: galley shows the change and asks, and on Allow POLICY.sig
        is written. The change is shown against the bytes POLICY.sig was
        made over, -old FILE or else git's HEAD of POLICY, when the signature
        verifies over them; otherwise against nothing. -agent defaults to
        $SSH_AUTH_SOCK.
`

func main() {
	if len(os.Args) < 2 {
		fmt.Fprint(os.Stderr, usage)
		os.Exit(2)
	}
	var err error
	switch os.Args[1] {
	case "policy":
		err = runPolicy(os.Args[2:], os.Stdout)
	case "-h", "--help", "help":
		fmt.Fprint(os.Stdout, usage)
	default:
		fmt.Fprintf(os.Stderr, "quoin: unknown command %q\n\n%s", os.Args[1], usage)
		os.Exit(2)
	}
	if err != nil {
		if errors.Is(err, flag.ErrHelp) {
			os.Exit(2)
		}
		fmt.Fprintf(os.Stderr, "quoin %s: %v\n", os.Args[1], err)
		os.Exit(1)
	}
}
