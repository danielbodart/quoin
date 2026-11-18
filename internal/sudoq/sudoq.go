// Package sudoq makes the question a sudo is asked with, local or remote,
// from one builder, so a remote sudo approved through the forwarded agent
// reads as the host would show it locally by construction: the same text,
// level and process chain table, the host's own chain, with what is true
// of the asking machine only on lines of its own, each "from here: ".
//
// The gate asks a local sudo with Question. In remote mode it sends
// Message, quoin-sudo-v2, for the forwarded agent to sign, and the signer
// reads it back with FromMessage and asks with Question too. A v1 message,
// from a gate that does not send v2 yet, is asked with Legacy.
package sudoq

import (
	"errors"
	"fmt"
	"path/filepath"
	"slices"
	"strings"

	"github.com/danielbodart/quoin/internal/galleyask"
	"github.com/danielbodart/quoin/internal/sudomsg"
	"github.com/danielbodart/quoin/peer"
)

// Subject is a sudo as it is asked about.
type Subject struct {
	// Argv is the program sudo resolved, by its path, then the arguments.
	Argv             []string
	User, RunAs, Cwd string
	// Danger are the danger lines, Env the variables outside the
	// allowlist, as the gate works them out.
	Danger, Env []string
	// Chain is the sudo's process chain on the host it runs on; nil is a
	// chain cut short with nothing in it.
	Chain *peer.Requester
	// Truncated is that command lines were left out of Chain for the
	// remote message to fit.
	Truncated bool
}

// Options are what is not the sudo's own.
type Options struct {
	// Host is the host a remote sudo runs on, as the signer names it;
	// empty for a local sudo.
	Host string
	// Lead are lines that open the text, as the caller words them.
	Lead []string
	// Here is the chain of the process on this machine that asked, for a
	// remote sudo: shown only on "from here: " lines, never in the table.
	Here *peer.Requester
	// Footer are lines that close the text.
	Footer []string
}

// Here is what starts every line about the asking machine in a remote
// sudo's question.
const Here = "from here: "

// TruncatedLine is the warning when command lines were left out of the
// chain to fit.
const TruncatedLine = "command lines were left out of the remote chain to fit"

func chainOf(s Subject) *peer.Requester {
	if s.Chain == nil {
		return &peer.Requester{Cut: true}
	}
	return s.Chain
}

// Level is "danger" for a sudo with danger lines, else "warning" for one
// whose chain is cut short or launched through a session's root, else
// "normal".
func Level(s Subject) string {
	r := chainOf(s)
	switch {
	case len(s.Danger) > 0:
		return "danger"
	case r.Cut || r.SessionRoot:
		return "warning"
	}
	return "normal"
}

// Title is "sudo" and the command, the program by its name.
func Title(argv []string) string {
	if len(argv) == 0 {
		return "sudo"
	}
	words := []string{galleyask.Clean(filepath.Base(argv[0]))}
	for _, a := range argv[1:] {
		words = append(words, galleyask.Clean(a))
	}
	return "sudo " + strings.Join(words, " ")
}

// Question is s asked: o.Lead; the danger lines; the chain's warnings; the
// command laid out; who runs it, as whom and where; the variables. A
// remote sudo's (o.Host) title ends "on <host>" and its table's summary
// starts "<host>: "; with o.Here, the asking chain's summary and warnings
// follow, each "from here: ", and its warnings raise a normal level to a
// warning, never lower one. o.Footer closes it. Every line from s is
// cleaned. The caller sets Password and Grantable.
func Question(s Subject, o Options) galleyask.Question {
	r := chainOf(s)
	lines := slices.Clone(o.Lead)
	if len(s.Danger) > 0 {
		for _, d := range s.Danger {
			lines = append(lines, galleyask.Clean(d))
		}
		lines = append(lines, "")
	}
	w := galleyask.Warnings(r)
	if s.Truncated {
		w = append(w, TruncatedLine)
	}
	if len(w) > 0 {
		lines = append(lines, w...)
		lines = append(lines, "")
	}
	lines = append(lines, galleyask.Command(s.Argv, galleyask.Width)...)
	lines = append(lines, fmt.Sprintf("%s as %s in %s", galleyask.Clean(s.User), galleyask.Clean(s.RunAs), galleyask.Clean(s.Cwd)))
	if len(s.Env) > 0 {
		lines = append(lines, "", "Run with these variables as well:")
		for _, e := range s.Env {
			lines = append(lines, "    "+shortVar(galleyask.Clean(e)))
		}
	}
	level := Level(s)
	title := Title(s.Argv)
	table := galleyask.Chain(r)
	if o.Host != "" {
		host := galleyask.Clean(o.Host)
		title += " on " + host
		table.Summary = host + ": " + table.Summary
	}
	if h := o.Here; h != nil {
		lines = append(lines, "", Here+galleyask.Summary(h))
		for _, w := range galleyask.Warnings(h) {
			lines = append(lines, Here+w)
		}
		if level == "normal" && (h.Cut || h.SessionRoot) {
			level = "warning"
		}
	}
	lines = append(lines, o.Footer...)
	return galleyask.Question{Title: title, Text: strings.Join(lines, "\n"), Level: level, Allow: "Allow", Chain: table}
}

