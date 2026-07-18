{ pkgs, ... }:
{
  environment.systemPackages = [
    # Core
    pkgs.coreutils

    # GUI
    pkgs.mpv

    # CLI
    ## Utils
    pkgs.bat
    pkgs.csvkit
    pkgs.fd
    pkgs.fx
    pkgs.fzf
    pkgs.gawk
    pkgs.getopt
    pkgs.gnused
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
    ## Docker
    pkgs.podman
    pkgs.podman-compose
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
    pkgs.lefthook
    ## AI
    pkgs.opencode
    pkgs.whisper-cpp
  ];
}
