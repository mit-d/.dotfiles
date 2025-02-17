
# Detect and set COPY and PASTE commands based on availability
if command -v wl-copy >/dev/null 2>&1 && command -v wl-paste >/dev/null 2>&1; then
    export COPY_COMMAND="wl-copy"
    export PASTE_COMMAND="wl-paste"
elif command -v xclip >/dev/null 2>&1; then
    export COPY_COMMAND="xclip -selection clipboard"
    export PASTE_COMMAND="xclip -selection clipboard -o"
elif command -v xsel >/dev/null 2>&1; then
    export COPY_COMMAND="xsel --clipboard --input"
    export PASTE_COMMAND="xsel --clipboard --output"
elif command -v clip.exe >/dev/null 2>&1; then
    # For Windows using WSL
    export COPY_COMMAND="clip.exe"
    export PASTE_COMMAND="powershell.exe Get-Clipboard"
elif command -v pbcopy >/dev/null 2>&1 && command -v pbpaste >/dev/null 2>&1; then
    # For macOS
    export COPY_COMMAND="pbcopy"
    export PASTE_COMMAND="pbpaste"
fi

# OS-specific setup
case "$OSTYPE" in
    linux*)
	# Linux-specific config
        if [ "$XDG_SESSION_TYPE" = "x11" ] && command -v setxkbmap >/dev/null 2>&1; then
            # X11 environment
            setxkbmap -option caps:ctrl_modifier
        elif [ "$XDG_SESSION_TYPE" = "wayland" ] && command -v gsettings >/dev/null 2>&1; then
            # Wayland with GNOME
            gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
        fi
        ;;
    darwin*)
        # macOS (OSTYPE is 'darwin*')
	alias 'su'='sudo su'
        ;;
    msys*|cygwin*|win32*)
        # Windows (via WSL, Cygwin, Git Bash, or MINGW)
        ;;
    *)
        # Catch-all for unsupported OS types
        ;;
esac
