{ ... }:
let
  palette = import ../palettes/active.nix;
in
{
  # Same limitation as bat: btop themes are their own file format, so a builtin
  # is selected by the name the palette declares for it.
  programs.btop = {
    enable = true;
    settings.color_theme = palette.tools.btop;
  };
}
