#!/usr/bin/env bash

# git_update_mr - Update merge request information with git commits
# Compatible with macOS, Linux, and other POSIX systems

set -euo pipefail # Exit on error, undefined vars, and pipe failures

# Function to display usage information
usage() {
    cat <<EOF
Usage: git_update_mr [OPTIONS] [BASE] [TARGET]

Update merge request information with git commit summary.

OPTIONS:
    -e              Enable editing of the info file
    -u              Upload to GitLab using glab command
    -f FILE         Use specific info file (default: from get_mr_file)
    -h, --help      Show this help message

ARGUMENTS:
    BASE            Base branch (default: origin/main)
    TARGET          Target branch/commit (default: HEAD)

EXAMPLES:
    git_update_mr
    git_update_mr -e -u
    git_update_mr -f my_mr.md origin/develop feature-branch
EOF
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to create a temporary backup (cross-platform)
create_backup() {
    local file="$1"
    local backup
    backup="${file}.bak.$(date +%s)"
    cp "$file" "$backup"
    echo "$backup"
}

# Function to handle sed operations (cross-platform)
remove_commits_block() {
    local file="$1"

    # Create backup first
    local backup
    backup=$(create_backup "$file")

    # Use different sed syntax based on platform
    if [[ $OSTYPE == "darwin"* ]]; then
        # macOS requires empty string after -i
        sed -i '' '/^# Commits$/,$d' "$file"
    else
        # Linux and other systems
        sed -i '/^# Commits$/,$d' "$file"
    fi

    # Verify operation succeeded, restore backup if not
    if [[ $? -ne 0 ]]; then
        echo "Error: sed operation failed, restoring backup" >&2
        mv "$backup" "$file"
        return 1
    fi

    # Clean up backup on success
    rm -f "$backup"
}

# Function to validate file path
validate_file_path() {
    local file="$1"
    local dir
    dir=$(dirname "$file")

    if [[ ! -d $dir ]]; then
        echo "Error: Directory '$dir' does not exist" >&2
        return 1
    fi

    # Check if we can write to the directory
    if [[ ! -w $dir ]]; then
        echo "Error: Cannot write to directory '$dir'" >&2
        return 1
    fi
}

# Main function
git_update_mr() {
    local enable_edit=false
    local upload=false
    local info_file=""
    local show_help=false

    # Parse command line arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
        -e | --edit)
            enable_edit=true
            shift
            ;;
        -u | --upload)
            upload=true
            shift
            ;;
        -f)
            if [[ $# -lt 2 ]]; then
                echo "Error: -f requires a filename argument" >&2
                return 1
            fi
            shift
            info_file="$1"
            shift
            ;;
        -f=*)
            info_file="${1#-f=}"
            shift
            ;;
        -h | --help)
            show_help=true
            shift
            ;;
        --)
            shift
            break
            ;;
        -*)
            echo "Error: Unknown option '$1'" >&2
            echo "Use -h or --help for usage information" >&2
            return 1
            ;;
        *)
            break
            ;;
        esac
    done

    # Show help if requested
    if [[ $show_help == true ]]; then
        usage
        return 0
    fi

    # Set default info file if not provided
    if [[ -z $info_file ]]; then
        if command_exists get_mr_file; then
            info_file=$(get_mr_file)
        else
            echo "Error: get_mr_file function not found and no file specified with -f" >&2
            return 1
        fi
    fi

    # Validate info file path
    if ! validate_file_path "$info_file"; then
        return 1
    fi

    # Set default base and target
    local base="${1:-origin/main}"
    local target="${2:-HEAD}"

    # Validate git_summary function exists
    if ! command_exists git_summary; then
        echo "Error: git_summary function not found" >&2
        return 1
    fi

    # If file doesn't exist and we're not editing, just show commits
    if [[ ! -f $info_file && $enable_edit != true ]]; then
        echo "Info file not found, showing commit summary:" >&2
        git_summary "$base" "$target"
        return 0
    fi

    # Create template file if it doesn't exist (only when editing)
    if [[ ! -f $info_file ]]; then
        cat >"$info_file" <<'EOF'
# Summary

# Testing Instructions

# Commits
EOF
        echo "Created new info file: $info_file" >&2
    fi

    # Open editor if requested
    if [[ $enable_edit == true ]]; then
        local editor="${EDITOR:-}"

        # Set default editor based on platform
        if [[ -z $editor ]]; then
            if command_exists code; then
                editor="code"
            elif command_exists nano; then
                editor="nano"
            elif command_exists vim; then
                editor="vim"
            else
                echo "Error: No suitable editor found. Set EDITOR environment variable." >&2
                return 1
            fi
        fi

        echo "Opening $info_file in $editor..." >&2
        "$editor" "$info_file"
    fi

    # Remove existing commits section
    if ! remove_commits_block "$info_file"; then
        echo "Error: Failed to update commits section" >&2
        return 1
    fi

    # Append new commits section
    {
        echo "# Commits"
        echo ""
        git_summary "$base" "$target"
    } >>"$info_file"

    echo "Successfully updated $info_file" >&2

    # Upload to GitLab if requested
    if [[ $upload == true ]]; then
        if command_exists glab; then
            echo "Uploading to GitLab..." >&2
            if glab mr update -d "$(cat "$info_file")"; then
                echo "Successfully updated GitLab merge request" >&2
            else
                echo "Warning: Failed to update GitLab merge request" >&2
                return 1
            fi
        else
            echo "Warning: glab command not found. Install GitLab CLI to enable upload functionality." >&2
            return 1
        fi
    fi
}

# Only run if script is executed directly (not sourced)
if [[ ${BASH_SOURCE[0]} == "${0}" ]]; then
    git_update_mr "$@"
fi
