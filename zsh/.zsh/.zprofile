# .zsh/.zprofile: .zprofile file for zsh(1).
#
# This file is sourced only for login shells (i.e. shells
# invoked with "-" as the first character of argv[0], and
# shells invoked with the -l flag.)
#
# Global Order: zshenv, zprofile, zshrc, zlogin
#

## Set up editor
export EDITOR=vi
export VISUAL=vi

## Detect and set COPY and PASTE commands based on availability
if command -v wl-copy &>/dev/null && command -v wl-paste &>/dev/null; then
  export COPY_COMMAND="wl-copy"
  export PASTE_COMMAND="wl-paste"
elif command -v xclip &>/dev/null; then
  export COPY_COMMAND="xclip -selection clipboard"
  export PASTE_COMMAND="xclip -selection clipboard -o"
elif command -v xsel &>/dev/null; then
  export COPY_COMMAND="xsel --clipboard --input"
  export PASTE_COMMAND="xsel --clipboard --output"
elif command -v clip.exe &>/dev/null; then
  # For Windows using WSL
  export COPY_COMMAND="clip.exe"
  export PASTE_COMMAND="powershell.exe Get-Clipboard"
elif command -v pbcopy &>/dev/null && command -v pbpaste &>/dev/null; then
  # For macOS
  export COPY_COMMAND="pbcopy"
  export PASTE_COMMAND="pbpaste"
fi

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
  # caps:ctrl
  hidutil property --set '{"UserKeyMapping":[
{"HIDKeyboardModifierMappingSrc": 0x700000039,"HIDKeyboardModifierMappingDst": 0x7000000E0},
{"HIDKeyboardModifierMappingSrc": 0x7000000E0,"HIDKeyboardModifierMappingDst": 0x700000039}
  ]}' >>/dev/null
  ;;
msys* | cygwin* | win32*)
  # Windows (via WSL, Cygwin, Git Bash, or MINGW)
  ;;
*)
  # Catch-all for unsupported OS types
  ;;
esac

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

