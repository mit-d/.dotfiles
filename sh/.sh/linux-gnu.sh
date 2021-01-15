setxkbmap -option caps:ctrl_modifier

# Bedrock
alias deb="strat -r debian"
alias gen="strat -r gentoo"
alias alp="strat -r alpine"

if command -v doas >/dev/null
then
    alias el='doas $SHELL'
else if command -v sudo >/dev/null
    alias el='sudo -E $SHELL'
fi

alias ls='ls --color'

# Added for debian sid installs
export PATH="$PATH:/home/derek/Android/Sdk/platform-tools"
alias wireshark-usb='sudo modprobe usbmon && sudo setfacl -m u:derek:r /dev/usbmon* && wireshark'
alias sus='systemctl suspend'
