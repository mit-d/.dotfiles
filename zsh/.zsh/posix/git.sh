# git.sh - Git helper functions
# POSIX-compliant shell script

## Aliases
alias bclean='git switch main && \
  git pull --prune --ff-only && \
  git branch --merged | grep -E -v "(^\*|^\s*main|^\s*dev|^\s*rc|^\s*staging)" | xargs git branch -d; \
  git switch - >/dev/null 2>&1'
alias bcleanrc='git switch rc && git fetch --prune && git branch --merged | grep -E -v "(^\*|^\s*main|^\s*dev|^\s*rc|^\s*staging)" | xargs git branch -d'

## Functions

Git() {
	vim -c ':sy on' +"Git $*" +only
}

git_summary() {
	base=${1:-origin/main}
	target=${2:-HEAD}
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

gtag() {
	delete=0
	rename=0
	clear=0
	gitname=""

	opts=$(getopt -o drc -l delete,rename,clear -- "$@") || {
		printf '%s\n' "Opts parsing failed" >&2
		return 1
	}
	eval set -- "$opts"

	while [ $# -gt 0 ]; do
		case "$1" in
		-d | --delete)
			delete=1
			shift
			;;
		-r | --rename)
			rename=1
			shift
			;;
		-c | --clear)
			clear=1
			shift
			;;
		--)
			shift
			break
			;;
		*) break ;;
		esac
	done

	# Rename mode
	if [ "$rename" -eq 1 ]; then
		if [ $# -lt 2 ]; then
			printf '%s\n' "Usage: gtag --rename old_gitname new_gitname" >&2
			return 1
		fi
		old="$1"
		new="$2"
		tags=$(git tag | grep -E "^${old}/")
		if [ -z "$tags" ]; then
			printf '%s\n' "No tags for ${old}" >&2
			return 0
		fi
		printf '%s\n' "$tags" | while IFS= read -r tag; do
			new_tag="${new}${tag#"$old"}"
			git tag "$new_tag" "$(git rev-parse "$tag")" &&
				git tag -d "$tag" &&
				printf '%s\n' "Renamed: $tag -> $new_tag" >&2
		done
		return 0
	fi

	# Figure out gitname
	if [ $# -gt 0 ]; then
		gitname="$*"
	else
		gitname=$(git config user.name)
	fi
	if [ -z "$gitname" ]; then
		printf '%s\n' "Missing git name." >&2
		return 1
	fi

	# Simplify gitname if it has whitespace
	case "$gitname" in
	*" "*)
		gitname=$(printf '%s' "$gitname" | awk '{printf "%s%s", tolower(substr($1,1,1)), tolower($NF)}')
		;;
	*)
		gitname=$(printf '%s' "$gitname" | tr '[:upper:]' '[:lower:]')
		;;
	esac

	# Clear mode
	if [ "$clear" -eq 1 ]; then
		tags=$(git tag | grep -E "^${gitname}/")
		if [ -z "$tags" ]; then
			printf '%s\n' "No tags to clear for ${gitname}" >&2
			return 0
		fi
		printf '%s\n' "Tags to be deleted:" >&2
		printf '%s\n' "$tags" | while IFS= read -r t; do
			printf '  %s\n' "$t" >&2
		done
		printf '%s\n' "Type 'Yes' to delete all these tags:" >&2
		read -r answer
		if [ "$answer" != "Yes" ]; then
			printf '%s\n' "Aborted." >&2
			return 0
		fi
		printf '%s\n' "$tags" | while IFS= read -r tag; do
			git tag -d "$tag" && printf '%s\n' "Deleted: $tag" >&2
		done
		return 0
	fi

	today=$(date +%Y-%m-%d)

	# Delete mode
	if [ "$delete" -eq 1 ]; then
		tag=$(git tag | grep -E "^${gitname}/${today}/[0-9]+$" | sort -V | tail -n1)
		if [ -z "$tag" ]; then
			printf '%s\n' "No tag for ${gitname} on ${today}" >&2
			return 1
		fi
		git tag -d "$tag" && printf '%s\n' "Deleted tag: $tag" >&2
	else
		max=$(git tag | grep -E "^${gitname}/${today}/" | sed "s#^${gitname}/${today}/##" | sort -n | tail -n1)
		if [ -n "$max" ]; then
			num=$((max + 1))
		else
			num=1
		fi
		tag="${gitname}/${today}/${num}"
		git tag "$tag" && printf '%s\n' "Created tag: $tag" >&2
	fi
}

git_ws() {
	# Check if we're inside a Git repo
	git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
		printf '%s\n' "Not a git repository." >&2
		return 1
	}

	ref=HEAD
	show_patch=0
	reset=1

	# Parse arguments with getopt
	opts=$(getopt -o phk -l patch,help,keep-index -- "$@") || {
		printf '%s\n' "Failed to parse options." >&2
		return 1
	}
	eval set -- "$opts"

	while [ $# -gt 0 ]; do
		case "$1" in
		-p | --patch)
			show_patch=1
			shift
			;;
		-k | --keep-index)
			reset=0
			shift
			;;
		-h | --help)
			printf '%s\n' "Usage: git-ws [--patch|-p] [--keep-index] [--help|-h]"
			printf '%s\n' "  -p, --patch:      Show only the patch"
			printf '%s\n' "  -k, --keep-index: Don't reset index before applying"
			printf '%s\n' "  -h, --help:       Print this help"
			return 0
			;;
		--)
			shift
			break
			;;
		*) break ;;
		esac
	done

	# Verify that the specified ref exists
	git rev-parse --verify "$ref" >/dev/null 2>&1 || {
		printf '%s\n' "Reference '$ref' does not exist." >&2
		return 1
	}

	# Grab patch, ignoring whitespace changes
	patch=$(git diff -U0 -w --ignore-all-space --ignore-blank-lines --no-color "$ref")
	if [ -z "$patch" ]; then
		printf '%s\n' "No non-whitespace changes found."
		return 0
	fi

	if [ "$show_patch" -eq 1 ]; then
		printf '%s\n' "$patch"
		return 0
	fi

	if [ "$reset" -eq 1 ]; then
		git reset
	fi

	printf '%s\n' "$patch" | git apply --cached --unidiff-zero -
}

