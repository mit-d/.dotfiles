# Prompt
###############################################################################

autoload -Uz promptinit && promptinit
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'
# Disabled for speed. To show staged/unstaged indicators, set this to true and
# add stagedstr/unstagedstr plus %u%c to the formats strings above.
zstyle ':vcs_info:git:*' check-for-changes false

# Icons are written with zsh ANSI-C quoting ($'...') to keep this file pure
# ASCII (the check-unicode hook rejects raw non-ASCII). They render through
# the SauceCodePro Nerd Font.
NIX_ICON=$'\ue843'
NODE_ICON=$'\ued0d'
PYTHON_ICON=$'\ue73c'

# Environment badges shown in the right prompt, as "VAR:color:label" entries.
# The label may be empty and may contain an icon; the value is appended after.
ENV_VARS=(
    "BBP_TEST_ARGS:magenta:"
)

# Each builder sets REPLY to its rprompt segment (empty when not applicable),
# so the hooks assemble the prompt without subshells. node/python shell out
# for a version string, so they are recomputed only when their inputs change
# (see _prompt_update_runtimes); the env badges read live vars and are rebuilt
# every prompt.

# Format a language-runtime badge, colored by origin: cyan when the binary
# comes from a nix dev shell (/nix/store), yellow otherwise. Sets REPLY.
_runtime_badge() {
    local cmd=$1 icon=$2 version=$3 color=yellow
    [[ "${commands[$cmd]}" == /nix/store/* ]] && color=cyan
    REPLY="%F{$color}${icon} ${version}%f "
}

# node: shown from a nix dev shell or from nvm.
_build_node_segment() {
    REPLY=""
    (( $+commands[node] )) || return
    [[ -n "$IN_NIX_SHELL" || -n "$NVM_BIN" ]] || return
    local version=$(node --version 2>/dev/null)
    [[ -n "$version" ]] && _runtime_badge node "$NODE_ICON" "$version"
}

# python: shown from a nix dev shell or an active virtualenv.
_build_py_segment() {
    REPLY=""
    (( $+commands[python3] )) || return
    [[ -n "$IN_NIX_SHELL" || -n "$VIRTUAL_ENV" ]] || return
    local version="${${(z)$(python3 --version 2>&1)}[2]}"
    [[ -n "$version" ]] && _runtime_badge python3 "$PYTHON_ICON" "$version"
}

# env badges: reads live env vars, so it runs every prompt (no caching).
_build_env_segment() {
    REPLY=""
    local entry var rest color label value
    for entry in "${ENV_VARS[@]}"; do
        var=${entry%%:*}
        rest=${entry#*:}
        color=${rest%%:*}
        label=${rest#*:}

        value=${(P)var}
        [[ -n "$value" ]] || continue

        # Shorten paths: drop a leading $PWD, then collapse $HOME to ~.
        if [[ "$PWD" != "/" && "$value" == "$PWD"/* ]]; then
            value=${value#$PWD/}
        elif [[ "$value" == "$PWD" ]]; then
            value="."
        fi
        value=${value/#$HOME/\~}

        REPLY+="%F{$color}${label}${value}%f "
    done
}

typeset -g PROMPT_NODE_SEG="" PROMPT_PY_SEG="" _prompt_runtime_sig=""

# Recompute the runtime segments only when their inputs change (cwd or the
# env vars that gate them), so node/python are forked on cd and on in-place
# venv/nvm/nix activation, but not on every prompt.
_prompt_update_runtimes() {
    local sig="$PWD|$IN_NIX_SHELL|$NVM_BIN|$VIRTUAL_ENV"
    [[ "$sig" == "$_prompt_runtime_sig" ]] && return
    _prompt_runtime_sig=$sig
    _build_node_segment; PROMPT_NODE_SEG=$REPLY
    _build_py_segment;   PROMPT_PY_SEG=$REPLY
}

_prompt_precmd() {
    vcs_info
    _prompt_update_runtimes

    PROMPT="%~ %B%F{red}%#%b%f "

    local nix_part="" env_part vcs_part=""
    [[ -n "$IN_NIX_SHELL" ]] && nix_part="%F{cyan}${NIX_ICON} ${IN_NIX_SHELL}%f "
    _build_env_segment; env_part=$REPLY
    [[ -n "$vcs_info_msg_0_" ]] && vcs_part="%F{blue}${vcs_info_msg_0_}%f"

    RPROMPT="${nix_part}${PROMPT_NODE_SEG}${PROMPT_PY_SEG}${env_part}${vcs_part}"
}

add-zsh-hook precmd _prompt_precmd

# PS2 for multiline commands.
export PS2=" >> "

# doas prompt.
export DOAS_PROMPT="%/ %B%F{yellow}%#%b%f "
