# Atelier Plateau Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-plateau-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-plateau-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-plateau-light";
  displayName = "Atelier Plateau Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f4ecec";
  surfaceDim = "#fffafa";
  surfaceBright = "#cdc5c5";
  surfaceContainerLowest = "#fffafa";
  surfaceContainerLow = "#f4ecec";
  surfaceContainer = "#e7dfdf";
  surfaceContainerHigh = "#dad2d2";
  surfaceContainerHighest = "#cdc5c5";
  surfaceVariant = "#e7dfdf";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1b1818";
  onSurface = "#585050";
  onSurfaceMuted = "#5e5656";
  onSurfaceVariant = "#655d5d";
  onSurfaceFaint = "#7e7777";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7e7777";
  outlineVariant = "#8a8585";

  # --- Accent roles -------------------------------------------------------
  primary = "#7272ca";
  onPrimary = "#120f0f";
  primaryContainer = "#c0bee1";
  onPrimaryContainer = "#1b1818";
  secondary = "#5485b6";
  onSecondary = "#1b1818";
  tertiary = "#8464c4";
  onTertiary = "#040303";
  error = "#ca4949";
  onError = "#fefcfc";
  inverseSurface = "#585050";
  inverseOnSurface = "#f4ecec";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e7dfdf";
    red = "#ca4949";
    green = "#4b8b8b";
    yellow = "#a06e3b";
    blue = "#7272ca";
    magenta = "#8464c4";
    cyan = "#5485b6";
    white = "#585050";
    brightBlack = "#7e7777";
    brightRed = "#b53538";
    brightGreen = "#397979";
    brightYellow = "#8d5d29";
    brightBlue = "#6160b6";
    brightMagenta = "#7352b0";
    brightCyan = "#4373a3";
    brightWhite = "#1b1818";
  };

  orange = "#b45a3c";
  brightOrange = "#a0482a";
  cursor = "#7272ca";

  tools = {
    bat = "ansi";
  };
}
