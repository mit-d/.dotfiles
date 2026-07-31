# Mellow Purple -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/mellow-purple.yaml
# Author: gidsi
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/mellow-purple.nix. Edits here are lost on the
# next run.

{
  name = "mellow-purple";
  displayName = "Mellow Purple";
  author = "gidsi";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1e0528";
  surfaceDim = "#190222";
  surfaceBright = "#241439";
  surfaceContainerLowest = "#190222";
  surfaceContainerLow = "#1e0528";
  surfaceContainer = "#1a092d";
  surfaceContainerHigh = "#1f0e33";
  surfaceContainerHighest = "#241439";
  surfaceVariant = "#1a092d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffeeff";
  onSurface = "#ffeeff";
  onSurfaceMuted = "#c491c0";
  onSurfaceVariant = "#984f93";
  onSurfaceFaint = "#5a407a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#624881";
  outlineVariant = "#3c1f5d";

  # --- Accent roles -------------------------------------------------------
  primary = "#550068";
  onPrimary = "#ffeeff";
  primaryContainer = "#32053f";
  onPrimaryContainer = "#ffeeff";
  secondary = "#b900b1";
  onSecondary = "#ffeeff";
  tertiary = "#8991bb";
  onTertiary = "#1e0528";
  error = "#00d9e9";
  onError = "#1e0528";
  inverseSurface = "#ffeeff";
  inverseOnSurface = "#1e0528";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1a092d";
    red = "#00d9e9";
    green = "#05cb0d";
    yellow = "#955ae7";
    blue = "#550068";
    magenta = "#8991bb";
    cyan = "#b900b1";
    white = "#ffeeff";
    brightBlack = "#320f55";
    brightRed = "#3aedfd";
    brightGreen = "#36df33";
    brightYellow = "#a76dfc";
    brightBlue = "#671b7a";
    brightMagenta = "#9ba3ce";
    brightCyan = "#ce2bc5";
    brightWhite = "#ffeeff";
  };

  orange = "#aa00a3";
  brightOrange = "#be29b6";
  cursor = "#824a91";

  tools = {
    bat = "ansi";
  };
}
