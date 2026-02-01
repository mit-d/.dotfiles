# Abbreviations (fish-like)
###############################################################################
# Key formats in abbrevs:
#   - "gp"          anywhere abbreviation (expands anywhere on the line)
#   - "git:sw"      context abbreviation (expands only after "git ")
#   - "@feat"       command abbreviation (expands only as first word)
#
# Function abbreviations are stored separately in abbrevs_func
###############################################################################
setopt extendedglob

# Main abbreviation store
# Keys can be:
#   - plain word: expands anywhere
#   - "prefix:word": expands only after prefix (context)
#   - "@word": expands only as first word (command position)
typeset -gA abbrevs

# Function abbreviations (value is function name to call)
typeset -gA abbrevs_func

# Persistence file for runtime additions
ABBR_USER_FILE="${ZDOTDIR:-$HOME}/.zsh_abbr_user"

###############################################################################
# Built-in abbreviation functions
###############################################################################

# !! - Last command
_abbr_fn_last_cmd() {
  fc -ln -1
}

# !$ - Last argument of previous command
_abbr_fn_last_arg() {
  local last_cmd="$(fc -ln -1)"
  echo "${last_cmd##* }"
}

# !^ - First argument of previous command
_abbr_fn_first_arg() {
  local last_cmd="$(fc -ln -1)"
  local without_cmd="${last_cmd#* }"
  echo "${without_cmd%% *}"
}

# !* - All arguments of previous command
_abbr_fn_all_args() {
  local last_cmd="$(fc -ln -1)"
  echo "${last_cmd#* }"
}

# !:n - Nth argument of previous command (0 = command itself)
_abbr_fn_nth_arg() {
  local n="${1:-1}"
  local last_cmd="$(fc -ln -1)"
  local -a words=(${(z)last_cmd})
  echo "${words[$((n+1))]}"
}

# Current git branch
_abbr_fn_git_branch() {
  git branch --show-current 2>/dev/null || echo ""
}

# Current date (ISO format)
_abbr_fn_date_iso() {
  date +%Y-%m-%d
}

# Current timestamp
_abbr_fn_timestamp() {
  date +%Y%m%d_%H%M%S
}

# Default function abbreviations
abbrevs_func=(
  "!!"    "_abbr_fn_last_cmd"
  '!$'    "_abbr_fn_last_arg"
  "!^"    "_abbr_fn_first_arg"
  "!*"    "_abbr_fn_all_args"
  "!!br"  "_abbr_fn_git_branch"
  "!!d"   "_abbr_fn_date_iso"
  "!!ts"  "_abbr_fn_timestamp"
)

###############################################################################
# Built-in Abbreviations
###############################################################################
# Key format:
#   "word"         - expands anywhere
#   "prefix:word"  - expands only after prefix (context)
#   "@word"        - expands only as first word (command position)

