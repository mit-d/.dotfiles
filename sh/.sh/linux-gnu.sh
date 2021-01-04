setxkbmap -option caps:ctrl_modifier
alias deb="strat -r debian"
alias gen="strat -r gentoo"
alias alp="strat -r alpine"

if command -v doas
then
    alias el="doas $0"
    alias dosu="doas"
else
    alias el="sudo -E $0"
fi

