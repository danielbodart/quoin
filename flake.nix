{
  description = "The host's gatekeepers: SSH keys in the TPM, sudo with no terminal, and a project's signed policy, asked through galley";

  # nixos-26.05, the release nix-config builds every host from, so the Zig
  # plugin this flake builds and pushes to the cache is the derivation a
  # host builds. The Go packages are the release's binaries, whatever
  # nixpkgs is (see release, below).
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = lib.genAttrs systems;
      darwinSystems = lib.genAttrs [ "aarch64-darwin" ];

      # Go's major.minor, the one mise.toml pins, for the dev shell.
      go = pkgs: pkgs.go_1_27;

      # THE GO PACKAGES ARE THE RELEASE'S BINARIES, not a build from source
      # (Dan, 2026-11-15): CI's build job compiles them once, static, with
      # the Go mise.toml pins (scripts/build.sh), tests them, and the release
      # carries them; building them again here only made second binaries
      # that were not the ones released. So a release's tag is a commit of
      # its own, a child of the released trunk commit, that adds
      # nix/release.json: the version, and for each system each binary's
      # asset URL and hash (scripts/release-json.sh writes it; ci.yml's
      # release job commits and tags it). A flake fetched as
      # github:danielbodart/quoin/v<V> sees its commit, not its tag, which is
      # why the version is in the file.
      #
      # On trunk there is no such file and no Go package, nor any check or
      # module that needs one: pin a release tag. Absent rather than an
      # error, so `nix flake check` and the dev shell still work on trunk.
      #
      # quoin-sudo-plugin stays a build from source, on trunk too: it is a
      # shared object sudo loads, linked against libc and libpam, and built
      # for the very sudo version the host runs (nix/sudo-zig.nix), so no
      # prebuilt file could serve every host.
      releaseFile = ./nix/release.json;
      release =
        if builtins.pathExists releaseFile
        then lib.importJSON releaseFile
        else null;

      # Static binaries installed byte for byte as the release has them: no
      # stripping or patching, which a static Go binary needs on neither
      # NixOS nor anywhere else, and which would make them differ from the
      # release's SHA256SUMS.
      mkRelease = pkgs: { pname, assets, bins, mainProgram, description }: pkgs.stdenvNoCC.mkDerivation {
        inherit pname;
        inherit (release) version;
        dontUnpack = true;
        dontConfigure = true;
        dontBuild = true;
        installPhase = ''
          runHook preInstall
          ${lib.concatMapStrings (b: "install -Dm0755 ${pkgs.fetchurl { inherit (assets.${b}) url hash; }} $out/bin/${b}\n") bins}
          runHook postInstall
        '';
        dontFixup = true;
        meta = {
          inherit description mainProgram;
          homepage = "https://github.com/danielbodart/quoin";
          license = lib.licenses.mit;
          platforms = builtins.attrNames release.assets;
          sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
        };
      };

      # The release's packages for each system it has assets for.
      releasePackages = lib.mapAttrs
        (system: assets:
          let
            pkgs = nixpkgs.legacyPackages.${system};
            mk = mkRelease pkgs;
          in
          rec {
            # One package, the four binaries: quoin, the person's own tool for
            # a project's policy file, and the three gatekeepers.
            quoin = mk {
              pname = "quoin";
              inherit assets;
              bins = [ "quoin" "quoin-signer" "quoin-sudo" "quoin-courier" ];
              mainProgram = "quoin";
              description = "The host's gatekeepers: SSH keys in the TPM, sudo with no terminal, and a project's signed policy, asked through galley";
            };
            default = quoin;
            # galley's services socket in the VM tests, answering from a script.
            fakegalley = mk {
              pname = "fakegalley";
              inherit assets;
              bins = [ "fakegalley" ];
              mainProgram = "fakegalley";
              description = "galley's services socket, answering from a script, for tests";
            };
            # A client that binds one session and signs for another, for the signer's VM test.
            agenttamper = mk {
              pname = "agenttamper";
              inherit assets;
              bins = [ "agenttamper" ];
              mainProgram = "agenttamper";
              description = "An agent client that binds one session and signs for another, for tests";
            };
          })
        (if release == null then { } else release.assets);
    in
    {
      # Keyed, so the module system can tell each is one module however many
      # times it is imported: the signer and the gate both import the policy
      # module, and a host may import all of them, and without a key two
      # imports are two anonymous functions declaring every option twice.
      nixosModules.signer = {
        key = "github:danielbodart/quoin#nixosModules.signer";
        imports = [ (import ./nix/signer.nix self) ];
      };
      nixosModules.sudo = {
        key = "github:danielbodart/quoin#nixosModules.sudo";
        imports = [ (import ./nix/sudo.nix self) ];
      };
      # The allowed signers a project's policy is verified against, and the
      # courier that carries it from the user's home. The signer and the gate
      # import it, each naming itself a courier peer.
      nixosModules.policy = {
        key = "github:danielbodart/quoin#nixosModules.policy";
        imports = [ (import ./nix/policy.nix self) ];
      };
      # quoin-sudo's remote mode on a Mac, for nix-darwin: the plugin and
      # its PAM module approve a no-tty sudo over ssh by the forwarded
      # agent's signature, as the Linux gate's remote mode does.
      darwinModules.sudo = {
        key = "github:danielbodart/quoin#darwinModules.sudo";
        imports = [ (import ./nix/sudo-darwin.nix self) ];
      };
      # All three; each is still off until its enable is set.
      nixosModules.default = {
        key = "github:danielbodart/quoin#nixosModules.default";
        imports = [ self.nixosModules.signer self.nixosModules.sudo self.nixosModules.policy ];
      };

      # macOS has quoin-sudo's darwin build alone: its signer, courier and
      # gate are Linux's (TPM, /proc, systemd), and a Mac's sudo is approved
      # from the Linux machine the person is at.
      packages = darwinSystems
        (system: {
          quoin-sudo-plugin = (import ./nix/sudo-zig-darwin.nix { pkgs = nixpkgs.legacyPackages.${system}; }).package;
        }) // forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          # quoin-sudo's Zig: the audit plugin, its PAM helper and the
          # build-time plugin check. See nix/sudo-zig.nix.
          quoin-sudo-plugin = (import ./nix/sudo-zig.nix { inherit pkgs; }).package;
          # The signer's presence check, built from the same Zig.
          quoin-presence = (import ./nix/sudo-zig.nix { inherit pkgs; }).presence;
        } // (releasePackages.${system} or { }));

      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          default = pkgs.mkShell {
            # swtpm and ssh-keygen, for the TPM and SSHSIG tests, which skip
            # without them unless QUOIN_REQUIRE_SWTPM or
            # QUOIN_REQUIRE_SSH_KEYGEN says to fail; zig, for sudo/.
            packages = [ (go pkgs) pkgs.gopls pkgs.golangci-lint pkgs.swtpm pkgs.openssh pkgs.zig_0_15 ];
            # The same setting the release is built with (scripts/build.sh),
            # so a `go build` in the shell produces a static binary rather
            # than a dynamically linked one that works here and nowhere else.
            CGO_ENABLED = "0";
          };
        });

      checks = darwinSystems
        (system: {
          inherit (self.packages.${system}) quoin-sudo-plugin;
          # The darwin Zig's unit tests, the plugin's from outside, lint and
          # fmt, on the Mac they are built for.
          sudo-zig = (import ./nix/sudo-zig-darwin.nix { pkgs = nixpkgs.legacyPackages.${system}; }).check;
        }) // forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          host = extra: nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [{ boot.isContainer = true; system.stateVersion = "26.05"; }] ++ extra;
          };
        in
        {
          # quoin-sudo's Zig, and its tests, the mode parse held to sudo's
          # own parse_args among them, lint, fmt and zwanzig.
          inherit (self.packages.${system}) quoin-sudo-plugin quoin-presence;
          sudo-zig = (import ./nix/sudo-zig.nix { inherit pkgs; }).check;

          # Every module imported twice, and through default besides, must
          # evaluate: the keys are what make a second import the same module
          # rather than a second declaration of every option.
          modules =
            let
              eval = host [
                self.nixosModules.default
                self.nixosModules.signer
                self.nixosModules.signer
                self.nixosModules.sudo
                self.nixosModules.sudo
                self.nixosModules.policy
                self.nixosModules.policy
              ];
            in
            pkgs.writeText "quoin-modules"
              (builtins.toJSON {
                signer = eval.config.services.quoin.signer.enable;
                sudo = eval.config.services.quoin.sudo.enable;
                courier = eval.config.services.quoin.policy.courier.enable;
              });

          # No login user may be in tss while the signer is enabled, however
          # the membership is spelled.
          signer-tss =
            let
              refused = user: group: builtins.any (a: ! a.assertion)
                (host [
                  self.nixosModules.signer
                  {
                    services.quoin.signer.enable = true;
                    users.users.alice = { isNormalUser = true; } // user;
                    users.groups.tss = group;
                  }
                ]).config.assertions;
              wrong = builtins.filter (x: x.got != x.want) [
                { case = "none"; got = refused { } { }; want = false; }
                { case = "extraGroups"; got = refused { extraGroups = [ "tss" ]; } { }; want = true; }
                { case = "members"; got = refused { } { members = [ "alice" ]; }; want = true; }
                { case = "primary"; got = refused { group = "tss"; } { }; want = true; }
              ];
            in
            assert nixpkgs.lib.assertMsg (wrong == [ ]) "tss assertion judged wrongly: ${builtins.toJSON wrong}";
            pkgs.writeText "quoin-signer-tss" "ok";

          # quoin-presence is refused for root, and with any auth rule but
          # the password's on the quoin-sudo PAM service; it serves the
          # signer alone, one request at a time, for forUser, and dumps no
          # core. (The signer's unit needs its release; its VM test checks
          # it dumps none either.)
          signer-presence =
            let
              eval = extra: (host [ self.nixosModules.signer { services.quoin.signer.enable = true; } extra ]).config;
              refused = extra: builtins.any (a: ! a.assertion) (eval extra).assertions;
              on = (eval { }).systemd;
              wrong = builtins.filter (x: x.got != x.want) [
                { case = "none"; got = refused { }; want = false; }
                { case = "root"; got = refused { services.quoin.signer.forUser = "root"; }; want = true; }
                { case = "extra quoin-sudo auth rule"; got = refused { security.pam.services.quoin-sudo.fprintAuth = true; }; want = true; }
                { case = "socket"; got = on.sockets.quoin-presence.socketConfig; want = { ListenStream = "/run/quoin-presence/sock"; SocketUser = "quoin-signer"; SocketMode = "0600"; DirectoryMode = "0755"; Accept = false; }; }
                { case = "for forUser, from the signer's uid"; got = lib.drop 1 (lib.splitString " " on.services.quoin-presence.serviceConfig.ExecStart); want = map builtins.toJSON [ "dan" "951" ]; }
                { case = "root"; got = on.services.quoin-presence.serviceConfig ? User; want = false; }
                { case = "no core"; got = on.services.quoin-presence.serviceConfig.LimitCORE; want = 0; }
                { case = "the signer after it"; got = builtins.elem "quoin-presence.socket" on.services.quoin-signer.after; want = true; }
              ];
            in
            assert nixpkgs.lib.assertMsg (wrong == [ ]) "quoin-presence judged wrongly: ${builtins.toJSON wrong}";
            pkgs.writeText "quoin-signer-presence" "ok";

          # The gate refuses a sudo set-up it cannot gate safely.
          sudo-eval =
            let
              refused = extra: builtins.any (a: ! a.assertion)
                (host [
                  self.nixosModules.sudo
                  { services.quoin.sudo.enable = true; }
                  extra
                ]).config.assertions;
              sudoers = text: { security.sudo.extraConfig = text; };
              remote = { services.quoin.sudo.remoteKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl a" ]; };
              wrong = builtins.filter (x: refused x.extra != x.want) [
                { case = "none"; extra = { }; want = false; }
                { case = "negated"; extra = sudoers "Defaults !rootpw, !intercept\nDefaults intercept_verify"; want = false; }
                { case = "extra auth rule"; extra = { security.pam.services.sudo.fprintAuth = true; }; want = true; }
                { case = "extra quoin-sudo auth rule"; extra = { security.pam.services.quoin-sudo.fprintAuth = true; }; want = true; }
                { case = "timestamp_type=global"; extra = sudoers "Defaults timestamp_type=global"; want = true; }
                { case = "!tty_tickets"; extra = sudoers "Defaults !tty_tickets"; want = true; }
                { case = "tty_tickets"; extra = sudoers "Defaults tty_tickets"; want = false; }
                { case = "rootpw"; extra = sudoers "Defaults rootpw"; want = true; }
                { case = "targetpw"; extra = sudoers "Defaults:dan targetpw"; want = true; }
                { case = "runaspw"; extra = sudoers "Defaults runaspw"; want = true; }
                { case = "intercept"; extra = sudoers "Defaults intercept"; want = true; }
                { case = "log_subcmds"; extra = sudoers "Defaults log_subcmds"; want = true; }
                { case = "INTERCEPT tag"; extra = sudoers "dan ALL=(ALL) INTERCEPT: ALL"; want = true; }
                { case = "LOG_SUBCMDS tag"; extra = sudoers "dan ALL=(ALL) LOG_SUBCMDS: ALL"; want = true; }
                { case = "NOINTERCEPT tag"; extra = sudoers "dan ALL=(ALL) NOINTERCEPT: ALL"; want = false; }
                { case = "INTERCEPT in extraRules"; extra = { security.sudo.extraRules = [{ users = [ "dan" ]; commands = [{ command = "ALL"; options = [ "INTERCEPT" ]; }]; }]; }; want = true; }
                { case = "ptrace_scope 0"; extra = { boot.kernel.sysctl."kernel.yama.ptrace_scope" = 0; }; want = true; }
                { case = "remote keys"; extra = remote; want = false; }
                { case = "a courier for the gated user"; extra = { services.quoin.policy = { fileName = "chase.json"; courier.enable = true; }; }; want = false; }
                { case = "a courier for another user"; extra = { services.quoin.policy = { fileName = "chase.json"; courier = { enable = true; forUser = "root"; }; }; }; want = true; }
                { case = "remote keys and an extra auth rule"; extra = { imports = [ remote ]; security.pam.services.sudo.fprintAuth = true; }; want = true; }
              ];
            in
            assert nixpkgs.lib.assertMsg (wrong == [ ]) "sudo gate assertions judged wrongly: ${builtins.toJSON (map (x: x.case) wrong)}";
            pkgs.writeText "quoin-sudo-eval" "ok";

          # sudo.conf is never built from a plugin sudo would not load.
          sudo-conf =
            let
              plugin = self.packages.${system}.quoin-sudo-plugin;
              conf = args: import ./nix/sudo-conf.nix { inherit pkgs plugin; } ({ version = pkgs.sudo.version; user = "dan"; } // args);
              fails = args: pkgs.testers.testBuildFailure (conf args);
            in
            pkgs.runCommand "quoin-sudo-conf"
              {
                good = conf { };
                remote = conf { remote = true; };
                broken = fails { so = "${pkgs.writeText "not-a-plugin.so" "not a library"}"; };
                symbol = fails { symbol = "quoin_approval"; };
                type = fails { so = "${pkgs.sudo}/libexec/sudo/sudoers.so"; symbol = "sudoers_policy"; };
              }
              ''
                grep -qx "Plugin quoin_audit ${plugin}/lib/quoin_sudo.so user=dan" $good
                grep -qx "Plugin quoin_audit ${plugin}/lib/quoin_sudo.so user=dan remote" $remote
                grep -q "cannot load" $broken/testBuildFailure.log
                grep -q "no symbol quoin_approval" $symbol/testBuildFailure.log
                grep -q "is plugin type 1, not 3 (audit)" $type/testBuildFailure.log
                touch $out
              '';
        }
        # What runs or renders quoin's binaries, so needs its packages, which
        # are the release's (see release, at the top): on a release tag, and
        # in CI's nix job, which makes this run's binaries the flake's
        # release (scripts/nix-local-release.sh). The tests, the race tests,
        # vet and gofmt are mise's (mise run check and race), on the very
        # toolchain the binaries are built with.
        // lib.optionalAttrs (self.packages.${system} ? quoin) {
          # The binaries, as a host installs them.
          inherit (self.packages.${system}) quoin fakegalley agenttamper;

          # The policy module: allowed signers rendered and read as the
          # verifiers will (building this builds the file, which runs quoin
          # policy signers on it), the courier's config with the signer and
          # the gate as its peers, and its unit as the user with no network
          # and only the home writable; and the signer's and the gate's
          # configs as the modules write them.
          policy-module =
            let
              key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE7wrGycGisT+fHX2DD9ohFP+IzDJOQ4cqprClYHszBR";
              eval = host [
                self.nixosModules.signer
                self.nixosModules.sudo
                {
                  users.users.alice = { isNormalUser = true; group = "users"; home = "/home/alice"; };
                  services.quoin.signer = {
                    enable = true;
                    forUser = "alice";
                    loginSigners = [ "proxy.service" ];
                    policySigners = [ "proxy.service" "editor.service" ];
                  };
                  services.quoin.sudo = {
                    enable = true;
                    forUser = "alice";
                    exec."/run/current-system/sw/bin/journalctl **".answer = "allow";
                    exec."/run/current-system/sw/bin/lpq".runAs = "lp";
                    exec."/run/current-system/sw/bin/lpq".answer = "refuse";
                  };
                  services.quoin.policy = {
                    fileName = "chase.json";
                    allowedSigners = [{ principal = "alice"; inherit key; } "bob ${key} bob@example"];
                    courier = { enable = true; forUser = "alice"; };
                  };
                }
              ];
              etc = eval.config.environment.etc;
              signers = etc."quoin/allowed_signers".source;
              settings = builtins.fromJSON etc."quoin/courier.json".source.config;
              unit = eval.config.systemd.services.quoin-courier.serviceConfig;
              signer = builtins.fromJSON etc."quoin/signer.json".source.config;
              signerUnit = eval.config.systemd.services.quoin-signer;
              gate = builtins.fromJSON etc."quoin/sudo.json".source.config;
              gateUnit = eval.config.systemd.services.quoin-sudo;
              policy = { courier = "/run/quoin-courier/sock"; allowedSigners = "/etc/quoin/allowed_signers"; fileName = "chase.json"; };
              wrong = builtins.filter (x: ! x.ok) [
                { case = "allowed signers"; ok = signers.text == "alice namespaces=\"quoin-policy:*\" ${key}\nbob ${key} bob@example\n"; }
                { case = "config"; ok = settings == { fileName = "chase.json"; allowedSigners = "/etc/quoin/allowed_signers"; peers = { "quoin-signer.service" = "quoin-signer"; "quoin-sudo.service" = "quoin-sudo"; }; }; }
                { case = "user"; ok = unit.User == "alice" && unit.Group == "users"; }
                { case = "home"; ok = unit.ReadWritePaths == [ "/home/alice" ] && unit.ProtectHome == "read-only" && unit.ProtectSystem == "strict"; }
                { case = "network"; ok = unit.PrivateNetwork && unit.RestrictAddressFamilies == [ "AF_UNIX" ]; }
                { case = "socket"; ok = eval.config.systemd.sockets.quoin-courier.socketConfig.ListenStream == "/run/quoin-courier/sock"; }
                { case = "signer policy"; ok = signer.policy == policy; }
                { case = "signer units"; ok = signer.loginSigners == [ "proxy.service" ] && signer.policySigners == [ "proxy.service" "editor.service" ]; }
                { case = "signer after the courier"; ok = builtins.elem "quoin-courier.socket" signerUnit.after && builtins.elem "quoin-courier.socket" signerUnit.wants; }
                { case = "gate policy"; ok = gate.policy == policy; }
                { case = "gate exec"; ok = gate.exec == { "/run/current-system/sw/bin/journalctl **" = { runAs = "root"; answer = "allow"; }; "/run/current-system/sw/bin/lpq" = { runAs = "lp"; answer = "refuse"; }; }; }
                { case = "gate after the courier"; ok = builtins.elem "quoin-courier.socket" gateUnit.after && builtins.elem "quoin-courier.socket" gateUnit.wants; }
              ];
            in
            assert nixpkgs.lib.assertMsg (wrong == [ ]) "the policy module is wrong: ${builtins.toJSON (map (x: x.case) wrong)}";
            pkgs.runCommand "quoin-policy-module" { } "cp ${signers} $out";

          # The signer trusts no unit unless the host names one: with nothing
          # set its config says so, and a name the kernel's comm could never
          # hold is refused by the option, as check refuses it.
          signer-units =
            let
              eval = extra: host [ self.nixosModules.signer { services.quoin.signer.enable = true; } extra ];
              settingsOf = c: builtins.fromJSON c.config.environment.etc."quoin/signer.json".source.config;
              takes = units: (builtins.tryEval (builtins.deepSeq (eval { services.quoin.signer.loginSigners = units; }).config.services.quoin.signer.loginSigners true)).success;
              wrong = builtins.filter (x: x.got != x.want) [
                { case = "none by default"; got = with settingsOf (eval { }); [ loginSigners policySigners ssh.forwardedThrough ]; want = [ [ ] [ ] [ ] ]; }
                { case = "own machines"; got = (settingsOf (eval { services.quoin.signer.ssh.forwardedThrough = [ "dan-blade" "*-mac" ]; })).ssh.forwardedThrough; want = [ "dan-blade" "*-mac" ]; }
                { case = "fifteen bytes"; got = takes [ "abcdefghijklmno.service" ]; want = true; }
                { case = "sixteen bytes"; got = takes [ "abcdefghijklmnop.service" ]; want = false; }
                { case = "not a service"; got = takes [ "proxy.socket" ]; want = false; }
              ];
            in
            assert nixpkgs.lib.assertMsg (wrong == [ ]) "the signer's units judged wrongly: ${builtins.toJSON wrong}";
            pkgs.writeText "quoin-signer-units" "ok";

          # quoin-signer with a software TPM, two sshds and fakegalley, in a VM.
          signer = pkgs.testers.runNixOSTest (import ./tests/signer.nix { inherit self; });

          # quoin-sudo as nixosModules.sudo runs it, with fakegalley, in a VM.
          sudo-gate = pkgs.testers.runNixOSTest (import ./tests/sudo-gate.nix { inherit self; });

          # quoin-sudo's remote mode: a client with the signer, a server with
          # the gate and remoteKeys, and a second sshd, in three VMs.
          sudo-remote = pkgs.testers.runNixOSTest (import ./tests/sudo-remote.nix { inherit self; });

          # quoin-courier as nixosModules.policy runs it, read and written by
          # a stand-in peer unit, in a VM.
          policy = pkgs.testers.runNixOSTest (import ./tests/policy.nix { inherit self; });
        });

      # Tests that hold quoin to times, which checks leaves out: a CI runner
      # sharing four vCPUs among every VM and build is no place to measure
      # anything. Built by hand on a machine fit to measure, never by nix
      # flake check, which does not build legacyPackages:
      #   nix build .#timing.sudo-gate -L
      legacyPackages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        lib.optionalAttrs (self.packages.${system} ? quoin) {
          timing.sudo-gate = pkgs.testers.runNixOSTest (import ./tests/sudo-gate.nix { inherit self; timing = true; });
        });

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixpkgs-fmt);
    };
}
