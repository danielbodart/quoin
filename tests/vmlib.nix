# What the VM tests wait with, so that none of them sleeps or polls: each
# blocks on the event it is waiting for, and the test driver's own timeout is
# the one bound on the whole run.
{ pkgs }:

let
  python = "${pkgs.python3}/bin/python3";
in
{
  # await N TEXT -- FOLLOWER...: runs FOLLOWER, a command that follows a log
  # as it grows (tail -F, journalctl -f), and returns once N of its lines
  # contain TEXT, printing them. It fails, rather than waits on, a follower
  # that ends first.
  await = pkgs.writeScript "await" ''
    #!${python}
    import subprocess, sys

    n, text, rest = int(sys.argv[1]), sys.argv[2], sys.argv[3:]
    assert rest[0] == "--", rest
    p = subprocess.Popen(rest[1:], stdout=subprocess.PIPE, text=True)
    seen = []
    for line in p.stdout:
        if text in line:
            seen.append(line)
            if len(seen) == n:
                break
    p.kill()
    p.wait()
    sys.stdout.write("".join(seen))
    sys.exit(0 if len(seen) == n else 1)
  '';

  # ptyrun [--pipe] [--answer PROMPT REPLY] -- COMMAND...: runs COMMAND on a
  # pty, or with --pipe on pipes, copying what it writes to stdout, and types
  # REPLY the first time PROMPT appears, so a password is typed when it is
  # asked for rather than after a guess at how long that takes; on pipes its
  # stdin is closed once REPLY is typed. Exits as COMMAND does.
  ptyrun = pkgs.writeScript "ptyrun" ''
    #!${python}
    import os, pty, subprocess, sys

    args = sys.argv[1:]
    pipe = args[0] == "--pipe"
    if pipe:
        args = args[1:]
    answer = None
    if args[0] == "--answer":
        answer, args = (args[1].encode(), args[2].encode() + b"\n"), args[3:]
    assert args[0] == "--", args
    if pipe:
        p = subprocess.Popen(args[1:], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        out, inp = p.stdout.fileno(), p.stdin
    else:
        pid, out = pty.fork()
        if pid == 0:
            os.execvp(args[1], args[1:])
    seen = b""
    while True:
        try:
            data = os.read(out, 4096)
        except OSError:
            break
        if not data:
            break
        os.write(1, data)
        if answer:
            seen += data
            if answer[0] in seen:
                if pipe:
                    inp.write(answer[1])
                    inp.close()
                else:
                    os.write(out, answer[1])
                answer = None
    if pipe:
        sys.exit(p.wait())
    sys.exit(os.waitstatus_to_exitcode(os.waitpid(pid, 0)[1]))
  '';
}
