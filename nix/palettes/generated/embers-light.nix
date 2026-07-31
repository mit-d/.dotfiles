# Embers Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/embers-light.yaml
# Author: Jannik Siebert (https://github.com/janniks)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/embers-light.nix. Edits here are lost on the
# next run.

{
  name = "embers-light";
  displayName = "Embers Light";
  author = "Jannik Siebert (https://github.com/janniks)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#dbd6d1";
  surfaceDim = "#ede8e3";
  surfaceBright = "#9c948c";
  surfaceContainerLowest = "#ede8e3";
  surfaceContainerLow = "#dbd6d1";
  surfaceContainer = "#beb6ae";
  surfaceContainerHigh = "#ada59d";
  surfaceContainerHighest = "#9c948c";
  surfaceVariant = "#beb6ae";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#16130f";
  onSurface = "#433b32";
  onSurfaceMuted = "#4e453c";
  onSurfaceVariant = "#5a5047";
  onSurfaceFaint = "#8a8075";

  # --- Borders and dividers -----------------------------------------------
  outline = "#8a8075";
  outlineVariant = "#a39a90";

  # --- Accent roles -------------------------------------------------------
  primary = "#6d5782";
  onPrimary = "#dedad5";
  primaryContainer = "#b0a4b3";
  onPrimaryContainer = "#16130f";
  secondary = "#576d82";
  onSecondary = "#edebe8";
  tertiary = "#82576d";
  onTertiary = "#e3e0dc";
  error = "#826d57";
  onError = "#f5f5f4";
  inverseSurface = "#433b32";
  inverseOnSurface = "#dbd6d1";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#beb6ae";
    red = "#826d57";
    green = "#57826d";
    yellow = "#6d8257";
    blue = "#6d5782";
    magenta = "#82576d";
    cyan = "#576d82";
    white = "#433b32";
    brightBlack = "#8a8075";
    brightRed = "#705c46";
    brightGreen = "#46705c";
    brightYellow = "#5c7046";
    brightBlue = "#5c4670";
    brightMagenta = "#70465c";
    brightCyan = "#465c70";
    brightWhite = "#16130f";
  };

  orange = "#828257";
  brightOrange = "#707046";
  cursor = "#6d5782";

  tools = {
    bat = "ansi";
  };
}
