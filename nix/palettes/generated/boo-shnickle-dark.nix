# boo-shnickle -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/boo-shnickle-dark.yaml
# Author: boo-shnickle (@boo_shnickle)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/boo-shnickle-dark.nix. Edits here are lost on the
# next run.

{
  name = "boo-shnickle-dark";
  displayName = "boo-shnickle";
  author = "boo-shnickle (@boo_shnickle)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#191914";
  surfaceDim = "#0d0d08";
  surfaceBright = "#57584b";
  surfaceContainerLowest = "#0d0d08";
  surfaceContainerLow = "#191914";
  surfaceContainer = "#3a3a2e";
  surfaceContainerHigh = "#48493c";
  surfaceContainerHighest = "#57584b";
  surfaceVariant = "#3a3a2e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffcc";
  onSurface = "#bdbd97";
  onSurfaceMuted = "#acac8a";
  onSurfaceVariant = "#9c9c7d";
  onSurfaceFaint = "#7c7c63";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7c7c63";
  outlineVariant = "#5b5b49";

  # --- Accent roles -------------------------------------------------------
  primary = "#bfbfd9";
  onPrimary = "#191914";
  primaryContainer = "#525257";
  onPrimaryContainer = "#ffffcc";
  secondary = "#bfffc5";
  onSecondary = "#191914";
  tertiary = "#f2bfd9";
  onTertiary = "#191914";
  error = "#ffbfa5";
  onError = "#191914";
  inverseSurface = "#bdbd97";
  inverseOnSurface = "#191914";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3a3a2e";
    red = "#ffbfa5";
    green = "#e7ff99";
    yellow = "#fff299";
    blue = "#bfbfd9";
    magenta = "#f2bfd9";
    cyan = "#bfffc5";
    white = "#bdbd97";
    brightBlack = "#7c7c63";
    brightRed = "#ffdacc";
    brightGreen = "#ffffff";
    brightYellow = "#ffffff";
    brightBlue = "#d2d2ed";
    brightMagenta = "#ffd6eb";
    brightCyan = "#ffffff";
    brightWhite = "#ffffcc";
  };

  orange = "#ffdc99";
  brightOrange = "#fff3de";
  cursor = "#bfbfd9";

  tools = {
    bat = "ansi";
  };
}
