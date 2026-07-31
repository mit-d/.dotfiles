# Tokyo Night Terminal Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyo-night-terminal-light.yaml
# Author: Michael Ball
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyo-night-terminal-light.nix. Edits here are lost on the
# next run.

{
  name = "tokyo-night-terminal-light";
  displayName = "Tokyo Night Terminal Light";
  author = "Michael Ball";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#d5d6db";
  surfaceDim = "#dfe0e5";
  surfaceBright = "#b7b8bd";
  surfaceContainerLowest = "#dfe0e5";
  surfaceContainerLow = "#d5d6db";
  surfaceContainer = "#cbccd1";
  surfaceContainerHigh = "#c1c2c7";
  surfaceContainerHighest = "#b7b8bd";
  surfaceVariant = "#cbccd1";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1a1b26";
  onSurface = "#4c505e";
  onSurfaceMuted = "#4c505e";
  onSurfaceVariant = "#4c505e";
  onSurfaceFaint = "#8d8f9a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#838691";
  outlineVariant = "#b4b5bc";

  # --- Accent roles -------------------------------------------------------
  primary = "#34548a";
  onPrimary = "#d5d6db";
  primaryContainer = "#95a3bd";
  onPrimaryContainer = "#1a1b26";
  secondary = "#0f4b6e";
  onSecondary = "#d5d6db";
  tertiary = "#5a4a78";
  onTertiary = "#d5d6db";
  error = "#8c4351";
  onError = "#d5d6db";
  inverseSurface = "#4c505e";
  inverseOnSurface = "#d5d6db";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#cbccd1";
    red = "#8c4351";
    green = "#33635c";
    yellow = "#8f5e15";
    blue = "#34548a";
    magenta = "#5a4a78";
    cyan = "#0f4b6e";
    white = "#4c505e";
    brightBlack = "#9699a3";
    brightRed = "#793241";
    brightGreen = "#22524c";
    brightYellow = "#7b4e00";
    brightBlue = "#244378";
    brightMagenta = "#4a3a66";
    brightCyan = "#003b5a";
    brightWhite = "#1a1b26";
  };

  orange = "#965027";
  brightOrange = "#833f13";
  cursor = "#34548a";

  tools = {
    bat = "ansi";
  };
}
