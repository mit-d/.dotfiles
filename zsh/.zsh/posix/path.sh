# path.sh - PATH configuration
# POSIX-compliant shell script

# Add directory to PATH if it exists and isn't already in PATH
_add_to_path() {
	dir="$1"
	if [ -d "$dir" ]; then
		case ":${PATH}:" in
		*:"$dir":*) ;; # Already in PATH
		*) PATH="$dir:$PATH" ;;
		esac
	fi
}

# Directories to add to PATH (in reverse priority order - last added = highest priority)
_add_to_path "$HOME/.npm_global/bin"
_add_to_path "/opt/homebrew/opt/coreutils/libexec/gnubin"
_add_to_path "/opt/homebrew/opt/openjdk/bin"
_add_to_path "/opt/homebrew/bin"
_add_to_path "$HOME/Android/Sdk/platform-tools"
_add_to_path "$HOME/.local/share/JetBrains/Toolbox/scripts"
_add_to_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
_add_to_path "$HOME/.local/bin"
_add_to_path "$HOME/.bin"
_add_to_path "$HOME/bin"

export PATH

unset -f _add_to_path
