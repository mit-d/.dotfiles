# .zsh/.zprofile: .zprofile file for zsh(1).
#
# This file is sourced only for login shells (i.e. shells
# invoked with "-" as the first character of argv[0], and
# shells invoked with the -l flag.)
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#

## Source PATH (after path_helper runs in /etc/zprofile)
. "$ZDOTDIR/posix/path.sh"

## Set up editor
export EDITOR=vi
export VISUAL=vi

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
  if [ "$XDG_SESSION_TYPE" = "x11" ] && command -v setxkbmap >/dev/null 2 >&1; then
    # X11 environment
    setxkbmap -option caps:ctrl_modifier
  elif [ "$XDG_SESSION_TYPE" = "wayland" ] && command -v gsettings >/dev/null 2 >&1; then
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

export NVM_DIR="$HOME/.nvm"

# Lazy-load NVM for faster shell startup
_nvm_lazy_load() {
  unset -f nvm node npm npx 2>/dev/null
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}

nvm() { _nvm_lazy_load; nvm "$@"; }
node() { _nvm_lazy_load; node "$@"; }
npm() { _nvm_lazy_load; npm "$@"; }
npx() { _nvm_lazy_load; npx "$@"; }

