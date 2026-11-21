package sudomsg

import (
	"bytes"
	"encoding/binary"
	"errors"
	"maps"
	"reflect"
	"slices"
	"strings"
	"testing"
)

// exampleAnswer allows example from a laptop through a jump host to this
// host, its second hop, with presence verified and an hour's window.
func exampleAnswer(t testing.TB) *Answer {
	return &Answer{
		Decision: Allow,
		Hops:     []Hop{{HostKey: hostKey(t, 3), Forwarded: true}, {HostKey: hostKey(t, 1), Forwarded: true}},
		Presence: Verified,
		Window:   3600,
	}
}

func TestTheAnswerEncodesToTheGoldenBytesAndParsesBackFieldForField(t *testing.T) {
	b, err := exampleAnswer(t).Marshal()
	if err != nil {
		t.Fatal(err)
	}
	want := golden(t, "answer.bin", b)
	if !bytes.HasPrefix(b, []byte("\x00\x00\x00\x14quoin-sudo-answer-v1")) {
		t.Errorf("starts %x", b[:24])
	}
	a, err := ParseAnswer(want)
	if err != nil {
		t.Fatal(err)
	}
	if !reflect.DeepEqual(a, exampleAnswer(t)) {
		t.Errorf("parsed %+v", a)
	}
	none := &Answer{Decision: Refuse, Presence: PresenceNone}
	b, err = none.Marshal()
	if err != nil {
		t.Fatal(err)
	}
	if a, err := ParseAnswer(b); err != nil || !reflect.DeepEqual(a, none) {
		t.Errorf("no hops parsed back %+v, %v", a, err)
	}
}

// encAnswer writes fields as given, each a key and its value, after the
// answer's magic, so a test can write what Marshal never would.
func encAnswer(kv ...string) []byte {
	var f []byte
	for i := 0; i < len(kv); i += 2 {
		f = appendString(f, []byte(kv[i]))
		f = appendString(f, []byte(kv[i+1]))
	}
	return appendString([]byte(answerPrefix), f)
}

func window(s uint32) string { return string(binary.BigEndian.AppendUint32(nil, s)) }

// hop is a hop's entry: its host key blob and a forwarded byte.
func hop(key []byte, fwd byte) []byte { return append(appendString(nil, key), fwd) }

func hops(h ...[]byte) string { return string(appendList(nil, h)) }

// answerFields are an allow's fields, verified with no window and no hops.
func answerFields() []string {
	return []string{"!decision", Allow, "!hops", hops(), "!presence", Verified, "!window", window(0)}
}

// malformedAnswers are answers ParseAnswer refuses, by what is wrong.
func malformedAnswers(t testing.TB) map[string][]byte {
	good, err := exampleAnswer(t).Marshal()
	if err != nil {
		t.Fatal(err)
	}
	k := hostKey(t, 1)
	many := slices.Repeat([][]byte{hop(k, 1)}, MaxHops+1)
	return map[string][]byte{
		"empty":                  nil,
		"the message's magic":    append([]byte(prefix), good[len(answerPrefix):]...),
		"another magic":          append([]byte("\x00\x00\x00\x14quoin-sudo-answer-v2"), good[24:]...),
		"no fields string":       []byte(answerPrefix),
		"a fields string short":  good[:len(good)-1],
		"trailing bytes":         append(slices.Clone(good), 0),
		"no decision":            encAnswer(without(answerFields(), "decision")...),
		"no hops":                encAnswer(without(answerFields(), "hops")...),
		"no presence":            encAnswer(without(answerFields(), "presence")...),
		"no window":              encAnswer(without(answerFields(), "window")...),
		"decision unmarked":      encAnswer(replaced(answerFields(), "decision", "decision", Allow)...),
		"hops unmarked":          encAnswer(replaced(answerFields(), "hops", "hops", hops())...),
		"a dialog":               encAnswer(replaced(answerFields(), "decision", "!decision", Dialog)...),
		"an empty decision":      encAnswer(replaced(answerFields(), "decision", "!decision", "")...),
		"presence required":      encAnswer(replaced(answerFields(), "presence", "!presence", Required)...),
		"a short window":         encAnswer(replaced(answerFields(), "window", "!window", "\x00\x00\x00")...),
		"a long window":          encAnswer(replaced(answerFields(), "window", "!window", window(0)+"\x00")...),
		"no hops count":          encAnswer(replaced(answerFields(), "hops", "!hops", "")...),
		"a hop missing":          encAnswer(replaced(answerFields(), "hops", "!hops", window(2)+hops(hop(k, 1))[4:])...),
		"hops with more":         encAnswer(replaced(answerFields(), "hops", "!hops", hops(hop(k, 1))+"x")...),
		"a forwarded byte of 2":  encAnswer(replaced(answerFields(), "hops", "!hops", hops(hop(k, 2)))...),
		"no forwarded byte":      encAnswer(replaced(answerFields(), "hops", "!hops", hops(appendString(nil, k)))...),
		"two forwarded bytes":    encAnswer(replaced(answerFields(), "hops", "!hops", hops(append(hop(k, 1), 1)))...),
		"an empty host key":      encAnswer(replaced(answerFields(), "hops", "!hops", hops(hop(nil, 1)))...),
		"an empty hop":           encAnswer(replaced(answerFields(), "hops", "!hops", hops(nil))...),
		"more than MaxHops hops": encAnswer(replaced(answerFields(), "hops", "!hops", string(appendList(nil, many)))...),
		"out of order":           encAnswer(slices.Concat(answerFields()[2:4], answerFields()[:2], answerFields()[4:])...),
		"a field twice":          encAnswer(slices.Concat(answerFields()[:2], answerFields())...),
		"a key with capitals":    encAnswer(with2(answerFields(), "Note", "x")...),
		"a message field":        encAnswer(with2(answerFields(), "!user", "dan")...),
		"more than MaxFields":    encAnswer(slices.Concat(answerFields(), manyFields(MaxFields-len(answerFields())/2+1))...),
	}
}

