# .zsh/.zshrc: Local .zshrc file for zsh(1).
# This file is sourced only for interactive shells.

## PROFILING
# Uncomment to profile startup time
# zmodload zsh/zprof # Add zprof to end of file

## Source Path Vars
###############################################################################
ZSH_DIR="$HOME/.zsh"

# Source POSIX-compliant scripts (portable across shells)
for file in "$ZSH_DIR"/posix/*.sh; do
    [ -f "$file" ] && . "$file"
done

# Source ZSH-only configuration files
# These use ZSH-specific features like zstyle, compinit, vcs_info, ZLE widgets
for file in abbr.zsh completion.zsh prompt.zsh interactive.zsh; do
    [ -f "$ZSH_DIR/$file" ] && source "$ZSH_DIR/$file"
done

# When this dotfile is being used, we will treat ~/.zshrc as local
# configuration that won't be checked into source control.
[[ -e "$HOME/.zshrc" ]] && source "$HOME/.zshrc"

# Stop here for IntelliJ
[[ -n "$INTELLIJ_ENVIRONMENT_READER" ]] && return 0

# Command-not-found plugin
[[ -f "/etc/zsh_command_not_found" ]] && source /etc/zsh_command_not_found

## Behavior
###############################################################################
set -o vi
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

## zmv for glob file manip
autoload -Uz zmv

# Disable beeping
setopt NO_BEEP

# Enable extended globbing
setopt EXTENDED_GLOB

## Functions
###############################################################################

# Set man colors
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_us=$'\e[01;32m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_so=$'\e[45;93m' \
        LESS_TERMCAP_se=$'\e[0m' \
        command man "$@"
}

# Backup function
if command -v rsync &>/dev/null; then
    bak() {
        mkdir -p .bak
        local file=".bak/$1.$(date --iso-8601).bak"
        local num=1
        while [[ -e "$file" ]]; do
            file=".bak/$1.$(date --iso-8601).bak ($num)"
            ((num++))
        done
        rsync -a "$1" "$file"
    }
fi

# FZF history search is wired by programs.fzf (nix/home/fzf.nix), which also
# themes it from the shared palette. It used to be sourced here with
# `source <(fzf --zsh)`; keeping both would load the integration twice.

# Run current line as root
run-as-root() {
    BUFFER="sudo $BUFFER"
    zle accept-line
}
zle -N run-as-root
bindkey "^[^M" run-as-root

# Toggle escape on current line
escape-cmd() {
    if [[ $BUFFER == \\* ]]; then
        BUFFER="${BUFFER:1}"
    else
        BUFFER="\\$BUFFER"
    fi
    zle end-of-line
}
zle -N escape-cmd
bindkey "^[\\" escape-cmd

# Start tmux if not running (set ZSH_NO_TMUX=1 to disable)
# Guard on an interactive shell attached to a real terminal so we never exec
# tmux in IDE/automation shells that source .zshrc without a tty.
ZSH_NO_TMUX=1
if [[ -o interactive && -t 1 && -z "$TMUX" && -z "$ZSH_NO_TMUX" ]] && command -v tmux &>/dev/null; then
  exec tmux
fi

# Activate python .venv if it exists
# [[ -e "$HOME/.venv/bin/activate" ]] && source "$HOME/.venv/bin/activate"

## Bun completions
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

## Plugins
###############################################################################
# zsh-autosuggestions and zsh-syntax-highlighting are now provided by
# programs.zsh in nix/home/zsh.nix, sourced at mkOrder 1200 -- after this
# file (1000), which preserves the requirement that syntax highlighting
# load after all custom ZLE widgets are defined.


## Named Dirs
# Essentially creates a ~-prefixed alias for each

# Named Dirs
hash -d vg="${WH_VANGUARD_PROJECT_DIR:-~/Source/vanguard}"
hash -d wt="${WH_VANGUARD_PROJECT_DIR:-~/Source/vanguard}/.worktrees"
hash -d migrations="${WH_VANGUARD_PROJECT_DIR:-~/Source/vanguard}/jaguar/bbp/migrations"
hash -d o=~/Documents/Obsidian
hash -d nix=~/.config/nix
hash -d zsh="${ZDOTDIR:-${HOME}}"
hash -d .=~/.dotfiles
hash -d remote-files=/opt/remote-files
hash -d projects=/opt/project-files
