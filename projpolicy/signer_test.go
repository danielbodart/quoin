package projpolicy

import (
	"reflect"
	"strings"
	"testing"
)

func rule(s string) *string { return &s }

func TestASignerSectionIsSSHHostsAndSSHSIGOfAllowAskOrNull(t *testing.T) {
	for _, c := range []struct {
		in   string
		want SignerSection
	}{
		{`null`, SignerSection{}},
		{`{}`, SignerSection{}},
		{`{"ssh": null, "sshsig": null}`, SignerSection{}},
		{`{"ssh": {}}`, SignerSection{SSH: &SignerSSH{}}},
		{`{"ssh": {"hosts": {"github.com": "allow", "*.lan": "ask", "**.bodar.com": null}}}`,
			SignerSection{SSH: &SignerSSH{Hosts: map[string]*string{"github.com": rule("allow"), "*.lan": rule("ask"), "**.bodar.com": nil}}}},
		{`{"sshsig": {"git": "allow", "file": null, "quoin": "ask"}}`,
			SignerSection{SSHSIG: map[string]*string{"git": rule("allow"), "file": nil, "quoin": rule("ask")}}},
	} {
		got, err := ParseSignerSection([]byte(c.in))
		if err != nil {
			t.Errorf("%s: %v", c.in, err)
			continue
		}
		if !reflect.DeepEqual(got, c.want) {
			t.Errorf("%s: %+v, want %+v", c.in, got, c.want)
		}
	}
}

func TestASignerSectionRefusesWhatTheSignerWouldNotApply(t *testing.T) {
	for _, c := range []struct{ in, says string }{
		{``, "no JSON value"},
		{`{} {}`, "more than one"},
		{`"allow"`, "not an object"},
		{`[]`, "not an object"},
		{`{"terminal": "allow"}`, `unknown key "terminal"`},
		{`{"SSH": {"hosts": {"github.com": "allow"}}}`, `unknown key "SSH"`},
		{`{"sshSig": {"git": "allow"}}`, `unknown key "sshSig"`},
		{`{"ssh": {"Hosts": {"github.com": "allow"}}}`, `ssh: unknown key "Hosts"`},
		{`{"ssh": {"agent": true}}`, `ssh: unknown key "agent"`},
		{`{"ssh": "allow"}`, "ssh: is not an object"},
		{`{"ssh": {"hosts": ["github.com"]}}`, "ssh.hosts: is not an object"},
		{`{"sshsig": "allow"}`, "sshsig: is not an object"},
		{`{"ssh": {"hosts": {"github.com": "deny"}}}`, `ssh.hosts.github.com: "deny" is not allow or ask`},
		{`{"ssh": {"hosts": {"github.com": "Allow"}}}`, "is not allow or ask"},
		{`{"ssh": {"hosts": {"github.com": true}}}`, "ssh.hosts.github.com: not allow, ask or null"},
		{`{"ssh": {"hosts": {"github.com": 1}}}`, "not allow, ask or null"},
		{`{"ssh": {"hosts": {"github.com": {}}}}`, "not allow, ask or null"},
		{`{"ssh": {"hosts": {"a**b": "allow"}}}`, "ssh.hosts:"},
		{`{"ssh": {"hosts": {"a.**": "allow"}}}`, "ssh.hosts:"},
		{`{"ssh": {"hosts": {"": "allow"}}}`, "ssh.hosts:"},
		{`{"ssh": {"hosts": {"|1|aGFzaA==|eA=": "allow"}}}`, "ssh.hosts:"},
		{`{"ssh": {"hosts": {"a?b": null}}}`, "ssh.hosts:"},
		{`{"sshsig": {"": "allow"}}`, "is not a namespace a rule may name"},
		{`{"sshsig": {"quoin-policy:~/Projects/foo": "allow"}}`, "is not a namespace a rule may name"},
		{`{"sshsig": {"quoin-policy": null}}`, "is not a namespace a rule may name"},
		{`{"sshsig": {"git": "deny"}}`, `sshsig.git: "deny" is not allow or ask`},
		{`{"sshsig": {"git": "allow", "git": "ask"}}`, `key "git" twice`},
		{`{"sshsig": {"git": 1.5}}`, "not an integer"},
	} {
		_, err := ParseSignerSection([]byte(c.in))
		if err == nil {
			t.Errorf("%s was accepted", c.in)
		} else if !strings.Contains(err.Error(), c.says) {
			t.Errorf("%s: %v, want it to say %s", c.in, err, c.says)
		}
	}
}
