# Humanoid dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/humanoid-dark.yaml
# Author: Thomas (tasmo) Friese
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/humanoid-dark.nix. Edits here are lost on the
# next run.

{
  name = "humanoid-dark";
  displayName = "Humanoid dark";
  author = "Thomas (tasmo) Friese";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#232629";
  surfaceDim = "#16191c";
  surfaceBright = "#50595b";
  surfaceContainerLowest = "#16191c";
  surfaceContainerLow = "#232629";
  surfaceContainer = "#333b3d";
  surfaceContainerHigh = "#414a4c";
  surfaceContainerHighest = "#50595b";
  surfaceVariant = "#333b3d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fcfcfc";
  onSurface = "#f8f8f2";
  onSurfaceMuted = "#dcdcd7";
  onSurfaceVariant = "#c0c0bd";
  onSurfaceFaint = "#60615d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#62635f";
  outlineVariant = "#484e54";

  # --- Accent roles -------------------------------------------------------
  primary = "#00a6fb";
  onPrimary = "#232629";
  primaryContainer = "#2c5472";
  onPrimaryContainer = "#fcfcfc";
  secondary = "#0dd9d6";
  onSecondary = "#232629";
  tertiary = "#f15ee3";
  onTertiary = "#232629";
  error = "#f11235";
  onError = "#0d0d0d";
  inverseSurface = "#f8f8f2";
  inverseOnSurface = "#232629";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#333b3d";
    red = "#f11235";
    green = "#02d849";
    yellow = "#ffb627";
    blue = "#00a6fb";
    magenta = "#f15ee3";
    cyan = "#0dd9d6";
    white = "#f8f8f2";
    brightBlack = "#60615d";
    brightRed = "#ff4850";
    brightGreen = "#38ec5e";
    brightYellow = "#ffd189";
    brightBlue = "#56b9ff";
    brightMagenta = "#ff7cf1";
    brightCyan = "#3dedea";
    brightWhite = "#fcfcfc";
  };

  orange = "#ff9505";
  brightOrange = "#ffb36d";
  cursor = "#00a6fb";

  tools = {
    bat = "ansi";
  };
}
