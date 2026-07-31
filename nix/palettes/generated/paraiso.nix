# Paraiso -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/paraiso.yaml
# Author: Jan T. Sott
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/paraiso.nix. Edits here are lost on the
# next run.

{
  name = "paraiso";
  displayName = "Paraiso";
  author = "Jan T. Sott";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2f1e2e";
  surfaceDim = "#211121";
  surfaceBright = "#5f4f5d";
  surfaceContainerLowest = "#211121";
  surfaceContainerLow = "#2f1e2e";
  surfaceContainer = "#41323f";
  surfaceContainerHigh = "#50404e";
  surfaceContainerHighest = "#5f4f5d";
  surfaceVariant = "#41323f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e7e9db";
  onSurface = "#a39e9b";
  onSurfaceMuted = "#989291";
  onSurfaceVariant = "#8d8687";
  onSurfaceFaint = "#776e71";

  # --- Borders and dividers -----------------------------------------------
  outline = "#776e71";
  outlineVariant = "#4f424c";

  # --- Accent roles -------------------------------------------------------
  primary = "#06b6ef";
  onPrimary = "#2f1e2e";
  primaryContainer = "#3d5471";
  onPrimaryContainer = "#e7e9db";
  secondary = "#5bc4bf";
  onSecondary = "#2f1e2e";
  tertiary = "#815ba4";
  onTertiary = "#eceee2";
  error = "#ef6155";
  onError = "#2f1e2e";
  inverseSurface = "#a39e9b";
  inverseOnSurface = "#2f1e2e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#41323f";
    red = "#ef6155";
    green = "#48b685";
    yellow = "#fec418";
    blue = "#06b6ef";
    magenta = "#815ba4";
    cyan = "#5bc4bf";
    white = "#a39e9b";
    brightBlack = "#776e71";
    brightRed = "#ff7a6c";
    brightGreen = "#5dc997";
    brightYellow = "#ffdd90";
    brightBlue = "#46c9ff";
    brightMagenta = "#936db7";
    brightCyan = "#70d8d2";
    brightWhite = "#e7e9db";
  };

  orange = "#f99b15";
  brightOrange = "#ffb566";
  cursor = "#06b6ef";

  tools = {
    bat = "ansi";
  };
}
