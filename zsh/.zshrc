# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#      source ~/.sh/darwin.shrc
# elif [[ "$OSTYPE" == "cygwin" ]]; then
# elif [[ "$OSTYPE" == "msys" ]]; then
# elif [[ "$OSTYPE" == "win32" ]]; then
# elif [[ "$OSTYPE" == "freebsd"* ]]; then
# else
#      # unknown os
# fi

[ -f ~/.sh/"$OSTYPE.shrc" ] && . ~/.sh/"$OSTYPE.shrc" ||\
    echo "Creating new local configurations at \"~/.sh/$OSTYPE.shrc\""\
    && mkdir -p ~/.sh\
    && touch ~/.sh/"$OSTYPE.shrc"\

export PROMPT="%m %F{red}%B%#%b %F{reset_colors}"

# aliases
for i in '11' '14' '17' '2a'
do
    alias "c++$i"="c++ --std=c++$i"
done

# Set the editor
for i in "`which vim`" "`which vi`" "/bin/vi" "/bin/vim"
do
    [ -x $i ] && export EDITOR=$i
done
alias e="$EDITOR"

# Configurations
set -o vi # enable vi binds

# visual mode -> edit command in temp vim buffer
LS_COLORS=$LS_COLORS:'di=0;35:'; export LS_COLORS
autoload -U edit-command-line; zle -N edit-command-line
bindkey "^X^E" edit-command-line
export VISUAL=vim
bindkey -M vicmd v edit-command-line
# batch file manipulation
autoload zmv

# added changes #
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"