// manyFields are n unmarked fields named after every answer field.
func manyFields(n int) []string {
	var kv []string
	for i := range n {
		kv = append(kv, "z"+strings.Repeat("a", i), "")
	}
	return kv
}

func TestAnAnswerThatDoesNotParseStrictlyIsRefused(t *testing.T) {
	for name, b := range malformedAnswers(t) {
		if a, err := ParseAnswer(b); err == nil {
			t.Errorf("%s: parsed %+v", name, a)
		}
	}
	if _, err := ParseAnswer(encAnswer(slices.Concat(answerFields(), manyFields(MaxFields-len(answerFields())/2))...)); err != nil {
		t.Errorf("exactly MaxFields: %v", err)
	}
	k := hostKey(t, 1)
	many := slices.Repeat([][]byte{hop(k, 1)}, MaxHops)
	if a, err := ParseAnswer(encAnswer(replaced(answerFields(), "hops", "!hops", string(appendList(nil, many)))...)); err != nil || len(a.Hops) != MaxHops {
		t.Errorf("exactly MaxHops: %v", err)
	}
}

// with2 is kv with key and value placed in name order.
func with2(kv []string, key, value string) []string {
	name := strings.TrimPrefix(key, Critical)
	for i := 0; i < len(kv); i += 2 {
		if strings.TrimPrefix(kv[i], Critical) > name {
			return slices.Insert(slices.Clone(kv), i, key, value)
		}
	}
	return append(slices.Clone(kv), key, value)
}

func TestAnUnknownAnswerFieldIsDroppedUnlessItIsMarkedCritical(t *testing.T) {
	plain, err := ParseAnswer(encAnswer(answerFields()...))
	if err != nil {
		t.Fatal(err)
	}
	a, err := ParseAnswer(encAnswer(with2(with2(answerFields(), "note", "x"), "zz", "")...))
	if err != nil {
		t.Fatal(err)
	}
	if !reflect.DeepEqual(a.Ignored, []string{"note", "zz"}) {
		t.Errorf("ignored %v", a.Ignored)
	}
	a.Ignored = nil
	if !reflect.DeepEqual(a, plain) {
		t.Errorf("changed the answer: %+v", a)
	}
	_, err = ParseAnswer(encAnswer(with2(answerFields(), "!note", "x")...))
	var critical *CriticalError
	if !errors.As(err, &critical) || critical.Key != "note" || !critical.Answer || !strings.Contains(err.Error(), "answer") {
		t.Errorf("got %v", err)
	}
}

