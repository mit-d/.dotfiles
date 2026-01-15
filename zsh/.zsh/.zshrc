# .zsh/.zshrc: Local .zshrc file for zsh(1).
# This file is sourced only for interactive shells.

## PROFILING
# Uncomment to profile startup time
# zmodload zsh/zprof # Add zprof to end of file

## Source Path Vars
###############################################################################
ZSH_DIR="$HOME/.zsh"

# Source configuration files if they exist
for file in $ZSH_DIR/*.zsh; do
  source "$file"
done

# When this dotfile is being used, we will treat ~/.zshrc as local
# configuration that won't be checked into source control.
if [[ -e "$HOME/.zshrc" ]]; then
  source "$HOME/.zshrc"
fi

# Stop here for IntelliJ
[[ -n "$INTELLIJ_ENVIRONMENT_READER" ]] && return 0

## Plugins
###############################################################################
for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  [[ -f "$ZSH_DIR/$plugin/$plugin.zsh" ]] && source "$ZSH_DIR/$plugin/$plugin.zsh"
  [[ -f "/opt/homebrew/share/$plugin/$plugin.zsh" ]] && source "/opt/homebrew/share/$plugin/$plugin.zsh"
done

# Command-not-found plugin
[[ -f "/etc/zsh_command_not_found" ]] && source /etc/zsh_command_not_found

## Behavior
###############################################################################
set -o vi
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# History settings
export HISTSIZE=100000 SAVEHIST=100000 HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
setopt histignorealldups sharehistory APPEND_HISTORY EXTENDED_HISTORY INC_APPEND_HISTORY \
       HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Disable beeping
setopt NO_BEEP

# Enable extended globbing
setopt EXTENDED_GLOB

# Check mail every minute
export MAILCHECK=60

## Functions
###############################################################################

# Set man colors
function man {
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[45;93m' \
  LESS_TERMCAP_se=$'\e[0m' \
  command man "$@"
}

# Backup function
function bak {
  mkdir -p .bak
  local file=".bak/$1.$(date --iso-8601).bak"
  local num=1
  while [[ -e "$file" ]]; do
    file=".bak/$1.$(date --iso-8601).bak ($num)"
    ((num++))
  done
  rsync -a "$1" "$file"
}

# FZF history search
function fzf-history-widget {
  local selected_command
  selected_command="$(fc -lrn 1 | fzf --height=40% --reverse --prompt='History> ')"
  if [[ -n "$selected_command" ]]; then
    BUFFER="$selected_command"
    CURSOR=${#BUFFER}
  fi
  zle reset-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

# Run current line as root
function run-as-root {
  BUFFER="sudo $BUFFER"
  zle accept-line
}
zle -N run-as-root
bindkey "^[^M" run-as-root

# Toggle escape on current line
function escape-cmd {
  if [[ $BUFFER == \\* ]]; then
    BUFFER="${BUFFER:1}"
  else
    BUFFER="\\$BUFFER"
  fi
  zle end-of-line
}
zle -N escape-cmd
bindkey "^[\\" escape-cmd

# Start tmux if not running
if [[ -z "$TMUX" ]] && command -v tmux &>/dev/null; then
  exec tmux
fi

# Activate python .venv if it exists
if [[ -e "$HOME/.venv/bin/activate" ]]; then
  source "$HOME/.venv/bin/activate"
fi

## Docker CLI completions
fpath=(/Users/derekmitten/.docker/completions $fpath)
autoload -Uz compinit
compinit

## Bun completions
[[ -s "/home/dmitten/.bun/_bun" ]] && source "/home/dmitten/.bun/_bun"

# Add GNU getopt to PATH
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"
