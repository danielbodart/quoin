# darwinModules.sudo: quoin-sudo's remote mode on a Mac, approved from the
# machine the person is at. A sudo of forUser's with no tty, under an ssh
# login with a forwarded agent, is signed there by a listed key, through
# that machine's quoin-signer and galley, or refused. Everything else is
# stock sudo. There is no gate daemon: remote mode reads no rules, so the
# plugin does the gate's remote half in sudo's own process (sudo/
# quoin_sudo_darwin.zig), and there is no local mode, the Mac having no
# galley of its own.
self:
{ config, lib, pkgs, ... }:

let
  cfg = config.services.quoin.sudo;
  inherit (lib) mkOption types;
  plugin = self.packages.${pkgs.stdenv.hostPlatform.system}.quoin-sudo-plugin;
  so = "${plugin}/lib/quoin_sudo.so";
  pam = "${plugin}/lib/quoin_sudo_pam.so";
  keys = pkgs.writeText "quoin-sudo-remote-keys" (lib.concatLines cfg.remoteKeys);
  remote = cfg.remoteKeys != [ ];

  sudoers = lib.filter (l: !lib.hasPrefix "#" (lib.trim l)) (lib.splitString "\n" (config.security.sudo.extraConfig or ""));
  matches = re: lib.concatMap (l: lib.filter lib.isList (builtins.split re l)) sudoers;
  timestampTypes = lib.unique (map lib.head (matches "timestamp_type[[:space:]]*=[[:space:]]*\"?([A-Za-z]*)")
    ++ map (_: "global") (matches "(^|[^!])![[:space:]]*(tty_tickets)([^A-Za-z_]|$)"));
in
{
  options.services.quoin.sudo = {
    enable = lib.mkEnableOption "quoin-sudo's remote mode: the plugin line in sudo.conf, the PAM rule in sudo_local, the sudoers defaults and the pre-flight";
    forUser = mkOption {
      type = types.str;
      default = "dan";
      description = "The gated user.";
    };
    remoteKeys = mkOption {
      type = types.listOf (types.strMatching "[^\n]+");
      default = [ ];
      description = "SSH public key lines, nistp256 or ed25519, whose signature approves forUser's remote sudo with no tty (`ssh -A host sudo x`); empty is remote mode off, which on a Mac is every sudo stock.";
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = timestampTypes == [ "tty" ];
        message = "a no-tty sudo's ticket under another timestamp_type is good for the next terminal sudo: sudoers sets timestamp_type ${toString timestampTypes}";
      }
    ];

    # Before /etc changes, and failing the switch: a Plugin line sudo
    # cannot load makes every sudo fatal, darwin-rebuild's own included.
    system.activationScripts.preActivation.text = ''
      if ! ${plugin}/bin/quoin-sudo-check-plugin ${so} quoin_audit ${pam} ${keys}; then
        echo "quoin-sudo: the pre-flight failed; sudo.conf is left as it was" >&2
        exit 1
      fi
    '';

    # sudoers is built into Apple's sudo, so sudoers.so names that copy.
    environment.etc."sudo.conf".text = ''
      Plugin sudoers_policy sudoers.so
      Plugin sudoers_io sudoers.so
      Plugin sudoers_audit sudoers.so
      Plugin quoin_audit ${so} user=${cfg.forUser}${lib.optionalString remote " remote"} keys=${keys}
    '';

    # First in sudo_local, which /etc/pam.d/sudo includes before its own.
    security.pam.services.sudo_local.text = lib.mkBefore ''
      auth       sufficient     ${pam} user=${cfg.forUser} plugin=${so}
    '';

    # As on Linux: -n reaches the PAM module, and a no-tty sudo leaves no
    # ticket a later one could use.
    security.sudo.extraConfig = ''
      Defaults noninteractive_auth
      Defaults timestamp_type=tty
    '';
  };
}
