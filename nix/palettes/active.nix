# The palette every themed surface reads from.
#
# THIS IS THE SWITCH. Change the name below and the whole system rethemes on the
# next `sudo darwin-rebuild switch --flake ~/.dotfiles`: terminal, browser
# chrome, desktop background, k9s, tmux status, fish and zsh colours, bat, fzf,
# btop.
#
# Any name in ./generated/_index.nix works -- 335 of them, generated from
# tinted-theming/schemes. A few to try:
#
#   nord             solarized-light      catppuccin-mocha
#   tokyo-night-dark rose-pine            everforest
#   dracula          atelier-sulphurpool  black-metal
#
# To tweak one without editing generated files, add ./overrides/<name>.nix.
# See ./README.md.
import ./load.nix "gruvbox-dark-hard"
