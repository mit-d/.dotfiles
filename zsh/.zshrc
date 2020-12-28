# arch specific
[ -f ~/.sh/"$OSTYPE.shrc" ] && . ~/.sh/"$OSTYPE.shrc" || echo "~/.sh/$OSTYPE.shrc not found"

# cosmetic
export PROMPT="%m %F{red}%B%#%b %F{reset_colors}"

# env
for i in "`which vim`" "`which vi`" "/bin/vi" "/bin/vim"
do
    [ -x $i ] && export EDITOR=$i
done
export VISUAL=vi

# aliases
for i in '11' '14' '17' '2a'
do
    alias "c++$i"="c++ --std=c++$i"
done
alias e="$EDITOR"
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"

# behavior
set -o vi
autoload -U edit-command-line; zle -N edit-command-line; bindkey "^X^E" edit-command-line

# added changes #
