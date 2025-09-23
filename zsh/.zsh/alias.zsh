# Command Aliases
################################################################################
alias e="$EDITOR"
alias ip="ip --color"
alias ls="ls --color -h"
alias ll="ls -al"
alias tree="tree -CF"
alias l="tree -L 1"
alias ping="ping -c 5"

if [[ -n "$COPY_COMMAND" ]]; then
  alias C="$COPY_COMMAND"
fi

if [[ -n "$PASTE_COMMAND" ]]; then
  alias P="$PASTE_COMMAND"
fi

if command -v yt-dlp &>/dev/null; then
  alias yt="yt-dlp"
  alias ytmp3="yt --extract-audio --audio-format mp3"
fi

if command -v doas &>/dev/null; then
  alias sudo='doas'
  alias el="doas ${SHELL:-sh}"
elif command -v sudo >/dev/null 2>&1; then
  alias el="sudo -E ${SHELL:-sh}"
fi

if command -v fastfetch &>/dev/null; then
  alias neofetch='fastfetch'
  alias ff='fastfetch'
fi

if command -v g++ &>/dev/null; then
  alias 'c++'='g++'
  for i in '11' '14' '17' '2a'; do
    alias "c++$i"="c++ --std=c++$i"
  done
fi

alias filecount='ls -aRF | wc -l'
alias myip="curl https://ipinfo.io 2>/dev/null | jq -C"

# Suffix Aliases
################################################################################
for type in txt md; do
  alias -s $type="${EDITOR:-nano} -- "
done

# Global Aliases
################################################################################
alias -g NULL='&>/dev/null' # Pipes all output to /dev/null
alias -g L="| less"         # Pipe output to less pager
alias -g T="| tee -a"       # Append output to file
alias -g G="| grep -ni"     # Grep with line numbers and case-insensitive
alias -g X="| $COPY_COMMAND"
alias -g Z="| fzf"

## Expand aliases with Control-Space
################################################################################
function expand-alias() { zle _expand_alias }
zle -N expand-alias && bindkey '^ ' expand-alias
alias dictz="fzf </usr/share/dict/words"

alias psql="psql-17"
