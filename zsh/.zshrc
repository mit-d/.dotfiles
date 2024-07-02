# arch specific
[ -f ~/.sh/"$OSTYPE.shrc" ] && . ~/.sh/"$OSTYPE.shrc" || echo "~/.sh/$OSTYPE.shrc not found"

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
set -o vi
autoload -U edit-command-line
zle -N edit-command-line
# bindkey "^X^E" edit-command-line
bindkey -M vicmd v edit-command-line

# Environment
###############################################################################
export EDITOR=vi
export VISUAL=vi

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
[ -e "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# sudo apt install command-not-found
[ -e "/etc/zsh_command_not_found" ] && source /etc/zsh_command_not_found

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

function git-rename-remote-branch() {
    local old_branch=$1
    local new_branch=$2

    # Rename the local branch
    git branch -m $old_branch $new_branch

    # Delete the old branch on remote
    git push origin :$old_branch

    # Unset the upstream tracking branch
    git branch --unset-upstream $new_branch

    # Push the new branch to remote and set upstream
    git push origin $new_branch -u
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
