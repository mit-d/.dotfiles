# Unikitty Reversible -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/unikitty-reversible.yaml
# Author: Josh W Lewis (@joshwlewis)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/unikitty-reversible.nix. Edits here are lost on the
# next run.

{
  name = "unikitty-reversible";
  displayName = "Unikitty Reversible";
  author = "Josh W Lewis (@joshwlewis)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2e2a31";
  surfaceDim = "#211d23";
  surfaceBright = "#6a666d";
  surfaceContainerLowest = "#211d23";
  surfaceContainerLow = "#2e2a31";
  surfaceContainer = "#4b484e";
  surfaceContainerHigh = "#5a575d";
  surfaceContainerHighest = "#6a666d";
  surfaceVariant = "#4b484e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#c3c2c4";
  onSurfaceMuted = "#b4b2b5";
  onSurfaceVariant = "#a5a3a6";
  onSurfaceFaint = "#878589";

  # --- Borders and dividers -----------------------------------------------
  outline = "#878589";
  outlineVariant = "#69666b";

  # --- Accent roles -------------------------------------------------------
  primary = "#7864fa";
  onPrimary = "#ffffff";
  primaryContainer = "#474278";
  onPrimaryContainer = "#ffffff";
  secondary = "#149bda";
  onSecondary = "#2e2a31";
  tertiary = "#b33ce8";
  onTertiary = "#ffffff";
  error = "#d8137f";
  onError = "#ffffff";
  inverseSurface = "#c3c2c4";
  inverseOnSurface = "#2e2a31";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#4b484e";
    red = "#d8137f";
    green = "#17ad98";
    yellow = "#dc8a0e";
    blue = "#7864fa";
    magenta = "#b33ce8";
    cyan = "#149bda";
    white = "#c3c2c4";
    brightBlack = "#878589";
    brightRed = "#ee3491";
    brightGreen = "#39c0ab";
    brightYellow = "#f09d31";
    brightBlue = "#897eff";
    brightMagenta = "#c752fd";
    brightCyan = "#35aeee";
    brightWhite = "#ffffff";
  };

  orange = "#d65407";
  brightOrange = "#eb6728";
  cursor = "#7864fa";

  tools = {
    bat = "ansi";
  };
}