func TestAnswerMarshalRefusesWhatParseAnswerWould(t *testing.T) {
	for name, f := range map[string]func(*Answer){
		"no decision":            func(a *Answer) { a.Decision = "" },
		"a dialog":               func(a *Answer) { a.Decision = Dialog },
		"no presence":            func(a *Answer) { a.Presence = "" },
		"presence required":      func(a *Answer) { a.Presence = Required },
		"an empty host key":      func(a *Answer) { a.Hops[0].HostKey = nil },
		"more than MaxHops hops": func(a *Answer) { a.Hops = slices.Repeat(a.Hops, MaxHops/2+1) },
		"too long":               func(a *Answer) { a.Hops[0].HostKey = make([]byte, MaxSize) },
	} {
		a := exampleAnswer(t)
		f(a)
		if b, err := a.Marshal(); err == nil {
			t.Errorf("%s: marshalled %x", name, b)
		}
	}
}

func TestTheSignedBytesAreTheMessageVerbatimThenTheAnswer(t *testing.T) {
	m, err := example(t).Marshal()
	if err != nil {
		t.Fatal(err)
	}
	a, err := exampleAnswer(t).Marshal()
	if err != nil {
		t.Fatal(err)
	}
	s := Signed(m, a)
	if !HasMagic(s) || !bytes.Equal(s[:len(m)], m) || !bytes.Equal(s[len(m):], a) {
		t.Errorf("signed %x", s)
	}
	if _, err := Parse(s); err == nil {
		t.Error("the signed bytes parse as a message")
	}
	m[len(m)-1] ^= 1
	if bytes.Equal(Signed(m, a), s) {
		t.Error("the signed bytes do not change with the message")
	}
}

func TestAMessageOfRoomBytesMakesAnExtensionRequestOfMaxSize(t *testing.T) {
	key := hostKey(t, 1)
	req := []byte{27}
	req = appendString(req, []byte(Extension))
	req = appendString(req, key)
	req = appendString(req, make([]byte, Room(len(key))))
	if len(req) != MaxSize {
		t.Errorf("%d bytes", len(req))
	}
	if Room(51) != MaxSize-(1+4+16+4+51+4) {
		t.Errorf("room %d", Room(51))
	}
}

// checkCase is an answer to example with its decision, presence, window and
// window key replaced, signed with key, and what the gate makes of it.
type checkCase struct {
	name               string
	decision, presence string
	window             uint32
	windowKey, key     []byte
	answer             []byte
	want               byte
}

// The outcomes a check case wants.
const (
	unparsed byte = iota
	refused
	accepted
)

func outcome(m *Message, key, answer []byte) byte {
	a, err := ParseAnswer(answer)
	if err != nil {
		return unparsed
	}
	if m.Check(a, key) != nil {
		return refused
	}
	return accepted
}

