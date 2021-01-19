# arch specific
[ -f ~/.sh/"$OSTYPE.shrc" ] && . ~/.sh/"$OSTYPE.shrc" || echo "~/.sh/$OSTYPE.shrc not found"

# escapes manpage: zshmisc, 
export PROMPT='%B%(!.%F{3}.%F{9})%#%b %F{reset_colors}' # %# with color
export PROMPT="%~ $PROMPT"   # pwd
export PROMPT="%n $PROMPT"   # $USERNAME
export RPROMPT="%* $RPROMPT" # Time
export RPROMPT="%y $RPROMPT" # tty

# env
for i in "$(which vim)" "$(which vi)" "/bin/vi" "/bin/vim"
    do; [ -x $i ] && export EDITOR="$i"; done
export VISUAL=vi

# aliases
for i in '11' '14' '17' '2a'; do; alias "c++$i"="c++ --std=c++$i"; done
alias e="$EDITOR"
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"

# behavior
set -o vi
autoload -U edit-command-line; zle -N edit-command-line; bindkey "^X^E" edit-command-line

export PATH="/home/derek/.bin:$PATH"

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

# added changes #
