// Package galleyask puts one question to the person through galley's
// services socket, and trusts the answer only from galley.service. The
// socket, the peer check and the conversation are galley's services
// client's; what is here is quoin's: how a question is laid out as a
// wire.Item, and what the window's answer means.
package galleyask

import (
	"context"
	"log/slog"
	"strconv"
	"time"

	"github.com/danielbodart/galley/services"
	"github.com/danielbodart/galley/wire"
)

type Question struct {
	Title, Text, Level string
	Grantable          bool
	Password           bool
	// Allow labels a question's Allow button, "Allow once" when empty.
	Allow string
	// Chain is the process chain's rows, ChainRows, shown as a table under
	// the text; nil shows none.
	Chain *ChainTable
	// Diff is a file's change, which galley shows as a unified diff it
	// works out itself; nil shows none.
	Diff *wire.Diff
	// Always adds galley's own Always button, answered Answer.Always, and
	// AlwaysText, what it does, as the text's last line.
	Always     bool
	AlwaysText string
}

type Answer struct {
	Allowed bool
	For     time.Duration // 0 is once
	// Always is galley's Always button: Allowed, and once, as far as a
	// grant goes; what it means beyond that is the asker's.
	Always bool
	// Password is the dialog's only; the caller zeroes it.
	Password []byte
	// Window is the galley process that answered, which services checked
	// was the user's galley.service before the question was put.
	Window services.Window
}

// ErrNobody is services' own: no window to answer, whatever the reason.
var ErrNobody = services.ErrNobody

const maxFor = 24 * time.Hour

// client reaches the window; a test moves its sockets and cgroup.
var client services.Client

// Ask puts q to name's galley, through galley's services client, which
// finds the socket, checks the peer is the user's galley.service and
// carries the item and its answer. A galley that refuses the item is no one
// to ask, and the question is put once.
func Ask(ctx context.Context, name string, q Question) (Answer, error) {
	w, win, err := client.Ask(ctx, name, item(name, q))
	if err != nil {
		return Answer{}, err
	}
	return answer(q, w, Answer{Window: win}), nil
}

func item(name string, q Question) *wire.Item {
	allow := q.Allow
	if allow == "" {
		allow = "Allow once"
	}
	it := &wire.Item{
		Kind: wire.KindQuestion, Level: q.Level, Title: q.Title, Text: q.Text,
		Buttons: []wire.Button{button(wire.AnswerCancel, "Refuse"), button(wire.AnswerExtra, allow)},
	}
	it.Diff, it.Always = q.Diff, q.Always
	if q.Always && q.AlwaysText != "" {
		it.Text += "\n" + q.AlwaysText
	}
	if q.Chain != nil {
		it.Table = &wire.Table{Columns: []string{"PID", "Process", "Command"}, Rows: q.Chain.Rows, Monospace: []int{2}, Summary: q.Chain.Summary}
	}
	units := wire.Field{Kind: wire.FieldCombo, Values: []string{"minutes", "hours"}}
	switch {
	case q.Password:
		it.Kind = wire.KindForms
		it.Buttons = []wire.Button{button(wire.AnswerCancel, "Cancel"), button(wire.AnswerOK, "Allow")}
		fields := []wire.Field{{Kind: wire.FieldPassword, Label: "Password for " + name}}
		if q.Grantable {
			fields = append(fields, wire.Field{Kind: wire.FieldEntry, Label: "Remember the password for this claude for", Text: "15"}, units)
		}
		it.Forms = &wire.Forms{Fields: fields}
	case q.Grantable:
		it.Kind = wire.KindForms
		it.Buttons = append(it.Buttons, button(wire.AnswerOK, "Allow for"))
		it.Forms = &wire.Forms{Fields: []wire.Field{{Kind: wire.FieldEntry, Label: "Allow for", Text: "15"}, units}}
	}
	it.Default = len(it.Buttons) - 1
	return it
}

func button(answer, label string) wire.Button {
	return wire.Button{Answer: answer, Label: label, Underline: -1}
}

func answer(q Question, w wire.Answer, a Answer) Answer {
	switch {
	case w.Answer == wire.AnswerAlways && q.Always && !q.Password:
		a.Allowed, a.Always = true, true
	case w.Answer == wire.AnswerExtra && w.Index == 0 && !q.Password:
		a.Allowed = true
	case w.Answer == wire.AnswerOK && (q.Password || q.Grantable):
		a.Allowed = true
		fields := w.Fields
		if q.Password {
			if p := text(fields, 0); p != "" {
				a.Password = []byte(p)
			}
			if len(fields) > 0 {
				fields = fields[1:]
			}
		}
		if q.Grantable {
			a.For = duration(text(fields, 0), text(fields, 1))
		}
	}
	return a
}

func text(fields []wire.FieldValue, i int) string {
	if i >= len(fields) || fields[i].Text == nil {
		return ""
	}
	return *fields[i].Text
}

func duration(number, unit string) time.Duration {
	per := map[string]time.Duration{"": time.Minute, "minutes": time.Minute, "hours": time.Hour}[unit]
	n, err := strconv.Atoi(number)
	if err != nil || n < 0 || per == 0 {
		slog.Warn("time not understood")
		return 0
	}
	if n > int(maxFor/per) {
		return maxFor
	}
	return time.Duration(n) * per
}
