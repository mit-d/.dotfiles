# The palette every themed surface reads from.
#
# THIS IS THE SWITCH. Point it at a different file and the whole system
# rethemes on the next `sudo darwin-rebuild switch --flake ~/.dotfiles`:
# terminal, browser chrome, desktop background, k9s, tmux status, fish and zsh
# colours, bat, fzf, btop.
#
# Available palettes live alongside this file; see ./README.md for the schema
# a new one has to satisfy.
## import ./gruvbox-dark-hard.nix
import ./solarized-light.nix
