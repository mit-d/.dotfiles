# Abbreviations
###############################################################################
setopt extendedglob
typeset -A abbrevs

# Git Abbreviations
typeset -A git_abbrevs=(
  "sw"            "switch"
  # "ga"            "git add"
  "gb"            "git branch"
  "gc"            "git commit"
  "gd"            "git diff"
  "gf"            "git fetch --prune --tags"
  "gl"            "git log"
  "glg"           "git log --graph --oneline"
  "glgl"          "git log --graph --oneline --all"
  "gr"            "git reset --mixed"
  "grh"           "git reset --hard"
  "grs"           "git reset --soft"
  "gs"            "git status -s"
  "gss"           "git status"
  "unstage"       "git restore --staged"
  "gchanged"      "git diff --name-only \"\$(git merge-base HEAD origin/main)\"...HEAD"
  "gblackchanged" 'black $(git diff --name-only "$(git merge-base HEAD origin/main)"...HEAD | grep -E "\.py$")'
  "gblacknew"     'black $(git diff --name-only --diff-filter=A "$(git merge-base HEAD origin/main)"...HEAD | grep -E "\.py$")'
  # posix/git.sh expansion
  "wtf"       'gwt feat/dmitten/WARH-__CURSOR__'
)

typeset -A git_abbrevs_extra=(
  "gadcp"   "git add . && git commit -m 'Auto-commit' && git push"
  "gai"     "git add --interactive"
  "gap"     "git add --patch"
  "gau"     "git add --update"
  "gba"     "git branch -a"
  "gbav"    "git branch -a -vv"
  "gbm"     "git branch -M"
  "gbmd"    'git branch --merged | grep  -v "\*\|main" | xargs -n1 git branch -d'
  "gbsc"    "git branch --show-current"
  "gbsmd"   "git fetch -p && for branch in \$(git branch -vv | grep ': gone]' | awk '{print \$1}'); do git branch -D \$branch; done"
  "gbv"     "git branch -vv"
  "gbz"     "git branch | fzf | xargs git checkout"
  "gca"     "git commit --amend"
  "gcane"   "git commit --amend --no-edit"
  "gcdi"    "git clean -di"
  "gci"     "git commit --interactive"
  "gcm"     "git commit --message"
  "gcwip"   "git commit -m 'WIP'"
  "gdc"     "git diff --cached"
  "gdm"     "git diff origin/main..__CURSOR__"
  "gdt"     "git difftool"
  "gfo"     "git fetch origin"
  "gfp"     "git fetch --prune"
  "gfpt"    "git fetch --prune --tags"
  "gmnf"    "git merge --no-ff"
  "gpf"     "git push --force-with-lease"
  "gpl"     "git pull"
  "gpo"     "git push origin"
  "gpod"    "git push origin --delete"
  "grb"     "git rebase"
  "grba"    "git rebase --abort"
  "grbc"    "git rebase --continue"
  "grbi"    "git rebase -i"
  "grbm"    "git rebase origin/main"
  "gre"     "git restore --staged --worktree"
  "grsm"    "git reset --soft origin/main"
  "gs-"     "git switch -"
  "gsc"     "git switch -C"
  "gsgl"    "git submodule -q foreach git pull -q origin main"
  "gsm"     "git switch main"
  "gsti"    "git stashed --keep-index"
  "gstl"    "git stash list"
  "gstp"    "git stash pop"
  "gsts"    "git stash --staged"
  "gsu"     "git submodule update --init --recursive"
)

# Docker Abbreviations
typeset -A docker_abbrevs=(
  "dk"    "docker"
  "dkr"   "docker run -it"
  "dke"   "docker exec -it __CURSOR__ /bin/bash"
  "dki"   "docker images"
  "dkig"  "docker images | grep __CURSOR__ | awk '{print \$3}'"
  "dkbd"  "docker build ."
  "dkbt"  "docker build -t __CURSOR__ ."
  "dkpa"  "docker system prune -a"
  "drid"  "docker rmi -f \$(docker images -q -f \"dangling=true\")"
  "dco"   "docker compose"
  "dcou"  "docker compose up -d --remove-orphans"
  "dcr"   "docker compose run -it __CURSOR__ --rm"
)

# Package Manager Abbreviations
typeset -A apt_abbrevs=(
  "apts"  "apt search"
  "aptl"  "apt list"
  "aptlu" "apt list -u"
  "apti"  "apt install"
  "aptr"  "apt remove --purge"
  "aptu"  "apt update"
  "aptug" "sudo apt update && sudo apt full-upgrade"
  "aptar" "apt autoremove"
  "flup"  "flatpak update"
)

typeset -A systemctl_abbrevs=(
  "ctl"   "sudo systemctl"
  "ctle"  "sudo systemctl enable"
  "ctlre" "sudo systemctl restart"
  "ctls"  "sudo systemctl stop"
)

# Miscellaneous Abbreviations
typeset -A misc_abbrevs=(
  "eof"   "<<EOF"
  "manz"  "apropos __CURSOR__ | fzf | cut -f1,2 -d' ' | xargs man"
  "hz"    "history 1 | fzf"
)

# Output Redirection Abbreviations
typeset -A output_abbrevs=(
  "_NULL" "&>/dev/null"  # Pipes all output to /dev/null
  "_L" "| less"          # Pipe output to less pager
  "_T" "| tee -a"        # Append output to file
  "_C" "| $COPY_COMMAND" # Pipe to copy command
  "_G" "| grep -ni"      # Grep with line numbers and case-insensitive
  "_Z" "| fzf"           # Pipe to fzf
)

