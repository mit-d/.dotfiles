# Abbreviations (fish-like)
###############################################################################
# Position modes:
#   - anywhere:  expand anywhere on the line (default, backwards compatible)
#   - command:   expand only as first word
#   - context:   expand only after a specific prefix (e.g., "git sw" → "git switch")
###############################################################################
setopt extendedglob

# Main abbreviation stores
typeset -A abbrevs          # anywhere
typeset -A abbrevs_cmd      # command position only
typeset -A abbrevs_ctx      # context-specific (key format: "prefix:abbr")

# Persistence file for runtime additions
ABBR_USER_FILE="${ZDOTDIR:-$HOME}/.zsh_abbr_user"

# Git Abbreviations (expand anywhere - these start with 'g' so no conflict)
typeset -A git_abbrevs=(
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
  "wtf"           'gwt feat/dmitten/WARH-__CURSOR__'
)

# Git subcommand abbreviations (expand only after "git ")
typeset -A git_ctx_abbrevs=(
  "sw"    "switch"
  "sw-"   "switch -"
  "swc"   "switch -C"
  "swm"   "switch main"
  "co"    "checkout"
  "cp"    "cherry-pick"
  "rb"    "rebase"
  "rbi"   "rebase -i"
  "rbm"   "rebase origin/main"
  "rba"   "rebase --abort"
  "rbc"   "rebase --continue"
  "rs"    "reset"
  "rsh"   "reset --hard"
  "rss"   "reset --soft"
  "st"    "stash"
  "stp"   "stash pop"
  "stl"   "stash list"
  "df"    "diff"
  "dfc"   "diff --cached"
  "lg"    "log --graph --oneline"
  "lga"   "log --graph --oneline --all"
  "aa"    "add -A"
  "ap"    "add --patch"
  "cm"    "commit -m"
  "ca"    "commit --amend"
  "can"   "commit --amend --no-edit"
  "pf"    "push --force-with-lease"
  "pl"    "pull"
)

# Docker subcommand abbreviations (expand only after "docker ")
typeset -A docker_ctx_abbrevs=(
  "r"     "run -it"
  "e"     "exec -it"
  "b"     "build"
  "i"     "images"
  "ps"    "ps -a"
  "rm"    "rm -f"
  "rmi"   "rmi -f"
  "l"     "logs -f"
  "p"     "pull"
  "pa"    "system prune -a"
)

# Docker Compose subcommand abbreviations (expand only after "docker compose ")
typeset -A compose_ctx_abbrevs=(
  "u"     "up -d"
  "d"     "down"
  "r"     "run --rm"
  "l"     "logs -f"
  "ps"    "ps -a"
  "b"     "build"
  "p"     "pull"
)

# Kubectl subcommand abbreviations (expand only after "kubectl ")
typeset -A kubectl_ctx_abbrevs=(
  "g"     "get"
  "gp"    "get pods"
  "gn"    "get nodes"
  "gs"    "get svc"
  "gd"    "get deploy"
  "ga"    "get all"
  "d"     "describe"
  "dp"    "describe pod"
  "dn"    "describe node"
  "l"     "logs -f"
  "e"     "exec -it"
  "a"     "apply -f"
  "del"   "delete"
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
  "gsti"    "git stash --keep-index"
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
  "dfh"    "df -h"
  "upt"    "uptime"
  "whoa"   "who -a"
)