abbrevs=(
  # === Git (anywhere - prefixed with 'g') ===
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

  # === Git context (after "git ") ===
  "git:sw"        "switch"
  "git:sw-"       "switch -"
  "git:swc"       "switch -C"
  "git:swm"       "switch main"
  "git:co"        "checkout"
  "git:cp"        "cherry-pick"
  "git:rb"        "rebase"
  "git:rbi"       "rebase -i"
  "git:rbm"       "rebase origin/main"
  "git:rba"       "rebase --abort"
  "git:rbc"       "rebase --continue"
  "git:rs"        "reset"
  "git:rsh"       "reset --hard"
  "git:rss"       "reset --soft"
  "git:st"        "stash"
  "git:stp"       "stash pop"
  "git:stl"       "stash list"
  "git:df"        "diff"
  "git:dfc"       "diff --cached"
  "git:lg"        "log --graph --oneline"
  "git:lga"       "log --graph --oneline --all"
  "git:aa"        "add -A"
  "git:ap"        "add --patch"
  "git:cm"        "commit -m"
  "git:ca"        "commit --amend"
  "git:can"       "commit --amend --no-edit"
  "git:pf"        "push --force-with-lease"
  "git:pl"        "pull"

  # === Kubernetes (anywhere - prefixed with 'k') ===
  "k"             "kubectl"
  "kgp"           "kubectl get pods"
  "kgn"           "kubectl get nodes"
  "kga"           "kubectl get all"
  "kdp"           "kubectl describe pod"
  "kl"            "kubectl logs"
  "kex"           "kubectl exec -it"
  "kctx"          "kubectl config use-context"
  "kns"           "kubectl config set-context --current --namespace"

  # === Kubectl context (after "kubectl ") ===
  "kubectl:g"     "get"
  "kubectl:gp"    "get pods"
  "kubectl:gn"    "get nodes"
  "kubectl:gs"    "get svc"
  "kubectl:gd"    "get deploy"
  "kubectl:ga"    "get all"
  "kubectl:d"     "describe"
  "kubectl:dp"    "describe pod"
  "kubectl:dn"    "describe node"
  "kubectl:l"     "logs -f"
  "kubectl:e"     "exec -it"
  "kubectl:a"     "apply -f"
  "kubectl:del"   "delete"

  # === Docker (anywhere - prefixed with 'dk') ===
  "dk"            "docker"
  "dkr"           "docker run -it"
  "dke"           "docker exec -it __CURSOR__ /bin/bash"
  "dki"           "docker images"
  "dkbd"          "docker build ."
  "dkbt"          "docker build -t __CURSOR__ ."
  "dkpa"          "docker system prune -a"
  "dco"           "docker compose"
  "dcou"          "docker compose up -d --remove-orphans"

  # === Docker context (after "docker ") ===
  "docker:r"      "run -it"
  "docker:e"      "exec -it"
  "docker:b"      "build"
  "docker:i"      "images"
  "docker:ps"     "ps -a"
  "docker:rm"     "rm -f"
  "docker:rmi"    "rmi -f"
  "docker:l"      "logs -f"
  "docker:p"      "pull"
  "docker:pa"     "system prune -a"

  # === Docker Compose context (after "docker compose ") ===
  "docker compose:u"   "up -d"
  "docker compose:d"   "down"
  "docker compose:r"   "run --rm"
  "docker compose:l"   "logs -f"
  "docker compose:ps"  "ps -a"
  "docker compose:b"   "build"
  "docker compose:p"   "pull"

  # === Python/UV ===
  "venv"          "uv venv"
  "act"           "source .venv/bin/activate"
  "deact"         "deactivate"
  "req"           "uv pip install -r requirements.txt"
  "freeze"        "uv pip freeze > requirements.txt"
  "sync"          "uv sync"
  "lock"          "uv lock"
  "uvi"           "uv pip install"
  "uvr"           "uv pip uninstall"
  "uvl"           "uv pip list"
  "uvadd"         "uv add"

  # === System monitoring ===
  "psa"           "ps aux"
  "dfh"           "df -h"
  "upt"           "uptime"
  "whoa"          "who -a"

  # === Networking ===
  "curlh"         "curl -I"
  "wgetr"         "wget -r"
  "ping5"         "ping -c 5"
  "tracer"        "traceroute"
  "nslook"        "nslookup"
  "digs"          "dig +short"

  # === Misc ===
  "eof"           "<<EOF"
  "hz"            "history 1 | fzf"

  # === Output redirection (anywhere) ===
  "_NULL"         "&>/dev/null"
  "_L"            "| less"
  "_T"            "| tee -a"
  "_G"            "| grep -ni"
  "_Z"            "| fzf"

  # === Command-position only (prefixed with @) ===
  "@feat"         "git switch -C feat/dmitten/WARH-__CURSOR__"
  "@bugs"         "git switch -C bugs/dmitten/WARH-__CURSOR__"
  "@misc"         "git switch -C misc/dmitten/__CURSOR__"
  "@t"            "task __CURSOR__"
)

# Load user abbreviations from persistence file (overrides built-ins)
[[ -f "$ABBR_USER_FILE" ]] && source "$ABBR_USER_FILE"

# Create aliases for simple (non-context, non-command) abbreviations
for key in ${(k)abbrevs}; do
  # Skip context (has :) and command-position (starts with @) abbreviations
  [[ "$key" == *:* || "$key" == @* ]] && continue
  alias $key="${abbrevs[$key]}" 2>/dev/null
done

###############################################################################
# Expansion Engine
###############################################################################

# Helper: check if cursor is inside a quoted string
# Returns 0 (true) if inside quotes, 1 (false) if outside
_abbr_in_quotes() {
  local str="$1"
  local single_count=0 double_count=0
  local temp

  # Count unescaped single quotes
  temp="${str//\\\'/}"  # Remove escaped single quotes
  while [[ "$temp" == *"'"* ]]; do
    ((single_count++))
    temp="${temp#*\'}"
  done

  # Count unescaped double quotes
  temp="${str//\\\"/}"  # Remove escaped double quotes
  while [[ "$temp" == *'"'* ]]; do
    ((double_count++))
    temp="${temp#*\"}"
  done

  # Inside quotes if either count is odd
  (( single_count % 2 == 1 || double_count % 2 == 1 ))
}

