# Prompt
###############################################################################
#

autoload -Uz promptinit; promptinit
autoload -Uz vcs_info

# Configure git branch formats in vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
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
  local seed=${1:-$RANDOM} # Use provided seed or default to a random value
  local colors=(red green yellow blue magenta cyan)
  local hash=$(($(echo -n "$seed" | cksum | awk '{print $1}') % ${#colors[@]}))
  echo "${colors[hash]}"
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

npm_prompt() {
  # Add nvm current version
  if command -v nvm >/dev/null 2 >&1; then
    local node_version=$(nvm current)
    echo "%F{yellow}node:${node_version}%f "
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
