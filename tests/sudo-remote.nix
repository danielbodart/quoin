# quoin-sudo's remote mode: dan on client runs `ssh -A server sudo …` with
# no tty, from a claude-shaped process, and quoin-signer on client asks
# fakegalley, a dialog's password checked by quoin-presence against dan's
# on client. server runs nixosModules.sudo with remoteKeys and a fakegalley
# of its own; second is a plain sshd with another host key. client runs a
# gate too, for its own sudo in a local mosey session.
{ self }:
{ lib, hostPkgs, ... }:

let
  pkgs = hostPkgs;
  system = pkgs.stdenv.hostPlatform.system;
  fakegalley = lib.getExe self.packages.${system}.fakegalley;
  plugin = self.packages.${system}.quoin-sudo-plugin;
  vmlib = import ./vmlib.nix { inherit pkgs; };
  password = "hunter2-remote";
  # dan's on client, which the signer's dialog takes; never server's.
  clientPassword = "hunter2-client";

  keys = pkgs.runCommand "sudo-remote-test-keys" { nativeBuildInputs = [ pkgs.openssh ]; } ''
    mkdir $out
    ssh-keygen -q -t ecdsa -b 256 -N "" -C listed -f $out/listed
    ssh-keygen -q -t ed25519 -N "" -C stock -f $out/stock
    ssh-keygen -q -t ed25519 -N "" -C unlisted -f $out/unlisted
    ssh-keygen -q -t ed25519 -N "" -C server -f $out/server
    ssh-keygen -q -t ed25519 -N "" -C client -f $out/client
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

  # A program whose basename is mosey's, as quoin-sudo knows mosey by its
  # exe: socat, copied under that name, so it relays as mosey's spawner
  # does, a listener of the user's serving the login's forwarded agent.
  moseyRelay = pkgs.runCommand "mosey-relay" { } ''
    mkdir -p $out/bin
    cp ${pkgs.socat}/bin/socat $out/bin/mosey
  '';

  # relayed PROGRAM CMD: relays $SSH_AUTH_SOCK through PROGRAM, a socat,
  # started as mosey starts its spawner -- through a path named exe, so its
  # comm is "exe", in a session of its own -- and runs CMD with
  # SSH_AUTH_SOCK at the relay. It says the relay's comm first.
  relayed = pkgs.writeShellScript "relayed" ''
    set -u
    d=$(mktemp -d)
    ln -s "$1" "$d/exe"
    setsid -f "$d/exe" -d -d UNIX-LISTEN:"$d/agent.sock",fork,perm=0600 UNIX-CONNECT:"$SSH_AUTH_SOCK" </dev/null >/dev/null 2>"$d/log"
    ${vmlib.await} 1 "listening on" -- tail -n +1 -F "$d/log" >/dev/null
    echo "relay comm: $(cat /proc/"$(pgrep -o -f "^$d/exe ")"/comm)"
    SSH_AUTH_SOCK="$d/agent.sock" sh -c "$2"
    s=$?
    pkill -f "^$d/exe "
    rm -r "$d"
    exit $s
  '';

  # detached CMD: runs CMD in a session of its own, reparented away from
  # the login (setsid -f's parent exits at once), waits for it on a FIFO,
  # and prints its output and exits with its status, so the login, and its
  # forwarded agent, stay up until it is done.
  detached = pkgs.writeShellScript "detached" ''
    set -u
    d=$(mktemp -d)
    mkfifo "$d/done"
    setsid -f sh -c "$1"' >"$0/out" 2>&1; echo $? >"$0/done"' "$d" </dev/null >/dev/null 2>&1
    s=$(cat "$d/done")
    cat "$d/out"
    rm -r "$d"
    exit "$s"
  '';

  sleeper = { wantedBy = [ "multi-user.target" ]; serviceConfig.ExecStart = "${pkgs.coreutils}/bin/sleep infinity"; };
