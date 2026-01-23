# git_update_mr - Update merge request information with git commits
# POSIX-compliant shell script

# Function to display usage information
_git_update_mr_usage() {
	cat <<'EOF'
Usage: git_update_mr [OPTIONS] [BASE] [TARGET]

Update merge request information with git commit summary.

OPTIONS:
    -e, --edit      Enable editing of the info file
    -u, --upload    Upload to GitLab using glab command
    -s, --sync      Download description from GitLab before editing
    -f FILE         Use specific info file (default: from get_mr_file)
    -h, --help      Show this help message

ARGUMENTS:
    BASE            Base branch (default: origin/main)
    TARGET          Target branch/commit (default: HEAD)

EXAMPLES:
    git_update_mr
    git_update_mr -e -u
    git_update_mr -s -e -u
    git_update_mr -f my_mr.md origin/develop feature-branch
EOF
}

# Function to check if a command exists
_git_update_mr_command_exists() {
	command -v "$1" >/dev/null 2>&1
}

# Function to create a temporary backup (cross-platform)
_git_update_mr_create_backup() {
	file="$1"
	backup="${file}.bak.$(date +%s)"
	cp "$file" "$backup" && printf '%s\n' "$backup"
}

# Function to handle sed operations (cross-platform)
_git_update_mr_remove_commits_block() {
	file="$1"
	backup=""
	sed_exit_code=0

	backup=$(_git_update_mr_create_backup "$file") || {
		printf '%s\n' "Error: Failed to create backup" >&2
		return 1
	}

	# Detect OS for sed compatibility
	case "$(uname -s)" in
	Darwin*)
		sed -i '' '/^# Commits$/,$d' "$file"
		sed_exit_code=$?
		;;
	*)
		sed -i '/^# Commits$/,$d' "$file"
		sed_exit_code=$?
		;;
	esac

	if [ "$sed_exit_code" -ne 0 ]; then
		printf '%s\n' "Error: sed operation failed, restoring backup" >&2
		mv "$backup" "$file"
		return 1
	fi

	rm -f "$backup"
}

