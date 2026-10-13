// Package execrule is how a command is decided by rules: the grammar a
// command is read by, and a set of exec rules, env names and unmatched
// matched against what it reads. An SSH proxy decides every command a
// sandbox sends with it, the sudo gate every command a sudo runs, and a
// launcher tests the catalogue of commands it writes rules for with it too,
// rather than a copy of it that could drift: what one says a command is is
// what the others will say.
//
// Everything here is a pure function of its arguments and imports nothing
// else of this module, so that any program can take its types as its own.
// Compile reads a Spec -- Exec, Env, Unmatched and Shell -- and refuses what
// no route should load with; Rules.Decide answers one command.
package execrule
