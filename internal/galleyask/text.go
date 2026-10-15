package galleyask

import (
	"fmt"
	"path/filepath"
	"slices"
	"strconv"
	"strings"
	"unicode"

	"github.com/danielbodart/quoin/peer"
)

const maxArg = 1000

// Name is the program a link runs, by its argv0, since comm is cut at 15
// characters and a wrapped program's comm is its wrapper's.
func Name(l peer.Link) string {
	if len(l.Cmdline) > 0 && l.Cmdline[0] != "" {
		return Clean(filepath.Base(l.Cmdline[0]))
	}
	return Clean(l.Comm)
}

// link is one process the chain shows: its pid, its name and its command
// laid out.
type link struct {
	pid   int
	name  string
	lines []string
}

// shown runs from the link the question names (topOf), or the top of the
// chain, down to the leaf, leaving out the shells between them: the top by
// its name alone, the rest by their names and commands, each folded against
// the one below it (fold) and laid out by Command, or, for Claude Code's
// Bash tool, the command the tool runs, laid out as a script (bashTool).
func shown(r *peer.Requester) []link {
	top := topOf(r)
	var pids []int
	var argvs [][]string
	for i := top; i >= 0; i-- {
		l := r.Chain[i]
		switch {
		case i == top:
			pids, argvs = append(pids, l.Pid), append(argvs, nil)
		case i == 0 || !Shell(l.Comm):
			argv := l.Cmdline
			if len(argv) == 0 {
				argv = []string{l.Comm}
			}
			pids, argvs = append(pids, l.Pid), append(argvs, argv)
		}
	}
	out := make([]link, len(pids))
	for i := range pids {
		if i == 0 {
			out[0] = link{pid: pids[0], name: Name(r.Chain[top])}
			continue
		}
		argv := argvs[i]
		if i+1 < len(argvs) {
			argv = fold(argv, argvs[i+1])
		}
		lines := Command(argv, Width)
		if body, ok := bashTool(argv); ok {
			lines = Script(body, Width)
		}
		out[i] = link{pids[i], Clean(filepath.Base(argv[0])), lines}
	}
	return out
}

// topOf is the index of the link the chain is shown from: r.Shown, or
// r.Anchor where Shown is not set, or the top of the chain.
func topOf(r *peer.Requester) int {
	from := r.Shown
	if from == nil {
		from = r.Anchor
	}
	for i := range r.Chain {
		if &r.Chain[i] == from {
			return i
		}
	}
	return len(r.Chain) - 1
}

// Folded is what stands in a folded command for what the row below it shows.
const Folded = "…"

// fold is argv with what the next row shows in full taken out, matched
// exactly, argument for argument, so nothing can hide in the fold: a
// wrapper whose arguments end with next's whole command keeps only its own
// (timeout 1800), and one that holds next's script, or next's command
// before arguments of its own, has it as … (script -qefc … /dev/null).
// argv[0] is never folded.
func fold(argv, next []string) []string {
	if len(next) > 0 && len(argv) > len(next) && slices.Equal(argv[len(argv)-len(next):], next) {
		return argv[:len(argv)-len(next)]
	}
	for i := 1; len(next) > 0 && i+len(next) <= len(argv); i++ {
		if slices.Equal(argv[i:i+len(next)], next) {
			return slices.Concat(argv[:i], []string{Folded}, argv[i+len(next):])
		}
	}
	w := wrapped(next)
	if s := scriptArg(next[w:]); s > 0 {
		script := next[w+s]
		for i := 1; i < len(argv); i++ {
			if argv[i] == script {
				return slices.Concat(argv[:i], []string{Folded}, argv[i+1:])
			}
		}
	}
	return argv
}

// ChainRows is the chain as a table's rows, top first: each process's pid,
// its name and its command's lines.
func ChainRows(r *peer.Requester) [][]string {
	var rows [][]string
	for _, l := range shown(r) {
		rows = append(rows, []string{strconv.Itoa(l.pid), l.name, strings.Join(l.lines, "\n")})
	}
	return rows
}

// ChainTable is the chain as a question's table: its rows, and the line
// the queue's row shows for it.
type ChainTable struct {
	Rows    [][]string
	Summary string
}

// Chain is the chain as a question shows it, in its table.
func Chain(r *peer.Requester) *ChainTable {
	return &ChainTable{Rows: ChainRows(r), Summary: Summary(r)}
}

// maxSummary is the most characters of a summary: a row shows far fewer.
const maxSummary = 300

// Summary is the chain in a line: the name of the link topOf finds, and
// what the leaf runs -- a shell's script, or the command Claude Code's
// Bash tool runs, on one line -- or that link's command when it is the leaf.
// Where the leaf is git's signing program, shown through, the line is what
// its parent runs, unless that is a shell: git commit, not ssh-keygen's
// buffer file.
func Summary(r *peer.Requester) string {
	if len(r.Chain) == 0 {
		return ""
	}
	top := topOf(r)
	leaf := 0
	if r.Anchor == &r.Chain[0] && r.Shown != r.Anchor && top > 1 && !Shell(r.Chain[1].Comm) {
		leaf = 1
	}
	line := leafLine(r.Chain[leaf])
	if top > 0 {
		line = Name(r.Chain[top]) + " ← " + line
	}
	if rs := []rune(line); len(rs) > maxSummary {
		line = string(rs[:maxSummary-1]) + "…"
	}
	return line
}

// leafLine is what l runs, on one line.
func leafLine(l peer.Link) string {
	argv := l.Cmdline
	if len(argv) == 0 {
		return Clean(l.Comm)
	}
	w := wrapped(argv)
	if s := scriptArg(argv[w:]); s > 0 {
		script := argv[w+s]
		if body, ok := bashTool(argv[w:]); ok {
			script = body
		}
		return Clean(strings.Join(strings.Fields(script), " "))
	}
	words := append([]string{filepath.Base(argv[0])}, argv[1:]...)
	return Clean(strings.Join(strings.Fields(strings.Join(words, " ")), " "))
}

// Shell is whether name is a shell's.
func Shell(name string) bool {
	switch name {
	case "sh", "ash", "dash", "bash", "rbash", "zsh", "ksh", "mksh", "oksh", "pdksh", "yash", "posh", "csh", "tcsh", "fish":
		return true
	}
	return false
}

// Warnings are the lines that open a question for a Cut or SessionRoot
// chain.
func Warnings(r *peer.Requester) []string {
	var lines []string
	if r.SessionRoot {
		lines = append(lines, "launched through "+sessionRoot(r.Anchor))
	}
	if r.Cut {
		lines = append(lines, "the process chain was cut short")
	}
	return lines
}

func sessionRoot(a *peer.Link) string {
	switch {
	case a.Pid == 1:
		return "pid 1"
	case a.Comm == ".kgx-wrapped":
		return "the terminal server"
	}
	return "systemd --user"
}

// Clean cuts s at maxArg characters and escapes control, bidi and line
// separator characters.
func Clean(s string) string {
	if r := []rune(s); len(r) > maxArg {
		s = string(r[:maxArg])
	}
	var b strings.Builder
	for _, r := range s {
		if unicode.IsControl(r) || unicode.In(r, unicode.Bidi_Control, unicode.Zl, unicode.Zp) {
			fmt.Fprintf(&b, `\u%04x`, r)
			continue
		}
		b.WriteRune(r)
	}
	return b.String()
}
