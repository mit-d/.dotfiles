# Ocote -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/ocote.yaml
# Author: Teshre
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/ocote.nix. Edits here are lost on the
# next run.

{
  name = "ocote";
  displayName = "Ocote";
  author = "Teshre";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#14100c";
  surfaceDim = "#090604";
  surfaceBright = "#3a332b";
  surfaceContainerLowest = "#090604";
  surfaceContainerLow = "#14100c";
  surfaceContainer = "#211b13";
  surfaceContainerHigh = "#2d271f";
  surfaceContainerHighest = "#3a332b";
  surfaceVariant = "#211b13";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#faf6ec";
  onSurface = "#e7dcc6";
  onSurfaceMuted = "#c8bda9";
  onSurfaceVariant = "#a99f8d";
  onSurfaceFaint = "#6b6253";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6b6253";
  outlineVariant = "#3a2e1c";

  # --- Accent roles -------------------------------------------------------
  primary = "#82a6e0";
  onPrimary = "#14100c";
  primaryContainer = "#3b4453";
  onPrimaryContainer = "#faf6ec";
  secondary = "#6dd8c8";
  onSecondary = "#14100c";
  tertiary = "#c58ae0";
  onTertiary = "#14100c";
  error = "#e8635a";
  onError = "#14100c";
  inverseSurface = "#e7dcc6";
  inverseOnSurface = "#14100c";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#211b13";
    red = "#e8635a";
    green = "#7dc97a";
    yellow = "#e8b43a";
    blue = "#82a6e0";
    magenta = "#c58ae0";
    cyan = "#6dd8c8";
    white = "#e7dcc6";
    brightBlack = "#6b6253";
    brightRed = "#fd766c";
    brightGreen = "#90dd8d";
    brightYellow = "#fcc751";
    brightBlue = "#94b9f4";
    brightMagenta = "#d99df4";
    brightCyan = "#81ecdb";
    brightWhite = "#faf6ec";
  };

  orange = "#e8843a";
  brightOrange = "#fd974f";
  cursor = "#82a6e0";

  tools = {
    bat = "ansi";
  };
}
