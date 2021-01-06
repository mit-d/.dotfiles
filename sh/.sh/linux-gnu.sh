setxkbmap -option caps:ctrl_modifier
alias deb="strat -r debian"
alias gen="strat -r gentoo"
alias alp="strat -r alpine"

if command -v doas >/dev/null
then
    alias el='doas $0'
else if command -v sudo
    alias el='sudo -E $0'
fi

alias ls='ls --color'