magic-abbrev-expand() {
  local MATCH prefix expansion ctx_key cmd_prefix

  # 0. Check function abbreviations first (they may contain special chars like !, $)
  # Check longest matches first to handle !!br before !!
  local func_abbr func_name func_result
  for func_abbr in ${(Ok)abbrevs_func}; do
    if [[ "$LBUFFER" == *"$func_abbr" ]]; then
      # Don't expand inside quotes
      prefix="${LBUFFER%"$func_abbr"}"
      if _abbr_in_quotes "$prefix"; then
        break
      fi
      func_name="${abbrevs_func[$func_abbr]}"
      if (( $+functions[$func_name] )); then
        func_result="$($func_name)"
        if [[ -n "$func_result" ]]; then
          LBUFFER="${prefix}${func_result}"
          zle self-insert
          return
        fi
      fi
    fi
  done

  # Extract the word being typed (alphanumeric + underscore)
  LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
  prefix="$LBUFFER"

  # Don't expand inside quoted strings
  if _abbr_in_quotes "$prefix"; then
    LBUFFER="${prefix}${MATCH}"
    zle self-insert
    return
  fi

  # Find the current simple command (after |, ||, &&, ;, or start of line)
  # This ensures "echo | git sw" sees "git" as the command, not "echo"
  local current_cmd="$prefix"
  current_cmd="${current_cmd##*[|&;]}"           # Remove up to last separator
  current_cmd="${current_cmd#"${current_cmd%%[![:space:]]*}"}"  # Trim leading whitespace

  # Strip subshell/command substitution prefixes: (, $(, `, {
  current_cmd="${current_cmd#\(}"
  current_cmd="${current_cmd#\$\(}"
  current_cmd="${current_cmd#\`}"
  current_cmd="${current_cmd#\{}"
  current_cmd="${current_cmd#"${current_cmd%%[![:space:]]*}"}"  # Trim again after stripping

  # Determine context: extract first word from current command
  cmd_prefix="${current_cmd%%[[:space:]]*}"

  # 1. Check context abbreviations (e.g., "git sw" → "git switch")
  #    These are stored as "prefix:word" in abbrevs
  if [[ -n "$cmd_prefix" && "$current_cmd" == *[[:space:]]* ]]; then
    # Try multi-word context prefixes first (e.g., "docker compose")
    local first_word="${current_cmd%%[[:space:]]*}"
    local rest="${current_cmd#*[[:space:]]}"
    rest="${rest#"${rest%%[![:space:]]*}"}"  # Trim leading space
    local second_word="${rest%%[[:space:]]*}"
    local multi_prefix="${first_word} ${second_word}"

    # Check multi-word prefix first (e.g., "docker compose:u")
    ctx_key="${multi_prefix}:${MATCH}"
    if [[ -n "${abbrevs[$ctx_key]}" ]]; then
      expansion="${abbrevs[$ctx_key]}"
      LBUFFER="${prefix}${expansion}"
      _abbr_handle_cursor "$prefix" "$expansion"
      return
    fi

    # Fall back to single-word prefix (e.g., "git:sw")
    ctx_key="${cmd_prefix}:${MATCH}"
    if [[ -n "${abbrevs[$ctx_key]}" ]]; then
      expansion="${abbrevs[$ctx_key]}"
      LBUFFER="${prefix}${expansion}"
      _abbr_handle_cursor "$prefix" "$expansion"
      return
    fi
  fi

  # 2. Check command-position abbreviations (first word of current command)
  #    These are stored as "@word" in abbrevs
  if [[ ! "$current_cmd" == *[[:space:]]* ]] && [[ -n "${abbrevs[@${MATCH}]}" ]]; then
    expansion="${abbrevs[@${MATCH}]}"
    LBUFFER="${prefix}${expansion}"
    _abbr_handle_cursor "$prefix" "$expansion"
    return
  fi

  # 3. Check anywhere abbreviations (plain keys, no prefix)
  #    Skip keys with : or @ prefix
  if [[ -n "${abbrevs[$MATCH]}" && "$MATCH" != *:* && "$MATCH" != @* ]]; then
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
      -a|--add)       action="add"; shift ;;
      -e|--erase)     action="erase"; shift ;;
      -r|--rename)    action="rename"; shift ;;
      -s|--show)      action="show"; shift ;;
      -l|--list)      action="list"; shift ;;
      -c|--command)   position="command"; shift ;;
      -C|--context)   position="context"; ctx_prefix="$2"; shift 2 ;;
      -f|--function)  position="function"; shift ;;
      -h|--help)      action="help"; shift ;;
      import-fish)    action="import-fish"; shift ;;
      export-fish)    action="export-fish"; shift ;;
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
        echo "Usage: abbr -a [-c|-C PREFIX|-f] NAME EXPANSION" >&2
        return 1
      fi
      case "$position" in
        function)
          # Verify the function exists
          if ! (( $+functions[$expansion] )); then
            echo "Warning: function '$expansion' not found (abbreviation added anyway)" >&2
          fi
          abbrevs_func[$name]="$expansion"
          echo "abbrevs_func[$name]=\"$expansion\"" >> "$ABBR_USER_FILE"
          echo "Added function abbreviation: $name → $expansion()"
          ;;
        command)
          # Store with @ prefix for command-position
          abbrevs[@${name}]="$expansion"
          echo "abbrevs[@${name}]=\"$expansion\"" >> "$ABBR_USER_FILE"
          echo "Added command abbreviation: $name → $expansion"
          ;;
        context)
          if [[ -z "$ctx_prefix" ]]; then
            echo "Context mode requires -C PREFIX" >&2
            return 1
          fi
          # Store with prefix:name format
          abbrevs["${ctx_prefix}:${name}"]="$expansion"
          echo "abbrevs[${ctx_prefix}:${name}]=\"$expansion\"" >> "$ABBR_USER_FILE"
          echo "Added context abbreviation: $ctx_prefix $name → $ctx_prefix $expansion"
          ;;
        *)
          abbrevs[$name]="$expansion"
          alias $name="$expansion" 2>/dev/null
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
      # Check plain key
      if [[ -n "${abbrevs[$name]}" ]]; then
        unset "abbrevs[$name]"
        unalias "$name" 2>/dev/null
        found=1
      fi
      # Check command-position (@name)
      if [[ -n "${abbrevs[@${name}]}" ]]; then
        unset "abbrevs[@${name}]"
        found=1
      fi
      # Check function abbreviations
      if [[ -n "${abbrevs_func[$name]}" ]]; then
        unset "abbrevs_func[$name]"
        found=1
      fi
      # Check all context prefixes (prefix:name)
      for key in ${(k)abbrevs}; do
        if [[ "$key" == *":$name" ]]; then
          unset "abbrevs[$key]"
          found=1
        fi
      done
      if [[ $found -eq 1 ]]; then
        # Remove from persistence file
        if [[ -f "$ABBR_USER_FILE" ]]; then
          sed -i.bak "/\[$name\]=/d; /\[@$name\]=/d; /\[.*:$name\]=/d" "$ABBR_USER_FILE"
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
      local oldname="$name" newname="$expansion" val="" key_type=""

      # Check plain key
      if [[ -n "${abbrevs[$oldname]}" && "$oldname" != *:* && "$oldname" != @* ]]; then
        val="${abbrevs[$oldname]}"
        unset "abbrevs[$oldname]"
        unalias "$oldname" 2>/dev/null
        abbrevs[$newname]="$val"
        alias $newname="$val" 2>/dev/null
        key_type="abbrevs"
      # Check command-position
      elif [[ -n "${abbrevs[@${oldname}]}" ]]; then
        val="${abbrevs[@${oldname}]}"
        unset "abbrevs[@${oldname}]"
        abbrevs[@${newname}]="$val"
        key_type="abbrevs[@"
        oldname="@${oldname}"
        newname="@${newname}"
      else
        # Check context abbrevs
        for key in ${(k)abbrevs}; do
          if [[ "$key" == *":$oldname" ]]; then
            local ctx="${key%%:*}"
            val="${abbrevs[$key]}"
            unset "abbrevs[$key]"
            abbrevs[${ctx}:${newname}]="$val"
            if [[ -f "$ABBR_USER_FILE" ]]; then
              sed -i.bak "s/abbrevs\[${ctx}:${oldname}\]/abbrevs[${ctx}:${newname}]/" "$ABBR_USER_FILE"
              rm -f "${ABBR_USER_FILE}.bak"
            fi
            echo "Renamed: $ctx $oldname → $ctx $newname"
            return 0
          fi
        done
        echo "Abbreviation not found: $oldname" >&2
        return 1
      fi

      if [[ -f "$ABBR_USER_FILE" ]]; then
        sed -i.bak "s/abbrevs\[$oldname\]/abbrevs[$newname]/" "$ABBR_USER_FILE"
        rm -f "${ABBR_USER_FILE}.bak"
      fi
      echo "Renamed: $oldname → $newname"
      return 0
      ;;

    show)
      echo "# Anywhere abbreviations"
      for key in ${(ko)abbrevs}; do
        [[ "$key" == *:* || "$key" == @* ]] && continue
        echo "abbr -a ${(q)key} ${(q)abbrevs[$key]}"
      done
      echo "\n# Command-position abbreviations"
      for key in ${(ko)abbrevs}; do
        [[ "$key" != @* ]] && continue
        local name="${key#@}"
        echo "abbr -a -c ${(q)name} ${(q)abbrevs[$key]}"
      done
      echo "\n# Context abbreviations"
      for key in ${(ko)abbrevs}; do
        [[ "$key" != *:* ]] && continue
        local ctx="${key%%:*}"
        local abbr="${key#*:}"
        echo "abbr -a -C ${(q)ctx} ${(q)abbr} ${(q)abbrevs[$key]}"
      done
      echo "\n# Function abbreviations"
      for key in ${(ko)abbrevs_func}; do
        echo "abbr -a -f ${(q)key} ${(q)abbrevs_func[$key]}"
      done
      ;;

    import-fish)
      # Import fish abbreviations from stdin or file
      # Fish format: abbr -a [-g] [--set-cursor[=MARKER]] NAME EXPANSION
      # Converts fish's cursor marker (default %) to __CURSOR__
      #
      # Options:
      #   --save     Persist imported abbreviations to user file
      #   --dry-run  Preview imports without applying
      local input_file="" save_imports=0 dry_run=0
      local count=0 skipped=0 saved=0
      local line abbr_name abbr_expansion is_global has_cursor cursor_marker

      # Parse import-fish specific options
      # name/expansion may contain leftover args from main parsing
      for arg in "$name" "$expansion" "$newname"; do
        case "$arg" in
          --save)     save_imports=1 ;;
          --dry-run)  dry_run=1 ;;
          -*)         ;; # ignore other flags
          "")         ;; # ignore empty
          *)          [[ -z "$input_file" ]] && input_file="$arg" ;;
        esac
      done

      _parse_fish_line() {
        local line="$1"
        abbr_name="" abbr_expansion="" is_global=0 has_cursor=0 cursor_marker="%"

        # Skip empty lines and comments
        [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && return 1

        # Match: abbr -a [-g] NAME EXPANSION or abbr --add [-g] NAME EXPANSION
        if [[ "$line" =~ ^[[:space:]]*abbr[[:space:]]+(--add|-a)[[:space:]]+ ]]; then
          local rest="${line#*abbr}"
          rest="${rest#*--add}"
          rest="${rest#*-a}"
          rest="${rest#"${rest%%[![:space:]]*}"}"

          # Parse flags
          while [[ "$rest" == -* ]]; do
            case "$rest" in
              --global[[:space:]]*|-g[[:space:]]*)
                is_global=1
                rest="${rest#--global}"
                rest="${rest#-g}"
                ;;
              --set-cursor=*)
                has_cursor=1
                cursor_marker="${rest#--set-cursor=}"
                cursor_marker="${cursor_marker%%[[:space:]]*}"
                rest="${rest#--set-cursor=*}"
                rest="${rest#*[[:space:]]}"
                ;;
              --set-cursor[[:space:]]*)
                has_cursor=1
                cursor_marker="%"
                rest="${rest#--set-cursor}"
                ;;
              --*[[:space:]]*)
                # Skip unknown long flags
                rest="${rest#--*[[:space:]]}"
                ;;
              -[a-zA-Z][[:space:]]*)
                # Skip unknown short flags
                rest="${rest#-?}"
                ;;
              *)
                break
                ;;
            esac
            rest="${rest#"${rest%%[![:space:]]*}"}"
          done

          # Handle -- separator
          [[ "$rest" == --[[:space:]]* ]] && rest="${rest#--[[:space:]]}"

          # Extract name (first word)
          abbr_name="${rest%%[[:space:]]*}"
          rest="${rest#"$abbr_name"}"
          rest="${rest#"${rest%%[![:space:]]*}"}"

          # Rest is expansion - handle quotes
          abbr_expansion="$rest"
          # Remove surrounding quotes if present
          if [[ "$abbr_expansion" == \'*\' ]]; then
            abbr_expansion="${abbr_expansion:1:-1}"
          elif [[ "$abbr_expansion" == \"*\" ]]; then
            abbr_expansion="${abbr_expansion:1:-1}"
          fi

          # Convert fish cursor marker to __CURSOR__
          if [[ $has_cursor -eq 1 && "$abbr_expansion" == *"$cursor_marker"* ]]; then
            abbr_expansion="${abbr_expansion//$cursor_marker/__CURSOR__}"
          fi

          [[ -n "$abbr_name" && -n "$abbr_expansion" ]]
          return $?
        fi
        return 1
      }

      _import_abbr() {
        if [[ $dry_run -eq 1 ]]; then
          echo "  [dry-run] $abbr_name → $abbr_expansion"
        else
          abbrevs[$abbr_name]="$abbr_expansion"
          alias "$abbr_name"="$abbr_expansion" 2>/dev/null
          if [[ $save_imports -eq 1 ]]; then
            echo "abbrevs[$abbr_name]=\"$abbr_expansion\"" >> "$ABBR_USER_FILE"
            ((saved++))
          fi
        fi
        ((count++))
      }

      if [[ -n "$input_file" && -f "$input_file" ]]; then
        [[ $dry_run -eq 1 ]] && echo "Dry run - no changes will be made:"
        # Read from file
        while IFS= read -r line || [[ -n "$line" ]]; do
          if _parse_fish_line "$line"; then
            _import_abbr
          elif [[ -n "$line" && ! "$line" =~ ^[[:space:]]*# ]]; then
            ((skipped++))
          fi
        done < "$input_file"
      else
        # Read from stdin
        [[ $dry_run -eq 0 ]] && echo "Paste fish abbreviations (Ctrl+D when done):"
        [[ $dry_run -eq 1 ]] && echo "Dry run - paste abbreviations (Ctrl+D when done):"
        while IFS= read -r line || [[ -n "$line" ]]; do
          if _parse_fish_line "$line"; then
            _import_abbr
          elif [[ -n "$line" && ! "$line" =~ ^[[:space:]]*# ]]; then
            ((skipped++))
          fi
        done
      fi

      if [[ $dry_run -eq 1 ]]; then
        echo "Would import $count abbreviations"
      else
        echo "Imported $count abbreviations"
        [[ $save_imports -eq 1 ]] && echo "Saved $saved to $ABBR_USER_FILE"
      fi
      [[ $skipped -gt 0 ]] && echo "Skipped $skipped unrecognized lines"
      ;;

    export-fish)
      # Export abbreviations in fish format
      # Converts __CURSOR__ to fish's --set-cursor with % marker
      echo "# Fish abbreviations exported from zsh-abbr"
      echo "# Import with: source <file> (in fish shell)"
      echo ""

      _export_fish_abbr() {
        local key="$1" val="$2" prefix="${3:-}"
        local set_cursor=""
        local fish_val="$val"

        # Convert __CURSOR__ to fish cursor marker
        if [[ "$val" == *"__CURSOR__"* ]]; then
          set_cursor="--set-cursor "
          fish_val="${val//__CURSOR__/%}"
        fi

        echo "abbr -a ${prefix}${set_cursor}-- ${key} ${(q)fish_val}"
      }

      # Export anywhere abbreviations
      for key in ${(ko)abbrevs}; do
        # Skip context and command-position keys
        [[ "$key" == *:* || "$key" == @* ]] && continue
        _export_fish_abbr "$key" "${abbrevs[$key]}"
      done

      # Export command-position abbreviations (fish doesn't have equivalent, use regular)
      local has_cmd=0
      for key in ${(ko)abbrevs}; do
        [[ "$key" != @* ]] && continue
        if [[ $has_cmd -eq 0 ]]; then
          echo ""
          echo "# Command-position abbreviations (no fish equivalent, using regular abbr)"
          has_cmd=1
        fi
        local name="${key#@}"
        _export_fish_abbr "$name" "${abbrevs[$key]}"
      done

      # Export context abbreviations with a note
      local has_ctx=0
      for key in ${(ko)abbrevs}; do
        [[ "$key" != *:* ]] && continue
        if [[ $has_ctx -eq 0 ]]; then
          echo ""
          echo "# Context abbreviations (no fish equivalent, exporting as comments)"
          has_ctx=1
        fi
        local ctx="${key%%:*}"
        local abbr="${key#*:}"
        echo "# $ctx context: $abbr → ${abbrevs[$key]}"
      done
      ;;

    list)
      local header='\033[1;36m' key_c='\033[1;33m' arrow='\033[0;37m'
      local val_c='\033[0;32m' ctx_c='\033[1;35m' cmd_c='\033[1;34m' reset='\033[0m'

      if [[ -t 1 ]]; then
        # Anywhere abbreviations (plain keys, no : or @)
        echo -e "${header}Anywhere abbreviations${reset}"
        for key in ${(ko)abbrevs}; do
          [[ "$key" == *:* || "$key" == @* ]] && continue
          printf "${key_c}%-12s${reset} ${arrow}→${reset} ${val_c}%s${reset}\n" \
            "$key" "${abbrevs[$key]}"
        done
        echo

        # Context abbreviations (keys with :)
        local has_ctx=0
        for key in ${(ko)abbrevs}; do
          [[ "$key" != *:* ]] && continue
          if [[ $has_ctx -eq 0 ]]; then
            echo -e "${header}Context abbreviations${reset}"
            has_ctx=1
          fi
          local ctx="${key%%:*}"
          local abbr="${key#*:}"
          printf "${ctx_c}%-14s${reset} ${key_c}%-8s${reset} ${arrow}→${reset} ${val_c}%s${reset}\n" \
            "$ctx" "$abbr" "${abbrevs[$key]}"
        done
        [[ $has_ctx -eq 1 ]] && echo

        # Command-position abbreviations (keys with @)
        local has_cmd=0
        for key in ${(ko)abbrevs}; do
          [[ "$key" != @* ]] && continue
          if [[ $has_cmd -eq 0 ]]; then
            echo -e "${header}Command-position abbreviations${reset}"
            has_cmd=1
          fi
          local name="${key#@}"
          printf "${cmd_c}%-12s${reset} ${arrow}→${reset} ${val_c}%s${reset}\n" \
            "$name" "${abbrevs[$key]}"
        done
        [[ $has_cmd -eq 1 ]] && echo

        # Function abbreviations
        if [[ ${#abbrevs_func} -gt 0 ]]; then
          echo -e "${header}Function abbreviations${reset}"
          for key in ${(ko)abbrevs_func}; do
            printf "${key_c}%-12s${reset} ${arrow}→${reset} ${val_c}%s()${reset}\n" \
              "$key" "${abbrevs_func[$key]}"
          done
        fi
      else
        # Non-interactive: output as zsh
        typeset -p abbrevs
        typeset -p abbrevs_func
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
  abbr -a -f NAME FUNC     Add a function abbreviation (FUNC is called for expansion)
  abbr -e NAME             Erase an abbreviation
  abbr -r OLD NEW          Rename an abbreviation
  abbr -s, --show          Show abbreviations as abbr commands (for export)
  abbr import-fish [FILE]  Import fish abbreviations from FILE or stdin
  abbr export-fish         Export abbreviations in fish format
  abbr -h, --help          Show this help

KEY FORMAT (in abbrevs array):
  "gp"              Anywhere - expands anywhere on line
  "git:sw"          Context  - expands only after "git "
  "@feat"           Command  - expands only as first word

EXAMPLES:
  abbr -a gp "git push"              # expands anywhere
  abbr -a -c ll "ls -la"             # expands only as first word
  abbr -a -C git sw switch           # "git sw" → "git switch"
  abbr -a -C docker b build          # "docker b" → "docker build"
  abbr -a -f '!!' _abbr_fn_last_cmd  # !! → last command (function)
  abbr -e gp                         # remove abbreviation
  abbr -r gp gpush                   # rename gp to gpush

BUILT-IN FUNCTIONS:
  !!     Last command            _abbr_fn_last_cmd
  !$     Last argument           _abbr_fn_last_arg
  !^     First argument          _abbr_fn_first_arg
  !*     All arguments           _abbr_fn_all_args
  !!br   Current git branch      _abbr_fn_git_branch
  !!d    Current date (ISO)      _abbr_fn_date_iso
  !!ts   Timestamp               _abbr_fn_timestamp

IMPORT/EXPORT:
  abbr import-fish FILE             Import from file (session only)
  abbr import-fish FILE --save      Import and persist to user file
  abbr import-fish FILE --dry-run   Preview import without applying
  abbr export-fish                  Export in fish format
  cat fish.abbr | abbr import-fish  Import from stdin

KEYBINDINGS:
  Space     Expand abbreviation
  Enter     Expand and execute
  Ctrl+x    Insert literal space (no expansion)
  Ctrl+xo   Pick abbreviation with fzf
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

  # Collect all abbreviation names (stripping prefixes)
  local -a all_abbrevs
  for key in ${(k)abbrevs}; do
    if [[ "$key" == @* ]]; then
      all_abbrevs+=("${key#@}")
    elif [[ "$key" == *:* ]]; then
      all_abbrevs+=("${key#*:}")
    else
      all_abbrevs+=("$key")
    fi
  done

  case "$words[2]" in
    -e|--erase|-r|--rename)
      _describe 'abbreviation' all_abbrevs
      ;;
    -C|--context)
      if [[ $CURRENT -eq 3 ]]; then
        # Extract unique context prefixes
        local -a contexts=()
        for key in ${(k)abbrevs}; do
          [[ "$key" == *:* ]] && contexts+=("${key%%:*}")
        done
        contexts=(${(u)contexts})
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

# Abbreviation picker with fzf (Ctrl+x a)
# Shows abbreviations for current context, select to insert or Esc to cancel
abbr-fzf() {
  local cmd_prefix="${LBUFFER%%[[:space:]]*}"
  local current_word="${LBUFFER##* }"
  local prefix_before_word="${LBUFFER% *}"
  [[ "$LBUFFER" != *" "* ]] && prefix_before_word=""
  local -a candidates
  local header="anywhere"

  # Determine which abbreviations to offer
  if [[ -n "$cmd_prefix" && "$LBUFFER" == *[[:space:]]* ]]; then
    # Check for multi-word context prefixes (e.g., "docker compose")
    local first_word="${LBUFFER%%[[:space:]]*}"
    local rest="${LBUFFER#*[[:space:]]}"
    rest="${rest#"${rest%%[![:space:]]*}"}"
    local second_word="${rest%%[[:space:]]*}"
    local multi_prefix="${first_word} ${second_word}"

    # Check if multi-word prefix has context abbreviations
    local has_multi=0
    for key in ${(k)abbrevs}; do
      [[ "$key" == "${multi_prefix}:"* ]] && { has_multi=1; break; }
    done

    if [[ $has_multi -eq 1 && "$LBUFFER" == "${multi_prefix} "* ]]; then
      cmd_prefix="$multi_prefix"
      prefix_before_word="$multi_prefix"
    fi
    header="$cmd_prefix"

    # Show context abbreviations for this prefix
    for key in ${(ko)abbrevs}; do
      [[ "$key" != ${cmd_prefix}:* ]] && continue
      local abbr="${key#*:}"
      local expansion="${abbrevs[$key]}"
      if [[ -z "$current_word" || "$abbr" == ${current_word}* ]]; then
        candidates+=("$(printf '%-10s → %s' "$abbr" "$expansion")")
      fi
    done
  else
    # Show anywhere abbreviations (plain keys only)
    for key in ${(ko)abbrevs}; do
      [[ "$key" == *:* || "$key" == @* ]] && continue
      if [[ -z "$current_word" || "$key" == ${current_word}* ]]; then
        candidates+=("$(printf '%-12s → %s' "$key" "${abbrevs[$key]}")")
      fi
    done
  fi

  if [[ ${#candidates} -eq 0 ]]; then
    zle -M "No abbreviations for: $header"
    return 1
  fi

  local selection
  selection=$(printf '%s\n' "${candidates[@]}" | \
    fzf --height=~50% --reverse --prompt="[$header] " \
        --header="Select abbreviation (Esc to cancel)" \
        --preview-window=hidden)

  if [[ -n "$selection" ]]; then
    # Extract just the abbreviation (before the →)
    local abbr="${selection%% →*}"
    abbr="${abbr%% *}"  # Trim trailing spaces

    if [[ -n "$prefix_before_word" ]]; then
      LBUFFER="${prefix_before_word} ${abbr}"
    else
      LBUFFER="${abbr}"
    fi
  fi

  zle reset-prompt
}
zle -N abbr-fzf
bindkey "^Xo" abbr-fzf    # Ctrl+x o

# Autosuggestion compatibility
export ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(magic-abbrev-expand-and-execute)
