
## Aliases
################################################################################

alias bclean='git switch main && \
  git pull --prune --ff-only && \
  git branch --merged | egrep -v "(^\*|^\s*main|^\s*dev|^\s*rc|^\s*staging)" | xargs git branch -d; \
  git switch - &>/dev/null'
alias bcleanrc='git switch rc && git fetch --prune && git branch --merged | egrep -v "(^\*|^\s*main|^\s*dev|^\s*rc|^\s*staging)" | xargs git branch -d'

## Functions
################################################################################

Git() { vim -c ':sy on' +"Git $*" +only }

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

function gtag {
  local delete=0 rename=0 clear=0 gitname opts

  opts="$(getopt -o drc -l delete,rename,clear -- "$@")" || {
    print -u2 "Opts parsing failed"
    return 1
  }
  eval set -- "$opts"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -d|--delete) delete=1; shift ;;
      -r|--rename) rename=1; shift ;;
      -c|--clear)  clear=1;  shift ;;
      --) shift; break ;;
      *)  break ;;
    esac
  done

  # Rename mode
  (( rename )) && {
    (( $# < 2 )) && { print -u2 "Usage: gtag --rename old_gitname new_gitname"; return 1; }
    local old="$1" new="$2" tag new_tag
    local -a tags=( ${(f)"$(git tag | grep -E "^${old}/")"} )
    (( ${#tags[@]} == 0 )) && { print -u2 "No tags for ${old}"; return 0; }
    for tag in "${tags[@]}"; do
      new_tag="${new}${tag#$old}"
      git tag "$new_tag" "$(git rev-parse "$tag")" &&
      git tag -d "$tag" &&
      print -u2 "Renamed: $tag -> $new_tag"
    done
    return 0
  }

  # Figure out gitname
  if [[ $# -gt 0 ]]; then
    gitname="$*"
  else
    gitname="$(git config user.name)"
  fi
  [[ -z "$gitname" ]] && { print -u2 "Missing git name."; return 1; }

  # Simplify gitname if it has whitespace
  if [[ "$gitname" == *" "* ]]; then
    gitname="$(awk '{printf "%s%s", tolower(substr($1,1,1)), tolower($NF)}' <<< "$gitname")"
  else
    gitname="${(L)gitname}"
  fi

  # Clear mode
  (( clear )) && {
    local -a tags=( ${(f)"$(git tag | grep -E "^${gitname}/")"} )
    (( ${#tags[@]} == 0 )) && { print -u2 "No tags to clear for ${gitname}"; return 0; }
    print -u2 "Tags to be deleted:"
    printf >&2 "  %s\n" "${tags[@]}"
    print -u2 "Type 'Yes' to delete all these tags:"
    read -r answer
    [[ "$answer" != "Yes" ]] && { print -u2 "Aborted."; return 0; }
    for tag in "${tags[@]}"; do
      git tag -d "$tag" && print -u2 "Deleted: $tag"
    done
    return 0
  }

  local today="$(date +%Y-%m-%d)"

  # Delete mode
  if (( delete )); then
    local tag
    tag="$(git tag | grep -E "^${gitname}/${today}/[0-9]+$" | sort -V | tail -n1)"
    [[ -z "$tag" ]] && { print -u2 "No tag for ${gitname} on ${today}"; return 1; }
    git tag -d "$tag" && print -u2 "Deleted tag: $tag"
  else
    local max num tag
    max="$(git tag | grep -E "^${gitname}/${today}/" | sed "s#^${gitname}/${today}/##" | sort -n | tail -n1)"
    num=$(( max ? max + 1 : 1 ))
    tag="${gitname}/${today}/${num}"
    git tag "$tag" && print -u2 "Created tag: $tag"
  fi
}

function git-ws {
  # Check if we're inside a Git repo.
  git rev-parse --is-inside-work-tree &>/dev/null || {
    print -u2 "Not a git repository."
    return 1
  }

  local ref=HEAD show_patch=0 reset=1 patch opts

  # Parse arguments with getopt.
  opts="$(getopt -o phk -l patch,help,keep-index -- "$@")" || {
    print -u2 "Failed to parse options."
    return 1
  }
  eval set -- "$opts"

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -p|--patch) show_patch=1; shift ;;
      -k|--keep-index) reset=0; shift ;;
      -h|--help)
        print -- "Usage: git-ws [--patch|-p] [--keep-index] [--help|-h]"
        print -- "  -p, --patch:      Show only the patch"
        print -- "  -k, --keep-index: Don't reset index before applying"
        print -- "  -h, --help:       Print this help"
        return 0
        ;;
      --) shift; break ;;
      *)  break ;;
    esac
  done

  # Verify that the specified ref exists.
  git rev-parse --verify "$ref" &>/dev/null || {
    print -u2 "Reference '$ref' does not exist."
    return 1
  }

  # Grab patch, ignoring whitespace changes.
  patch="$(git diff -U0 -w --ignore-all-space --ignore-blank-lines --no-color "$ref")"
  [[ -z $patch ]] && { print -- "No non-whitespace changes found."; return 0 }

  (( show_patch )) && { print -- "$patch"; return 0 }
  (( reset )) && git reset
  git apply --cached --unidiff-zero - <<<"$patch"
}

function git-rename-remote-branch {
  # Verify arguments
  [[ $# -lt 2 ]] && {
    print -u2 "Usage: git-rename-remote-branch <old_branch> <new_branch>"
    return 1
  }

  local old_branch="$1" new_branch="$2"

  # Rename local branch
  git branch -m "$old_branch" "$new_branch" || { print -u2 "Failed to rename local branch."; return 1 }

  # Delete old branch on remote
  git push origin :"$old_branch" || { print -u2 "Failed to delete old remote branch."; return 1 }

  # Unset upstream for the new branch (if any)
  git branch --unset-upstream "$new_branch" &>/dev/null

  # Push the new branch and set it to track
  git push -u origin "$new_branch" || { print -u2 "Failed to push new branch."; return 1 }

  print -u2 "Renamed remote branch: $old_branch -> $new_branch"
}

function git-skip {
  # Get all modified files (both staged and unstaged)
  local MODIFIED_FILES=$(git status --porcelain | grep -E '^ M|^M |^MM' | awk '{print $2}')
  local UNTRACKED_FILES=$(git status --porcelain | grep -E '^\?\?' | awk '{print $2}')

  echo "Setting skip-worktree for modified files:"
  # Set skip-worktree bit for each modified file
  for file in $MODIFIED_FILES; do
      git update-index --skip-worktree "$file"
      echo "  Set skip-worktree for $file"
  done

  if [ -n "$UNTRACKED_FILES" ]; then
      echo -e "\nWarning: Found untracked files that can't be marked with skip-worktree:"
      for file in $UNTRACKED_FILES; do
          echo "  $file"
      done
      echo "Consider adding these files to the repository first if you want to skip-worktree them."
  fi

  echo -e "\nDone. Files will now be ignored by Git."
}

function git-unskip {
  # Get all files with skip-worktree set
  local SKIP_WORKTREE_FILES=$(git ls-files -v | grep "^S" | awk '{print $2}')

  # Remove skip-worktree bit
  for file in $SKIP_WORKTREE_FILES; do
      git update-index --no-skip-worktree "$file"
      echo "Removed skip-worktree for $file"
  done
}

# Load git-specific functions
if [[ -f "$HOME/.zsh/git_update_mr.zsh" ]]; then
  source "$HOME/.zsh/git_update_mr.zsh"
fi

if [[ -f "$HOME/.zsh/gitbr.zsh" ]]; then
  source "$HOME/.zsh/gitbr.zsh"
fi

