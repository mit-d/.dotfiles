setxkbmap -option caps:ctrl_modifier

# Bedrock
alias deb="strat -r debian"
alias gen="strat -r gentoo"
alias alp="strat -r alpine"

if command -v doas >/dev/null
then
    alias el='doas $SHELL'
else if command -v sudo
    alias el='sudo -E $SHELL'
fi

alias ls='ls --color'