// shortVar is a variable's line cut to galleyask.Width characters: enough
// to see what it is and that it is there, more of it in the log.
func shortVar(e string) string {
	if r := []rune(e); len(r) > galleyask.Width {
		return string(r[:galleyask.Width-1]) + "…"
	}
	return e
}

// Message is s as quoin-sudo-v2, for nonce and the host's keys. Its links
// are a copy of s's chain, which MarshalWithin may blank.
func Message(s Subject, nonce []byte, hosts [][]byte) *sudomsg.Message {
	return &sudomsg.Message{
		Version: sudomsg.V2, Nonce: nonce, HostKeys: hosts,
		User: s.User, RunAs: s.RunAs, Cwd: s.Cwd, Argv: s.Argv,
		Danger: s.Danger, Env: s.Env, Truncated: s.Truncated,
		Links: slices.Clone(chainOf(s).Chain),
	}
}

// FromMessage is the Subject a v2 message carries, its chain resolved once
// from its links. A v1 message, or one with no command, is an error.
func FromMessage(m *sudomsg.Message) (Subject, error) {
	if m.Version != sudomsg.V2 {
		return Subject{}, fmt.Errorf("a quoin-sudo-v%d message, not v2", max(m.Version, sudomsg.V1))
	}
	if len(m.Argv) == 0 {
		return Subject{}, errors.New("a quoin-sudo-v2 message with no command")
	}
	return Subject{
		Argv: m.Argv, User: m.User, RunAs: m.RunAs, Cwd: m.Cwd,
		Danger: m.Danger, Env: m.Env, Truncated: m.Truncated,
		Chain: peer.FromLinks(m.Links),
	}, nil
}

// Legacy is a v1 message asked as signers asked it before v2: its reasons,
// the asking chain's warnings, the command and who runs it, the asking
// chain as the table, titled "sudo on <host>", at the message's level or
// the asking chain's. Kept until every gate sends v2.
func Legacy(m *sudomsg.Message, o Options) galleyask.Question {
	here := o.Here
	if here == nil {
		here = &peer.Requester{Cut: true}
	}
	lines := slices.Clone(o.Lead)
	for _, r := range m.Reasons {
		lines = append(lines, galleyask.Clean(r))
	}
	if len(m.Reasons) > 0 {
		lines = append(lines, "")
	}
	if w := galleyask.Warnings(here); len(w) > 0 {
		lines = append(lines, w...)
		lines = append(lines, "")
	}
	lines = append(lines, galleyask.Command(m.Argv, galleyask.Width)...)
	lines = append(lines, fmt.Sprintf("%s as %s in %s", galleyask.Clean(m.User), galleyask.Clean(m.RunAs), galleyask.Clean(m.Cwd)))
	lines = append(lines, o.Footer...)
	level := m.Level
	if level == "" {
		level = "normal"
		if here.Cut || here.SessionRoot {
			level = "warning"
		}
	}
	return galleyask.Question{
		Title: "sudo on " + galleyask.Clean(o.Host), Text: strings.Join(lines, "\n"), Level: level,
		Allow: "Allow", Chain: galleyask.Chain(here),
	}
}