typeset -A k8s_abbrevs=(
  "k"      "kubectl"
  "kgp"    "kubectl get pods"
  "kgn"    "kubectl get nodes"
  "kga"    "kubectl get all"
  "kdp"    "kubectl describe pod"
  "kl"     "kubectl logs"
  "kex"    "kubectl exec -it"
  "kctx"   "kubectl config use-context"
  "kns"    "kubectl config set-context --current --namespace"
)

typeset -A sysmon_abbrevs=(
  "psa"    "ps aux"
  "top"    "htop"
  "dfh"    "df -h"
  "upt"    "uptime"
  "who"    "who -a"
)

typeset -A net_abbrevs=(
  "curlh"  "curl -I"
  "wgetr"  "wget -r"
  "ping"  "ping -c 5"
  "tracer" "traceroute"
  "nslook" "nslookup"
  "dig"    "dig +short"
)

typeset -A pyenv_abbrevs=(
  "venv"   "uv venv"
  "act"    "source .venv/bin/activate"
  "deact"  "deactivate"
  "req"    "uv pip install -r requirements.txt"
  "freeze" "uv pip freeze > requirements.txt"
  "sync"   "uv sync"
  "lock"   "uv lock"
  "uvi"    "uv pip install"
  "uvr"    "uv pip uninstall"
  "uvl"    "uv pip list"
  "uvadd"  "uv add"
)

# Custom Workflow Abbreviations
typeset -A custom_abbrevs=(
  "feat"     "git switch -C feat/dmitten/WARH-__CURSOR__"
  "bugs"     "git switch -C bugs/dmitten/WARH-__CURSOR__"
  "misc"     "git switch -C misc/dmitten/__CURSOR__"
  "manage"   "docker exec -it jaguar-debug python manage.py __CURSOR__"
  "managesh" "docker exec -it jaguar-debugshell python manage.py __CURSOR__"
  "db"       "echo \"export DB_NAME=__CURSOR__\" >~/.db-env && source ~/.db-env"
)

# List of associative arrays to merge
typeset -a abbrev_arrays=(
  git_abbrevs
  # git_abbrevs_extra
  k8s_abbrevs
  docker_abbrevs
  pyenv_abbrevs
  sysmon_abbrevs
  net_abbrevs
  misc_abbrevs
  output_abbrevs
  custom_abbrevs
  # apt_abbrevs
  # systemctl_abbrevs
)

# Merge all arrays into abbrevs
for array in ${abbrev_arrays[@]}; do
  abbrevs+=( ${(kv)${(P)array}} )
done

# Loop over the keys of the abbreviations array and create aliases for each
for abbr in ${(k)abbrevs}; do
  alias $abbr="${abbrevs[$abbr]}"
done

magic-abbrev-expand() {
  local MATCH
  # Remove (from the end of LBUFFER) any continuous alphanumeric/underscore characters
  # and capture them in MATCH
  LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}

  # Look up the abbreviation in the abbrevs associative array
  command=${abbrevs[$MATCH]}

  # Append the command if found, otherwise the original MATCH
  LBUFFER+=${command:-$MATCH}

  # If the expanded text contains __CURSOR__, split it into left and right buffers
  if [[ "${command}" == *"__CURSOR__"* ]]; then
    LBUFFER="${command%%__CURSOR__*}"
    RBUFFER="${command#*__CURSOR__}"
  else
    # If there's no cursor placeholder, just insert a space
    zle self-insert
  fi
}

magic-abbrev-expand-and-execute() {
  # Perform the abbreviation expansion
  magic-abbrev-expand
  # Remove the last character (usually the space or the newline)
  zle backward-delete-char
  # Accept the current command line and execute
  zle accept-line
}

no-magic-abbrev-expand() {
  # Insert a literal space without expanding an abbreviation
  LBUFFER+=' '
}

# Create ZLE widgets from the functions above
zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-execute
zle -N no-magic-abbrev-expand

# Bind keys to the custom widgets
bindkey " " magic-abbrev-expand               # Space triggers abbreviation expansion
bindkey "^M" magic-abbrev-expand-and-execute  # Enter triggers expansion plus command execution
bindkey "^x " no-magic-abbrev-expand          # Ctrl+x + space inserts space literally
bindkey -M isearch " " self-insert            # During isearch, space just inserts space

function abbr {
  if [[ -t 1 ]]; then
    # Colors for interactive terminal
    local header_color='\033[1;36m' # Bold cyan
    local key_color='\033[1;33m'    # Bold yellow
    local arrow_color='\033[0;37m'  # White
    local value_color='\033[0;32m'  # Green
    local reset='\033[0m'           # Reset color

    for array in ${abbrev_arrays[@]}; do
      # Print header with color
      echo -e "${header_color}${array}${reset}"

      # Get all keys and sort them for consistent output
      local keys=(${(ko)${(P)array}})

      for key in $keys; do
        local value=${${(P)array}[$key]}
        printf "${key_color}%-12s${reset} ${arrow_color}→${reset} ${value_color}%s${reset}\n" "$key" "$value"
      done
      echo
    done
  else
    # Pretty print typeset as valid zsh for non-interactive
    for array in ${abbrev_arrays[@]}; do
      typeset -p $array | sed 's/\[/\n  [/g; s/)/\n)/' | sed '1s/^/\n/'
    done
  fi
}

# Ensures that autosuggestions are cleared when custom ENTER widget is used
export ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(magic-abbrev-expand-and-execute)
