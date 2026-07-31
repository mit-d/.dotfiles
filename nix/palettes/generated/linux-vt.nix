# Linux VT -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/linux-vt.yaml
# Author: j-c-m (https://github.com/j-c-m/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/linux-vt.nix. Edits here are lost on the
# next run.

{
  name = "linux-vt";
  displayName = "Linux VT";
  author = "j-c-m (https://github.com/j-c-m/)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#505050";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#333333";
  surfaceContainerHigh = "#414141";
  surfaceContainerHighest = "#505050";
  surfaceVariant = "#333333";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#aaaaaa";
  onSurfaceMuted = "#999999";
  onSurfaceVariant = "#888888";
  onSurfaceFaint = "#555555";

  # --- Borders and dividers -----------------------------------------------
  outline = "#555555";
  outlineVariant = "#444444";

  # --- Accent roles -------------------------------------------------------
  primary = "#5555ff";
  onPrimary = "#ffffff";
  primaryContainer = "#101042";
  onPrimaryContainer = "#ffffff";
  secondary = "#00aaaa";
  onSecondary = "#000000";
  tertiary = "#ff55ff";
  onTertiary = "#000000";
  error = "#aa0000";
  onError = "#ffffff";
  inverseSurface = "#aaaaaa";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#333333";
    red = "#aa0000";
    green = "#00aa00";
    yellow = "#ffff55";
    blue = "#5555ff";
    magenta = "#ff55ff";
    cyan = "#00aaaa";
    white = "#aaaaaa";
    brightBlack = "#555555";
    brightRed = "#bf261c";
    brightGreen = "#2ebe29";
    brightYellow = "#ffffff";
    brightBlue = "#6772ff";
    brightMagenta = "#ff8afd";
    brightCyan = "#30bdbd";
    brightWhite = "#ffffff";
  };

  orange = "#ff5555";
  brightOrange = "#ff7f79";
  cursor = "#5555ff";

  tools = {
    bat = "ansi";
  };
}
