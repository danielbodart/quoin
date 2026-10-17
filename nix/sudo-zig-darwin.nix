# quoin-sudo's Zig for macOS: the plugin doing the gate's remote half in
# sudo's process, its PAM module, the pre-flight, and the pre-flight's
# arm64e loader. Apple ships sudo without its headers, so sudo_plugin.h is
# taken from the release Apple builds from, 1.9.13p2; the API major is what
# sudo checks, and the pre-flight checks it again on the host.
{ pkgs }:
let
  inherit (pkgs) lib;
  zig = pkgs.zig_0_15;
  root = ../sudo;

  sudoSrc = pkgs.fetchurl {
    url = "https://www.sudo.ws/dist/sudo-1.9.13p2.tar.gz";
    hash = "sha256-3yAE/eTBAzsf3KM5lY4OxjPTk9YE/P+dFROr7x+UV00=";
  };
  # Apple's PAM is OpenPAM, and the SDK carries neither its headers nor a
  # libpam to link: the headers are openpam's, and what is installed binds
  # PAM from sudo's process. Only the tests link openpam's libpam.
  sudoInclude = pkgs.runCommand "sudo-plugin-h-1.9.13p2" { } ''
    mkdir -p $out
    tar -xzf ${sudoSrc} -C $out --strip-components=2 sudo-1.9.13p2/include/sudo_plugin.h
  '';

  sources = map (f: root + "/${f}") [
    "abi.zig" "fd_darwin.zig" "chain.zig" "agent.zig" "ids.zig" "args.zig" "sshkey.zig" "sudomsg.zig"
    "quoin_sudo_darwin.zig" "quoin-sudo-pam-darwin.zig" "quoin-sudo-check-plugin-darwin.zig"
    "lint.zig" "darwin_test.zig" "testdata/sudomsg"
  ];

  zigBuild = { pname, steps, flags ? "", postInstall ? "", dontStrip ? false }:
    pkgs.stdenv.mkDerivation {
      inherit pname postInstall dontStrip;
      version = "0";
      src = lib.fileset.toSource {
        inherit root;
        fileset = lib.fileset.unions ([ (root + "/build.zig") (root + "/build.zig.zon") (root + "/darwin") ] ++ sources);
      };
      nativeBuildInputs = [ zig ];
      dontUseZigBuild = true;
      doCheck = false;
      disallowedReferences = [ zig ];
      installPhase = ''
        runHook preInstall
        mkdir -p $out
        TERM=dumb zig build ${steps} -j$NIX_BUILD_CORES --release=safe --prefix $out -Dsudo-include=${sudoInclude} -Dpam=${pkgs.openpam} ${flags}
        runHook postInstall
      '';
    };
in
{
  package = zigBuild {
    pname = "quoin-sudo-plugin-darwin";
    steps = "install";
    flags = "-Dloader=${placeholder "out"}/libexec/quoin-sudo-load";
    # The loader is arm64e, as Apple's sudo is, which Zig cannot build.
    # nixpkgs' clang marks arm64e as pointer-auth ABI version 0, which
    # macOS kills outside Apple's own binaries (exit 137 before main);
    # Xcode's clang marks version 1. The mark is the high byte of the
    # Mach-O header's cpusubtype, at offset 11, set to 0x81 and signed
    # again. Were a macOS to refuse it all the same, the pre-flight fails
    # and the switch leaves sudo.conf alone.
    postInstall = ''
      mkdir -p $out/libexec
      load=$out/libexec/quoin-sudo-load
      $CC -arch arm64e -O2 -Wall -Wextra -I${sudoInclude} -I${pkgs.openpam}/include -o $load darwin/quoin-sudo-load.c
      [ "$(od -An -tx1 -j11 -N1 $load | tr -d ' ')" = 80 ]
      printf '\x81' | dd of=$load bs=1 seek=11 conv=notrunc
      ${pkgs.darwin.sigtool}/bin/codesign -f -s - $load
    '';
    dontStrip = true;
  };

  check = zigBuild {
    pname = "quoin-sudo-zig-check-darwin";
    steps = "test lint fmt";
  };
}
