# shellcheck shell=sh
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
    alias "c++20"="c++ --std=c++20"
fi

# Utility aliases
alias filecount='ls -aRF | wc -l'
if command -v curl >/dev/null 2>&1 && command -v jq >/dev/null 2>&1; then
    alias myip="curl https://ipinfo.io 2>/dev/null | jq -C"
fi

# Helper aliases
alias extract_words="tr '[:upper:]' '[:lower:]' | tr -cd '[:alnum:][:space:]' | tr '[:space:]' '\n' | grep -v '^$'"

if command -v fzf >/dev/null 2>&1; then
    alias dictz="fzf </usr/share/dict/words"
fi
if command -v magick >/dev/null 2>&1; then
    alias imgcolors='f() { magick "$1" -format %c histogram:info:- | sort -rn | head -${2:-20}; }; f'
    alias swatch='f() { magick "$1" -format %c histogram:info:- | sort -rn | head -${2:-10} | while read line; do hex=$(echo "$line" | grep -oE "#[0-9A-Fa-f]{6}" | head -1); [ -n "$hex" ] && printf "\e[48;2;%d;%d;%dm   \e[0m %s  %s\n" 0x${hex:1:2} 0x${hex:3:2} 0x${hex:5:2} "$hex" "$(echo $line | grep -oE "^[[:space:]]*[0-9]+")px"; done; }; f'
fi
if command -v nvim >/dev/null 2>&1; then
    alias vim="nvim"
fi

# OS-specific aliases
case "$OSTYPE" in
darwin*) ;;
linux*)
    if command -v xdg-open >/dev/null 2>&1; then
        alias open='xdg-open'
    fi
    ;;
msys* | cygwin* | win32*) ;;
esac
