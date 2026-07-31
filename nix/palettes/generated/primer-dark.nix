# Primer Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/primer-dark.yaml
# Author: Jimmy Lin
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/primer-dark.nix. Edits here are lost on the
# next run.

{
  name = "primer-dark";
  displayName = "Primer Dark";
  author = "Jimmy Lin";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#010409";
  surfaceDim = "#000001";
  surfaceBright = "#3c424a";
  surfaceContainerLowest = "#000001";
  surfaceContainerLow = "#010409";
  surfaceContainer = "#21262d";
  surfaceContainerHigh = "#2e343b";
  surfaceContainerHighest = "#3c424a";
  surfaceVariant = "#21262d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f0f6fc";
  onSurface = "#b1bac4";
  onSurfaceMuted = "#9ea7b1";
  onSurfaceVariant = "#8b949e";
  onSurfaceFaint = "#484f58";

  # --- Borders and dividers -----------------------------------------------
  outline = "#495059";
  outlineVariant = "#30363d";

  # --- Accent roles -------------------------------------------------------
  primary = "#58a6ff";
  onPrimary = "#010409";
  primaryContainer = "#1a385a";
  onPrimaryContainer = "#f0f6fc";
  secondary = "#a5d6ff";
  onSecondary = "#010409";
  tertiary = "#f778ba";
  onTertiary = "#010409";
  error = "#ff7b72";
  onError = "#010409";
  inverseSurface = "#b1bac4";
  inverseOnSurface = "#010409";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#21262d";
    red = "#ff7b72";
    green = "#3fb950";
    yellow = "#d29922";
    blue = "#58a6ff";
    magenta = "#f778ba";
    cyan = "#a5d6ff";
    white = "#b1bac4";
    brightBlack = "#484f58";
    brightRed = "#ff9d94";
    brightGreen = "#55cd63";
    brightYellow = "#e6ac3d";
    brightBlue = "#7fbaff";
    brightMagenta = "#ff97ca";
    brightCyan = "#cce7ff";
    brightWhite = "#f0f6fc";
  };

  orange = "#f0883e";
  brightOrange = "#ff9f5f";
  cursor = "#58a6ff";

  tools = {
    bat = "ansi";
  };
}
