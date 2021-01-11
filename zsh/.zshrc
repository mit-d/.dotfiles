# arch specific
[ -f ~/.sh/"$OSTYPE.sh" ] && . ~/.sh/"$OSTYPE.sh" || echo "~/.sh/$OSTYPE.sh not found"

# cosmetic
local z_su="%(#.%F{yellow}.%F{magenta})%B"
local z_re="%F{reset_colors}%b"
export PROMPT="%~ $z_su%# $z_re"

# env
for i in "$(which vim)" "$(which vi)" "/bin/vi" "/bin/vim"
    do; [ -x $i ] && export EDITOR="$i"; done
export VISUAL=vi
export PATH="$PATH:$HOME/.bin"

# aliases
for i in '11' '14' '17' '2a'; do; alias "c++$i"="c++ --std=c++$i"; done
alias e="$EDITOR"
alias ytmp3="youtube-dl --extract-audio --audio-format mp3"

# behavior
set -o vi
autoload -U edit-command-line
zle -N edit-command-line; bindkey "^X^E" edit-command-line

# start tmux
if [ -z "$TMUX" ] && command -v tmux; then
    exec tmux
fi

# added changes #
