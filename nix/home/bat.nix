{ ... }:
let
  palette = import ../palettes/active.nix;
in
{
  # bat themes are compiled Sublime colour schemes, not a list of hex values, so
  # this selects a builtin by name. The name comes from the palette rather than
  # being guessed here: branching on palette.variant alone produced
  # "gruvbox-light" under a solarized palette, which is the wrong theme rather
  # than merely the wrong lightness.
  programs.bat = {
    enable = true;
    config.theme = palette.tools.bat;
  };
}
