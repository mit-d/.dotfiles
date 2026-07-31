# boo-shnickle-light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/boo-shnickle-light.yaml
# Author: boo-shnickle (@boo_shnickle)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/boo-shnickle-light.nix. Edits here are lost on the
# next run.

{
  name = "boo-shnickle-light";
  displayName = "boo-shnickle-light";
  author = "boo-shnickle (@boo_shnickle)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffcc";
  surfaceDim = "#ffffff";
  surfaceBright = "#bbba90";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffcc";
  surfaceContainer = "#dedeb2";
  surfaceContainerHigh = "#cccca1";
  surfaceContainerHighest = "#bbba90";
  surfaceVariant = "#dedeb2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#191914";
  onSurface = "#5b5b49";
  onSurfaceMuted = "#6b6b56";
  onSurfaceVariant = "#7c7c63";
  onSurfaceFaint = "#9c9c7d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9c9c7d";
  outlineVariant = "#bdbd97";

  # --- Accent roles -------------------------------------------------------
  primary = "#bfbfd9";
  onPrimary = "#191914";
  primaryContainer = "#e6e7d3";
  onPrimaryContainer = "#191914";
  secondary = "#bfffc5";
  onSecondary = "#191914";
  tertiary = "#f2bfd9";
  onTertiary = "#191914";
  error = "#ffbfa5";
  onError = "#191914";
  inverseSurface = "#5b5b49";
  inverseOnSurface = "#ffffcc";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#dedeb2";
    red = "#ffbfa5";
    green = "#e7ff99";
    yellow = "#fff299";
    blue = "#bfbfd9";
    magenta = "#f2bfd9";
    cyan = "#bfffc5";
    white = "#5b5b49";
    brightBlack = "#9c9c7d";
    brightRed = "#ebac92";
    brightGreen = "#d3eb85";
    brightYellow = "#ebde86";
    brightBlue = "#acacc6";
    brightMagenta = "#deacc6";
    brightCyan = "#acebb2";
    brightWhite = "#191914";
  };

  orange = "#ffdc99";
  brightOrange = "#ebc886";
  cursor = "#9191a2";

  tools = {
    bat = "ansi";
  };
}
