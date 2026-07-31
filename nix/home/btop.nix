{ ... }:
let
  palette = import ../palettes/active.nix;
in
{
  # btop ships gruvbox_dark_v2 / gruvbox_light, selected by name. Same caveat as
  # bat: btop themes are their own file format, so an arbitrary palette would
  # need `themes` populated rather than a builtin named here.
  programs.btop = {
    enable = true;
    settings.color_theme = if palette.variant == "light" then "gruvbox_light" else "gruvbox_dark_v2";
  };
}
