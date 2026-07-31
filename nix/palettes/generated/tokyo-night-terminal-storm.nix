# Tokyo Night Terminal Storm -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-night-terminal-storm.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-night-terminal-storm.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-night-terminal-storm";
  displayName = "Tokyo Night Terminal Storm";
  author = "Michael Ball";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#24283b";
  surfaceDim = "#171b2d";
  surfaceBright = "#353642";
  surfaceContainerLowest = "#171b2d";
  surfaceContainerLow = "#24283b";
  surfaceContainer = "#1a1b26";
  surfaceContainerHigh = "#272834";
  surfaceContainerHighest = "#353642";
  surfaceVariant = "#1a1b26";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d5d6db";
  onSurface = "#8a8ea6";
  onSurfaceMuted = "#81859f";
  onSurfaceVariant = "#787c99";
  onSurfaceFaint = "#555c78";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5e647f";
  outlineVariant = "#393f56";

  # --- Accent roles -------------------------------------------------------
  primary = "#7aa2f7";
  onPrimary = "#24283b";
  primaryContainer = "#43537d";
  onPrimaryContainer = "#d5d6db";
  secondary = "#7dcfff";
  onSecondary = "#24283b";
  tertiary = "#bb9af7";
  onTertiary = "#24283b";
  error = "#f7768e";
  onError = "#24283b";
  inverseSurface = "#8a8ea6";
  inverseOnSurface = "#24283b";

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
