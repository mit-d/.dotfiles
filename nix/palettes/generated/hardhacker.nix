# Hardhacker -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/hardhacker.yaml
# Author: fe2-Nyxar, based on the https://github.com/hardhackerlabs
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/hardhacker.nix. Edits here are lost on the
# next run.

{
  name = "hardhacker";
  displayName = "Hardhacker";
  author = "fe2-Nyxar, based on the https://github.com/hardhackerlabs";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#211e2a";
  surfaceDim = "#171420";
  surfaceBright = "#413c4d";
  surfaceContainerLowest = "#171420";
  surfaceContainerLow = "#211e2a";
  surfaceContainer = "#2c2737";
  surfaceContainerHigh = "#363142";
  surfaceContainerHighest = "#413c4d";
  surfaceVariant = "#2c2737";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#e4dee9";
  onSurfaceMuted = "#b6afc3";
  onSurfaceVariant = "#8a829e";
  onSurfaceFaint = "#6e6780";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6e6780";
  outlineVariant = "#3f3951";

  # --- Accent roles -------------------------------------------------------
  primary = "#95a6f4";
  onPrimary = "#211e2a";
  primaryContainer = "#4a4d70";
  onPrimaryContainer = "#ffffff";
  secondary = "#b3f4f3";
  onSecondary = "#211e2a";
  tertiary = "#ff79c6";
  onTertiary = "#211e2a";
  error = "#e965a5";
  onError = "#211e2a";
  inverseSurface = "#e4dee9";
  inverseOnSurface = "#211e2a";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2c2737";
    red = "#e965a5";
    green = "#b1f2a7";
    yellow = "#ebde76";
    blue = "#95a6f4";
    magenta = "#ff79c6";
    cyan = "#b3f4f3";
    white = "#e4dee9";
    brightBlack = "#6e6780";
    brightRed = "#fe78b8";
    brightGreen = "#d6ffd0";
    brightYellow = "#fff28a";
    brightBlue = "#aabaff";
    brightMagenta = "#ff9fd3";
    brightCyan = "#e9fffe";
    brightWhite = "#ffffff";
  };

  orange = "#f4b870";
  brightOrange = "#ffcf97";
  cursor = "#95a6f4";

  tools = {
    bat = "ansi";
  };
}
