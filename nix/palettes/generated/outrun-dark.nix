# Outrun Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/outrun-dark.yaml
# Author: Hugo Delahousse (http://github.com/hugodelahousse/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/outrun-dark.nix. Edits here are lost on the
# next run.

{
  name = "outrun-dark";
  displayName = "Outrun Dark";
  author = "Hugo Delahousse (http://github.com/hugodelahousse/)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#00002a";
  surfaceDim = "#00000e";
  surfaceBright = "#3b3d6a";
  surfaceContainerLowest = "#00000e";
  surfaceContainerLow = "#00002a";
  surfaceContainer = "#20204a";
  surfaceContainerHigh = "#2d2e5a";
  surfaceContainerHighest = "#3b3d6a";
  surfaceVariant = "#20204a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5f5ff";
  onSurface = "#d0d0fa";
  onSurfaceMuted = "#c0c0ea";
  onSurfaceVariant = "#b0b0da";
  onSurfaceFaint = "#50507a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#50507a";
  outlineVariant = "#30305a";

  # --- Accent roles -------------------------------------------------------
  primary = "#66b0ff";
  onPrimary = "#00002a";
  primaryContainer = "#143c74";
  onPrimaryContainer = "#f5f5ff";
  secondary = "#0ef0f0";
  onSecondary = "#00002a";
  tertiary = "#f10596";
  onTertiary = "#00002a";
  error = "#ff4242";
  onError = "#00002a";
  inverseSurface = "#d0d0fa";
  inverseOnSurface = "#00002a";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#20204a";
    red = "#ff4242";
    green = "#59f176";
    yellow = "#f3e877";
    blue = "#66b0ff";
    magenta = "#f10596";
    cyan = "#0ef0f0";
    white = "#d0d0fa";
    brightBlack = "#50507a";
    brightRed = "#ff736a";
    brightGreen = "#90ff9e";
    brightYellow = "#fffbc4";
    brightBlue = "#8dc3ff";
    brightMagenta = "#ff46a7";
    brightCyan = "#7afffe";
    brightWhite = "#f5f5ff";
  };

  orange = "#fc8d28";
  brightOrange = "#ffaa6b";
  cursor = "#66b0ff";

  tools = {
    bat = "ansi";
  };
}
