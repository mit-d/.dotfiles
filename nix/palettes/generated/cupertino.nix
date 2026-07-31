# Cupertino -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/cupertino.yaml
# Author: Defman21
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/cupertino.nix. Edits here are lost on the
# next run.

{
  name = "cupertino";
  displayName = "Cupertino";
  author = "Defman21";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#9e9e9e";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#c0c0c0";
  surfaceContainerHigh = "#afafaf";
  surfaceContainerHighest = "#9e9e9e";
  surfaceVariant = "#c0c0c0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#404040";
  onSurface = "#404040";
  onSurfaceMuted = "#5f5f5f";
  onSurfaceVariant = "#808080";
  onSurfaceFaint = "#808080";

  # --- Borders and dividers -----------------------------------------------
  outline = "#808080";
  outlineVariant = "#c0c0c0";

  # --- Accent roles -------------------------------------------------------
  primary = "#0000ff";
  onPrimary = "#ffffff";
  primaryContainer = "#94baff";
  onPrimaryContainer = "#404040";
  secondary = "#318495";
  onSecondary = "#ffffff";
  tertiary = "#a90d91";
  onTertiary = "#ffffff";
  error = "#c41a15";
  onError = "#ffffff";
  inverseSurface = "#404040";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#c0c0c0";
    red = "#c41a15";
    green = "#007400";
    yellow = "#826b28";
    blue = "#0000ff";
    magenta = "#a90d91";
    cyan = "#318495";
    white = "#404040";
    brightBlack = "#808080";
    brightRed = "#ab0004";
    brightGreen = "#006000";
    brightYellow = "#705a12";
    brightBlue = "#0026be";
    brightMagenta = "#90007b";
    brightCyan = "#197283";
    brightWhite = "#404040";
  };

  orange = "#eb8500";
  brightOrange = "#d17600";
  cursor = "#0000ff";

  tools = {
    bat = "ansi";
  };
}