# Function to validate file path
_git_update_mr_validate_file_path() {
	file="$1"
	dir=""

	# Handle relative paths properly
	case "$file" in
	*/*)
		dir=$(dirname "$file")
		;;
	*)
		dir="."
		;;
	esac

	if [ ! -d "$dir" ]; then
		printf '%s\n' "Error: Directory '$dir' does not exist" >&2
		return 1
	fi

	if [ ! -w "$dir" ]; then
		printf '%s\n' "Error: Cannot write to directory '$dir'" >&2
		return 1
	fi
}

# Function to sync description from GitLab
_git_update_mr_sync_from_gitlab() {
	info_file="$1"

	if ! _git_update_mr_command_exists glab; then
		printf '%s\n' "Error: glab command not found. Install GitLab CLI to enable sync functionality." >&2
		return 1
	fi

	printf '%s\n' "Syncing description from GitLab..." >&2

	mr_description=$(glab mr view --output json 2>/dev/null | jq -r '.description // ""' 2>/dev/null) || {
		printf '%s\n' "Warning: Failed to fetch merge request description from GitLab" >&2
		return 1
	}

	if [ -z "$mr_description" ] || [ "$mr_description" = "null" ]; then
		printf '%s\n' "No description found on GitLab merge request" >&2
		return 0
	fi

	# Create backup before overwriting
	backup=""
	if [ -f "$info_file" ]; then
		backup=$(_git_update_mr_create_backup "$info_file") || {
			printf '%s\n' "Error: Failed to create backup before sync" >&2
			return 1
		}
	fi

	# Write the downloaded description to the file
	printf '%s\n' "$mr_description" >"$info_file" || {
		printf '%s\n' "Error: Failed to write synced description to file" >&2
		if [ -n "$backup" ]; then
			mv "$backup" "$info_file"
		fi
		return 1
	}

	if [ -n "$backup" ]; then
		rm -f "$backup"
	fi

	printf '%s\n' "Successfully synced description from GitLab" >&2
	return 0
}

get_mr_file() {
	mr_number=$(glab mr view | awk 'NR == 8 { print $2 }')
	mr_dir="${GLAB_MR_FILE_DIR:-${HOME}/Documents}"
	printf '%s\n' "${mr_dir}/mr-$mr_number.md"
}

# Main function
git_update_mr() {
	enable_edit=false
	upload=false
	sync=false
	info_file=""
	show_help=false

	# Parse command line arguments using getopts
	OPTIND=1
	while getopts "eusf:h-:" opt; do
		case "$opt" in
		e) enable_edit=true ;;
		u) upload=true ;;
		s) sync=true ;;
		f) info_file="$OPTARG" ;;
		h) show_help=true ;;
		-)
			# Handle long options
			case "$OPTARG" in
			edit) enable_edit=true ;;
			upload) upload=true ;;
			sync) sync=true ;;
			help) show_help=true ;;
			*)
				printf '%s\n' "Unknown option: --$OPTARG" >&2
				return 1
				;;
			esac
			;;
		*)
			printf '%s\n' "Error: Invalid options" >&2
			printf '%s\n' "Use -h or --help for usage information" >&2
			return 1
			;;
		esac
	done
	shift $((OPTIND - 1))

	# Check if we're in a git repository
	if ! git rev-parse --git-dir >/dev/null 2>&1; then
		echo "Error: Not in a git repository" >&2
		_git_update_mr_usage
		return 1
	fi

	# Show help if requested
	if [ "$show_help" = true ]; then
		_git_update_mr_usage
		return 0
	fi

	# Set default info file if not provided
	if [ -z "$info_file" ]; then
		if _git_update_mr_command_exists get_mr_file; then
			info_file=$(get_mr_file) || {
				printf '%s\n' "Error: get_mr_file function failed" >&2
				return 1
			}
		else
			printf '%s\n' "Error: get_mr_file function not found and no file specified with -f" >&2
			return 1
		fi
	fi

	# Validate info file path
	if ! _git_update_mr_validate_file_path "$info_file"; then
		return 1
	fi

	# Set default base and target from remaining arguments
	base="${1:-origin/main}"
	target="${2:-HEAD}"

	# Validate git_summary function exists
	if ! _git_update_mr_command_exists git_summary; then
		printf '%s\n' "Error: git_summary function not found" >&2
		return 1
	fi

	# Sync from GitLab if requested
	if [ "$sync" = true ]; then
		_git_update_mr_sync_from_gitlab "$info_file" || {
			# Continue execution even if sync fails, unless it's a critical error
			if [ ! -f "$info_file" ]; then
				printf '%s\n' "Error: Sync failed and no local file exists" >&2
				return 1
			fi
		}
	fi

	# If file doesn't exist and we're not editing, just show commits
	if [ ! -f "$info_file" ] && [ "$enable_edit" != true ]; then
		printf '%s\n' "Info file not found, showing commit summary:" >&2
		git_summary "$base" "$target"
		return 0
	fi

	# Create template file if it doesn't exist
	if [ ! -f "$info_file" ]; then
		if ! cat >"$info_file" <<'EOF'; then
# Summary

-----

_TBD_

## Screenshots and Examples

<details>
<summary>Click to expand</summary>

### _TBD_

![Title](){width=960}

</details>

# Testing

-----

<details>
<summary>Click to expand</summary>

## Local Environment Setup

|                     |                                   |
|---------------------|-----------------------------------|
| C1 Business Type    | `Home Warranty`                   |
| Angular Application | `warranty_dash`, `affiliate_dash` |
| Depot Database      | `rc`                              |


## Testing Instructions

_TBD_

## Test Coverage

_TBD_

</details>

# Commits
EOF
			printf '%s\n' "Error: Failed to create info file: $info_file" >&2
			return 1
		fi
		printf '%s\n' "Created new info file: $info_file" >&2
	fi

	# Open editor if requested
	if [ "$enable_edit" = true ]; then
		editor="${EDITOR:-}"

		if [ -z "$editor" ]; then
			for candidate in code cursor nano vim vi; do
				if _git_update_mr_command_exists "$candidate"; then
					editor="$candidate"
					break
				fi
			done
		fi

		if [ -z "$editor" ]; then
			printf '%s\n' "Error: No suitable editor found. Set EDITOR environment variable." >&2
			return 1
		fi

		printf '%s\n' "Opening $info_file in $editor..." >&2
		"$editor" "$info_file" || {
			printf '%s\n' "Warning: Editor exited with non-zero status" >&2
		}
	fi

	# Remove existing commits section and append new one
	if ! _git_update_mr_remove_commits_block "$info_file"; then
		printf '%s\n' "Error: Failed to update commits section" >&2
		return 1
	fi

	{
		printf '%s\n\n-----\n' "# Commits"
		git_summary "$base" "$target"
	} >>"$info_file" || {
		printf '%s\n' "Error: Failed to append commits section" >&2
		return 1
	}

	printf '%s\n' "Successfully updated $info_file" >&2

	# Upload to GitLab if requested
	if [ "$upload" = true ]; then
		if _git_update_mr_command_exists glab; then
			printf '%s\n' "Uploading to GitLab..." >&2
			if glab mr update -d "$(cat "$info_file")"; then
				printf '%s\n' "Successfully updated GitLab merge request" >&2
			else
				printf '%s\n' "Warning: Failed to update GitLab merge request" >&2
				return 1
			fi
		else
			printf '%s\n' "Warning: glab command not found. Install GitLab CLI to enable upload functionality." >&2
			return 1
		fi
	fi
}
