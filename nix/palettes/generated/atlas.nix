# Atlas -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atlas.yaml
# Author: Alex Lende (https://ajlende.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atlas.nix. Edits here are lost on the
# next run.

{
  name = "atlas";
  displayName = "Atlas";
  author = "Alex Lende (https://ajlende.com)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#002635";
  surfaceDim = "#001823";
  surfaceBright = "#25566c";
  surfaceContainerLowest = "#001823";
  surfaceContainerLow = "#002635";
  surfaceContainer = "#00384d";
  surfaceContainerHigh = "#14475c";
  surfaceContainerHighest = "#25566c";
  surfaceVariant = "#00384d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fafaf8";
  onSurface = "#a1a19a";
  onSurfaceMuted = "#949c98";
  onSurfaceVariant = "#869696";
  onSurfaceFaint = "#6c8b91";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6c8b91";
  outlineVariant = "#517f8d";

  # --- Accent roles -------------------------------------------------------
  primary = "#14747e";
  onPrimary = "#fafaf8";
  primaryContainer = "#044250";
  onPrimaryContainer = "#fafaf8";
  secondary = "#5dd7b9";
  onSecondary = "#002635";
  tertiary = "#9a70a4";
  onTertiary = "#ffffff";
  error = "#ff5a67";
  onError = "#002635";
  inverseSurface = "#a1a19a";
  inverseOnSurface = "#002635";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#00384d";
    red = "#ff5a67";
    green = "#7fc06e";
    yellow = "#ffcc1b";
    blue = "#14747e";
    magenta = "#9a70a4";
    cyan = "#5dd7b9";
    white = "#a1a19a";
    brightBlack = "#6c8b91";
    brightRed = "#ff8387";
    brightGreen = "#92d481";
    brightYellow = "#ffe49d";
    brightBlue = "#2e8690";
    brightMagenta = "#ad82b7";
    brightCyan = "#72ebcc";
    brightWhite = "#fafaf8";
  };

  orange = "#f08e48";
  brightOrange = "#ffa467";
  cursor = "#1d7780";

  tools = {
    bat = "ansi";
  };
}
