if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    source ~/.sh/linux.shrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
     # Mac OSX
     source ~/.sh/darwin.shrc
elif [[ "$OSTYPE" == "cygwin" ]]; then
     # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
     # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
     # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
     # ...
else
     # Unknown.
fi

export PROMPT="%K{blue}%F{black}%m%K{reset_colors} %F{magenta}%B%#%b %K{reset_colors}%F{reset_colors}"

# Aliases
alias 'c++11'='c++ --std=c++11'
alias 'c++14'='c++ --std=c++14'
alias 'c++17'='c++ --std=c++17'
alias 'c++2a'='c++ --std=c++2a'

# Set the editor
export EDITOR="/bin/env vim"
alias e="$EDITOR"

# Configurations
set -o vi # enable vi binds

# LS_COLORS=$LS_COLORS:'di=0;35:'; export LS_COLORS
alias ls="ls --color"
autoload -U edit-command-line; zle -N edit-command-line
bindkey "^X^E" edit-command-line
export VISUAL=$EDITOR
autoload zmv
export BROWSER=surf

# # # # # # # # #
# added changes #
# # # # # # # # #
LOCAL_RC_PATH="$HOME/.zshrc.loc"
