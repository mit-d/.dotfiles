# Stella -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/stella.yaml
# Author: Shrimpram
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/stella.nix. Edits here are lost on the
# next run.

{
  name = "stella";
  displayName = "Stella";
  author = "Shrimpram";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2b213c";
  surfaceDim = "#211731";
  surfaceBright = "#4c415f";
  surfaceContainerLowest = "#211731";
  surfaceContainerLow = "#2b213c";
  surfaceContainer = "#362b48";
  surfaceContainerHigh = "#413654";
  surfaceContainerHighest = "#4c415f";
  surfaceVariant = "#362b48";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ebdcff";
  onSurface = "#998bad";
  onSurfaceMuted = "#8c7e9f";
  onSurfaceVariant = "#827495";
  onSurfaceFaint = "#655978";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6a5d7d";
  outlineVariant = "#4d4160";

  # --- Accent roles -------------------------------------------------------
  primary = "#a5aad4";
  onPrimary = "#2b213c";
  primaryContainer = "#565172";
  onPrimaryContainer = "#ebdcff";
  secondary = "#9bc7bf";
  onSecondary = "#2b213c";
  tertiary = "#c594ff";
  onTertiary = "#2b213c";
  error = "#c79987";
  onError = "#2b213c";
  inverseSurface = "#998bad";
  inverseOnSurface = "#2b213c";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#362b48";
    red = "#c79987";
    green = "#acc79b";
    yellow = "#c7c691";
    blue = "#a5aad4";
    magenta = "#c594ff";
    cyan = "#9bc7bf";
    white = "#998bad";
    brightBlack = "#655978";
    brightRed = "#dbac99";
    brightGreen = "#bfdaae";
    brightYellow = "#dad9a4";
    brightBlue = "#b8bde8";
    brightMagenta = "#d2b0ff";
    brightCyan = "#aedad2";
    brightWhite = "#ebdcff";
  };

  orange = "#8865c6";
  brightOrange = "#9a77da";
  cursor = "#a5aad4";

  tools = {
    bat = "ansi";
  };
}
