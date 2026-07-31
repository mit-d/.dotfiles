# Material Darker -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/material-darker.yaml
# Author: Nate Peterson
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/material-darker.nix. Edits here are lost on the
# next run.

{
  name = "material-darker";
  displayName = "Material Darker";
  author = "Nate Peterson";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#212121";
  surfaceDim = "#141414";
  surfaceBright = "#4d4d4d";
  surfaceContainerLowest = "#141414";
  surfaceContainerLow = "#212121";
  surfaceContainer = "#303030";
  surfaceContainerHigh = "#3e3e3e";
  surfaceContainerHighest = "#4d4d4d";
  surfaceVariant = "#303030";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#eeffff";
  onSurfaceMuted = "#d0e5ea";
  onSurfaceVariant = "#b2ccd6";
  onSurfaceFaint = "#565656";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5e5e5e";
  outlineVariant = "#393939";

  # --- Accent roles -------------------------------------------------------
  primary = "#82aaff";
  onPrimary = "#212121";
  primaryContainer = "#44516d";
  onPrimaryContainer = "#ffffff";
  secondary = "#89ddff";
  onSecondary = "#212121";
  tertiary = "#c792ea";
  onTertiary = "#212121";
  error = "#f07178";
  onError = "#212121";
  inverseSurface = "#eeffff";
  inverseOnSurface = "#212121";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#303030";
    red = "#f07178";
    green = "#c3e88d";
    yellow = "#ffcb6b";
    blue = "#82aaff";
    magenta = "#c792ea";
    cyan = "#89ddff";
    white = "#eeffff";
    brightBlack = "#4a4a4a";
    brightRed = "#ff898e";
    brightGreen = "#d6fca0";
    brightYellow = "#ffe4b5";
    brightBlue = "#9fbfff";
    brightMagenta = "#dba5fe";
    brightCyan = "#beecff";
    brightWhite = "#ffffff";
  };

  orange = "#f78c6c";
  brightOrange = "#ffa78c";
  cursor = "#82aaff";

  tools = {
    bat = "ansi";
  };
}