git_rename_remote_branch() {
	# Verify arguments
	if [ $# -lt 2 ]; then
		printf '%s\n' "Usage: git-rename-remote-branch <old_branch> <new_branch>" >&2
		return 1
	fi

	old_branch="$1"
	new_branch="$2"

	# Rename local branch
	git branch -m "$old_branch" "$new_branch" || {
		printf '%s\n' "Failed to rename local branch." >&2
		return 1
	}

	# Delete old branch on remote
	git push origin :"$old_branch" || {
		printf '%s\n' "Failed to delete old remote branch." >&2
		return 1
	}

	# Unset upstream for the new branch (if any)
	git branch --unset-upstream "$new_branch" 2>/dev/null

	# Push the new branch and set it to track
	git push -u origin "$new_branch" || {
		printf '%s\n' "Failed to push new branch." >&2
		return 1
	}

	printf '%s\n' "Renamed remote branch: $old_branch -> $new_branch" >&2
}

# Glob patterns stored as newline-separated strings (POSIX-compatible)
GIT_COMMIT_LOCAL_PROJECT_GLOBS='*.ts
*.html
*.scss
jaguar/**/*.py'

GIT_COMMIT_LOCAL_PROJECT_INCLUDE_GLOBS='jaguar/**/settings.py
jaguar/manage.py
jaguar/bbp/tests/*runner.py
jaguar/jaguar/jaguar_log.py'

git_commit_project_files() {
	apply=0

	opts=$(getopt -o ah -l apply,help -- "$@") || {
		printf '%s\n' "Failed to parse options." >&2
		return 1
	}
	eval set -- "$opts"

	while [ $# -gt 0 ]; do
		case "$1" in
		-a | --apply)
			apply=1
			shift
			;;
		-h | --help)
			printf '%s\n' "Usage: git-commit-project-files [-a|--apply] [-h|--help]"
			printf '%s\n' "  -a, --apply: Apply the most recent tagged project files commit"
			printf '%s\n' "  -h, --help:  Print this help"
			return 0
			;;
		--)
			shift
			break
			;;
		*) break ;;
		esac
	done

	# Apply mode: cherry-pick the most recent misc/local-files/* tagged commit
	if [ "$apply" -eq 1 ]; then
		latest_tag=$(git tag -l --sort=-creatordate "misc/local-files/*" | head -n 1)
		if [ -z "$latest_tag" ]; then
			printf '%s\n' "No misc/local-files/* tags found." >&2
			return 1
		fi
		printf '%s\n' "Applying: $latest_tag" >&2
		git cherry-pick --no-commit "$latest_tag" || {
			printf '%s\n' "Cherry-pick failed. Resolve conflicts or run 'git cherry-pick --abort'." >&2
			return 1
		}
		printf '%s\n' "Applied changes from $latest_tag (unstaged)" >&2
		return 0
	fi

	# 1. Stage everything initially
	git add -A

	# 2. Unstage excluded files
	# Build git reset arguments from glob patterns
	printf '%s\n' "$GIT_COMMIT_LOCAL_PROJECT_GLOBS" | while IFS= read -r pattern; do
		[ -n "$pattern" ] && git reset -q -- "$pattern" 2>/dev/null
	done

	# 3. Re-stage specifically included exceptions
	printf '%s\n' "$GIT_COMMIT_LOCAL_PROJECT_INCLUDE_GLOBS" | while IFS= read -r pattern; do
		[ -n "$pattern" ] && git add -- "$pattern" 2>/dev/null
	done

	# 4. Check if we have anything left to commit
	if git diff --cached --quiet; then
		echo "No local files to commit." >&2
		return 0
	fi

	# 5. Get the Tree Hash of the current index
	current_tree_hash=$(git write-tree)

	# 6. Check for duplicate states
	existing_commit=$(git log --tags="misc/local-files/*" --format="%T %H" |
		grep "^$current_tree_hash" | head -n 1 | awk '{print $2}')

	# 7. Commit and Tag
	timestamp=$(date -u +"%Y-%m-%dT%H%M%SZ")

	if git commit --no-verify -q -m "FIXME: LOCAL FILES: $timestamp"; then
		if [ -n "$existing_commit" ]; then
			echo "Identical state already exists in commit: $(printf '%.8s' "$existing_commit")" >&2
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

# Append a commit to git-blame-ignore-revs with a comment
git_ignore_rev() {
	rev="${1:-HEAD}"
	
	# Get the configured ignore-revs file, default to .git-blame-ignore-revs
	ignore_file=$(git config blame.ignoreRevsFile 2>/dev/null) || ignore_file=".git-blame-ignore-revs"
	
	# Get the full commit hash
	full_hash=$(git rev-parse "$rev" 2>/dev/null) || {
		echo "Error: Invalid revision '$rev'" >&2
		return 1
	}
	
	# Get the first line of the commit message
	commit_msg=$(git log -1 --format='%s' "$full_hash")
	
	# Append to the file
	printf '%s # %s\n' "$full_hash" "$commit_msg" >> "$ignore_file"
	
	echo "Added: $full_hash # $commit_msg"
}

gwt() {
    git worktree add -B "$1" "../$1"
}
