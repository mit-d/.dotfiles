# arch specific
[ -f ~/.sh/"$OSTYPE.sh" ] && . ~/.sh/"$OSTYPE.sh" || echo "~/.sh/$OSTYPE.sh not found"

# Prompt
###############################################################################

# Set up PROMPT
PROMPT='%B%(!.%F{3}.%F{9})%#%b %F{reset_colors}'
PROMPT="%~ $PROMPT" # pwd
# PROMPT="%n $PROMPT" # $USERNAME
# PROMPT="%y $PROMPT" # tty (left)
export PROMPT

RPROMPT=""
# RPROMPT="%* $RPROMPT" # time (right)
# RPROMPT="%D $RPROMPT" # date (right)
# RPROMPT="%y $RPROMPT" # tty (right)
# RPROMPT="%F{black}$RPROMPT" # set color
export RPROMPT

# behavior
###############################################################################
# set -o vi # Trying emacs binds for a bit
autoload -U edit-command-line
zle -N edit-command-line; bindkey "^X^E" edit-command-line

# Environment
###############################################################################
export EDITOR=vi
export VISUAL=vi

# Environment
###############################################################################
export MAILCHECK=60

# setup zsh history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zhistory
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

# no beeping!
setopt NO_BEEP

source "$HOME/.zsh/alias.zsh"
source "$HOME/.zsh/completion.zsh"

# Local zsh config
ZSH_LOC_RC="$HOME/.zshrc_local"
[ -e "$ZSH_LOC_RC" ] && source "$ZSH_LOC_RC"

# Functions
###############################################################################
function git-revert-ws() {
    mybranch=master
    git checkout -b tmp git-svn

    # compute the non-ws diff to mybranch and apply it
    git diff -U0 -w --no-color $mybranch | git apply -R --cached --ignore-whitespace --unidiff-zero -

    git commit -m "non ws changes"
    git reset --hard  # discard all non-staged data
}

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

