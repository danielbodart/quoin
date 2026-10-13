// Package policysign is the signer's policy-sign agent extension, both ends
// of it: the extension's name, its request and response, and the client a
// program asks quoin-signer to sign a project's policy file with. The
// signer's own server decodes and answers with the same types, so the two
// move in lock step.
//
// A request carries the new bytes, and the old bytes with their signature
// when there are any: the signer shows the person the change against the
// old bytes, when the old signature verifies over them, and, if allowed,
// signs the new bytes in the project's namespace. The answer follows
// SSH_AGENT_SUCCESS as JSON: the armoured signature, or why there is none.
package policysign

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"net"

	"golang.org/x/crypto/ssh/agent"
)

// Extension is the agent extension a person signs a project's policy file
// through.
const Extension = "policy-sign@quoin"

// MaxRequest bounds a request's contents: the signer refuses a longer one
// unread.
const MaxRequest = 4 << 20

// agentSuccess is SSH_AGENT_SUCCESS, which an extension's answer begins
// with.
const agentSuccess = 6

// Request is policy-sign's contents, as JSON: the project's directory and
// its policy file's name, the new bytes, and the bytes the old signature was
// made over with that signature, if there are any.
//
// Approved says a person approved the new bytes already, answering Always
// in a question of the sender's own that showed the change: it is signed
// unasked, and only from the main process of a unit the signer's config
// names as a policy signer. From anyone else it is refused.
type Request struct {
	Root     string `json:"root"`
	Name     string `json:"name"`
	New      []byte `json:"new"`
	Old      []byte `json:"old,omitempty"`
	OldSig   []byte `json:"oldSig,omitempty"`
	Approved bool   `json:"approved,omitempty"`
}

// Response is policy-sign's answer, after SSH_AGENT_SUCCESS: the armoured
// signature, or why there is none.
type Response struct {
	Sig   []byte `json:"sig,omitempty"`
	Error string `json:"error,omitempty"`
}

// DecodeRequest reads an extension's contents as a Request, refusing one
// longer than MaxRequest, a field it does not know, and anything after the
// one value.
func DecodeRequest(contents []byte) (Request, error) {
	var p Request
	if len(contents) > MaxRequest {
		return p, errors.New("the request is too big")
	}
	dec := json.NewDecoder(bytes.NewReader(contents))
	dec.DisallowUnknownFields()
	if err := dec.Decode(&p); err != nil {
		return Request{}, fmt.Errorf("request: %w", err)
	}
	if dec.More() {
		return Request{}, errors.New("request: more than one JSON value")
	}
	return p, nil
}

// Reply is r as the extension's answer: SSH_AGENT_SUCCESS, then r as JSON.
func Reply(r Response) []byte {
	b, _ := json.Marshal(r)
	return append([]byte{agentSuccess}, b...)
}

// ParseReply reads an extension's answer as Reply wrote it.
func ParseReply(out []byte) (Response, error) {
	var r Response
	if len(out) < 1 || out[0] != agentSuccess || json.Unmarshal(out[1:], &r) != nil {
		return Response{}, fmt.Errorf("the agent's answer %q is not policy-sign's", out)
	}
	return r, nil
}

// Sign asks the agent at sock to sign req's file, through Extension, and
// returns the armoured signature.
func Sign(ctx context.Context, sock string, req Request) ([]byte, error) {
	contents, err := json.Marshal(req)
	if err != nil {
		return nil, err
	}
	var d net.Dialer
	c, err := d.DialContext(ctx, "unix", sock)
	if err != nil {
		return nil, err
	}
	defer c.Close()
	if dl, ok := ctx.Deadline(); ok {
		_ = c.SetDeadline(dl)
	}
	out, err := agent.NewClient(c).Extension(Extension, contents)
	if errors.Is(err, agent.ErrExtensionUnsupported) {
		return nil, fmt.Errorf("the agent at %s does not sign policies: it is not quoin-signer", sock)
	}
	if err != nil {
		return nil, err
	}
	resp, err := ParseReply(out)
	if err != nil {
		return nil, err
	}
	if resp.Error != "" {
		return nil, fmt.Errorf("the signer: %s", resp.Error)
	}
	if resp.Sig == nil {
		return nil, errors.New("the signer sent no signature")
	}
	return resp.Sig, nil
}
