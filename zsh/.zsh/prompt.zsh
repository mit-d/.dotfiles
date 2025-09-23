# Prompt
###############################################################################
#

autoload -Uz promptinit; promptinit
autoload -Uz vcs_info

# Configure git branch formats in vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'

precmd() { vcs_info; VCS_MSG="${vcs_info_msg_0_}" }

setopt PROMPT_SUBST
PROMPT="%B%F{red}%#%b%f "

ENV_VARS=(
  "DB_NAME"
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
PROMPT="$(build_env_prompt)${PROMPT}"

PROMPT="%~ $PROMPT"
export PROMPT


# RPROMPT='%F{blue}${VCS_MSG}%f'
RPROMPT='%F{blue}${VCS_MSG}%f'
export RPROMPT

PS2=" >> "
export PS2

# /etc/doas.conf:
# permit persist setenv { -ENV PROMPT=$DOAS_PROMPT SSH_AUTH_SOCK } :wheel
# permit nopass keepenv setenv { PATH } root as root
export DOAS_PROMPT="%/ %B%F{yellow}%#%b%f "