typeset -A net_abbrevs=(
  "curlh"  "curl -I"
  "wgetr"  "wget -r"
  "ping5"  "ping -c 5"
  "tracer" "traceroute"
  "nslook" "nslookup"
  "digs"   "dig +short"
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

# Arrays to merge into main stores
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

# Context abbreviation arrays (format: array[prefix]="name1:name2:...")
typeset -a ctx_abbrev_arrays=(
  git_ctx_abbrevs
)

# Merge "anywhere" arrays into abbrevs
for array in ${abbrev_arrays[@]}; do
  abbrevs+=( ${(kv)${(P)array}} )
done

# Merge context arrays into abbrevs_ctx
# Context abbrevs are stored with key "prefix:abbr"
for key val in "${(@kv)git_ctx_abbrevs}"; do
  abbrevs_ctx[git:$key]=$val
done
for key val in "${(@kv)docker_ctx_abbrevs}"; do
  abbrevs_ctx[docker:$key]=$val
done
for key val in "${(@kv)compose_ctx_abbrevs}"; do
  abbrevs_ctx[docker\ compose:$key]=$val
done
for key val in "${(@kv)kubectl_ctx_abbrevs}"; do
  abbrevs_ctx[kubectl:$key]=$val
done

# Load user abbreviations from persistence file
[[ -f "$ABBR_USER_FILE" ]] && source "$ABBR_USER_FILE"

# Create aliases for anywhere abbreviations (for tab completion)
for key in ${(k)abbrevs}; do
  alias $key="${abbrevs[$key]}"
done

###############################################################################
# Expansion Engine
###############################################################################

magic-abbrev-expand() {
  local MATCH prefix expansion ctx_key cmd_prefix

  # Extract the word being typed (alphanumeric + underscore)
  LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
  prefix="$LBUFFER"

  # Determine context: extract first word from prefix
  cmd_prefix="${prefix%%[[:space:]]*}"
  # Check if prefix has any content after the command
  local after_cmd="${prefix#*[[:space:]]}"

  # 1. Check context abbreviations first (e.g., "git sw" → "git switch")
  if [[ -n "$cmd_prefix" && "$prefix" == *[[:space:]]* ]]; then
    ctx_key="${cmd_prefix}:${MATCH}"
    if [[ -n "${abbrevs_ctx[$ctx_key]}" ]]; then
      expansion="${abbrevs_ctx[$ctx_key]}"
      LBUFFER="${prefix}${expansion}"
      _abbr_handle_cursor "$prefix" "$expansion"
      return
    fi
  fi

  # 2. Check command-position abbreviations (first word only)
  if [[ -z "${prefix// /}" ]] && [[ -n "${abbrevs_cmd[$MATCH]}" ]]; then
    expansion="${abbrevs_cmd[$MATCH]}"
    LBUFFER="${prefix}${expansion}"
    _abbr_handle_cursor "$prefix" "$expansion"
    return
  fi

  # 3. Check anywhere abbreviations (default)
  if [[ -n "${abbrevs[$MATCH]}" ]]; then
    expansion="${abbrevs[$MATCH]}"
    LBUFFER="${prefix}${expansion}"
    _abbr_handle_cursor "$prefix" "$expansion"
    return
  fi

  # No match - restore original
  LBUFFER="${prefix}${MATCH}"
  zle self-insert
}

# Helper: handle __CURSOR__ placeholder
_abbr_handle_cursor() {
  local prefix="$1" expansion="$2"
  if [[ "$expansion" == *"__CURSOR__"* ]]; then
    LBUFFER="${prefix}${expansion%%__CURSOR__*}"
    RBUFFER="${expansion#*__CURSOR__}"
  else
    zle self-insert
  fi
}

magic-abbrev-expand-and-execute() {
  magic-abbrev-expand
  zle backward-delete-char
  zle accept-line
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

# Register widgets
zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-execute
zle -N no-magic-abbrev-expand

# Key bindings
bindkey " " magic-abbrev-expand
bindkey "^M" magic-abbrev-expand-and-execute
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert

###############################################################################
# abbr CLI (fish-like management)
###############################################################################

abbr() {
  local action="list" position="anywhere" ctx_prefix="" name="" expansion="" newname=""

  # Parse arguments
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -a|--add)     action="add"; shift ;;
      -e|--erase)   action="erase"; shift ;;
      -r|--rename)  action="rename"; shift ;;
      -s|--show)    action="show"; shift ;;
      -l|--list)    action="list"; shift ;;
      -c|--command) position="command"; shift ;;
      -C|--context) position="context"; ctx_prefix="$2"; shift 2 ;;
      -h|--help)    action="help"; shift ;;
      *)
        if [[ -z "$name" ]]; then
          name="$1"
        elif [[ -z "$expansion" ]]; then
          expansion="$1"
        else
          newname="$1"
        fi
        shift
        ;;
    esac
  done

  case "$action" in
    add)
      if [[ -z "$name" || -z "$expansion" ]]; then
        echo "Usage: abbr -a [-c|-C PREFIX] NAME EXPANSION" >&2
        return 1
      fi
      case "$position" in
        command)
          abbrevs_cmd[$name]="$expansion"
          echo "abbrevs_cmd[$name]=\"$expansion\"" >> "$ABBR_USER_FILE"
          echo "Added command abbreviation: $name → $expansion"
          ;;
        context)
          if [[ -z "$ctx_prefix" ]]; then
            echo "Context mode requires -C PREFIX" >&2
            return 1
          fi
          abbrevs_ctx["${ctx_prefix}:${name}"]="$expansion"
          echo "abbrevs_ctx[${ctx_prefix}:${name}]=\"$expansion\"" >> "$ABBR_USER_FILE"
          echo "Added context abbreviation: $ctx_prefix $name → $ctx_prefix $expansion"
          ;;
        *)
          abbrevs[$name]="$expansion"
          alias $name="$expansion"
          echo "abbrevs[$name]=\"$expansion\"" >> "$ABBR_USER_FILE"
          echo "Added abbreviation: $name → $expansion"
          ;;
      esac
      ;;

    erase)
      if [[ -z "$name" ]]; then
        echo "Usage: abbr -e NAME" >&2
        return 1
      fi
      local found=0
      if [[ -n "${abbrevs[$name]}" ]]; then
        unset "abbrevs[$name]"
        unalias "$name" 2>/dev/null
        found=1
      fi
      if [[ -n "${abbrevs_cmd[$name]}" ]]; then
        unset "abbrevs_cmd[$name]"
        found=1
      fi
      # Check all context prefixes
      for key in ${(k)abbrevs_ctx}; do
        if [[ "$key" == *":$name" ]]; then
          unset "abbrevs_ctx[$key]"
          found=1
        fi
      done
      if [[ $found -eq 1 ]]; then
        # Remove from persistence file
        if [[ -f "$ABBR_USER_FILE" ]]; then
          sed -i.bak "/\[$name\]=/d; /\[.*:$name\]=/d" "$ABBR_USER_FILE"
          rm -f "${ABBR_USER_FILE}.bak"
        fi
        echo "Erased abbreviation: $name"
      else
        echo "Abbreviation not found: $name" >&2
        return 1
      fi
      ;;

    rename)
      if [[ -z "$name" || -z "$expansion" ]]; then
        echo "Usage: abbr -r OLDNAME NEWNAME" >&2
        return 1
      fi
      local oldname="$name" newname="$expansion" val=""
      # Check each store for the old name
      if [[ -n "${abbrevs[$oldname]}" ]]; then
        val="${abbrevs[$oldname]}"
        unset "abbrevs[$oldname]"
        unalias "$oldname" 2>/dev/null
        abbrevs[$newname]="$val"
        alias $newname="$val"
        if [[ -f "$ABBR_USER_FILE" ]]; then
          sed -i.bak "s/abbrevs\[$oldname\]/abbrevs[$newname]/" "$ABBR_USER_FILE"
          rm -f "${ABBR_USER_FILE}.bak"
        fi
        echo "Renamed: $oldname → $newname"
        return 0
      fi
      if [[ -n "${abbrevs_cmd[$oldname]}" ]]; then
        val="${abbrevs_cmd[$oldname]}"
        unset "abbrevs_cmd[$oldname]"
        abbrevs_cmd[$newname]="$val"
        if [[ -f "$ABBR_USER_FILE" ]]; then
          sed -i.bak "s/abbrevs_cmd\[$oldname\]/abbrevs_cmd[$newname]/" "$ABBR_USER_FILE"
          rm -f "${ABBR_USER_FILE}.bak"
        fi
        echo "Renamed: $oldname → $newname"
        return 0
      fi
      # Check context abbrevs
      for key in ${(k)abbrevs_ctx}; do
        if [[ "$key" == *":$oldname" ]]; then
          local ctx="${key%%:*}"
          val="${abbrevs_ctx[$key]}"
          unset "abbrevs_ctx[$key]"
          abbrevs_ctx[$ctx:$newname]="$val"
          if [[ -f "$ABBR_USER_FILE" ]]; then
            sed -i.bak "s/abbrevs_ctx\[$ctx:$oldname\]/abbrevs_ctx[$ctx:$newname]/" "$ABBR_USER_FILE"
            rm -f "${ABBR_USER_FILE}.bak"
          fi
          echo "Renamed: $ctx $oldname → $ctx $newname"
          return 0
        fi
      done
      echo "Abbreviation not found: $oldname" >&2
      return 1
      ;;

    show)
      echo "# Anywhere abbreviations"
      for key in ${(ko)abbrevs}; do
        echo "abbr -a ${(q)key} ${(q)abbrevs[$key]}"
      done
      echo "\n# Command-position abbreviations"
      for key in ${(ko)abbrevs_cmd}; do
        echo "abbr -a -c ${(q)key} ${(q)abbrevs_cmd[$key]}"
      done
      echo "\n# Context abbreviations"
      for key in ${(ko)abbrevs_ctx}; do
        local ctx="${key%%:*}"
        local abbr="${key#*:}"
        echo "abbr -a -C ${(q)ctx} ${(q)abbr} ${(q)abbrevs_ctx[$key]}"
      done
      ;;

    list)
      local header='\033[1;36m' key_c='\033[1;33m' arrow='\033[0;37m'
      local val_c='\033[0;32m' ctx_c='\033[1;35m' reset='\033[0m'

      if [[ -t 1 ]]; then
        # Anywhere abbreviations (from arrays)
        for array in ${abbrev_arrays[@]}; do
          echo -e "${header}${array}${reset}"
          for key in ${(ko)${(P)array}}; do
            printf "${key_c}%-12s${reset} ${arrow}→${reset} ${val_c}%s${reset}\n" \
              "$key" "${${(P)array}[$key]}"
          done
          echo
        done

        # Context abbreviations
        if [[ ${#abbrevs_ctx} -gt 0 ]]; then
          echo -e "${header}context_abbrevs${reset}"
          for key in ${(ko)abbrevs_ctx}; do
            local ctx="${key%%:*}"
            local abbr="${key#*:}"
            printf "${ctx_c}%-6s${reset} ${key_c}%-8s${reset} ${arrow}→${reset} ${val_c}%s${reset}\n" \
              "$ctx" "$abbr" "${abbrevs_ctx[$key]}"
          done
          echo
        fi

        # Command-position abbreviations
        if [[ ${#abbrevs_cmd} -gt 0 ]]; then
          echo -e "${header}command_abbrevs${reset}"
          for key in ${(ko)abbrevs_cmd}; do
            printf "${key_c}%-12s${reset} ${arrow}→${reset} ${val_c}%s${reset}\n" \
              "$key" "${abbrevs_cmd[$key]}"
          done
          echo
        fi
      else
        # Non-interactive: output as zsh
        for array in ${abbrev_arrays[@]}; do
          typeset -p $array | sed 's/\[/\n  [/g; s/)/\n)/' | sed '1s/^/\n/'
        done
      fi
      ;;

    help)
      cat <<'EOF'
abbr - fish-like abbreviation manager

USAGE:
  abbr                     List all abbreviations
  abbr -l, --list          List all abbreviations
  abbr -a NAME EXPANSION   Add an anywhere abbreviation
  abbr -a -c NAME EXP      Add a command-position abbreviation (first word only)
  abbr -a -C CTX NAME EXP  Add a context abbreviation (after CTX, e.g., "git")
  abbr -e NAME             Erase an abbreviation
  abbr -r OLD NEW          Rename an abbreviation
  abbr -s, --show          Show abbreviations as abbr commands (for export)
  abbr -h, --help          Show this help

EXAMPLES:
  abbr -a gp "git push"              # expands anywhere
  abbr -a -c ll "ls -la"             # expands only as first word
  abbr -a -C git sw switch           # "git sw" → "git switch"
  abbr -a -C docker b build          # "docker b" → "docker build"
  abbr -e gp                         # remove abbreviation
  abbr -r gp gpush                   # rename gp to gpush

KEYBINDINGS:
  Space     Expand abbreviation
  Enter     Expand and execute
  Ctrl+x    Insert literal space (no expansion)
EOF
      ;;
  esac
}

# Completion for abbr command
_abbr() {
  local -a subcmds
  subcmds=(
    '-a:Add a new abbreviation'
    '--add:Add a new abbreviation'
    '-e:Erase an abbreviation'
    '--erase:Erase an abbreviation'
    '-r:Rename an abbreviation'
    '--rename:Rename an abbreviation'
    '-l:List all abbreviations'
    '--list:List all abbreviations'
    '-s:Show abbreviations as commands'
    '--show:Show abbreviations as commands'
    '-c:Add command-position abbreviation'
    '--command:Add command-position abbreviation'
    '-C:Add context abbreviation (requires PREFIX)'
    '--context:Add context abbreviation (requires PREFIX)'
    '-h:Show help'
    '--help:Show help'
  )

  local -a all_abbrevs
  all_abbrevs=(${(k)abbrevs} ${(k)abbrevs_cmd})
  for key in ${(k)abbrevs_ctx}; do
    all_abbrevs+=("${key#*:}")
  done

  case "$words[2]" in
    -e|--erase|-r|--rename)
      _describe 'abbreviation' all_abbrevs
      ;;
    -C|--context)
      if [[ $CURRENT -eq 3 ]]; then
        local -a contexts=(git docker "docker compose" kubectl)
        _describe 'context' contexts
      elif [[ $CURRENT -eq 4 ]]; then
        _message 'abbreviation name'
      else
        _message 'expansion'
      fi
      ;;
    -a|--add)
      if [[ $CURRENT -eq 3 ]]; then
        _message 'abbreviation name'
      else
        _message 'expansion'
      fi
      ;;
    *)
      _describe 'abbr command' subcmds
      ;;
  esac
}
(( $+functions[compdef] )) && compdef _abbr abbr

