# sudo.conf with quoin-sudo's plugin line, built only when
# quoin-sudo-check-plugin loads the plugin as sudo would and finds an audit
# plugin of this sudo's API major built for this sudo version (guard 1).
{ pkgs, plugin }:
{ so ? "${plugin}/lib/quoin_sudo.so", symbol ? "quoin_audit", version, user, remote ? false }:
let inherit (pkgs.lib) escapeShellArg; in
pkgs.runCommand "sudo.conf" { } ''
  ${plugin}/bin/quoin-sudo-check-plugin ${escapeShellArg so} ${escapeShellArg symbol} ${escapeShellArg version}
  echo ${escapeShellArg "Plugin ${symbol} ${so} user=${user}${pkgs.lib.optionalString remote " remote"}"} > $out
''
