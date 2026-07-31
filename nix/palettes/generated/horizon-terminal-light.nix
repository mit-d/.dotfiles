# Horizon Terminal Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/horizon-terminal-light.yaml
# Author: Michael Ball (http://github.com/michael-ball/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/horizon-terminal-light.nix. Edits here are lost on the
# next run.

{
  name = "horizon-terminal-light";
  displayName = "Horizon Terminal Light";
  author = "Michael Ball (http://github.com/michael-ball/)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fdf0ed";
  surfaceDim = "#ffffff";
  surfaceBright = "#d7b9b0";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fdf0ed";
  surfaceContainer = "#fadad1";
  surfaceContainerHigh = "#e9c9c0";
  surfaceContainerHighest = "#d7b9b0";
  surfaceVariant = "#fadad1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#201c1d";
  onSurface = "#403c3d";
  onSurfaceMuted = "#686362";
  onSurfaceVariant = "#877f7e";
  onSurfaceFaint = "#ada3a2";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a29997";
  outlineVariant = "#f2c5b9";

  # --- Accent roles -------------------------------------------------------
  primary = "#26bbd9";
  onPrimary = "#201c1d";
  primaryContainer = "#bbdde6";
  onPrimaryContainer = "#201c1d";
  secondary = "#59e1e3";
  onSecondary = "#201c1d";
  tertiary = "#ee64ac";
  onTertiary = "#201c1d";
  error = "#e95678";
  onError = "#201c1d";
  inverseSurface = "#403c3d";
  inverseOnSurface = "#fdf0ed";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#fadad1";
    red = "#e95678";
    green = "#29d398";
    yellow = "#fadad1";
    blue = "#26bbd9";
    magenta = "#ee64ac";
    cyan = "#59e1e3";
    white = "#403c3d";
    brightBlack = "#bdb3b1";
    brightRed = "#d44267";
    brightGreen = "#00bf87";
    brightYellow = "#e6c7be";
    brightBlue = "#00a7c4";
    brightMagenta = "#d95199";
    brightCyan = "#40cdcf";
    brightWhite = "#201c1d";
  };

  orange = "#f9cec3";
  brightOrange = "#e5bbb0";
  cursor = "#3298b0";

  tools = {
    bat = "ansi";
  };
}
