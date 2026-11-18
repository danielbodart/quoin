# quoin-sudo's remote mode: dan on client runs `ssh -A server sudo …` with
# no tty, from a claude-shaped process, and quoin-signer on client asks
# fakegalley. server runs nixosModules.sudo with remoteKeys and a
# fakegalley of its own; second is a plain sshd with another host key.
{ self }:
{ lib, hostPkgs, ... }:

let
  pkgs = hostPkgs;
  system = pkgs.stdenv.hostPlatform.system;
  fakegalley = lib.getExe self.packages.${system}.fakegalley;
  plugin = self.packages.${system}.quoin-sudo-plugin;
  vmlib = import ./vmlib.nix { inherit pkgs; };
  password = "hunter2-remote";

  keys = pkgs.runCommand "sudo-remote-test-keys" { nativeBuildInputs = [ pkgs.openssh ]; } ''
    mkdir $out
    ssh-keygen -q -t ecdsa -b 256 -N "" -C listed -f $out/listed
    ssh-keygen -q -t ed25519 -N "" -C stock -f $out/stock
    ssh-keygen -q -t ed25519 -N "" -C unlisted -f $out/unlisted
    ssh-keygen -q -t ed25519 -N "" -C server -f $out/server
    ssh-keygen -q -t ed25519 -N "" -C second -f $out/second
  '';
  pub = name: lib.fileContents "${keys}/${name}.pub";
  logins = map (k: "${keys}/${k}.pub") [ "listed" "stock" "unlisted" ];

  claude = pkgs.runCommand "sudo-remote-test-claude" { } ''
    mkdir -p $out/bin
    cp ${pkgs.bash}/bin/bash $out/bin/claude
  '';

  sshd = host: {
    services.openssh = {
      enable = true;
      hostKeys = [{ path = "/etc/ssh/ssh_host_ed25519_key"; type = "ed25519"; }];
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
    };
    environment.etc."ssh/ssh_host_ed25519_key" = { source = "${keys}/${host}"; mode = "0600"; };
    environment.etc."ssh/ssh_host_ed25519_key.pub" = { source = "${keys}/${host}.pub"; mode = "0644"; };
  };

  galleyService = {
    systemd.tmpfiles.rules = [ "d /run/galley-ask 0755 dan users -" "d /run/fakegalley 0755 dan users -" ];
    systemd.user.services.galley.serviceConfig = {
      ExecStart = "${fakegalley} -socket /run/galley-ask/dan.sock -script /run/fakegalley/script -log /run/fakegalley/log";
      Slice = "app.slice";
      # Ready once its socket is bound, so a restart returns only then.
      Type = "notify";
    };
    # Restarted for each new script, at times more than five in ten seconds.
    systemd.user.services.galley.startLimitIntervalSec = 0;
  };

  # agentpeer SOCKET HOLD: connects to SOCKET as whoever runs it and prints,
  # as JSON, the socket's path, its listener's pid and uid as SO_PEERCRED
  # gives them, and its own ancestors' pids; then holds the connection until
  # a line is written to the FIFO HOLD, so the listener is still there while
  # root looks at it.
  agentpeer = pkgs.writeScript "agentpeer" ''
    #!${pkgs.python3}/bin/python3
    import json, os, socket, struct, sys

    path, hold = sys.argv[1], sys.argv[2]
    s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    s.connect(path)
    cred = s.getsockopt(socket.SOL_SOCKET, socket.SO_PEERCRED, struct.calcsize("3i"))
    pid, uid, gid = struct.unpack("3i", cred)
    ancestors, p = [], os.getppid()
    while p > 1:
        ancestors.append(p)
        with open(f"/proc/{p}/stat") as f:
            p = int(f.read().rsplit(")", 1)[1].split()[1])
    print(json.dumps({"sock": path, "pid": pid, "uid": uid, "ancestors": ancestors}), flush=True)
    with open(hold) as f:
        f.readline()
  '';

  sleeper = { wantedBy = [ "multi-user.target" ]; serviceConfig.ExecStart = "${pkgs.coreutils}/bin/sleep infinity"; };
