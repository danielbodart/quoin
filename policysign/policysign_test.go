package policysign

import (
	"bytes"
	"encoding/json"
	"strings"
	"testing"
)

func TestARequestRoundTripsAndNothingElseIsRead(t *testing.T) {
	want := Request{Root: "/home/u/Projects/foo", Name: "chase.json", New: []byte("{}\n"), Old: []byte("{\"a\": 1}\n"), OldSig: []byte("sig"), Approved: true}
	b, _ := json.Marshal(want)
	got, err := DecodeRequest(b)
	if err != nil {
		t.Fatal(err)
	}
	if got.Root != want.Root || got.Name != want.Name || !bytes.Equal(got.New, want.New) ||
		!bytes.Equal(got.Old, want.Old) || !bytes.Equal(got.OldSig, want.OldSig) || !got.Approved {
		t.Errorf("%+v", got)
	}
	for name, tc := range map[string]struct {
		contents []byte
		err      string
	}{
		"an unknown field": {[]byte(`{"root":"/x","name":"chase.json","new":"e30K","extra":1}`), "unknown field"},
		"two values":       {[]byte(`{"root":"/x"} {"root":"/y"}`), "more than one"},
		"not JSON":         {[]byte(`nope`), "request:"},
		"too big":          {bytes.Repeat([]byte(" "), MaxRequest+1), "too big"},
	} {
		if _, err := DecodeRequest(tc.contents); err == nil || !strings.Contains(err.Error(), tc.err) {
			t.Errorf("%s: %v", name, err)
		}
	}
}

func TestAReplyIsAgentSuccessThenItsJSON(t *testing.T) {
	out := Reply(Response{Sig: []byte("armoured")})
	if out[0] != agentSuccess {
		t.Fatalf("reply %q", out)
	}
	r, err := ParseReply(out)
	if err != nil || string(r.Sig) != "armoured" || r.Error != "" {
		t.Errorf("%+v %v", r, err)
	}
	r, err = ParseReply(Reply(Response{Error: "refused"}))
	if err != nil || r.Error != "refused" || r.Sig != nil {
		t.Errorf("%+v %v", r, err)
	}
	for _, out := range [][]byte{nil, {5}, append([]byte{5}, `{}`...), append([]byte{agentSuccess}, `nope`...)} {
		if _, err := ParseReply(out); err == nil {
			t.Errorf("%q parsed", out)
		}
	}
}
