# shellcheck shell=bash
# /etc/skel/.bash_profile

# Shared POSIX path setup (cargo, local bins, etc.)
. "$HOME/.zsh/posix/path.sh"

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi
