package execrule

import "strings"

// Spec is what Compile reads of a route: whether its commands are typed
// into a device's own shell, its exec rules, its env names and what an
// unmatched command gets. The JSON names are a route's own, so a route type
// elsewhere can embed Spec and be read and written as it always was, with
// one definition of each field rather than a copy that could drift.
type Spec struct {
	// Shell is for a device whose login shell ignores the command an exec
	// carries -- a router's or a modem's CLI -- so the command is typed into
	// that shell instead. Only a single simple command of plain words is
	// readable then, since the device's shell is no shell this package knows
	// the grammar of.
	Shell bool `json:"shell,omitempty"`
	// Exec decides each simple command in a command by the most literal
	// pattern it matches, made stricter by every arg rule that matches it;
	// the strictest of them decides the command.
	Exec []Rule `json:"exec,omitempty"`
	// Env are the variables a command may set for itself -- `LANG=C ls`,
	// `env LC_ALL=C ls` -- and still be decided as the command it runs: each
	// a name, or a name's start and a trailing "*", as "LC_*". A command
	// setting any other is unreadable. A name that changes what any command
	// runs -- PATH, LD_*, BASH_ENV and their kin -- is refused.
	Env []string `json:"env,omitempty"`
	// Unmatched is "ask", the default, or "refuse": for a simple command no
	// rule matches, and every command a shell would read as anything but
	// its words.
	Unmatched string `json:"unmatched,omitempty"`
}

// Rule decides the simple commands Command matches: admitted, asked about,
// or refused. With Arg, it only tightens: it asks about or refuses those of
// them with an argument Arg matches, or, with no Command, every simple
// command with one.
type Rule struct {
	// Command is words separated by single spaces: each literal, "*" for
	// exactly one word, or, last, "**" for any number of them. Optional
	// with Arg.
	Command string `json:"command,omitempty"`
	// Arg is a glob whose "*" is any run of characters but "/", matched
	// against each argument whole, what follows its first "=", and each
	// "/"-separated part of either. A rule with one must ask or refuse.
	Arg    string `json:"arg,omitempty"`
	Ask    bool   `json:"ask,omitempty"`
	Refuse bool   `json:"refuse,omitempty"`
	// Operation is what the rule is: shown to the person asked and logged,
	// never matched on.
	Operation *Operation `json:"operation,omitempty"`
}

// Operation names what a rule is, for the person asked and the log: an id
// and a summary, which Compile requires, and the rest optional.
type Operation struct {
	ID          string `json:"id"`
	Summary     string `json:"summary"`
	Description string `json:"description,omitempty"`
	// Class is "read", "write" or "guarded", and Category the API's own
	// grouping: shown to the person asked, never matched on.
	Class    string `json:"class,omitempty"`
	Category string `json:"category,omitempty"`
}

// RuleName splits a rule's name, as Decision.Rule names one, back into
// its parts: a command pattern, a pattern and "[arg GLOB]", or "[arg GLOB]"
// alone. A file that keys its rules by name reads them with it.
func RuleName(key string) (command, arg string) {
	i := strings.Index(key, "[arg ")
	if i < 0 || !strings.HasSuffix(key, "]") || i > 0 && key[i-1] != ' ' {
		return key, ""
	}
	return strings.TrimSuffix(key[:i], " "), key[i+len("[arg ") : len(key)-1]
}
