# shellcheck shell=sh
# path.sh - PATH configuration
# POSIX-compliant shell script

# Add directory to front of PATH if it exists (removes duplicates)
# Uses pure shell parameter expansion to avoid subprocess overhead:
#   ${PATH%%:$dir:*} - everything before the match
#   ${PATH#*:$dir:}  - everything after the match
#   ${PATH#:}        - strip leading colon if present
_add_to_path() {
    dir="$1"
    [ -d "$dir" ] || return
    case ":$PATH:" in
    *:"$dir":*) PATH="${PATH%%:$dir:*}:${PATH#*:$dir:}" ;;
    esac
    PATH="$dir:${PATH#:}"
}

# Directories to add to PATH (in reverse priority order - last added = highest priority)
_add_to_path "$HOME/.npm_global/bin"
_add_to_path "/opt/homebrew/opt/gnu-getopt/bin"
_add_to_path "/opt/homebrew/opt/findutils/libexec/gnubin"
_add_to_path "/opt/homebrew/opt/coreutils/libexec/gnubin"
_add_to_path "/opt/homebrew/opt/openjdk/bin"
_add_to_path "/opt/homebrew/bin"
_add_to_path "$HOME/Android/Sdk/platform-tools"
_add_to_path "$HOME/.local/share/JetBrains/Toolbox/scripts"
_add_to_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
_add_to_path "$HOME/.local/bin"
_add_to_path "$HOME/.bin"
_add_to_path "$HOME/bin"
_add_to_path "$HOME/.cache/.bun/bin"

export PATH

unset -f _add_to_path