# Show available abbreviations for current context (Ctrl+x a)
# Usage: type "git " then press Ctrl+x a to see git abbreviations
abbr-show-context() {
  local cmd_prefix="${LBUFFER%%[[:space:]]*}"
  local current_word="${LBUFFER##* }"
  local -a matches

  # Check for context abbreviations
  if [[ -n "$cmd_prefix" && "$LBUFFER" == *[[:space:]]* ]]; then
    # Handle "docker compose" as special case
    if [[ "$LBUFFER" == "docker compose "* ]]; then
      cmd_prefix="docker compose"
    fi

    for key in ${(ko)abbrevs_ctx}; do
      if [[ "$key" == ${cmd_prefix}:* ]]; then
        local abbr="${key#*:}"
        local expansion="${abbrevs_ctx[$key]}"
        # Filter by current word prefix if any
        if [[ -z "$current_word" || "$abbr" == ${current_word}* ]]; then
          matches+=("$abbr → $expansion")
        fi
      fi
    done

    if [[ ${#matches} -eq 0 ]]; then
      zle -M "No abbreviations for: $cmd_prefix"
    else
      zle -M "[$cmd_prefix] ${(F)matches}"
    fi
  else
    # At command position - show anywhere abbreviations matching current word
    local count=0
    for key in ${(ko)abbrevs}; do
      if [[ -z "$current_word" || "$key" == ${current_word}* ]]; then
        matches+=("$key → ${abbrevs[$key]}")
        ((count++))
        [[ $count -ge 20 ]] && { matches+=("... (use 'abbr' to see all)"); break; }
      fi
    done

    if [[ ${#matches} -eq 0 ]]; then
      zle -M "No abbreviations matching: $current_word"
    else
      zle -M "${(F)matches}"
    fi
  fi
}
zle -N abbr-show-context
bindkey "^Xa" abbr-show-context

# Insert abbreviation from menu (Ctrl+x Tab)
abbr-complete() {
  local cmd_prefix="${LBUFFER%%[[:space:]]*}"
  local current_word="${LBUFFER##* }"
  local prefix_before_word="${LBUFFER% *}"
  [[ "$LBUFFER" != *" "* ]] && prefix_before_word=""
  local -a candidates

  # Determine which abbreviations to offer
  if [[ -n "$cmd_prefix" && "$LBUFFER" == *[[:space:]]* ]]; then
    # Handle "docker compose" as special case
    if [[ "$LBUFFER" == "docker compose "* ]]; then
      cmd_prefix="docker compose"
      prefix_before_word="docker compose"
    fi

    for key in ${(ko)abbrevs_ctx}; do
      if [[ "$key" == ${cmd_prefix}:* ]]; then
        local abbr="${key#*:}"
        if [[ -z "$current_word" || "$abbr" == ${current_word}* ]]; then
          candidates+=("$abbr")
        fi
      fi
    done
  else
    for key in ${(ko)abbrevs}; do
      if [[ -z "$current_word" || "$key" == ${current_word}* ]]; then
        candidates+=("$key")
      fi
    done
  fi

  if [[ ${#candidates} -eq 0 ]]; then
    zle -M "No matching abbreviations"
    return 1
  elif [[ ${#candidates} -eq 1 ]]; then
    # Single match - insert it
    if [[ -n "$prefix_before_word" ]]; then
      LBUFFER="${prefix_before_word} ${candidates[1]}"
    else
      LBUFFER="${candidates[1]}"
    fi
  else
    # Multiple matches - use menu selection
    local selection
    selection=$(printf '%s\n' "${candidates[@]}" | fzf --height=10 --reverse --prompt="abbr> ")
    if [[ -n "$selection" ]]; then
      if [[ -n "$prefix_before_word" ]]; then
        LBUFFER="${prefix_before_word} ${selection}"
      else
        LBUFFER="${selection}"
      fi
    fi
  fi
}
zle -N abbr-complete
bindkey "^X^I" abbr-complete  # Ctrl+x Tab

# Autosuggestion compatibility
export ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(magic-abbrev-expand-and-execute)
