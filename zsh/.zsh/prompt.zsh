# Prompt
###############################################################################
#

autoload -Uz promptinit; promptinit
autoload -Uz vcs_info

# Configure git branch formats in vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'
zstyle ':vcs_info:*' enable git
# Disabled for speed. To show staged/unstaged indicators, set this to true and
# add stagedstr/unstagedstr plus %u%c to the formats string above.
zstyle ':vcs_info:git:*' check-for-changes false

# Environment variables to display in the prompt with optional labels
ENV_VARS=(
    # "DB_NAME::"
    # "TEST_DB_NAME:::"
    "VIRTUAL_ENV:py@"
    "BBP_TEST_ARGS:"
)

random_color() {
    local seed=${1:-$RANDOM}
    local colors=(red green yellow blue magenta cyan)
    # Use zsh's built-in string hashing instead of spawning cksum/awk
    local hash=$(( ${#seed} * 31 + $(printf '%d' "'${seed[1]}") ))
    echo "${colors[hash % ${#colors[@]} + 1]}"
}

# Function to build prompt with environment variables
build_env_prompt() {
    local env_prompt=""
    for entry in "${ENV_VARS[@]}"; do
        local var="${entry%%:*}" # Variable name
        local label="${entry#*:}" # Label or fallback to variable name
        [[ "$label" == "$var" ]] && label="$var"
        if [[ -n "${(P)var}" ]]; then
            local value="${(P)var}"
            if [[ "$PWD" != "/" && "$value" == "$PWD"* ]]; then
                value="${value/#$PWD/.}" # Replace PWD with '.'
            fi
            value="${value/#$HOME/~}" # Replace HOME with '~'
            value="${value/#.\//}"
            local color="$(random_color $var)"
            env_prompt+="%F{8}${label}%F{$color}${value}%f "
        fi
    done
    echo "$env_prompt"
}

# Nix dev-shell indicator glyph, defined below via a zsh ANSI-C
# quote so this file stays pure ASCII (the check-unicode hook rejects
# raw non-ASCII); it renders through the SauceCodePro Nerd Font.
NIX_ICON=$'\ue843'

# Cached node version for prompt (avoids slow nvm call on every prompt).
# _from_nix tracks whether the resolved node came from a nix dev shell.
_cached_node_version=""
_cached_node_dir=""
_cached_node_from_nix=0

# Cached python version, populated only when python comes from a nix dev shell.
_cached_py_version=""
_cached_py_dir=""


precmd() {
    vcs_info
    VCS_MSG="${vcs_info_msg_0_}"

    # Build the main prompt
    PROMPT="%B%F{red}%#%b%f "
    PROMPT="%~ $PROMPT"

    # Build rprompt pieces inline (avoids subshell overhead from $(...))
    local env_part="" node_part="" nix_part="" py_part=""
    env_part="$(build_env_prompt)"

    # Nix dev-shell indicator: glyph + pure/impure, only inside a shell.
    [[ -n "$IN_NIX_SHELL" ]] && nix_part="%F{cyan}${NIX_ICON} ${IN_NIX_SHELL}%f "

    # node: recompute only when the directory changes. Show it when it comes
    # from a nix dev shell (cyan, signalling origin) or from nvm (yellow).
    if [[ "$PWD" != "$_cached_node_dir" ]]; then
        _cached_node_dir="$PWD"
        _cached_node_version=""
        _cached_node_from_nix=0
        if [[ -n "$IN_NIX_SHELL" || -n "$NVM_BIN" ]] && (( $+commands[node] )); then
            _cached_node_version=$(node --version 2>/dev/null)
            [[ "${commands[node]}" == /nix/store/* ]] && _cached_node_from_nix=1
        fi
    fi
    if [[ -n "$_cached_node_version" ]]; then
        if (( _cached_node_from_nix )); then
            node_part="%F{cyan}node:${_cached_node_version}%f "
        elif [[ -n "$NVM_BIN" ]]; then
            node_part="%F{yellow}node:${_cached_node_version}%f "
        fi
    fi

    # python: shown only when provided by a nix dev shell (cyan), per-dir cache.
    if [[ "$PWD" != "$_cached_py_dir" ]]; then
        _cached_py_dir="$PWD"
        _cached_py_version=""
        if [[ -n "$IN_NIX_SHELL" && "${commands[python3]}" == /nix/store/* ]]; then
            _cached_py_version="${${(z)$(python3 --version 2>&1)}[2]}"
        fi
    fi
    [[ -n "$_cached_py_version" ]] && py_part="%F{cyan}py:${_cached_py_version}%f "

    RPROMPT="${nix_part}${node_part}${py_part}${env_part}%F{blue}${VCS_MSG:+${VCS_MSG}}%f"
}

setopt PROMPT_SUBST

# PS2 for multiline commands
PS2=" >> "
export PS2

# DOAS prompt customization
export DOAS_PROMPT="%/ %B%F{yellow}%#%b%f "
