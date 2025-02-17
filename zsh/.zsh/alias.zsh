# alias #
alias e="$EDITOR"
alias gd="git difftool --tool=meld -y"
alias gg="git log --graph --oneline --all"
alias ip="ip --color"
alias l="tree -CL 1"
alias ll="ls -al"
alias myip="curl https://ipinfo.io 2>/dev/null | jq -C"
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"
for i in '11' '14' '17' '2a'; alias "c++$i"="c++ --std=c++$i"
alias ls="ls --color=auto"

if command -v doas >/dev/null 2>&1; then
  alias sudo='doas'
  alias el='doas $SHELL'
elif command -v sudo >/dev/null 2>&1; then
  alias el='sudo -E $SHELL'
fi


[[ -n "$COPY_COMMAND" ]] && alias C="$COPY_COMMAND"
[[ -n "$PASTE_COMMAND" ]] && alias P="$PASTE_COMMAND"


