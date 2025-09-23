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

# Environment variables to display in the prompt
ENV_VARS=(
  "DB_NAME"
  "VIRTUAL_ENV"
)

# Function to build prompt with environment variables
build_env_prompt() {
  local env_prompt=""
  for var in "${ENV_VARS[@]}"; do
    if [[ -n "${(P)var}" ]]; then
      env_prompt+="%F{cyan}${var}:${(P)var}%f "
    fi
  done
  echo "$env_prompt"
}

npm_prompt() {
  # Add nvm current version
  if command -v nvm > /dev/null 2>&1; then
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