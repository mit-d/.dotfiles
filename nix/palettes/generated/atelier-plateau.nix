# Atelier Plateau -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-plateau.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-plateau.nix. Edits here are lost on the
# next run.

{
  name = "atelier-plateau";
  displayName = "Atelier Plateau";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1b1818";
  surfaceDim = "#0f0c0c";
  surfaceBright = "#443f3f";
  surfaceContainerLowest = "#0f0c0c";
  surfaceContainerLow = "#1b1818";
  surfaceContainer = "#292424";
  surfaceContainerHigh = "#363131";
  surfaceContainerHighest = "#443f3f";
  surfaceVariant = "#292424";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f4ecec";
  onSurface = "#8a8585";
  onSurfaceMuted = "#847e7e";
  onSurfaceVariant = "#7e7777";
  onSurfaceFaint = "#655d5d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#655d5d";
  outlineVariant = "#585050";

  # --- Accent roles -------------------------------------------------------
  primary = "#7272ca";
  onPrimary = "#120f0f";
  primaryContainer = "#393956";
  onPrimaryContainer = "#f4ecec";
  secondary = "#5485b6";
  onSecondary = "#1b1818";
  tertiary = "#8464c4";
  onTertiary = "#040303";
  error = "#ca4949";
  onError = "#fefcfc";
  inverseSurface = "#8a8585";
  inverseOnSurface = "#1b1818";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#292424";
    red = "#ca4949";
    green = "#4b8b8b";
    yellow = "#a06e3b";
    blue = "#7272ca";
    magenta = "#8464c4";
    cyan = "#5485b6";
    white = "#8a8585";
    brightBlack = "#655d5d";
    brightRed = "#df5c5a";
    brightGreen = "#5d9d9d";
    brightYellow = "#b3804d";
    brightBlue = "#8384de";
    brightMagenta = "#9676d8";
    brightCyan = "#6697c9";
    brightWhite = "#f4ecec";
  };

  orange = "#b45a3c";
  brightOrange = "#c86c4e";
  cursor = "#7272ca";

  tools = {
    bat = "ansi";
  };
}
