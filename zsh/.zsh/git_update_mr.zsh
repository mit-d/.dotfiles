# git_update_mr - Update merge request information with git commits
# Compatible with macOS, Linux, and other POSIX systems

# Function to display usage information
_git_update_mr_usage() {
    cat << 'EOF'
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
_git_update_mr_command_exists() { command -v "$1" >/dev/null 2>&1; }

# Function to create a temporary backup (cross-platform)
_git_update_mr_create_backup() { 
    local file="$1" backup="${file}.bak.$(date +%s)"
    cp "$file" "$backup" && print "$backup"
}

# Function to handle sed operations (cross-platform)
_git_update_mr_remove_commits_block() {
    local file="$1" backup sed_exit_code
    
    if ! backup=$(_git_update_mr_create_backup "$file"); then
        print -u2 "Error: Failed to create backup"; return 1
    fi
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' '/^# Commits$/,$d' "$file"
        sed_exit_code=$?
    else
        sed -i '/^# Commits$/,$d' "$file"
        sed_exit_code=$?
    fi
    
    if [[ $sed_exit_code -ne 0 ]]; then
        print -u2 "Error: sed operation failed, restoring backup"
        mv "$backup" "$file"
        return 1
    fi
    
    rm -f "$backup"
}

# Function to validate file path
_git_update_mr_validate_file_path() {
    local file="$1" dir
    
    # Handle relative paths properly
    if [[ "$file" == */* ]]; then
        dir="${file:h}"
    else
        dir="."
    fi
    
    if [[ ! -d "$dir" ]]; then
        print -u2 "Error: Directory '$dir' does not exist"
        return 1
    fi
    
    if [[ ! -w "$dir" ]]; then
        print -u2 "Error: Cannot write to directory '$dir'"
        return 1
    fi
}

# Function to sync description from GitLab
_git_update_mr_sync_from_gitlab() {
    local info_file="$1"
    
    if ! _git_update_mr_command_exists glab; then
        print -u2 "Error: glab command not found. Install GitLab CLI to enable sync functionality."
        return 1
    fi
    
    print -u2 "Syncing description from GitLab..."
    
    local mr_description
    if ! mr_description=$(glab mr view --output json 2>/dev/null | jq -r '.description // ""' 2>/dev/null); then
        print -u2 "Warning: Failed to fetch merge request description from GitLab"
        return 1
    fi
    
    if [[ -z "$mr_description" || "$mr_description" == "null" ]]; then
        print -u2 "No description found on GitLab merge request"
        return 0
    fi
    
    # Create backup before overwriting
    local backup
    if [[ -f "$info_file" ]]; then
        if ! backup=$(_git_update_mr_create_backup "$info_file"); then
            print -u2 "Error: Failed to create backup before sync"
            return 1
        fi
    fi
    
    # Write the downloaded description to the file
    if ! print "$mr_description" > "$info_file"; then
        print -u2 "Error: Failed to write synced description to file"
        if [[ -n "$backup" ]]; then
            mv "$backup" "$info_file"
        fi
        return 1
    fi
    
    if [[ -n "$backup" ]]; then
        rm -f "$backup"
    fi
    
    print -u2 "Successfully synced description from GitLab"
    return 0
}

get_mr_file() {
  local mr_number=$(glab mr view | awk 'NR == 8 { print $2 }')
  local mr_dir="${GLAB_MR_FILE_DIR:-${HOME}/Documents}"
  print "${mr_dir}/mr-$mr_number.md"
}

# Main function
_git_update_mr() {
    setopt LOCAL_OPTIONS ERR_EXIT PIPE_FAIL
    
    local enable_edit=false upload=false sync=false info_file="" show_help=false
    local -A opts
    local -a remaining_args

    # Parse command line arguments using zsh zparseopts
    if ! zparseopts -D -A opts e -edit u -upload s -sync f: h -help; then
        print -u2 "Error: Invalid options"
        print -u2 "Use -h or --help for usage information"
        return 1
    fi

    # Check if we're in a git repository
    if ! git rev-parse --git-dir &>/dev/null; then
        echo "Error: Not in a git repository" >&2
        _git_update_mr_usage
        return 1
    fi

    # Store remaining arguments
    remaining_args=("$@")

    # Process parsed options - check if key exists in array (not if value is non-empty)
    [[ -v "opts[-e]" || -v "opts[--edit]" ]] && enable_edit=true
    [[ -v "opts[-u]" || -v "opts[--upload]" ]] && upload=true
    [[ -v "opts[-s]" || -v "opts[--sync]" ]] && sync=true
    [[ -v "opts[-h]" || -v "opts[--help]" ]] && show_help=true
    [[ -v "opts[-f]" ]] && info_file="${opts[-f]}"

    # Show help if requested
    if [[ "$show_help" == true ]]; then
        _git_update_mr_usage
        return 0
    fi

    # Set default info file if not provided
    if [[ -z "$info_file" ]]; then
        if _git_update_mr_command_exists get_mr_file; then
            if ! info_file=$(get_mr_file); then
                print -u2 "Error: get_mr_file function failed"
                return 1
            fi
        else
            print -u2 "Error: get_mr_file function not found and no file specified with -f"
            return 1
        fi
    fi

    # Validate info file path
    if ! _git_update_mr_validate_file_path "$info_file"; then
        return 1
    fi

    # Set default base and target from remaining arguments
    local base="${remaining_args[1]:-origin/main}"
    local target="${remaining_args[2]:-HEAD}"

    # Validate git_summary function exists
    if ! _git_update_mr_command_exists git_summary; then
        print -u2 "Error: git_summary function not found"
        return 1
    fi

    # Sync from GitLab if requested
    if [[ "$sync" == true ]]; then
        if ! _git_update_mr_sync_from_gitlab "$info_file"; then
            # Continue execution even if sync fails, unless it's a critical error
            if [[ $? -eq 1 && ! -f "$info_file" ]]; then
                print -u2 "Error: Sync failed and no local file exists"
                return 1
            fi
        fi
    fi

    # If file doesn't exist and we're not editing, just show commits
    if [[ ! -f "$info_file" && "$enable_edit" != true ]]; then
        print -u2 "Info file not found, showing commit summary:"
        git_summary "$base" "$target"
        return 0
    fi

    # Create template file if it doesn't exist
    if [[ ! -f "$info_file" ]]; then
        if ! cat > "$info_file" << 'EOF'
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
        then
            print -u2 "Error: Failed to create info file: $info_file"
            return 1
        fi
        print -u2 "Created new info file: $info_file"
    fi

    # Open editor if requested
    if [[ "$enable_edit" == true ]]; then
        local editor="${EDITOR:-}"
        local -a editor_candidates=(code cursor nano vim vi)
        
        if [[ -z "$editor" ]]; then
            for candidate in $editor_candidates; do
                if _git_update_mr_command_exists "$candidate"; then
                    editor="$candidate"
                    break
                fi
            done
        fi
        
        if [[ -z "$editor" ]]; then
            print -u2 "Error: No suitable editor found. Set EDITOR environment variable."
            return 1
        fi
        
        print -u2 "Opening $info_file in $editor..."
        if ! "$editor" "$info_file"; then
            print -u2 "Warning: Editor exited with non-zero status"
        fi
    fi

    # Remove existing commits section and append new one
    if ! _git_update_mr_remove_commits_block "$info_file"; then
        print -u2 "Error: Failed to update commits section"
        return 1
    fi
    
    if ! { print "# Commits\n\n-----"; print ""; git_summary "$base" "$target"; } >> "$info_file"; then
        print -u2 "Error: Failed to append commits section"
        return 1
    fi
    
    print -u2 "Successfully updated $info_file"

    # Upload to GitLab if requested
    if [[ "$upload" == true ]]; then
        if _git_update_mr_command_exists glab; then
            print -u2 "Uploading to GitLab..."
            if glab mr update -d "$(cat "$info_file")"; then
                print -u2 "Successfully updated GitLab merge request"
            else
                print -u2 "Warning: Failed to update GitLab merge request"
                return 1
            fi
        else
            print -u2 "Warning: glab command not found. Install GitLab CLI to enable upload functionality."
            return 1
        fi
    fi
}

# Helper function for git branch completion
_git_branch_names() {
    local -a branches
    branches=(${(f)"$(git branch -a 2>/dev/null | sed 's/^[* ] //' | sed 's/^remotes\///')"})
    _describe 'git branches' branches
}

# Tab completion for git_update_mr
_git_update_mr_completion() {
    local -a options=(
        '-e[Enable editing of the info file]' 
        '--edit[Enable editing of the info file]' 
        '-u[Upload to GitLab using glab command]' 
        '--upload[Upload to GitLab using glab command]' 
        '-s[Download description from GitLab before editing]' 
        '--sync[Download description from GitLab before editing]' 
        '-f[Use specific info file]:file:_files' 
        '-h[Show help message]' 
        '--help[Show help message]'
    )
    _arguments -s $options '1:base branch:_git_branch_names' '2:target branch:_git_branch_names'
}

git_update_mr() {
    # Wrapper that catches any exits from the main function
    if _git_update_mr "$@"; then
        return 0
    else
        local exit_code=$?
        print -u2 "git_update_mr failed with exit code: $exit_code"
        return $exit_code
    fi
}


# Register completion function
compdef _git_update_mr_completion git_update_mr
