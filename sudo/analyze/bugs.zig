//! Planted descriptor bugs for zwanzig, on the gate connection's handle as
//! the plugin calls it. Analysed, never compiled; each function is one bug.

const fd = @import("fd");

// double close
pub fn doubleClose() !void {
    const s = try fd.connectUnix("/run/quoin-sudo/gate.sock");
    s.close();
    s.close();
}

// send after close
pub fn sendAfterClose() !void {
    const s = try fd.connectUnix("/run/quoin-sudo/gate.sock");
    s.close();
    try s.sendAll("QSUD");
}

// peer check after close
pub fn peerAfterClose() !u32 {
    const s = try fd.connectUnix("/run/quoin-sudo/gate.sock");
    s.close();
    return s.peerUid();
}

// control: closed once, used before
pub fn ok() !void {
    const s = try fd.connectUnix("/run/quoin-sudo/gate.sock");
    defer s.close();
    try s.sendAll("QSUD");
}
