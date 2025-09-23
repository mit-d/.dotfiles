# .zsh/.zshrc: Local .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#

## PROFILING - uncomment to profile startup time
# zmodload zsh/zprof # add zprof to end of file










## Source path vars
###############################################################################

# Path configuration
if [[ -f "$HOME/.zsh/path.zsh" ]]; then
  source "$HOME/.zsh/path.zsh"
fi

# Prompt configuration
if [[ -f "$HOME/.zsh/prompt.zsh" ]]; then
  source "$HOME/.zsh/prompt.zsh"
fi

# Stop here for intellij
if [ -n "$INTELLIJ_ENVIRONMENT_READER" ]; then
  return 0
fi

# Completion formatting
if [[ -f "$HOME/.zsh/completion.zsh" ]]; then
  source "$HOME/.zsh/completion.zsh"
fi

# Lazy NVM loading
if [[ -f "$HOME/.zsh/nvm.zsh" ]]; then
  source "$HOME/.zsh/nvm.zsh"
fi

# Misc aliases
if [[ -f "$HOME/.zsh/alias.zsh" ]]; then
  source "$HOME/.zsh/alias.zsh"
fi

# Misc aliases
if [[ -f "$HOME/.zsh/abbr.zsh" ]]; then
  source "$HOME/.zsh/abbr.zsh"
fi

# Git functions + aliases
if command -v git &>/dev/null && [[ -f "$HOME/.zsh/git.zsh" ]]; then
  source "$HOME/.zsh/git.zsh"
fi

# When this dotfile is being used, we will treat ~/.zshrc as local
# configuration that won't be checked into source control.
if [[ -e "$HOME/.zshrc" ]]; then
  source "$HOME/.zshrc"
fi

## Plugins
###############################################################################

for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  [[ -e "$HOME/.zsh/$plugin/$plugin.zsh" ]] && source "$HOME/.zsh/$plugin/$plugin.zsh"
  [[ -e "/opt/homebrew/share/$plugin/$plugin.zsh" ]] && source "/opt/homebrew/share/$plugin/$plugin.zsh"
done

# sudo apt install command-not-found
if [ -e "/etc/zsh_command_not_found" ]; then
  source /etc/zsh_command_not_found
fi

## Behavior
###############################################################################
set -o vi
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
## Treating 'visual mode' as edit-command-line is nice, but I find it annoying.
## when my leader key is right next to escape, `v and <esc>v are too similar.
# bindkey -M vicmd v edit-command-line

# Environment + Options
###############################################################################

# History
export HISTSIZE=100000 SAVEHIST=100000 HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
setopt histignorealldups sharehistory
setopt APPEND_HISTORY EXTENDED_HISTORY INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_SPACE
# autoload -Uz history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
# bindkey "$terminfo[kcud1]" history-beginning-search-forward-end

# no beeping!
setopt NO_BEEP

# Extended globbing
setopt EXTENDED_GLOB

# Check mail every minute
export MAILCHECK=60

# Functions
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

function bak {
  mkdir -p .bak
  local file=".bak/$1.$(date --iso-8601).bak"
  local num=1
  while [ -e "$file" ]; do
    file=".bak/$1.$(date --iso-8601).bak ($num)"
    ((num++))
  done
  rsync -a "$1" "$file"
}

# Bind C-r Custom history search widget using fzf
function fzf-history-widget {
  # Fetch and select from your Zsh history, stripping leading numbers
  local selected_command
  selected_command="$(fc -lrn 1 | fzf --height=40% --reverse --prompt='History> ')"

  # If a command was actually selected, replace the current buffer with it
  if [[ -n "$selected_command" ]]; then
    BUFFER="$selected_command"
    CURSOR=${#BUFFER}
  fi
  zle reset-prompt
}
zle -N fzf-history-widget; bindkey '^R' fzf-history-widget

# Bind Alt-Enter to run current line as root
run-as-root() {
  BUFFER="sudo $BUFFER";
  zle accept-line;
}
zle -N run-as-root; bindkey "^[^M" run-as-root

# Bind Alt-\ to toggle escape on current line
escape-cmd() {
  if [[ $BUFFER == \\* ]]; then
    BUFFER="${BUFFER:1}"
  else
    BUFFER="\\$BUFFER"
  fi
  zle end-of-line
}
zle -N escape-cmd; bindkey "^[\\" escape-cmd

# Start tmux if it is installed + not running
case $- in *i*) # Ensure interactive shell
  if [ -z "$TMUX" ] && command -v tmux &>/dev/null; then exec tmux; fi ;;
esac
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/derekmitten/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
#
export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"

# bun completions
[ -s "/home/dmitten/.bun/_bun" ] && source "/home/dmitten/.bun/_bun"