in
{
  name = "quoin-sudo-remote";

  nodes.client = { ... }: {
    imports = [ self.nixosModules.signer galleyService ];
    virtualisation.tpm.enable = true;
    services.quoin.signer.enable = true;
    users.users.dan = { isNormalUser = true; uid = 1000; group = "users"; linger = true; };
    programs.ssh.knownHosts = {
      server.publicKeyFile = "${keys}/server.pub";
      second.publicKeyFile = "${keys}/second.pub";
    };
    environment.systemPackages = [ pkgs.ssh-tpm-agent ];
  };

  nodes.server = { ... }: {
    imports = [ self.nixosModules.sudo galleyService (sshd "server") ];
    services.quoin.sudo = {
      enable = true;
      remoteKeys = [ (pub "listed") (pub "stock") ];
    };
    specialisation.off.configuration.services.quoin.sudo.remoteKeys = lib.mkForce [ ];
    specialisation.ids.configuration.environment.etc."sudo.conf".source = lib.mkForce
      (pkgs.writeText "sudo.conf" "Plugin quoin_audit ${plugin.logIds}/lib/quoin_sudo.so user=dan remote\n");
    users.users.dan = {
      isNormalUser = true;
      uid = 1000;
      group = "users";
      extraGroups = [ "wheel" ];
      linger = true;
      inherit password;
      openssh.authorizedKeys.keyFiles = logins;
    };
    systemd.services.quoin-spare = sleeper;
    environment.systemPackages = [ pkgs.socat ];
  };

  nodes.second = { ... }: {
    imports = [ (sshd "second") ];
    users.users.dan = { isNormalUser = true; uid = 1000; group = "users"; openssh.authorizedKeys.keyFiles = logins; };
    networking.firewall.allowedTCPPorts = [ 7777 ];
    environment.systemPackages = [ pkgs.socat ];
  };

  testScript = ''
    import json
    import re
    import shlex

    pw = "${password}"
    path = "/run/wrappers/bin:/run/current-system/sw/bin"

    def galley(m, *script):
        m.succeed(f"printf '%s\\n' {' '.join(map(shlex.quote, script))} > /run/fakegalley/script")
        m.succeed("systemctl -M dan@ --user restart galley.service")

    def events(m, kind):
        out = m.succeed("cat /run/fakegalley/log 2>/dev/null || true")
        return [e for e in map(json.loads, out.splitlines()) if e["event"] == kind]

    # The signer and the gate log a decision before they reply, and --sync
    # returns only once every line written before it is in the journal.
    def journal(m, unit, msg):
        out = m.succeed(f"journalctl --sync && journalctl -u {unit} -o cat --no-pager")
        return [d for d in (json.loads(l) for l in out.splitlines() if l.startswith("{")) if d.get("msg") == msg]

    def signs():
        return journal(client, "quoin-signer.service", "decision")

    def gate():
        return [d for d in journal(server, "quoin-sudo.service", "decision") if d.get("remote")]

    def checkins():
        return journal(server, "quoin-sudo.service", "check-in")

    def await_lines(m, n, text, *follow):
        return m.succeed(f"${vmlib.await} {n} {shlex.quote(text)} -- {shlex.join(follow)}")

    def wait_events(kind, n):
        await_lines(client, n, f'"event":"{kind}"', "tail", "-n", "+1", "-F", "/run/fakegalley/log")

    def fingerprint(name):
        return client.succeed(f"ssh-keygen -lf ${keys}/{name}.pub").split()[1]

    # A claude fed lines through a FIFO; each runs to completion, its output
    # and exit status in files.
    start_all()
    # Started, not polled for: start joins the job boot queued and returns once it is done.
    client.succeed("systemctl start quoin-signer.socket")
    client.succeed("systemctl start user@1000.service")
    server.succeed("systemctl start sshd.service")
    server.succeed("systemctl start quoin-sudo.socket")
    server.succeed("systemctl start user@1000.service")
    second.succeed("systemctl start sshd.service")

    def start(where):
        client.succeed(f"install -d -o dan -g users -m 0700 /run/{where} && mkfifo -m 0600 /run/{where}/in && chown dan /run/{where}/in")
        inner = f"exec 3<>/run/{where}/in; exec ${claude}/bin/claude <&3 >/dev/null 2>&1"
        env = f"-E SSH_AUTH_SOCK=/run/quoin-signer/agent -E PATH={path}"
        client.succeed(f"systemd-run -M dan@ --user --unit={where} --quiet -p Type=exec {env} -- ${pkgs.runtimeShell} -c {shlex.quote(inner)}")

    # The status is a FIFO the claude blocks writing until wait reads it, so
    # every launch is waited for, and the claude runs nothing else meanwhile.
    n = 0
    def launch(cmd):
        global n
        n += 1
        status, out = f"/run/claude/status-{n}", f"/run/claude/out-{n}"
        client.succeed(f"mkfifo -m 0600 {status} && chown dan {status}")
        line = f"{{ {cmd}; }} </dev/null >{out} 2>&1; echo $? > {status}"
        client.succeed(f"printf '%s\\n' {shlex.quote(line)} > /run/claude/in")
        return status, out

    def wait(h):
        status, out = h
        return int(client.succeed(f"cat {status}")), client.succeed(f"cat {out}")

    def run(cmd):
        return wait(launch(cmd))

    def remote_sudo(cmd, ssh="ssh -A"):
        return run(f"{ssh} server {shlex.quote(cmd)}")

    with subtest("set-up: the listed key is in the TPM, logins to server and second are granted"):
        client.succeed("install -m 0600 ${keys}/listed /root/listed && install -m 0644 ${keys}/listed.pub /root/listed.pub")
        client.succeed("SSH_ASKPASS_REQUIRE=never ssh-tpm-keygen --import /root/listed -f /root/imported </dev/null")
        client.succeed("systemctl start quoin-signer.service")
        client.succeed("install -o ssh-signer -g ssh-signer -m 0600 /root/imported.tpm /var/lib/quoin-signer/id_ecdsa.tpm")
        client.succeed("systemctl restart quoin-signer.service")
        out = client.succeed("runuser -u dan -- env SSH_AUTH_SOCK=/run/quoin-signer/agent ssh-add -l")
        assert fingerprint("listed") in out, out
        galley(client, "ok 60 minutes")
        galley(server, "cancel")
        start("claude")
        client.succeed("install -o dan -m 0600 ${keys}/stock ${keys}/unlisted /run/claude/")
        for host in ("server", "second"):
            rc, out = run(f"ssh {host} true")
            assert rc == 0, repr((rc, out))
        galley(client, "answer 0")

    # What quoin-sudo tells an ssh -A login by: the forwarded agent's socket
    # is served by the login's own sshd-session, running as dan, an ancestor
    # of the login's shell. OpenSSH 10.1 and on bind it in ~/.ssh/agent/,
    # named for that sshd-session's pid. Its exe, unlike sshd's, is not
    # dumpable, so only root reads it.
    with subtest("Forwarded agent: SSH_AUTH_SOCK under ssh -A is served by dan's sshd-session"):
        server.succeed("install -d -o dan -g users -m 0700 /run/peer && mkfifo -m 0600 /run/peer/hold && chown dan /run/peer/hold")
        h = launch("ssh -A server '${agentpeer} \"$SSH_AUTH_SOCK\" /run/peer/hold'")
        peer = json.loads(await_lines(client, 1, '"pid"', "tail", "-n", "+1", "-F", h[1]))
        pid = peer["pid"]
        exe = server.succeed(f"readlink /proc/{pid}/exe").strip()
        comm = server.succeed(f"cat /proc/{pid}/comm").strip()
        server.fail(f"runuser -u dan -- readlink /proc/{pid}/exe")
        server.log(f"agent listener: {peer} exe={exe} comm={comm} {server.succeed('ssh -V 2>&1').strip()}")
        assert exe.endswith("/libexec/sshd-session") and comm == "sshd-session", (exe, comm)
        assert peer["uid"] == 1000 and pid in peer["ancestors"], peer
        assert re.fullmatch(rf"/home/dan/\.ssh/agent/s\.[^/]+\.sshd\.{pid}\.[^/]+", peer["sock"]), peer
        server.succeed("echo done > /run/peer/hold")
        rc, out = wait(h)
        assert rc == 0, repr((rc, out))
        server.succeed("rm -r /run/peer")

    with subtest("Allow: the command runs, asked once on the client and never on the server"):
        asked, gated, signed = len(events(client, "question")), len(gate()), len(signs())
        rc, out = remote_sudo("sudo id -u")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        qs = events(client, "question")[asked:]
        assert len(qs) == 1, qs
        q = qs[0]
        client.log(f"remote sudo question: {json.dumps(q)}")
        assert q["title"] == "sudo id -u on server" and q["level"] == "normal" and q["kind"] == "question", q
        assert [b["label"] for b in q["buttons"]] == ["Refuse", "Allow"], q
        lines = q["text"].split("\n")
        # The table is server's chain, the sudo's own; claude, here on
        # client, is only on its from-here line.
        rows = q["table"]["rows"]
        assert rows and all(r[1] != "claude" for r in rows) and q["table"]["summary"].startswith("server: "), q
        assert lines[-2].startswith("from here: claude ← ssh -A server") and lines[-1].startswith("key SHA256:"), lines
        assert [l for l in lines if "claude" in l] == [lines[-2]], lines
        assert "/run/current-system/sw/bin/id -u" in lines, lines
        assert "dan as root in /home/dan" in lines, lines
        s = [d for d in signs()[signed:] if d["class"] == "remote sudo"]
        assert len(s) == 1 and s[0]["version"] == 2 and s[0]["remote_chain"], signs()[signed:]
        assert [l["Pid"] for l in s[0]["remote_chain"]][-1] == 1, s[0]
        assert events(server, "question") == []
        allowed = [d for d in gate()[gated:] if d.get("outcome") == "allow"]
        assert len(allowed) == 1, gate()[gated:]
        d = allowed[0]
        assert d["remote"] and d["argv"] == ["/run/current-system/sw/bin/id", "-u"] and d["key"] == fingerprint("listed"), d
        assert d["nonce"] and d["host_keys"] == [client.succeed("ssh-keygen -lf ${keys}/server.pub").split()[1]], d

    with subtest("Refuse: sudo refuses with the gate's message and runs nothing"):
        galley(client, "cancel")
        rc, out = remote_sudo("sudo touch /root/refused")
        assert rc != 0 and "quoin-sudo: the forwarded agent refused" in out, repr((rc, out))
        server.fail("test -e /root/refused")
        galley(client, "answer 0")

    with subtest("Danger: a danger question with the reason first, and Allow runs it"):
        asked = len(events(client, "question"))
        rc, out = remote_sudo("sudo systemctl stop quoin-spare.service")
        assert rc == 0, repr((rc, out))
        q = events(client, "question")[asked]
        d = gate()[-1]
        assert q["level"] == "danger" and d["level"] == "danger" and d["danger"] and d["version"] == 2, (q, d)
        assert q["text"].split("\n")[0] == d["danger"][0], (q, d)
        server.fail("systemctl is-active quoin-spare.service")
        server.succeed("systemctl start quoin-spare.service")

    with subtest("tty: the server's password is asked and the signer gets no forwarded sign"):
        signed = len(signs())
        rc, out = run(f"${vmlib.ptyrun} --pipe --answer 'password for' {pw} -- ssh -A -tt server sudo id -u")
        assert rc == 0 and "password for dan" in out and "0" in out.split(), repr((rc, out))
        rc, out = run("ssh -A -tt server sudo -n id -u")
        assert rc != 0 and "a password is required" in out, repr((rc, out))
        assert all(d["class"] not in ("remote sudo", "forwarded") for d in signs()[signed:]), signs()[signed:]

    with subtest("No forwarding: stock, a terminal is required, no check-in"):
        signed, gated = len(signs()), len(checkins())
        rc, out = remote_sudo("sudo id -u", ssh="ssh -a")
        assert rc != 0 and "a terminal is required" in out, repr((rc, out))
        assert len(checkins()) == gated
        assert all(d["class"] != "remote sudo" for d in signs()[signed:])

    with subtest("The command shown is the one run: -s runs the shell, and the question says so"):
        asked = len(events(client, "question"))
        rc, out = remote_sudo("sudo -s whoami")
        assert rc == 0 and out.strip().splitlines()[-1] == "root", repr((rc, out))
        argv = events(client, "question")[asked]["text"].split("\n")
        shown = [l for l in argv if l.startswith("/run/current-system/sw/bin/bash")]
        assert shown == ["/run/current-system/sw/bin/bash -c whoami"], argv
        server.succeed("journalctl -t sudo --no-pager | tail -n 3 | grep -F 'COMMAND=/run/current-system/sw/bin/bash -c whoami'")

    with subtest("Relayed socket: a socket from second is refused by the signer, and sudo refuses"):
        # socat says "listening on" once it is bound; the relay is a socket
        # unit, bound before systemd-run returns.
        h = launch("ssh -n -A second 'exec socat -d -d TCP-LISTEN:7777,reuseaddr,fork UNIX-CONNECT:\"$SSH_AUTH_SOCK\"' & true")
        wait(h)
        await_lines(client, 1, "listening on", "tail", "-n", "+1", "-F", h[1])
        server.succeed("install -d -o dan -g users -m 0700 /run/relay")
        server.succeed("systemd-run --uid=dan --gid=users --unit=relay "
                       "--socket-property=ListenStream=/run/relay/agent --socket-property=SocketUser=dan --socket-property=SocketMode=0600 "
                       "socat ACCEPT-FD:3,fork TCP:second:7777")
        asked, signed = len(events(client, "question")), len(signs())
        rc, out = remote_sudo("SSH_AUTH_SOCK=/run/relay/agent sudo touch /root/relayed", ssh="ssh -a")
        assert rc != 0 and "quoin-sudo: the forwarded agent refused" in out, repr((rc, out))
        server.fail("test -e /root/relayed")
        assert len(events(client, "question")) == asked
        client.succeed("journalctl --sync && journalctl -u quoin-signer.service -o cat | grep -F \"not one of the message's host keys\"")
        server.succeed("systemctl stop relay.socket relay.service")
        second.succeed("pkill -u dan socat")

    with subtest("Stock agent: a listed file key signs with no question anywhere"):
        run("ssh-agent -a /run/claude/stock.sock >/dev/null && SSH_AUTH_SOCK=/run/claude/stock.sock ssh-add /run/claude/stock")
        asked, signed = len(events(client, "question")), len(signs())
        rc, out = remote_sudo("sudo id -u", ssh="SSH_AUTH_SOCK=/run/claude/stock.sock ssh -A")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        assert len(events(client, "question")) == asked and len(signs()) == signed
        assert events(server, "question") == []
        assert gate()[-1]["key"] == fingerprint("stock"), gate()[-1]

    with subtest("Unlisted key: no listed key in the forwarded agent, nothing asked"):
        run("ssh-agent -a /run/claude/unlisted.sock >/dev/null && SSH_AUTH_SOCK=/run/claude/unlisted.sock ssh-add /run/claude/unlisted")
        asked = len(events(client, "question"))
        rc, out = remote_sudo("sudo id -u", ssh="SSH_AUTH_SOCK=/run/claude/unlisted.sock ssh -A")
        assert rc != 0 and "quoin-sudo: no listed key in the forwarded agent" in out, repr((rc, out))
        assert len(events(client, "question")) == asked

    with subtest("Hang-up: the client's ssh killed while its question is up"):
        galley(client, "never")
        asked, closed = len(events(client, "question")), len(events(client, "close"))
        h = launch("ssh -A server sudo touch /root/hung-up")
        wait_events("question", asked + 1)
        server.succeed("pgrep -x sudo")
        client.succeed("pkill -u dan -x ssh")
        wait(h)
        # pidwait is 1 when no sudo is left to wait for.
        server.succeed("pidwait -x sudo || test $? -eq 1; ! pgrep -x sudo")
        server.fail("test -e /root/hung-up")
        wait_events("close", closed + 1)
        galley(client, "answer 0")

    with subtest("Ids: sudo's ids are the same before the drop and after the restore, and the command runs as root"):
        server.succeed("/run/booted-system/specialisation/ids/bin/switch-to-configuration test")
        rc, out = remote_sudo("sudo id -u")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        before = [l.split(": ", 1)[1] for l in out.splitlines() if l.startswith("quoin-sudo ids before the drop: ")]
        after = [l.split(": ", 1)[1] for l in out.splitlines() if l.startswith("quoin-sudo ids after the restore: ")]
        assert len(before) == 1 and before == after, out
        server.succeed("/run/booted-system/bin/switch-to-configuration test")

    with subtest("Gate stopped: stock, no signer request"):
        server.succeed("systemctl stop quoin-sudo.socket quoin-sudo.service")
        signed = len(signs())
        rc, out = remote_sudo("sudo id -u")
        assert rc != 0 and "a terminal is required" in out, repr((rc, out))
        assert all(d["class"] != "remote sudo" for d in signs()[signed:])
        server.succeed("systemctl start quoin-sudo.socket")

    with subtest("Remote mode off: no remote keys is stock, no check-in"):
        server.succeed("/run/booted-system/specialisation/off/bin/switch-to-configuration test")
        assert json.loads(server.succeed("cat /etc/quoin/sudo.json"))["remoteKeys"] == []
        assert "remote" not in server.succeed("cat /etc/sudo.conf").split()
        signed, gated = len(signs()), len(checkins())
        rc, out = remote_sudo("sudo id -u")
        assert rc != 0 and "a terminal is required" in out, repr((rc, out))
        assert len(checkins()) == gated
        assert all(d["class"] != "remote sudo" for d in signs()[signed:])
        server.succeed("/run/booted-system/bin/switch-to-configuration test")

    with subtest("/etc/pam.d/sudo's auth is the helper, pam_unix and pam_deny"):
        auth = [l.split()[2] for l in server.succeed("grep '^auth' /etc/pam.d/sudo").splitlines()]
        assert [a.rsplit("/", 1)[-1] for a in auth] == ["pam_exec.so", "pam_unix.so", "pam_deny.so"], auth
  '';
}
