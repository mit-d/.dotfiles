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
  ];
}
