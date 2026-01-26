# alias.sh - Command aliases
# POSIX-compliant shell script

# Basic aliases
alias e="$EDITOR"
alias ip="ip --color"
alias ls="ls --color -h"
alias ll="ls -al"
alias tree="tree -CF"
alias l="tree -L 1"
alias ping5="ping -c 5"

# Clipboard aliases (if COPY_COMMAND/PASTE_COMMAND are set)
if [ -n "$COPY_COMMAND" ]; then
	alias C="$COPY_COMMAND"
fi

if [ -n "$PASTE_COMMAND" ]; then
	alias P="$PASTE_COMMAND"
fi

# yt-dlp aliases
if command -v yt-dlp >/dev/null 2>&1; then
	alias yt="yt-dlp"
	alias ytmp3="yt --extract-audio --audio-format mp3"
fi

# Privilege escalation
if command -v doas >/dev/null 2>&1; then
	alias sudo='doas'
	alias el="doas ${SHELL:-sh}"
elif command -v sudo >/dev/null 2>&1; then
	alias el="sudo -E ${SHELL:-sh}"
fi

# fastfetch/neofetch
if command -v fastfetch >/dev/null 2>&1; then
	alias neofetch='fastfetch'
	alias ff='fastfetch'
fi

# C++ aliases
if command -v g++ >/dev/null 2>&1; then
	alias 'c++'='g++'
	alias "c++11"="c++ --std=c++11"
	alias "c++14"="c++ --std=c++14"
	alias "c++17"="c++ --std=c++17"
	alias "c++2a"="c++ --std=c++2a"
fi

# Utility aliases
alias filecount='ls -aRF | wc -l'
alias myip="curl https://ipinfo.io 2>/dev/null | jq -C"

# Helper aliases
alias extract_words="tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:][:space:]' | tr '[:space:]' '\n' | grep -v '^$'"

# Claude alias
if command -v claude >/dev/null 2>&1; then
	alias clod="claude"
fi

alias dictz="fzf </usr/share/dict/words"
