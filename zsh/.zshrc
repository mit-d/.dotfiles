# arch specific
[ -f ~/.sh/"$OSTYPE.sh" ] && . ~/.sh/"$OSTYPE.sh" || echo "~/.sh/$OSTYPE.sh not found"

# escapes manpage: zshmisc, 
export PROMPT='%B%(!.%F{3}.%F{9})%#%b %F{reset_colors}' # %# with color
export PROMPT="%~ $PROMPT"   # pwd
# export PROMPT="%n $PROMPT"   # $USERNAME
# export RPROMPT="%* $RPROMPT" # Time
# export RPROMPT="%y $RPROMPT" # tty
# export RPROMPT="%F{black}$RPROMPT" # tty

# behavior
set -o vi
autoload -U edit-command-line
zle -N edit-command-line; bindkey "^X^E" edit-command-line

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


# env #
export EDITOR=vi
export VISUAL=vi
export PATH="$PATH:$HOME/.bin"

export MAILCHECK=60

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE

setopt COMPLETE_IN_WORD
setopt AUTO_CD
setopt NO_BEEP

source "$HOME/.zsh/alias.zsh"

source "$HOME/.zsh/completion.zsh"

ZSH_LOC_RC="$HOME/.zshrc_local"
[ -e "$ZSH_LOC_RC" ] && source "$ZSH_LOC_RC"

alias gg="git log --oneline --graph --all"
alias toolbox="$HOME/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox"

function git-revert-ws() {
    mybranch=master
    git checkout -b tmp git-svn

    # compute the non-ws diff to mybranch and apply it
    git diff -U0 -w --no-color $mybranch | git apply -R --cached --ignore-whitespace --unidiff-zero -

    git commit -m "non ws changes"
    git reset --hard  # discard all non-staged data
}
