{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.vim

    # Batch 1: stateless CLI tools (migrated from homebrew).
    # Renames vs brew: gnu-sed=gnused, gnu-getopt=getopt, yq=yq-go,
    # jira-cli=jira-cli-go, tree-sitter-cli=tree-sitter.
    # GNU coreutils was a brew dependency, but its gnubin was deliberately
    # on PATH; the nix package provides the same GNU tools in sw/bin.
    pkgs.coreutils
    pkgs.age
    pkgs.bat
    pkgs.cmatrix
    pkgs.codespell
    pkgs.cowsay
    pkgs.csvkit
    pkgs.fastfetch
    pkgs.fd
    pkgs.fx
    pkgs.fzf
    pkgs.gawk
    pkgs.getopt
    pkgs.gh
    pkgs.git-quick-stats
    pkgs.glab
    pkgs.gnused
    pkgs.go-task
    pkgs.htop
    pkgs.jira-cli-go
    pkgs.jq
    pkgs.k9s
    pkgs.lftp
    pkgs.most
    pkgs.ncdu
    pkgs.pv
    pkgs.shellcheck
    pkgs.shfmt
    pkgs.stow
    pkgs.taplo
    pkgs.tree
    pkgs.tree-sitter
    pkgs.yq-go

    # Batch 2: dev toolchains (migrated from homebrew).
    # Renames vs brew: openjdk@21=jdk21, clang-format=clang-tools.
    # llvm stays in brew (keg-only there; nix clang in systemPackages
    # would shadow /usr/bin/clang).
    pkgs.clang-tools
    pkgs.cmake
    pkgs.python3Packages.fonttools
    pkgs.go
    pkgs.gradle
    pkgs.imagemagick
    pkgs.jdk21
    pkgs.lcov
    pkgs.lefthook
    pkgs.markdownlint-cli2
    pkgs.mpv
    pkgs.neovim
    pkgs.newsboat
    pkgs.ninja
    pkgs.prettier
    pkgs.ruff
    pkgs.tmux
    pkgs.uv
    pkgs.whisper-cpp

    # Batch 3 survivors of the case-by-case review.
    pkgs.opencode
    # Test framework for the repo's zsh abbr suite (tests/abbr.zunit);
    # replaces the zunit-zsh tap (and revolver, its only dependency).
    pkgs.zunit
    # Client tools only (psql etc.) for dockerized instances; no local
    # daemon. Replaces the brew postgresql@17 server install.
    pkgs.postgresql_17
    # Was only a brew dependency (via opencode), but it's a daily
    # driver and must survive its dependent's migration.
    pkgs.ripgrep
  ];
}
