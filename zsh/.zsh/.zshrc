# .zsh/.zshrc: Local .zshrc file for zsh(1).
#
# This file is sourced only for interactive shells. It
# should contain commands to set up aliases, functions,
# options, key bindings, etc.
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#

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

# Completion formatting
if [[ -f "$HOME/.zsh/completion.zsh" ]]; then
  source "$HOME/.zsh/completion.zsh"
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

# https://github.com/zsh-users/zsh-autosuggestions
if [ -e "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# https://github.com/zsh-users/zsh-syntax-highlighting.git
if [ -e "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

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
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

# no beeping!
setopt NO_BEEP

# Check mail every minute
export MAILCHECK=60

# Functions
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

bak() {
    mkdir -p .bak
    local file=".bak/$1.$(date --iso-8601).bak"
    local num=1
    while [ -e "$file" ]; do
        file=".bak/$1.$(date --iso-8601).bak ($num)"
        ((num++))
    done
    rsync -a "$1" "$file"
}

# Start tmux if it is installed + not running
case $- in *i*) # Ensure interactive shell
  if [ -z "$TMUX" ] && command -v tmux &>/dev/null; then exec tmux; fi ;;
esac
