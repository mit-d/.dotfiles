# alias #
alias e="$EDITOR"
alias gd="git difftool --tool=meld -y"
alias gg="git log --graph --oneline --all"
alias ip="ip --color"
alias ls="ls --color=auto"
alias l="tree -CL 1"
alias ll="ls -al"
alias myip="curl https://ident.me && echo"
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"
for i in '11' '14' '17' '2a'; alias "c++$i"="c++ --std=c++$i"
alias neofetch="fastfetch"
alias ff="fastfetch"
[ -x /bin/doas ] && alias sudo="/bin/doas"

# WSL2-specific aliases
alias choco="choco.exe"
