# Darcula -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/darcula.yaml
# Author: jetbrains
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/darcula.nix. Edits here are lost on the
# next run.

{
  name = "darcula";
  displayName = "Darcula";
  author = "jetbrains";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2b2b2b";
  surfaceDim = "#242424";
  surfaceBright = "#404040";
  surfaceContainerLowest = "#242424";
  surfaceContainerLow = "#2b2b2b";
  surfaceContainer = "#323232";
  surfaceContainerHigh = "#393939";
  surfaceContainerHighest = "#404040";
  surfaceVariant = "#323232";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#a9b7c6";
  onSurfaceMuted = "#a7adb4";
  onSurfaceVariant = "#a4a3a3";
  onSurfaceFaint = "#606366";

  # --- Borders and dividers -----------------------------------------------
  outline = "#64676a";
  outlineVariant = "#424242";

  # --- Accent roles -------------------------------------------------------
  primary = "#9876aa";
  onPrimary = "#ffffff";
  primaryContainer = "#524658";
  onPrimaryContainer = "#ffffff";
  secondary = "#629755";
  onSecondary = "#ffffff";
  tertiary = "#cc7832";
  onTertiary = "#ffffff";
  error = "#4eade5";
  onError = "#2b2b2b";
  inverseSurface = "#a9b7c6";
  inverseOnSurface = "#2b2b2b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#323232";
    red = "#4eade5";
    green = "#6a8759";
    yellow = "#bbb529";
    blue = "#9876aa";
    magenta = "#cc7832";
    cyan = "#629755";
    white = "#a9b7c6";
    brightBlack = "#606366";
    brightRed = "#62c0f9";
    brightGreen = "#7c996a";
    brightYellow = "#cec843";
    brightBlue = "#ab88bd";
    brightMagenta = "#e08b46";
    brightCyan = "#74aa67";
    brightWhite = "#ffffff";
  };

  orange = "#689757";
  brightOrange = "#7aaa69";
  cursor = "#9876aa";

  tools = {
    bat = "ansi";
  };
}
