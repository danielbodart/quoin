// Package sudoq makes the question a sudo is asked with, local or remote,
// from one builder, so a remote sudo approved through the forwarded agent
// reads as the host would show it locally by construction: the same text,
// level and process chain table, the host's own chain, with what is true
// of the asking machine only on lines of its own, each "from here: ".
//
// The gate asks a local sudo with Question. In remote mode it sends
// Message, a sudomsg.Message, for the forwarded agent to sign, and the
// signer reads it back with FromMessage and asks with Question too.
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
	// Rule is the rule that asked; nil is none.
	Rule *sudomsg.Rule
}

// Options are what is not the sudo's own.
type Options struct {
	// Host is the host a remote sudo runs on, as the signer names it;
	// empty for a local sudo.
	Host string
	// Via are the hosts a remote sudo was reached through, from this
	// machine out, before Host.
	Via []string
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

// RuleLine opens the question a rule asks.
func RuleLine(r sudomsg.Rule) string {
	return fmt.Sprintf("asked, with no password, by the %s %s", galleyask.Clean(r.Source), galleyask.Clean(r.Pattern))
}

// Route is host, then " via " and the hosts it was reached through, from
// this machine out: "B via A". Each name is cleaned.
func Route(host string, via []string) string {
	route := galleyask.Clean(host)
	if len(via) > 0 {
		names := make([]string, len(via))
		for i, v := range via {
			names[i] = galleyask.Clean(v)
		}
		route += " via " + strings.Join(names, ", ")
	}
	return route
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

// Question is s asked: the rule's line; o.Lead; the danger lines; the
// chain's warnings; the command laid out; who runs it, as whom and where;
// the variables. A remote sudo's (o.Host) title ends "on " and its Route
// and its table's summary starts "<host>: "; with o.Here, the asking chain's summary and warnings
// follow, each "from here: ", and its warnings raise a normal level to a
// warning, never lower one. o.Footer closes it. Every line from s is
// cleaned. The caller sets Password and Grantable.
func Question(s Subject, o Options) galleyask.Question {
	r := chainOf(s)
	var lines []string
	if s.Rule != nil {
		lines = append(lines, RuleLine(*s.Rule), "")
	}
	lines = append(lines, o.Lead...)
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
		title += " on " + Route(o.Host, o.Via)
		table.Summary = galleyask.Clean(o.Host) + ": " + table.Summary
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

// Message is s as a sudomsg.Message, for nonce and the host's keys, asked
// as a dialog with presence required and no window: the caller sets
// Decision, Presence, Window and WindowKey to what it decided. Its links
// are a copy of s's chain, which MarshalWithin may blank.
func Message(s Subject, nonce []byte, hosts [][]byte) *sudomsg.Message {
	return &sudomsg.Message{
		Nonce: nonce, HostKeys: hosts,
		User: s.User, RunAs: s.RunAs, Cwd: s.Cwd, Argv: s.Argv,
		Danger: s.Danger, Env: s.Env, Truncated: s.Truncated,
		Links:    slices.Clone(chainOf(s).Chain),
		Rule:     s.Rule,
		Decision: sudomsg.Dialog, Presence: sudomsg.Required,
	}
}

// FromMessage is the Subject a message carries, its chain resolved once
// from its links. One with no command is an error.
func FromMessage(m *sudomsg.Message) (Subject, error) {
	if len(m.Argv) == 0 {
		return Subject{}, errors.New("a quoin-sudo message with no command")
	}
	return Subject{
		Argv: m.Argv, User: m.User, RunAs: m.RunAs, Cwd: m.Cwd,
		Danger: m.Danger, Env: m.Env, Truncated: m.Truncated,
		Chain: peer.FromLinks(m.Links), Rule: m.Rule,
	}, nil
}
