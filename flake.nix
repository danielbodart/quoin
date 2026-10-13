{
  description = "The host's gatekeepers: SSH keys in the TPM, sudo with no terminal, and a project's signed policy, asked through galley";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;

      # The MAJOR only, which is the one part of the version that is a decision
      # rather than a count -- 0 says the interfaces are still moving.
      # scripts/version.sh derives the release name (major.commit-count.run-
      # number) from the repository, and a build from a store path has no
      # repository to count, so the two are deliberately different things: this
      # names the package, that names the artefact CI publishes.
      version = nixpkgs.lib.fileContents ./VERSION;

      # One package, all four binaries: quoin, the person's own tool for a
      # project's policy file, and the three gatekeepers, quoin-signer,
      # quoin-sudo and quoin-courier. They share one module and one test
      # suite, so a change to any of them rebuilds and retests all of them
      # anyway; one derivation runs that suite once.
      mkQuoin = pkgs: pkgs.buildGoModule {
        pname = "quoin";
        inherit version;
        # The Go module alone, so that a change to the docs, the modules or
        # the VM tests does not rebuild and retest the binaries, and so every
        # VM test, from scratch.
        src = nixpkgs.lib.fileset.toSource {
          root = ./.;
          fileset = nixpkgs.lib.fileset.difference ./. (nixpkgs.lib.fileset.unions [
            ./docs
            ./README.md
            ./flake.nix
            ./flake.lock
            ./nix
            ./.github
            ./scripts
            ./VERSION
            (nixpkgs.lib.fileset.fileFilter (f: f.hasExt "nix") ./tests)
          ]);
        };

        # Pinned rather than null, because there are dependencies: x/crypto
        # for ssh, the agent protocol the signer serves and SSHSIG, which a
        # project's policy file is signed in; x/sys for the peer checks;
        # galley's wire and services client, for the questions the signer and
        # the gate put to galley; go-tpm with go-tpm-keyfiles for the signer's
        # TPM keys; and rapid for the property tests. vendorHash = null is a
        # nice property and never a security one.
        vendorHash = "sha256-tUWnEcMV7O1AaxhtmssCY/m6HiY6gLQlppJUksehPMU=";

        # A STATIC BINARY. Each gatekeeper runs as a systemd unit with
        # ProtectSystem=strict, and the sudo gate answers a plugin that sudo
        # loads as root. cgo would drag in glibc's NSS, which resolves names
        # through whatever the host's nsswitch.conf says -- exactly the kind of
        # implicit configuration a gatekeeper should not have.
        env.CGO_ENABLED = 0;
        # One swtpm per TPM test; set, they fail rather than skip without it.
        env.QUOIN_REQUIRE_SWTPM = "1";
        # projpolicy's SSHSIG and allowed_signers are held to stock
        # ssh-keygen; set, those tests fail rather than skip without it.
        env.QUOIN_REQUIRE_SSH_KEYGEN = "1";

        ldflags = [ "-s" "-w" "-X" "main.version=${version}" ];
        excludedPackages = [ "tests/fakegalley" "tests/agenttamper" ];

        # `go test ./...` rather than buildGoModule's own check, which would
        # leave out the excluded packages' tests. peer's user namespace test
        # skips cleanly where the kernel refuses one, so this passes in the
        # Nix sandbox and means something on a machine where it does not have
        # to.
        doCheck = true;
        checkPhase = ''
          runHook preCheck
          go test ./...
          runHook postCheck
        '';
        nativeCheckInputs = [ pkgs.swtpm pkgs.openssh ];

        meta = {
          description = "The host's gatekeepers: SSH keys in the TPM, sudo with no terminal, and a project's signed policy, asked through galley";
          homepage = "https://github.com/danielbodart/quoin";
          license = nixpkgs.lib.licenses.mit;
          mainProgram = "quoin";
          platforms = nixpkgs.lib.platforms.linux;
        };
      };

      # A program of tests/, built from the same module, and the same vendored
      # dependencies, with no tests of its own to run.
      mkTool = pkgs: name: (mkQuoin pkgs).overrideAttrs (old: {
        pname = name;
        inherit (mkQuoin pkgs) goModules;
        subPackages = [ "tests/${name}" ];
        excludedPackages = [ ];
        doCheck = false;
        meta = old.meta // { mainProgram = name; };
      });
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
      # All three; each is still off until its enable is set.
      nixosModules.default = {
        key = "github:danielbodart/quoin#nixosModules.default";
        imports = [ self.nixosModules.signer self.nixosModules.sudo self.nixosModules.policy ];
      };

      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        rec {
          quoin = mkQuoin pkgs;
          default = quoin;
          # quoin-sudo's Zig: the audit plugin, its PAM helper and the
          # build-time plugin check. See nix/sudo-zig.nix.
          quoin-sudo-plugin = (import ./nix/sudo-zig.nix { inherit pkgs; }).package;
          # galley's services socket in the VM tests, answering from a script.
          fakegalley = mkTool pkgs "fakegalley";
          # A client that binds one session and signs for another, for the signer's VM test.
          agenttamper = mkTool pkgs "agenttamper";
        });

      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        {
          default = pkgs.mkShell {
            # swtpm and ssh-keygen, for the TPM and SSHSIG tests, which skip
            # without them unless QUOIN_REQUIRE_SWTPM or
            # QUOIN_REQUIRE_SSH_KEYGEN says to fail; zig, for sudo/.
            packages = [ pkgs.go pkgs.gopls pkgs.golangci-lint pkgs.swtpm pkgs.openssh pkgs.zig_0_15 ];
            # The same setting the package builds with, so a `go build` in the
            # shell produces the same binary the flake does rather than a
            # dynamically linked one that works here and nowhere else.
            CGO_ENABLED = "0";
          };
        });

      checks = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          pkg = self.packages.${system}.quoin;
          host = extra: nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [{ boot.isContainer = true; system.stateVersion = "26.05"; }] ++ extra;
          };
        in
        {
          # The build, which is also the unit tests, the property tests and the
          # fuzz corpora.
          inherit (self.packages.${system}) quoin;

          # quoin-sudo's Zig, and its tests, the mode parse held to sudo's
          # own parse_args among them, lint, fmt and zwanzig.
          inherit (self.packages.${system}) quoin-sudo-plugin;
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
                { case = "config"; ok = settings == { fileName = "chase.json"; allowedSigners = "/etc/quoin/allowed_signers"; peers = { "quoin-signer.service" = "ssh-signer"; "quoin-sudo.service" = "sudo-gate"; }; }; }
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
                { case = "none by default"; got = with settingsOf (eval { }); [ loginSigners policySigners ]; want = [ [ ] [ ] ]; }
                { case = "fifteen bytes"; got = takes [ "abcdefghijklmno.service" ]; want = true; }
                { case = "sixteen bytes"; got = takes [ "abcdefghijklmnop.service" ]; want = false; }
                { case = "not a service"; got = takes [ "proxy.socket" ]; want = false; }
              ];
            in
            assert nixpkgs.lib.assertMsg (wrong == [ ]) "the signer's units judged wrongly: ${builtins.toJSON wrong}";
            pkgs.writeText "quoin-signer-units" "ok";

          # No login user may be in tss while the signer is enabled, however
          # the membership is spelled.
          signer-tss =
            let
              refused = user: group: builtins.any (a: ! a.assertion) (host [
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

          # The gate refuses a sudo set-up it cannot gate safely.
          sudo-eval =
            let
              refused = extra: builtins.any (a: ! a.assertion) (host [
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

          # Formatting as a gate rather than a habit: this is one repository
          # with one formatter and no argument to have about it.
          gofmt = pkgs.runCommand "gofmt"
            { nativeBuildInputs = [ pkgs.go ]; }
            ''
              cd ${./.}
              unformatted=$(gofmt -l .)
              if [ -n "$unformatted" ]; then
                echo "not gofmt'd:" >&2
                echo "$unformatted" >&2
                exit 1
              fi
              touch $out
            '';

          # go vet from inside the package's own build, because vet needs the
          # module's dependencies and this is where they already are.
          govet = pkg.overrideAttrs (_: {
            pname = "quoin-vet";
            inherit (pkg) goModules;
            checkPhase = ''
              runHook preCheck
              go vet ./...
              runHook postCheck
            '';
          });

          # The tests again, under the race detector. It needs cgo -- the race
          # runtime is C -- so this check turns it on for itself; the package
          # is still built static, with CGO_ENABLED=0, and never ships this.
          race = pkg.overrideAttrs (old: {
            pname = "quoin-race";
            inherit (pkg) goModules;
            env = (old.env or { }) // { CGO_ENABLED = 1; };
            checkPhase = ''
              runHook preCheck
              go test -race ./...
              runHook postCheck
            '';
          });

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

          # The version script decides what every release is called, so it is
          # gated by the same check that gates the release.
          shellcheck = pkgs.runCommand "shellcheck"
            { nativeBuildInputs = [ pkgs.shellcheck ]; }
            ''
              shellcheck ${./scripts/version.sh}
              touch $out
            '';
        });

      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixpkgs-fmt);
    };
}
