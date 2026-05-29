# .zsh/.zprofile: .zprofile file for zsh(1).
#
# This file is sourced only for login shells (i.e. shells
# invoked with "-" as the first character of argv[0], and
# shells invoked with the -l flag.)
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#

## Source PATH (after path_helper runs in /etc/zprofile)
. "$ZDOTDIR/posix/00-path.sh"

## Set up editor (first available wins)
for _editor in nvim vim vi nano; do
    if command -v "$_editor" &>/dev/null; then
        export EDITOR="$_editor"
        export VISUAL="$_editor"
        break
    fi
done
unset _editor

## Detect and set COPY and PASTE commands based on OS (avoids unnecessary command -v calls)
case "$OSTYPE" in
    darwin*)
        export COPY_COMMAND="pbcopy"
        export PASTE_COMMAND="pbpaste"
        ;;
    linux*)
        if command -v wl-copy &>/dev/null; then
            export COPY_COMMAND="wl-copy"
            export PASTE_COMMAND="wl-paste"
        elif command -v xclip &>/dev/null; then
            export COPY_COMMAND="xclip -selection clipboard"
            export PASTE_COMMAND="xclip -selection clipboard -o"
        elif command -v xsel &>/dev/null; then
            export COPY_COMMAND="xsel --clipboard --input"
            export PASTE_COMMAND="xsel --clipboard --output"
        fi

        if command -v xdg-open &>/dev/null; then
            alias open='xdg-open'
        fi
        ;;
    msys*|cygwin*|win32*)
        export COPY_COMMAND="clip.exe"
        export PASTE_COMMAND="powershell.exe Get-Clipboard"
        ;;
esac

## OS-specific setup
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
        # caps:ctrl remapping moved to .zlogin (only needs to run once per login)
        ;;
    msys* | cygwin* | win32*)
        # Windows (via WSL, Cygwin, Git Bash, or MINGW)
        ;;
    *)
        # Catch-all for unsupported OS types
        ;;
esac
