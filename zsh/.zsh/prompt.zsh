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

precmd() {
  vcs_info
  VCS_MSG="${vcs_info_msg_0_}"
}

setopt PROMPT_SUBST

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

# Build the main prompt
PROMPT="%B%F{red}%#%b%f "
PROMPT="$(build_env_prompt)${PROMPT}"
PROMPT="%~ $PROMPT"

# Conditional RPROMPT to show VCS info only if available
RPROMPT='%F{blue}${VCS_MSG:+${VCS_MSG}}%f'

# Export prompts
export PROMPT
export RPROMPT

# PS2 for multiline commands
PS2=" >> "
export PS2

# DOAS prompt customization
export DOAS_PROMPT="%/ %B%F{yellow}%#%b%f "