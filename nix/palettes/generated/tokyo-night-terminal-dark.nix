# Tokyo Night Terminal Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-night-terminal-dark.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-night-terminal-dark.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-night-terminal-dark";
  displayName = "Tokyo Night Terminal Dark";
  author = "Michael Ball";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#16161e";
  surfaceDim = "#111119";
  surfaceBright = "#242631";
  surfaceContainerLowest = "#111119";
  surfaceContainerLow = "#16161e";
  surfaceContainer = "#1a1b26";
  surfaceContainerHigh = "#1f202c";
  surfaceContainerHighest = "#242631";
  surfaceVariant = "#1a1b26";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d5d6db";
  onSurface = "#7a7e9a";
  onSurfaceMuted = "#787c99";
  onSurfaceVariant = "#787c99";
  onSurfaceFaint = "#474e6c";

  # --- Borders and dividers -----------------------------------------------
  outline = "#4f5673";
  outlineVariant = "#2f3549";

  # --- Accent roles -------------------------------------------------------
  primary = "#7aa2f7";
  onPrimary = "#16161e";
  primaryContainer = "#394668";
  onPrimaryContainer = "#d5d6db";
  secondary = "#7dcfff";
  onSecondary = "#16161e";
  tertiary = "#bb9af7";
  onTertiary = "#16161e";
  error = "#f7768e";
  onError = "#16161e";
  inverseSurface = "#7a7e9a";
  inverseOnSurface = "#16161e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1a1b26";
    red = "#f7768e";
    green = "#41a6b5";
    yellow = "#e0af68";
    blue = "#7aa2f7";
    magenta = "#bb9af7";
    cyan = "#7dcfff";
    white = "#787c99";
    brightBlack = "#444b6a";
    brightRed = "#ff94a5";
    brightGreen = "#56b9c8";
    brightYellow = "#f4c27b";
    brightBlue = "#93b6ff";
    brightMagenta = "#ccb1ff";
    brightCyan = "#acdfff";
    brightWhite = "#d5d6db";
  };

  orange = "#ff9e64";
  brightOrange = "#ffbb95";
  cursor = "#7aa2f7";

  tools = {
    bat = "ansi";
  };
}