func checkCases(t testing.TB) []checkCase {
	h1, h2, h3, listed, wk := hostKey(t, 1), hostKey(t, 2), hostKey(t, 3), hostKey(t, 8), windowKey(t)
	ans := func(decision, presence string, window uint32, hops ...Hop) []byte {
		b, err := (&Answer{Decision: decision, Presence: presence, Window: window, Hops: hops}).Marshal()
		if err != nil {
			t.Fatal(err)
		}
		return b
	}
	fwd := func(k []byte) Hop { return Hop{HostKey: k, Forwarded: true} }
	allowed := ans(Allow, Verified, 0)
	cases := []checkCase{
		{"a dialog allowed, verified, with no window and no hops", Dialog, Required, 3600, nil, listed, allowed, accepted},
		{"a dialog allowed with the whole window offered", Dialog, Required, 3600, nil, listed, ans(Allow, Verified, 3600, fwd(h3), fwd(h1)), accepted},
		{"a dialog allowed with a window past the offer", Dialog, Required, 3600, nil, listed, ans(Allow, Verified, 3601), refused},
		{"a dialog with no window offered, allowed with one", Dialog, Required, 0, nil, listed, ans(Allow, Verified, 1), refused},
		{"a dialog allowed with no presence", Dialog, Required, 3600, nil, listed, ans(Allow, PresenceNone, 0), refused},
		{"a dialog refused", Dialog, Required, 3600, nil, listed, ans(Refuse, Verified, 0), refused},
		{"a dialog whose last hop is another host", Dialog, Required, 3600, nil, listed, ans(Allow, Verified, 0, fwd(h1), fwd(h3)), refused},
		{"a dialog whose last hop is this host's second key", Dialog, Required, 3600, nil, listed, ans(Allow, Verified, 0, Hop{HostKey: h2}), accepted},
		{"a dialog with no presence required, a window with none verified", Dialog, PresenceNone, 60, nil, listed, ans(Allow, PresenceNone, 30), refused},
		{"a dialog with no presence required, a window verified", Dialog, PresenceNone, 60, nil, listed, ans(Allow, Verified, 30), accepted},
		{"a question in a window, by its key", Question, PresenceNone, 0, wk, wk, ans(Allow, PresenceNone, 0), accepted},
		{"a question in a window, by another key", Question, PresenceNone, 0, wk, listed, ans(Allow, PresenceNone, 0), refused},
		{"a question in a window, verified as well", Question, PresenceNone, 0, wk, wk, allowed, accepted},
		{"a question in a window, refused", Question, PresenceNone, 0, wk, wk, ans(Refuse, PresenceNone, 0), refused},
		{"a question a rule asked", Question, PresenceNone, 0, nil, listed, ans(Allow, PresenceNone, 0, fwd(h2)), accepted},
		{"a question allowed with a window", Question, PresenceNone, 60, nil, listed, ans(Allow, Verified, 30), refused},
		{"an answer with an unknown critical field", Dialog, Required, 3600, nil, listed, encAnswer(with2(answerFields(), "!zz", "")...), unparsed},
		{"an answer with an unknown field", Dialog, Required, 3600, nil, listed, encAnswer(with2(answerFields(), "zz", "x")...), accepted},
		{"an answer of exactly MaxFields", Dialog, Required, 3600, nil, listed, encAnswer(slices.Concat(answerFields(), manyFields(MaxFields-len(answerFields())/2))...), accepted},
		{"an answer of exactly MaxHops", Dialog, Required, 3600, nil, listed, encAnswer(replaced(answerFields(), "hops", "!hops", string(appendList(nil, slices.Repeat([][]byte{hop(h1, 1)}, MaxHops))))...), accepted},
	}
	malformed := malformedAnswers(t)
	for _, name := range slices.Sorted(maps.Keys(malformed)) {
		cases = append(cases, checkCase{"malformed: " + name, Dialog, Required, 3600, nil, listed, malformed[name], unparsed})
	}
	return cases
}

// The Zig mirror reads the answer and checks it as the gate does, held to
// these cases through testdata/answer-cases.bin: a list of cases, each the
// name, the decision, presence, window and window key that replace
// example's, the key that signed, the answer, and a byte, 0 when the answer
// does not parse, 1 when it is not accepted, 2 when it is.
func TestTheGateTakesOnlyAnAnswerThatAllowsWhatTheMessageAsked(t *testing.T) {
	var recs [][]byte
	for _, c := range checkCases(t) {
		m := example(t)
		m.Decision, m.Presence, m.Window, m.WindowKey = c.decision, c.presence, c.window, c.windowKey
		if got := outcome(m, c.key, c.answer); got != c.want {
			t.Errorf("%s: got %d, want %d", c.name, got, c.want)
		}
		var r []byte
		for _, s := range [][]byte{[]byte(c.name), []byte(c.decision), []byte(c.presence)} {
			r = appendString(r, s)
		}
		r = binary.BigEndian.AppendUint32(r, c.window)
		for _, s := range [][]byte{c.windowKey, c.key, c.answer} {
			r = appendString(r, s)
		}
		recs = append(recs, append(r, c.want))
	}
	golden(t, "answer-cases.bin", appendList(nil, recs))
}

func FuzzNoAnswerCrashesTheParser(f *testing.F) {
	good, err := exampleAnswer(f).Marshal()
	if err != nil {
		f.Fatal(err)
	}
	f.Add(good)
	f.Add(encAnswer(with2(answerFields(), "zz", "x")...))
	f.Add(encAnswer(with2(answerFields(), "!zz", "x")...))
	f.Add([]byte(answerPrefix))
	f.Fuzz(func(t *testing.T, b []byte) {
		a, err := ParseAnswer(b)
		if err != nil || len(a.Ignored) > 0 {
			return
		}
		again, err := a.Marshal()
		if err != nil || !bytes.Equal(again, b) {
			t.Fatalf("parsed %x, marshalled %x, %v", b, again, err)
		}
	})
}
