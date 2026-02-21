
# Set up local completions
fpath+="$HOME/.zsh/completions"
# fpath+="/home/linuxbrew/.linuxbrew/share/zsh/site-functions" ## Disabling for now, permission problems

# auto completion (use cached completions if fresh, regenerate daily)
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# auto complete options
setopt COMPLETE_IN_WORD # complete in word
setopt AUTO_CD # auto-complete directory for cd

# verbose
zstyle ':completion:*' verbose yes

# cache the results of completion functions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_completion_cache

# fuzzy matching of completions for when they are mistyped
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# completing process ids with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# remove trailing slash from directories
# zstyle ':completion:*' squeeze-slashes true

# never complete the parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd
