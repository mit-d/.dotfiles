{ ... }:
let
  palette = import ../palettes/active.nix;
in
{
  # bat ships gruvbox-dark and gruvbox-light builtin, so the theme is selected by
  # name rather than generated. Which one depends on the palette's variant, so a
  # swap to a light theme does not leave bat dark.
  #
  # This is the one themed surface that cannot follow an *arbitrary* palette: bat
  # themes are compiled Sublime colour schemes, not a list of hex values, so a
  # palette with no matching builtin needs `themes` populated with a real
  # .tmTheme. Named builtins are the honest trade for now.
  programs.bat = {
    enable = true;
    config.theme = if palette.variant == "light" then "gruvbox-light" else "gruvbox-dark";
  };
}
