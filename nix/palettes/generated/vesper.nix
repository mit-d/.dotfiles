# Vesper -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/vesper.yaml
# Author: FormalSnake (https://github.com/formalsnake)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/vesper.nix. Edits here are lost on the
# next run.

{
  name = "vesper";
  displayName = "Vesper";
  author = "FormalSnake (https://github.com/formalsnake)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#101010";
  surfaceDim = "#050505";
  surfaceBright = "#3f3f3f";
  surfaceContainerLowest = "#050505";
  surfaceContainerLow = "#101010";
  surfaceContainer = "#232323";
  surfaceContainerHigh = "#303030";
  surfaceContainerHighest = "#3f3f3f";
  surfaceVariant = "#232323";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d5d5d5";
  onSurface = "#b7b7b7";
  onSurfaceMuted = "#a8a8a8";
  onSurfaceVariant = "#999999";
  onSurfaceFaint = "#4c4c4b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#545453";
  outlineVariant = "#2e2e2e";

  # --- Accent roles -------------------------------------------------------
  primary = "#8eaaaa";
  onPrimary = "#101010";
  primaryContainer = "#3b4444";
  onPrimaryContainer = "#d5d5d5";
  secondary = "#60a592";
  onSecondary = "#101010";
  tertiary = "#d69094";
  onTertiary = "#101010";
  error = "#de6e6e";
  onError = "#101010";
  inverseSurface = "#b7b7b7";
  inverseOnSurface = "#101010";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#232323";
    red = "#de6e6e";
    green = "#5f8787";
    yellow = "#ffc799";
    blue = "#8eaaaa";
    magenta = "#d69094";
    cyan = "#60a592";
    white = "#b7b7b7";
    brightBlack = "#333333";
    brightRed = "#f38180";
    brightGreen = "#719999";
    brightYellow = "#ffe1ca";
    brightBlue = "#a0bdbd";
    brightMagenta = "#eaa3a6";
    brightCyan = "#73b8a4";
    brightWhite = "#d5d5d5";
  };

  orange = "#dab083";
  brightOrange = "#eec396";
  cursor = "#8eaaaa";

  tools = {
    bat = "ansi";
  };
}