in
{
  name = "quoin-sudo-remote";

  nodes.client = { ... }: {
    imports = [ self.nixosModules.signer self.nixosModules.sudo galleyService (sshd "client") ];
    virtualisation.tpm.enable = true;
    services.quoin.signer.enable = true;
    # Its own signer's key, for a sudo of its own in a local mosey session.
    services.quoin.sudo = { enable = true; remoteKeys = [ (pub "listed") ]; };
    users.users.dan = { isNormalUser = true; uid = 1000; group = "users"; extraGroups = [ "wheel" ]; linger = true; password = clientPassword; };
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
      # Rules decide a remote sudo as they do a local one.
      exec = {
        "/run/current-system/sw/bin/hostname **".answer = "allow";
        "/run/current-system/sw/bin/uname **".answer = "refuse";
        "/run/current-system/sw/bin/whoami **".answer = "ask";
      };
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
    programs.ssh.knownHosts.server.publicKeyFile = "${keys}/server.pub";
    networking.firewall.allowedTCPPorts = [ 7777 ];
    environment.systemPackages = [ pkgs.socat ];
  };

  testScript = ''
    import json
    import re
    import shlex

    pw = "${password}"
    cpw = "${clientPassword}"
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

    def labels(q):
        return [f["label"] for f in q["fields"] or []]

    def is_dialog(q, time=True):
        want = ["Password for dan"] + (["Remember the password for this claude for", ""] if time else [])
        return q["kind"] == "forms" and labels(q) == want and [b["label"] for b in q["buttons"]] == ["Cancel", "Allow"]

    def is_question(q):
        return q["kind"] == "question" and not q["fields"] and [b["label"] for b in q["buttons"]] == ["Refuse", "Allow"]

    def presence(outcome):
        out = client.succeed("journalctl --sync && journalctl -u quoin-presence.service -o cat --no-pager")
        return len([l for l in out.splitlines() if f"quoin-presence: {outcome}" in l])

    def fingerprint(name):
        return client.succeed(f"ssh-keygen -lf ${keys}/{name}.pub").split()[1]

    # A claude fed lines through a FIFO; each runs to completion, its output
    # and exit status in files.
    start_all()
    # Started, not polled for: start joins the job boot queued and returns once it is done.
    client.succeed("systemctl start quoin-signer.socket quoin-presence.socket quoin-sudo.socket")
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
        client.succeed("install -o quoin-signer -g quoin-signer -m 0600 /root/imported.tpm /var/lib/quoin-signer/id_ecdsa.tpm")
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
        galley(client, f"ok {cpw} 0")

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

    with subtest("Allow: the command runs, the dialog asked once on the client, its password checked there, never on the server"):
        asked, gated, signed, passed = len(events(client, "question")), len(gate()), len(signs()), presence("passed")
        rc, out = remote_sudo("sudo id -u")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        qs = events(client, "question")[asked:]
        assert len(qs) == 1, qs
        q = qs[0]
        client.log(f"remote sudo question: {json.dumps(q)}")
        # A sudo a window could cover is offered one, as locally.
        assert q["title"] == "sudo id -u on server" and q["level"] == "normal" and is_dialog(q), q
        lines = q["text"].split("\n")
        # The table is server's chain, the sudo's own; claude, here on
        # client, is only on its from-here line.
        rows = q["table"]["rows"]
        assert rows and all(r[1] != "claude" for r in rows) and q["table"]["summary"].startswith("server: "), q
        assert lines[-2].startswith("from here: claude ← ssh -A server") and lines[-1].startswith("key SHA256:"), lines
        assert [l for l in lines if "claude" in l] == [lines[-2]], lines
        assert "/run/current-system/sw/bin/id -u" in lines, lines
        assert "dan as root in /home/dan" in lines, lines
        assert presence("passed") == passed + 1
        s = [d for d in signs()[signed:] if d["class"] == "remote sudo"]
        assert len(s) == 1 and s[0]["remote_chain"], signs()[signed:]
        s = s[0]
        assert [l["Pid"] for l in s["remote_chain"]][-1] == 1, s
        assert s["outcome"] == "sign" and s["source"] == "presence" and s["decision"] == "dialog" and s["presence"] == "required", s
        assert s["answer"] == "allow" and s["answer_presence"] == "verified" and s["answer_window"] == 0 and s["secrets_wrong"] == 0, s
        assert s["hops"] == [client.succeed("ssh-keygen -lf ${keys}/server.pub").split()[1]], s
        assert events(server, "question") == []
        allowed = [d for d in gate()[gated:] if d.get("outcome") == "allow"]
        assert len(allowed) == 1, gate()[gated:]
        d = allowed[0]
        assert d["remote"] and d["argv"] == ["/run/current-system/sw/bin/id", "-u"] and d["key"] == fingerprint("listed"), d
        assert d["nonce"] and d["host_keys"] == [client.succeed("ssh-keygen -lf ${keys}/server.pub").split()[1]], d
        assert d["decision"] == "dialog" and d["requires"] == "required" and d["offered"] == 86400, d
        assert d["answered"] == "allow" and d["presence"] == "verified" and d["window"] == 0 and d["hops"] == 1, d
        out = client.succeed("journalctl --sync && journalctl -o cat --no-pager")
        assert cpw not in out and pw not in out

    with subtest("Wrong password: the dialog comes back, its second password checked, and it runs"):
        galley(client, "ok wrong-password 0", f"ok {cpw} 0")
        asked, signed, failed = len(events(client, "question")), len(signs()), presence("failed")
        rc, out = remote_sudo("sudo id -u")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        qs = events(client, "question")[asked:]
        assert len(qs) == 2 and all(is_dialog(q) for q in qs), qs
        assert qs[1]["text"].startswith("Wrong password, try again\n") and "Wrong password" not in qs[0]["text"], qs
        assert presence("failed") == failed + 1
        s = [d for d in signs()[signed:] if d["class"] == "remote sudo"]
        assert len(s) == 1 and s[0]["secrets_wrong"] == 1 and s[0]["answer"] == "allow", s
        # server's password is not dan's on client.
        galley(client, f"ok {pw} 0", "cancel")
        rc, out = remote_sudo("sudo touch /root/server-password")
        assert rc != 0 and "cancelled" in out.splitlines(), repr((rc, out))
        server.fail("test -e /root/server-password")
        galley(client, f"ok {cpw} 0")

    # Only the key that opened a window answers inside it, and it is asked
    # with no password; a window is keyed on the sudo's claude on server,
    # here the login's sshd-session, so it covers one ssh's sudos.
    with subtest("Window: the dialog opens one, and the next sudo in it is a question signed by the same key"):
        galley(client, f"ok {cpw} 15 minutes", "answer 0", f"ok {cpw} 0")
        asked, gated = len(events(client, "question")), len(gate())
        rc, out = remote_sudo("sudo id -u && sudo id -g")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        assert "quoin-sudo: password remembered for this claude until" in out, out
        qs = events(client, "question")[asked:]
        assert len(qs) == 2 and is_dialog(qs[0]) and is_question(qs[1]) and qs[1]["title"] == "sudo id -g on server", qs
        d = [x for x in gate()[gated:] if x["outcome"] == "allow"]
        assert len(d) == 2 and d[0]["window"] == 900 and "window_until" in d[0], d
        assert d[1]["decision"] == "question" and d[1]["requires"] == "none" and d[1]["window_key"] == fingerprint("listed"), d
        # Another login is another claude on server: the dialog again.
        asked = len(events(client, "question"))
        rc, out = remote_sudo("sudo id -u")
        assert rc == 0, repr((rc, out))
        assert is_dialog(events(client, "question")[asked]), events(client, "question")[asked:]

    with subtest("Refuse: sudo refuses with the signer's signed refusal and runs nothing"):
        galley(client, "cancel")
        rc, out = remote_sudo("sudo touch /root/refused")
        assert rc != 0 and "cancelled" in out.splitlines() and "forwarded agent" not in out, repr((rc, out))
        server.fail("test -e /root/refused")
        d = gate()[-1]
        assert d["outcome"] == "refuse" and d["source"] == "signer" and d["answered"] == "refuse", d
        galley(client, f"ok {cpw} 0")

    with subtest("Danger: a danger dialog with the reason first and no window, and its password runs it"):
        asked = len(events(client, "question"))
        rc, out = remote_sudo("sudo systemctl stop quoin-spare.service")
        assert rc == 0, repr((rc, out))
        q = events(client, "question")[asked]
        d = gate()[-1]
        assert is_dialog(q, time=False) and q["level"] == "danger" and d["level"] == "danger" and d["danger"] and "version" not in d, (q, d)
        assert d["offered"] == 0 and d["presence"] == "verified", d
        assert q["text"].split("\n")[0] == d["danger"][0], (q, d)
        server.fail("systemctl is-active quoin-spare.service")
        server.succeed("systemctl start quoin-spare.service")

    # Through second, the route is the title and the hops both binds; the
    # gate takes it, its last hop server.
    with subtest("Via: a sudo reached through second says so, and runs"):
        galley(client, "answer 0", f"ok {cpw} 0")
        asked = len(events(client, "question"))
        rc, out = run("ssh -A second ssh -A server sudo id -u")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        qs = [q for q in events(client, "question")[asked:] if q["title"].startswith("sudo ")]
        assert len(qs) == 1 and qs[0]["title"] == "sudo id -u on server via second" and is_dialog(qs[0]), qs
        d = gate()[-1]
        assert d["outcome"] == "allow" and d["hops"] == 2, d
        galley(client, f"ok {cpw} 0")

    # An allow or a refuse rule asks no one, and the agent is never asked.
    with subtest("Rules: an allow runs and a refuse refuses, as locally, with nothing asked anywhere"):
        asked, signed, local = len(events(client, "question")), len(signs()), len(events(server, "question"))
        rc, out = remote_sudo("sudo hostname")
        assert rc == 0 and out.strip().splitlines()[-1] == "server", repr((rc, out))
        rc, out = remote_sudo("sudo uname -r")
        assert rc != 0 and "refused by the host rule /run/current-system/sw/bin/uname **" in out, repr((rc, out))
        assert len(events(client, "question")) == asked, events(client, "question")[asked:]
        assert all(d["class"] != "remote sudo" for d in signs()[signed:]), signs()[signed:]
        assert len(events(server, "question")) == local
        d = gate()[-2:]
        assert [x["outcome"] for x in d] == ["allow", "refuse"] and all(x["source"] == "host rule" for x in d), d

    with subtest("Ask rule: a question with no password, any listed key's answer counts"):
        galley(client, "answer 0")
        asked, passed = len(events(client, "question")), presence("passed")
        rc, out = remote_sudo("sudo whoami")
        assert rc == 0 and out.strip().splitlines()[-1] == "root", repr((rc, out))
        q = events(client, "question")[asked]
        assert is_question(q) and q["text"].startswith("asked, with no password, by the host rule /run/current-system/sw/bin/whoami **\n"), q
        assert presence("passed") == passed
        d = gate()[-1]
        assert d["outcome"] == "allow" and d["decision"] == "question" and d["requires"] == "none" and d["rule_source"] == "host rule", d
        galley(client, f"ok {cpw} 0")

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

    # Who serves SSH_AUTH_SOCK, not the chain, makes a sudo remote: one
    # setsid'd away from its login has no sshd-session above it, and was
    # gated locally, asking server's own galley.
    with subtest("Reparented: a sudo setsid'd away from its login is remote, its own chain the table"):
        asked, local = len(events(client, "question")), len(events(server, "question"))
        rc, out = remote_sudo("${detached} 'sudo id -u'")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        qs = events(client, "question")[asked:]
        assert len(qs) == 1 and qs[0]["title"] == "sudo id -u on server", qs
        rows = qs[0]["table"]["rows"]
        client.log(f"reparented chain: {rows}")
        assert [r[1] for r in rows] == ["systemd", "sh"] and qs[0]["table"]["summary"].startswith("server: "), qs[0]
        assert len(events(server, "question")) == local

    # mosey's spawner serves the agent of a mosey session; its comm is
    # "exe", and it is in a session of its own, so no sshd-session is in the
    # sudo's chain. The relay here stands in for it.
    with subtest("mosey: a sudo whose agent a mosey-shaped relay serves is remote, and allowed"):
        asked, local = len(events(client, "question")), len(events(server, "question"))
        cmd = shlex.quote("${detached} 'sudo id -u'")
        rc, out = remote_sudo(f"${relayed} ${moseyRelay}/bin/mosey {cmd}")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        assert "relay comm: exe" in out.splitlines(), out
        qs = events(client, "question")[asked:]
        assert len(qs) == 1 and qs[0]["title"] == "sudo id -u on server", qs
        assert len(events(server, "question")) == local

    # A mosey session attached from a terminal on client: mosey serves the
    # sudo's agent and its client relays its own SSH_AUTH_SOCK, the signer's,
    # with no bind. The relay here stands in for both, run as mosey so its
    # comm is the client's. The signer takes a message naming client's host
    # keys alone from it, asks it as client's own sudo, and client's gate
    # takes the signed answer. Relayed with mosey's spawner's comm, "exe",
    # it is refused unasked: with no bind it may come from far off.
    with subtest("Local mosey: client's own sudo through an unbound mosey relay is asked by client's signer"):
        galley(client, f"ok {cpw} 0")
        run("setsid -f ${moseyRelay}/bin/mosey -d -d UNIX-LISTEN:/run/claude/mosey.sock,fork,perm=0600 UNIX-CONNECT:\"$SSH_AUTH_SOCK\" "
            "</dev/null >/dev/null 2>/run/claude/mosey.log")
        await_lines(client, 1, "listening on", "tail", "-n", "+1", "-F", "/run/claude/mosey.log")
        asked, signed = len(events(client, "question")), len(signs())
        rc, out = run("SSH_AUTH_SOCK=/run/claude/mosey.sock sudo id -u")
        assert rc == 0 and out.strip().splitlines()[-1] == "0", repr((rc, out))
        qs = events(client, "question")[asked:]
        assert len(qs) == 1 and qs[0]["title"] == "sudo id -u" and labels(qs[0])[0] == "Password for dan", qs
        s = [d for d in signs()[signed:] if d["class"] == "remote sudo"]
        assert len(s) == 1 and s[0]["destination"] == "this host" and s[0]["via"] == "unbound relay" and s[0]["answer"] == "allow", s
        d = [x for x in journal(client, "quoin-sudo.service", "decision") if x.get("remote")]
        assert d[-1]["outcome"] == "allow" and d[-1]["source"] == "signature" and d[-1]["hops"] == 0, d[-1]
        client.succeed("pkill -f '^${moseyRelay}/bin/mosey '")

        asked = len(events(client, "question"))
        rc, out = run("${relayed} ${moseyRelay}/bin/mosey 'sudo touch /root/local-mosey'")
        assert rc != 0 and "relay comm: exe" in out.splitlines() and "quoin-sudo: the forwarded agent refused" in out, repr((rc, out))
        client.fail("test -e /root/local-mosey")
        assert len(events(client, "question")) == asked
        r = journal(client, "quoin-signer.service", "refused")
        assert r[-1]["reason"] == "this host's sudo on an unbound connection, not from a mosey client", r[-1]

    # Root with no capabilities is held by no file mode, so the helper's
    # mount namespace has none of root's sockets. Running since the first
    # dialog (Accept=no).
    with subtest("quoin-presence sees no root-only socket, and what PAM needs"):
        pid = client.succeed("systemctl show -P MainPID quoin-presence.service").strip()
        assert pid != "0", pid
        hidden = ["/run/systemd/private", "/run/dbus/system_bus_socket", "/run/quoin-sudo/gate.sock",
                  "/nix/var/nix/daemon-socket/socket", "/var/lib", "/etc/ssh/ssh_host_ed25519_key"]
        seen = ["/run/wrappers/bin/unix_chkpwd", "/run/systemd/journal/dev-log", "/etc/shadow", "/etc/pam.d/quoin-sudo"]
        checks = " && ".join([f"test ! -e {p}" for p in hidden] + [f"test -e {p}" for p in seen])
        client.succeed(f"nsenter -t {pid} -m -- ${pkgs.bash}/bin/bash -c {shlex.quote(checks)}")
        links = client.succeed(f"nsenter -t {pid} -n -- ${pkgs.iproute2}/bin/ip -o link").splitlines()
        assert len(links) == 1 and links[0].split(": ")[1] == "lo", links

    # In an ssh login, an agent that is not forwarded is stock, as no agent
    # is: never this host's own galley for a user who is not at it.
    with subtest("Not forwarded: a login's own ssh-agent, another program's relay, another user's listener, a stale socket are stock"):
        server.succeed("install -d -m 0755 /run/rootagent && ln -s ${moseyRelay}/bin/mosey /run/rootagent/exe")
        server.succeed("setsid -f /run/rootagent/exe -d -d UNIX-LISTEN:/run/rootagent/agent.sock,fork,perm=0666 SYSTEM:cat "
                       "</dev/null >/dev/null 2>/run/rootagent/log")
        await_lines(server, 1, "listening on", "tail", "-n", "+1", "-F", "/run/rootagent/log")
        for cmd in [
            'eval "$(ssh-agent -s)" >/dev/null; sudo id -u; s=$?; ssh-agent -k >/dev/null; exit $s',
            "${relayed} ${pkgs.socat}/bin/socat 'sudo id -u'",
            "SSH_AUTH_SOCK=/run/rootagent/agent.sock sudo id -u",
            "SSH_AUTH_SOCK=/run/no-such-agent.sock sudo id -u",
        ]:
            signed, gated = len(signs()), len(checkins())
            rc, out = remote_sudo(cmd)
            assert rc != 0 and "a terminal is required" in out, repr((cmd, rc, out))
            assert len(checkins()) == gated, cmd
            assert all(d["class"] != "remote sudo" for d in signs()[signed:]), cmd
        server.succeed("pkill -f '^/run/rootagent/exe ' && rm -r /run/rootagent")

    # A process whose argv is mosey's spawner's, mosey --serve=spawner,
    # stands in for a mosey session with no agent forwarded into it.
    with subtest("mosey with no agent: a sudo in a mosey session is stock, not asked on server"):
        signed, gated, local = len(signs()), len(checkins()), len(events(server, "question"))
        spawner = shlex.quote("exec -a /run/no-such/mosey bash -c 'sudo id -u; s=$?; exit $s' --serve=spawner")
        rc, out = remote_sudo(f"${detached} {shlex.quote('bash -c ' + spawner)}", ssh="ssh -a")
        assert rc != 0 and "a terminal is required" in out, repr((rc, out))
        assert len(checkins()) == gated and len(events(server, "question")) == local
        assert all(d["class"] != "remote sudo" for d in signs()[signed:])

    with subtest("Relayed socket: a socket from second is refused by the signer, and sudo refuses"):
        # socat says "listening on" once it is bound. The relay on server
        # is mosey-shaped, so quoin-sudo takes it for a forwarder and only
        # the signer's host-key binding stands in its way.
        h = launch("ssh -n -A second 'exec socat -d -d TCP-LISTEN:7777,reuseaddr,fork UNIX-CONNECT:\"$SSH_AUTH_SOCK\"' & true")
        wait(h)
        await_lines(client, 1, "listening on", "tail", "-n", "+1", "-F", h[1])
        server.succeed("install -d -o dan -g users -m 0700 /run/relay && ln -s ${moseyRelay}/bin/mosey /run/relay/exe")
        server.succeed("runuser -u dan -- setsid -f /run/relay/exe -d -d UNIX-LISTEN:/run/relay/agent,fork,perm=0600 TCP:second:7777 "
                       "</dev/null >/dev/null 2>/run/relay/log")
        await_lines(server, 1, "listening on", "tail", "-n", "+1", "-F", "/run/relay/log")
        asked, signed = len(events(client, "question")), len(signs())
        rc, out = remote_sudo("SSH_AUTH_SOCK=/run/relay/agent sudo touch /root/relayed", ssh="ssh -a")
        assert rc != 0 and "quoin-sudo: the forwarded agent refused" in out, repr((rc, out))
        server.fail("test -e /root/relayed")
        assert len(events(client, "question")) == asked
        client.succeed("journalctl --sync && journalctl -u quoin-signer.service -o cat | grep -F \"not one of the message's host keys\"")
        server.succeed("pkill -f '^/run/relay/exe ' && rm -r /run/relay")
        second.succeed("pkill -u dan socat")

    # A stock agent knows no quoin-sudo@quoin and fails it, and there is no
    # plain sign to fall back to: it cannot approve a remote sudo, even
    # with a listed key.
    with subtest("Stock agent: a listed file key cannot approve, and nothing is asked anywhere"):
        run("ssh-agent -a /run/claude/stock.sock >/dev/null && SSH_AUTH_SOCK=/run/claude/stock.sock ssh-add /run/claude/stock")
        asked, signed = len(events(client, "question")), len(signs())
        rc, out = remote_sudo("sudo touch /root/stock", ssh="SSH_AUTH_SOCK=/run/claude/stock.sock ssh -A")
        assert rc != 0 and "quoin-sudo: the forwarded agent refused" in out, repr((rc, out))
        server.fail("test -e /root/stock")
        assert len(events(client, "question")) == asked and len(signs()) == signed
        assert events(server, "question") == []
        assert gate()[-1]["outcome"] == "refuse" and gate()[-1]["source"] == "agent", gate()[-1]

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
        galley(client, f"ok {cpw} 0")

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
