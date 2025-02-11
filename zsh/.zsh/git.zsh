
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

function gtag() {
  local delete=0 rename=0 clear=0 gitname opts
  opts=$(getopt -o drc --long delete,rename,clear -- "$@") || { echo "Opts parsing failed"; return 1; }
  eval set -- "$opts"
  while true; do
    case "$1" in
      -d|--delete) delete=1; shift ;;
      -r|--rename) rename=1; shift ;;
      -c|--clear) clear=1; shift ;;
      --) shift; break ;;
      *) break ;;
    esac
  done

  # Handle rename mode
  if (( rename )); then
    (( $# < 2 )) && { echo "Usage: gtag --rename old_gitname new_gitname"; return 1; }
    local old=$1 new=$2
    local -a tags
    tags=(${(f)"$(git tag | grep -E "^${old}/")"})
    (( ${#tags[@]} == 0 )) && { echo "No tags for ${old}"; return 0; }
    for tag in "${tags[@]}"; do
      local new_tag="${new}${tag#$old}"
      git tag "$new_tag" "$(git rev-parse "$tag")" &&
      git tag -d "$tag" &&
      echo "Renamed: $tag -> $new_tag"
    done
    return 0
  fi

  # Determine gitname from positional args or git config
  if [[ $# -gt 0 ]]; then
    gitname="$*"
  else
    gitname="$(git config user.name)"
  fi
  [[ -z "$gitname" ]] && { echo "Missing git name."; return 1; }
  if [[ "$gitname" == *" "* ]]; then
    gitname=$(echo "$gitname" | awk '{printf "%s%s", tolower(substr($1,1,1)), tolower($NF)}')
  else
    gitname=$(tr '[:upper:]' '[:lower:]' <<< "$gitname")
  fi

  # Handle clear mode: show matching tags and require confirmation
  if (( clear )); then
    local -a tags
    tags=(${(f)"$(git tag | grep -E "^${gitname}/")"})
    if (( ${#tags[@]} == 0 )); then
      echo "No tags to clear for ${gitname}"
      return 0
    fi
    echo "Tags to be deleted:"
    printf "  %s\n" "${tags[@]}"
    echo "Type 'Yes' to delete all these tags:"
    read -r answer
    if [[ "$answer" != "Yes" ]]; then
      echo "Aborted."
      return 0
    fi
    for tag in "${tags[@]}"; do
      git tag -d "$tag" && echo "Deleted: $tag"
    done
    return 0
  fi

  local today=$(date +"%Y-%m-%d")
  # Handle delete mode: Delete the latest tag for today.
  if (( delete )); then
    local tag=$(git tag | grep -E "^${gitname}/${today}/[0-9]+$" | sort -V | tail -n1)
    [[ -z "$tag" ]] && { echo "No tag for ${gitname} on ${today}"; return 1; }
    git tag -d "$tag" && echo "Deleted tag: $tag"
  else
    local max num tag
    max=$(git tag | grep -E "^${gitname}/${today}/" | sed "s#^${gitname}/${today}/##" | sort -n | tail -n1)
    num=$(( max ? max + 1 : 1 ))
    tag="${gitname}/${today}/${num}"
    git tag "$tag" && echo "Created tag: $tag"
  fi
}

function git-revert-ws() {
    mybranch=master
    git checkout -b tmp git-svn

    # compute the non-ws diff to mybranch and apply it
    git diff -U0 -w --no-color $mybranch | git apply -R --cached --ignore-whitespace --unidiff-zero -

    git commit -m "non ws changes"
    git reset --hard  # discard all non-staged data
}

function git-rename-remote-branch() {
    local old_branch=$1
    local new_branch=$2

    # Rename the local branch
    git branch -m $old_branch $new_branch

    # Delete the old branch on remote
    git push origin :$old_branch

    # Unset the upstream tracking branch
    git branch --unset-upstream $new_branch

    # Push the new branch to remote and set upstream
    git push origin $new_branch -u
}

