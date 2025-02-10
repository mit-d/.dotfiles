
alias bclean='git switch main && git fetch --prune && git branch --merged | egrep -v "(^\*|^\s*main|^\s*dev|^\s*rc|^\s*staging)" | xargs git branch -d'
alias bcleanrc='git switch rc && git fetch --prune && git branch --merged | egrep -v "(^\*|^\s*main|^\s*dev|^\s*rc|^\s*staging)" | xargs git branch -d'

git_summary() {
  local base=${1:-origin/main}
  local target=${2:-HEAD}
  local count
  count=$(git rev-list --count --no-merges "$base..$target" 2>/dev/null)

  if [ "$count" -le 3 ]; then
    git log --no-merges --format="### %s (%h)%n%n%b" "$base..$target"
  else
    echo "<details>"
    echo "<summary>View ($count) Commits</summary>"
    echo
    git log --no-merges --format="### %s (%h)%n%n%b" "$base..$target"
    echo
    echo "</details>"
    echo
  fi
}

git_update_mr() {
  local enable_edit=false
  local info_file="mr_info.md"

  # Parse flags
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -e) enable_edit=true; shift ;;
      -f=*) info_file="${1#-f=}"; shift ;;
      -f)
        shift
        if [[ $# -gt 0 ]]; then
          info_file="$1"
          shift
        else
          echo "Error: -f requires a filename."
          return 1
        fi
        ;;
      --) shift; break ;;
      *) break ;;
    esac
  done

  local base=${1:-origin/main}
  local target=${2:-HEAD}

  # If file missing and not editing, just print commits for piping
  if [[ ! -f "$info_file" && "$enable_edit" != true ]]; then
    git_summary "$base" "$target"
    return
  fi

  # Create if needed, only for editing
  if [[ ! -f "$info_file" ]]; then
    {
      echo "# Summary"
      echo
      echo "# Testing Instructions"
      echo
      echo "# Commits"
    } > "$info_file"
  fi

  # Optionally edit
  if [[ "$enable_edit" == true ]]; then
    echo "Editing $info_file..."
    "${EDITOR:-nano}" "$info_file"
  fi

  # Remove old commits block
  sed -i '/^# Commits$/,$d' "$info_file"

  # Pipe output to file AND stdout
  {
    echo "# Commits"
    echo
    git_summary "$base" "$target"
  } | tee -a "$info_file"

  echo "Updated $info_file." >&2
}
