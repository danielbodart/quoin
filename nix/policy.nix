# nixosModules.policy: a project's signed policy file. allowedSigners is
# rendered, root's, to /etc/quoin/allowed_signers, the file every verifier
# checks a policy's signature against; courier is quoin-courier, running as
# forUser with no network, which finds the policy file above a process's
# working directory and replaces it, for the system units named its peers.
# The signer and the sudo gate import this module and name themselves peers.
self:
{ config, lib, pkgs, utils, ... }:

let
  cfg = config.services.quoin.policy;
  inherit (lib) mkOption types;
  package = self.packages.${pkgs.stdenv.hostPlatform.system}.quoin;

  signer = types.submodule {
    options = {
      principal = mkOption {
        type = types.str;
        example = "dan";
        description = "Who signs with the key: the -I a stock ssh-keygen -Y verify names.";
      };
      key = mkOption {
        type = types.str;
        example = "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAI…";
        description = "The public key, as its .pub file holds it.";
      };
    };
  };
  line = s: if builtins.isString s then s else ''${s.principal} namespaces="quoin-policy:*" ${s.key}'';

  # Read as every verifier will read it, when the system is built.
  allowedSigners = pkgs.runCommand "quoin-allowed-signers"
    {
      nativeBuildInputs = [ package ];
      text = lib.concatMapStrings (s: line s + "\n") cfg.allowedSigners;
      passAsFile = [ "text" ];
    } ''
    cp "$textPath" "$out"
    quoin policy signers "$out"
  '';

  user = config.users.users.${cfg.courier.forUser};

  # Checked as serve will read it, when the system is built.
  configFile = pkgs.runCommand "quoin-courier-config.json"
    {
      nativeBuildInputs = [ package ];
      config = builtins.toJSON {
        inherit (cfg) fileName;
        allowedSigners = "/etc/quoin/allowed_signers";
        inherit (cfg.courier) peers;
      };
      passAsFile = [ "config" ];
    } ''
    cp "$configPath" "$out"
    quoin-courier check "$out"
  '';
in
{
  options.services.quoin.policy = {
    fileName = mkOption {
      type = types.str;
      example = "chase.json";
      description = ''
        A project's policy file's name, found in the nearest directory from a
        process's working directory up to forUser's home; its signature is
        beside it with .sig added. No default: the launcher names it.
      '';
    };
    allowedSigners = mkOption {
      type = types.listOf (types.either signer types.str);
      default = [ ];
      example = [{ principal = "dan"; key = "ecdsa-sha2-nistp256 AAAA…"; }];
      description = ''
        Whose signature makes a project's policy count, written root's to
        /etc/quoin/allowed_signers. A `{ principal, key }` becomes
        `principal namespaces="quoin-policy:*" key`, so the key signs
        policies and nothing else; a string is an allowed_signers line as it
        is, in OpenSSH's format, but a cert-authority line is refused.
      '';
    };
    courier = {
      enable = lib.mkEnableOption "quoin-courier, the courier that reads and writes forUser's project policy files for the signer and the sudo gate";
      forUser = mkOption {
        type = types.str;
        default = "dan";
        description = "The user whose projects' policy files the courier reads and writes, and who it runs as.";
      };
      peers = mkOption {
        type = types.attrsOf types.str;
        default = { };
        example = { "quoin-signer.service" = "ssh-signer"; };
        description = ''
          The system units allowed to call the courier, each to the user it
          runs as: a caller must be that user, in that unit's cgroup. The
          signer and the sudo gate add themselves when enabled.
        '';
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (cfg.allowedSigners != [ ] || cfg.courier.enable) {
      environment.etc."quoin/allowed_signers".source = allowedSigners;
    })

    (lib.mkIf cfg.courier.enable {
      environment.etc."quoin/courier.json".source = configFile;

      systemd.sockets.quoin-courier = {
        description = "quoin-courier socket";
        wantedBy = [ "sockets.target" ];
        socketConfig = {
          ListenStream = "/run/quoin-courier/sock";
          # Each caller's uid and cgroup are checked on accept; the mode only
          # lets the peers, each its own user, connect at all.
          SocketMode = "0666";
          DirectoryMode = "0755";
          FileDescriptorName = "courier";
        };
      };

      systemd.services.quoin-courier = {
        description = "quoin-policy: project policy files, carried from ${cfg.courier.forUser}'s home";
        requires = [ "quoin-courier.socket" ];
        after = [ "quoin-courier.socket" ];
        startLimitIntervalSec = 0;
        restartTriggers = [ configFile ];
        serviceConfig = {
          ExecStart = utils.escapeSystemdExecArgs [ (lib.getExe' package "quoin-courier") "serve" "-config" "/etc/quoin/courier.json" ];
          Type = "notify";
          NotifyAccess = "main";
          User = cfg.courier.forUser;
          Group = user.group;
          Restart = "always";
          RestartSec = "1s";
          UMask = "0022";
          ProtectSystem = "strict";
          ProtectHome = "read-only";
          ReadWritePaths = [ user.home ];
          PrivateNetwork = true;
          RestrictAddressFamilies = [ "AF_UNIX" ];
          PrivateTmp = true;
          PrivateDevices = true;
          ProtectKernelTunables = true;
          ProtectKernelModules = true;
          ProtectKernelLogs = true;
          ProtectControlGroups = true;
          ProtectClock = true;
          ProtectHostname = true;
          RestrictNamespaces = true;
          RestrictRealtime = true;
          RestrictSUIDSGID = true;
          LockPersonality = true;
          MemoryDenyWriteExecute = true;
          NoNewPrivileges = true;
          CapabilityBoundingSet = "";
          SystemCallArchitectures = "native";
          SystemCallFilter = [ "@system-service" "~@privileged" ];
        };
      };
    })
  ];
}
