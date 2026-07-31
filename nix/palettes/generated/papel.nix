# Papel -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/papel.yaml
# Author: Teshre
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/papel.nix. Edits here are lost on the
# next run.

{
  name = "papel";
  displayName = "Papel";
  author = "Teshre";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f5efe2";
  surfaceDim = "#ffffff";
  surfaceBright = "#6e6557";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f5efe2";
  surfaceContainer = "#8e8576";
  surfaceContainerHigh = "#7e7566";
  surfaceContainerHighest = "#6e6557";
  surfaceVariant = "#8e8576";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#342f29";
  onSurface = "#3a2e20";
  onSurfaceMuted = "#514535";
  onSurfaceVariant = "#6a5d4b";
  onSurfaceFaint = "#9a8c76";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9a8c76";
  outlineVariant = "#dacba8";

  # --- Accent roles -------------------------------------------------------
  primary = "#2c6ca0";
  onPrimary = "#f5efe2";
  primaryContainer = "#a9bdcb";
  onPrimaryContainer = "#342f29";
  secondary = "#2a8a7a";
  onSecondary = "#121110";
  tertiary = "#9b4d8e";
  onTertiary = "#f5efe2";
  error = "#c0392b";
  onError = "#f5efe2";
  inverseSurface = "#3a2e20";
  inverseOnSurface = "#f5efe2";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#8e8576";
    red = "#c0392b";
    green = "#5e7a28";
    yellow = "#a8761a";
    blue = "#2c6ca0";
    magenta = "#9b4d8e";
    cyan = "#2a8a7a";
    white = "#3a2e20";
    brightBlack = "#9a8c76";
    brightRed = "#ab2317";
    brightGreen = "#4d6812";
    brightYellow = "#946500";
    brightBlue = "#175a8d";
    brightMagenta = "#883b7c";
    brightCyan = "#0b7869";
    brightWhite = "#342f29";
  };

  orange = "#c25c1f";
  brightOrange = "#ad4a00";
  cursor = "#2c6ca0";

  tools = {
    bat = "ansi";
  };
}
