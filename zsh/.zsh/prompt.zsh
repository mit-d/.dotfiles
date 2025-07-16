# Prompt
###############################################################################
#

autoload -Uz promptinit; promptinit
autoload -Uz vcs_info

# Configure git branch formats in vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes false  # Disable for speed (set true if you need staged/unstaged indicators)
zstyle ':vcs_info:git:*' stagedstr '%F{green}●%F{blue}'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}●%F{blue}'
zstyle ':vcs_info:git:*' formats '%u%c (%b)'

# Environment variables to display in the prompt with optional labels
ENV_VARS=(
  "DB_NAME::"
  "TEST_DB_NAME:::"
  "VIRTUAL_ENV:py:"
  "BBP_TEST_EXTRA_ARGS:"
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

# Cached node version for prompt (avoids slow nvm call on every prompt)
_cached_node_version=""
_cached_node_dir=""

npm_prompt() {
  # Only show node version if nvm is actually loaded (not just the lazy wrapper)
  if [[ -n "$NVM_BIN" ]]; then
    # Refresh cache on directory change
    if [[ "$PWD" != "$_cached_node_dir" ]]; then
      _cached_node_dir="$PWD"
      _cached_node_version=$(node --version 2>/dev/null)
    fi
    [[ -n "$_cached_node_version" ]] && echo "%F{yellow}node:${_cached_node_version}%f "
  fi
}







precmd() {
  vcs_info
  VCS_MSG="${vcs_info_msg_0_}"

  # Build the main prompt
  PROMPT="%B%F{red}%#%b%f "
  PROMPT="%~ $PROMPT"

  # Build rprompt
  RPROMPT='%F{blue}${VCS_MSG:+${VCS_MSG}}%f'
  RPROMPT="$(build_env_prompt)${RPROMPT}"
  RPROMPT="$(npm_prompt)${RPROMPT}"
}

setopt PROMPT_SUBST

# Export prompts
export PROMPT
export RPROMPT

# PS2 for multiline commands
PS2=" >> "
export PS2

# DOAS prompt customization
export DOAS_PROMPT="%/ %B%F{yellow}%#%b%f "
