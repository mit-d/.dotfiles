# PS1 Configs # ---------------------------------------------------------------
# autoload -U promptinit && promptinit
# autoload -U colors && colors

setprompt()
{
    local baseCLR="white"
    local sudoCLR="magenta"
    local promptCLR="cyan"

    local PCLR="%(!.%F{$sudoCLR}.%F{$promptCLR})"

    local NAME="$PCLR%n%F{reset_colors}"
    local HOSTNAME="$PCLR%m%F{reset_colors}"
    local HOSTNAME_FULL="$PCLR%M%F{reset_colors}"
    local PDIR="[%/]"
    PROMPT="%B%#%b "

    case $1 in
        hu | n | normal)
            export PROMPT="$NAME@$HOSTNAME $PROMPT"
            ;;
        f | full)
            export PROMPT="$NAME@$HOSTNAME_FULL $PDIR $PROMPT"
            ;;
        a | alternate)
            export PROMPT="%(!.@$HOSTNAME.$NAME) $PROMPT"
            ;;
        al | alternate_long)
            export PROMPT="%(!.$NAME.$HOSTNAME) %F{8}$PDIR%F{reset_colors} $PROMPT"
            ;;
        p | path)
            export PROMPT="$PCLR$PDIR%F{reset_colors} $PROMPT"
            ;;
        h | hostname)
            export PROMPT="$HOSTNAME $PROMPT"
            ;;
        u | username)
            export PROMPT="$NAME $PROMPT"
            ;;
        *)
            ;;
    esac
}

setprompt hu

# Aliases # -------------------------------------------------------------------

alias j='vim $(date +%Y-%m-%d%n).md'
alias q='exit'
alias t='todo.sh'
alias :q='q'
alias 'c++11'='c++ --std=c++11'
alias 'c++14'='c++ --std=c++14'
alias 'c++17'='c++ --std=c++17'
alias 'c++2a'='c++ --std=c++2a'

alias youtube-mp3="youtube-dl -x -f bestaudio --audio-quality 0 --audio-format mp3 $1 -o \"$HOME/Music/Ableton/User Library/Samples/youtube/%(title)s-%(id)s.%(ext)s\""


alias ls="ls -G "
alias su="sudo $SHELL"

# Preferred editor for local and remote sessions # ----------------------------
export EDITOR=nvim

LS_COLORS=$LS_COLORS:'di=0;35:'; export LS_COLORS

bindkey -v
export KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
    zle reset-prompt
}

# Add $PATH changes here
