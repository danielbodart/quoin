package projpolicy

import (
	"fmt"
	"maps"
	"slices"
	"strings"

	"github.com/danielbodart/quoin/hostpattern"
)

// SignerSection is a project's signer section as quoin-signer reads it: the
// only settings a project may layer over the host's, ssh.hosts and sshsig,
// each a map from a key to allow, ask or nil (JSON null, which deletes the
// host's rule of that key when the section is merged over the host's).
type SignerSection struct {
	SSH    *SignerSSH         `json:"ssh,omitempty"`
	SSHSIG map[string]*string `json:"sshsig,omitempty"`
}

// SignerSSH is a signer section's ssh object.
type SignerSSH struct {
	Hosts map[string]*string `json:"hosts,omitempty"`
}

// The rules a signer section's maps may hold, besides null.
const (
	SignerAllow = "allow"
	SignerAsk   = "ask"
)

// ParseSignerSection reads b, a project's signer section, as quoin-signer
// does, or says why the signer would ignore the file it is in. It is the
// one reading: chase checks a project's file by it, so it refuses exactly
// what the signer would not apply.
//
// b is read as Decode reads a policy file, and must be null (no section)
// or an object whose keys are exactly ssh and sshsig, and ssh's exactly
// hosts: a key in any other case is refused, not folded, since the merge
// over the host's rules matches keys exactly. Every rule is allow, ask or
// null; an ssh.hosts key is in hostpattern's grammar; and an sshsig key is
// a namespace that is neither empty nor one of the project policies'
// own, under NamespacePrefix, which only a policy sign may sign in.
func ParseSignerSection(b []byte) (SignerSection, error) {
	var s SignerSection
	v, err := Decode(b)
	if err != nil {
		return s, err
	}
	if v == nil {
		return s, nil
	}
	top, err := signerObject(v, "", "ssh", "sshsig")
	if err != nil {
		return s, err
	}
	if sv, ok := top["ssh"]; ok && sv != nil {
		ssh, err := signerObject(sv, "ssh", "hosts")
		if err != nil {
			return s, err
		}
		s.SSH = &SignerSSH{}
		if s.SSH.Hosts, err = signerRules(ssh["hosts"], "ssh.hosts", hostpattern.Check); err != nil {
			return s, err
		}
	}
	s.SSHSIG, err = signerRules(top["sshsig"], "sshsig", func(ns string) error {
		if ns == "" || strings.HasPrefix(ns, NamespacePrefix) {
			return fmt.Errorf("%q is not a namespace a rule may name", ns)
		}
		return nil
	})
	return s, err
}

const signerKeys = "a project's signer section sets ssh.hosts and sshsig"

// signerObject is v as an object holding no key but these.
func signerObject(v any, at string, keys ...string) (map[string]any, error) {
	m, ok := v.(map[string]any)
	if !ok {
		return nil, fmt.Errorf("%sis not an object (%s)", prefix(at), signerKeys)
	}
	for _, k := range slices.Sorted(maps.Keys(m)) {
		if !slices.Contains(keys, k) {
			return nil, fmt.Errorf("%sunknown key %q (%s)", prefix(at), k, signerKeys)
		}
	}
	return m, nil
}

// signerRules is v as a map of rules, nil for null, each key checked.
func signerRules(v any, at string, check func(string) error) (map[string]*string, error) {
	if v == nil {
		return nil, nil
	}
	m, ok := v.(map[string]any)
	if !ok {
		return nil, fmt.Errorf("%s: is not an object of allow, ask or null", at)
	}
	out := make(map[string]*string, len(m))
	for _, k := range slices.Sorted(maps.Keys(m)) {
		if err := check(k); err != nil {
			return nil, fmt.Errorf("%s: %w", at, err)
		}
		switch r := m[k].(type) {
		case nil:
			out[k] = nil
		case string:
			if r != SignerAllow && r != SignerAsk {
				return nil, fmt.Errorf("%s.%s: %q is not allow or ask", at, k, r)
			}
			out[k] = &r
		default:
			return nil, fmt.Errorf("%s.%s: not allow, ask or null", at, k)
		}
	}
	return out, nil
}

func prefix(at string) string {
	if at == "" {
		return ""
	}
	return at + ": "
}
