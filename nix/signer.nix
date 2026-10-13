# nixosModules.signer: quoin-signer, the only holder of the TPM, serving
# forUser's SSH agent at /run/quoin-signer/agent.
self:
{ config, lib, pkgs, utils, ... }:

let
  cfg = config.services.quoin.signer;
  policy = config.services.quoin.policy;
  inherit (lib) mkOption types;
  package = self.packages.${pkgs.stdenv.hostPlatform.system}.quoin;
  signer = lib.getExe' package "quoin-signer";
  rule = types.enum [ "allow" "ask" ];
  # A main process is known by its comm, which the kernel cuts at 15
  # bytes, so a longer name could never be recognised; check refuses one too.
  unit = types.strMatching "[A-Za-z0-9:_.-]{1,15}[.]service";

  inTss = lib.filter
    (name:
      let u = config.users.users.${name}; in
      u.isNormalUser && (u.group == "tss" || lib.elem "tss" u.extraGroups || lib.elem name config.users.groups.tss.members))
    (lib.attrNames config.users.users);

  tpm = {
    User = "ssh-signer";
    Group = "ssh-signer";
    SupplementaryGroups = [ "tss" ];
    DevicePolicy = "closed";
    DeviceAllow = [ "/dev/tpmrm0 rw" ];
  };

  # Checked as serve will read it, when the system is built.
  configFile = pkgs.runCommand "quoin-signer-config.json"
    {
      nativeBuildInputs = [ package ];
      config = builtins.toJSON ({
        inherit (cfg) forUser terminal sshsig loginSigners policySigners;
        ssh = { inherit (cfg.ssh) hosts; };
      } // lib.optionalAttrs policy.courier.enable {
        # A project's signed policy, read through the courier for the
        # process that asks: its signer section over these settings, Always
        # offered, and policy-sign served.
        policy = {
          courier = "/run/quoin-courier/sock";
          allowedSigners = "/etc/quoin/allowed_signers";
          inherit (policy) fileName;
        };
      });
      passAsFile = [ "config" ];
    } ''
    cp "$configPath" "$out"
    quoin-signer check "$out"
  '';
in
{
  imports = [ self.nixosModules.policy ];

  options.services.quoin.signer = {
    enable = lib.mkEnableOption "quoin-signer, the SSH agent whose keys live in the TPM";
    forUser = mkOption {
      type = types.str;
      default = "dan";
      description = "The only peer uid served, and the user whose galley is asked.";
    };
    terminal = mkOption {
      type = rule;
      default = "allow";
      description = "A real tab's bound, direct sign to a host in /etc/ssh/ssh_known_hosts.";
    };
    sshsig = mkOption {
      type = types.attrsOf rule;
      default = { git = "allow"; };
      description = "A direct SSHSIG sign in each namespace. An unlisted namespace is asked, Allow once.";
    };
    ssh.hosts = mkOption {
      type = types.attrsOf rule;
      default = { };
      example = { "github.com" = "allow"; };
      description = ''
        A bound, direct login from any of forUser's processes to a host key
        listed under this name in /etc/ssh/ssh_known_hosts, or a name this
        pattern matches: `*` alone is one label, `*` within a label any run
        of it (`*-ap`), and `**` as the first label one or more
        (`**.bodar.com`). A literal beats a pattern and a narrower pattern a
        wider one. A forwarded sign, an unknown host key and a cut chain are
        asked whatever this says. With services.quoin.policy.courier on, a
        project's signed policy file merges its signer.ssh.hosts over these.
      '';
    };
    loginSigners = mkOption {
      type = types.listOf unit;
      default = [ ];
      example = [ "proxy.service" ];
      description = ''
        System units whose main process, run as forUser, has its logins
        signed with no question: a program the host trusts to decide for
        itself which machines a session it runs may log into. A child the
        main process starts is asked as anyone else is. None by default:
        nothing is trusted for being a particular program.
      '';
    };
    policySigners = mkOption {
      type = types.listOf unit;
      default = [ ];
      example = [ "proxy.service" ];
      description = ''
        System units whose main process, run as forUser, may send a
        policy-sign marked approved, saying the person already approved the
        change in a question of its own, which is signed with no question of
        the signer's; approved from anyone else is refused. Nothing else
        from the unit is signed unasked for being listed here. None by
        default.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    services.quoin.policy.courier.peers."quoin-signer.service" = "ssh-signer";

    assertions = [{
      assertion = inTss == [ ];
      message = "a login user in tss could sign with any key blob: ${toString inTss}";
    }
      {
        assertion = !policy.courier.enable || policy.courier.forUser == cfg.forUser;
        message = "services.quoin.policy.courier.forUser (${policy.courier.forUser}) is not services.quoin.signer.forUser (${cfg.forUser}): the signer reads the projects of the user it serves.";
      }];

    security.tpm2.enable = true;

    users.users.ssh-signer = {
      uid = 951;
      group = "ssh-signer";
      isSystemUser = true;
    };
    users.groups.ssh-signer.gid = 951;

    environment.etc."quoin/signer.json".source = configFile;

    systemd.sockets.quoin-signer = {
      description = "quoin-signer agent socket";
      wantedBy = [ "sockets.target" ];
      socketConfig = {
        ListenStream = "/run/quoin-signer/agent";
        SocketUser = cfg.forUser;
        SocketMode = "0600";
        DirectoryMode = "0755";
        FileDescriptorName = "agent";
      };
    };

    systemd.services.quoin-signer = {
      description = "quoin-signer: SSH keys in the TPM, asked for through galley";
      requires = [ "quoin-signer.socket" ];
      wants = lib.optional policy.courier.enable "quoin-courier.socket";
      after = [ "quoin-signer.socket" ] ++ lib.optional policy.courier.enable "quoin-courier.socket";
      startLimitIntervalSec = 0;
      restartTriggers = [ configFile ];
      serviceConfig = tpm // {
        ExecStart = utils.escapeSystemdExecArgs [ signer "serve" "-config" "/etc/quoin/signer.json" ];
        Type = "notify";
        NotifyAccess = "main";
        Restart = "always";
        StateDirectory = "quoin-signer";
        StateDirectoryMode = "0700";
        NoNewPrivileges = true;
        CapabilityBoundingSet = "";
        ProtectSystem = "strict";
        ProtectHome = true;
        PrivateTmp = true;
        ProtectControlGroups = true;
        RestrictAddressFamilies = [ "AF_UNIX" ];
        SystemCallFilter = [ "@system-service" "~@privileged" ];
        MemoryDenyWriteExecute = true;
      };
    };

    systemd.services.quoin-signer-keygen = {
      description = "quoin-signer: a new key in the TPM, in /var/lib/quoin-signer/new";
      serviceConfig = tpm // {
        Type = "oneshot";
        ExecStart = utils.escapeSystemdExecArgs [ signer "keygen" "-out" "/var/lib/quoin-signer/new" "-comment" "${cfg.forUser}@${config.networking.hostName}" ];
        StateDirectory = [ "quoin-signer" "quoin-signer/new" ];
        StateDirectoryMode = "0700";
      };
    };
  };
}
