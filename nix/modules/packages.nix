{ pkgs, ... }:
let
  # nixpkgs' whisper-cpp postPatch has a bug: its `grep -q install(` guard
  # omits the filename, so it reads empty stdin and fires for every example
  # target, appending `install(TARGETS whisper.coreml LIBRARY)` to
  # src/CMakeLists.txt seven times unconditionally. With CoreML enabled that
  # target links -framework CoreML, which segfaults `ld` on this pin; with it
  # disabled the target is missing and configure fails. So: disable CoreML
  # (Metal GPU accel is unaffected) and supply a corrected postPatch that
  # only installs the example binaries. Drop this once nixpkgs fixes the guard.
  whisper-cpp = (pkgs.whisper-cpp.override { coreMLSupport = false; }).overrideAttrs (_: {
    postPatch = ''
      for target in examples/{bench,command,cli,quantize,server,stream,talk-llama}/CMakeLists.txt; do
        if ! grep -q -F 'install(' "$target"; then
          echo 'install(TARGETS ''${TARGET} RUNTIME)' >> "$target"
        fi
      done
    '';
  });
  # Not in nixpkgs, so build it from the crates.io release. Packaging it here
  # is what lets obsidian-sync.nix drop the ~/.cargo/bin entry it otherwise
  # had to splice into the Linear sync agent's PATH -- `cargo install` puts
  # binaries somewhere environment.systemPath knows nothing about.
  #
  # The crate ships a Cargo.lock, so the default vendoring works. Its test
  # suite writes under $HOME, which is read-only in the build sandbox, so
  # point HOME at a scratch dir rather than skipping the test.
  linear-cli = pkgs.rustPlatform.buildRustPackage rec {
    pname = "linear-cli";
    version = "0.3.27";

    src = pkgs.fetchCrate {
      inherit pname version;
      hash = "sha256-bxMu8w/8fNlYMYjzhPmdO4gb/n50+/sgvIluRC7UolA=";
    };

    cargoHash = "sha256-udYtgOnZ8aRRqji91pwVMQU2bXkSvdlWNUvyyvHPQRA=";

    preCheck = ''
      export HOME=$(mktemp -d)
    '';
  };
in
{
  environment.systemPackages = [
    # Core
    pkgs.coreutils

    # GUI
    pkgs.mpv

    # CLI
    ## Utils
    pkgs.bat
    pkgs.btop
    pkgs.csvkit
    pkgs.fd
    pkgs.fx
    pkgs.fzf
    pkgs.gawk
    pkgs.getopt
    pkgs.gnused
    pkgs.grex
    pkgs.htop
    pkgs.imagemagick
    pkgs.jq
    pkgs.k9s
    pkgs.lftp
    pkgs.most
    pkgs.ncdu
    pkgs.newsboat
    pkgs.pv
    pkgs.ripgrep
    pkgs.stow
    pkgs.tmux
    pkgs.tree
    pkgs.yq-go
    pkgs.zoxide
    ### security
    pkgs.age
    pkgs.gnupg
    ### Fun
    pkgs.cmatrix
    pkgs.cowsay
    pkgs.fastfetch
    pkgs.neo

    # Dev
    ## vim
    pkgs.neovim
    pkgs.tree-sitter
    pkgs.vim
    ## C++
    pkgs.cmake
    pkgs.clang-tools
    pkgs.ninja
    ## Go
    pkgs.go
    pkgs.go-task
    ## Java
    pkgs.gradle
    pkgs.jdk21
    ## db/k8s
    pkgs.postgresql_17
    ## Python
    pkgs.python3Packages.fonttools
    pkgs.ruff
    pkgs.uv
    ## Rust
    pkgs.cargo
    pkgs.clippy
    pkgs.rust-analyzer
    pkgs.rustc
    pkgs.rustfmt
    ## shell
    pkgs.shellcheck
    pkgs.shfmt
    pkgs.zunit
    ## nix
    pkgs.deadnix
    pkgs.nixfmt
    pkgs.statix
    ## Toml
    pkgs.taplo
    ## Utils / Static Analysis
    pkgs.codespell
    pkgs.markdownlint-cli2
    pkgs.prettier
    pkgs.lcov
    ## Version Control
    pkgs.gh
    pkgs.git-quick-stats
    pkgs.glab
    pkgs.jira-cli-go
    linear-cli
    pkgs.lefthook
    ## AI
    pkgs.opencode
    pkgs.pi-coding-agent
    whisper-cpp
  ];
}
