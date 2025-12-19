
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

# Glob patterns for project files to exclude from local commits
GIT_COMMIT_LOCAL_PROJECT_GLOBS=(
  "*.ts"
  "*.html"
  "*.scss"
  "jaguar/**/*.py"
)

# Glob patterns for files to explicitly include as project files
GIT_COMMIT_LOCAL_PROJECT_INCLUDE_GLOBS=(
  "jaguar/**/settings.py"
  "jaguar/manage.py"
  "jaguar/bbp/tests/*runner.py"
  "jaguar/jaguar/jaguar_log.py"
)

function git-commit-project-files {
  # 1. Stage everything initially
  git add -A

  # 2. Unstage excluded files in batch (much faster than looping git reset)
  # We construct a list of files matching the exclude patterns that are currently staged
  local excluded_files
  excluded_files=$(git diff --name-only --cached -- "${GIT_COMMIT_LOCAL_PROJECT_GLOBS[@]}" 2>/dev/null)
  
  if [[ -n "$excluded_files" ]]; then
    # We use xargs to handle long lists of files safely
    echo "$excluded_files" | xargs -r git reset -q --
  fi

  # 3. Re-stage specifically included exceptions
  # (Only if the pattern matches actual files to avoid errors)
  for pattern in "${GIT_COMMIT_LOCAL_PROJECT_INCLUDE_GLOBS[@]}"; do
    git add -- "$pattern" 2>/dev/null
  done

  # 4. Check if we have anything left to commit
  if git diff --cached --quiet; then
    echo "No local files to commit." >&2
    return 0
  fi

  # 5. Get the Tree Hash of the current index
  # This represents the exact state of the project files we are about to commit.
  # It is much faster and more accurate than piping diff to sha256sum.
  local current_tree_hash
  current_tree_hash=$(git write-tree)

  # 6. Check for duplicate states
  # We look for any commit pointed to by our tags that has the EXACT same tree.
  # This replaces the slow loop with a single fast lookup.
  local existing_commit
  existing_commit=$(git log --tags="misc/local-files/*" --format="%T %H" | \
    grep "^$current_tree_hash" | head -n 1 | awk '{print $2}')

  # 7. Commit and Tag
  local timestamp
  timestamp=$(date -u +"%Y-%m-%dT%H%M%SZ")
  
  if git commit --no-verify -q -m "FIXME: LOCAL FILES: $timestamp"; then
    if [[ -n "$existing_commit" ]]; then
      echo "Identical state already exists in commit: ${existing_commit:0:8}" >&2
      echo "Created commit: FIXME: LOCAL FILES: $timestamp" >&2
    else
      git tag "misc/local-files/$timestamp"
      echo "Created commit and tag: misc/local-files/$timestamp" >&2
    fi
  else
    echo "Failed to create commit." >&2
    return 1
  fi
}


# Load git-specific functions
if [[ -f "$HOME/.zsh/git_skip.zsh" ]]; then
  source "$HOME/.zsh/git_skip.zsh"
fi

if [[ -f "$HOME/.zsh/git_update_mr.zsh" ]]; then
  source "$HOME/.zsh/git_update_mr.zsh"
fi

if [[ -f "$HOME/.zsh/gitbr.zsh" ]]; then
  source "$HOME/.zsh/gitbr.zsh"
fi

