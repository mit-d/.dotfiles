
export PROMPT="%m %F{red}%B%#%b %F{reset_colors}"

# Aliases
alias 'c++11'='c++ --std=c++11'
alias 'c++14'='c++ --std=c++14'
alias 'c++17'='c++ --std=c++17'
alias 'c++2a'='c++ --std=c++2a'

# Set the editor
[ -x /bin/vi ] && export EDITOR='/bin/vi'
[ -x /bin/vim ] && export EDITOR='/bin/vim'
[ -x /usr/bin/vi ] && export EDITOR='/usr/bin/vi'
[ -x /usr/bin/vim ] && export EDITOR='/usr/bin/vim'
alias e="$EDITOR"

# Configurations
set -o vi # enable vi binds

LS_COLORS=$LS_COLORS:'di=0;35:'; export LS_COLORS
autoload -U edit-command-line; zle -N edit-command-line
bindkey "^X^E" edit-command-line
export VISUAL=vim
bindkey -M vicmd v edit-command-line

[ -x /bin/fish ] && SHELL='/bin/fish' exec /bin/fish

local fish_exec="`which fish`"
[ -x $fish_exec ] && SHELL=$fish_exec exec $fish_exec
