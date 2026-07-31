# Shapeshifter -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/shapeshifter.yaml
# Author: Tyler Benziger (http://tybenz.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/shapeshifter.nix. Edits here are lost on the
# next run.

{
  name = "shapeshifter";
  displayName = "Shapeshifter";
  author = "Tyler Benziger (http://tybenz.com)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f9f9f9";
  surfaceDim = "#ffffff";
  surfaceBright = "#bcbcbc";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f9f9f9";
  surfaceContainer = "#e0e0e0";
  surfaceContainerHigh = "#cecece";
  surfaceContainerHighest = "#bcbcbc";
  surfaceVariant = "#e0e0e0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#000000";
  onSurface = "#102015";
  onSurfaceMuted = "#222a24";
  onSurfaceVariant = "#343434";
  onSurfaceFaint = "#555555";

  # --- Borders and dividers -----------------------------------------------
  outline = "#555555";
  outlineVariant = "#ababab";

  # --- Accent roles -------------------------------------------------------
  primary = "#3b48e3";
  onPrimary = "#f9f9f9";
  primaryContainer = "#a8bbf7";
  onPrimaryContainer = "#000000";
  secondary = "#23edda";
  onSecondary = "#000000";
  tertiary = "#f996e2";
  onTertiary = "#000000";
  error = "#e92f2f";
  onError = "#000000";
  inverseSurface = "#102015";
  inverseOnSurface = "#f9f9f9";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e0e0e0";
    red = "#e92f2f";
    green = "#0ed839";
    yellow = "#dddd13";
    blue = "#3b48e3";
    magenta = "#f996e2";
    cyan = "#23edda";
    white = "#102015";
    brightBlack = "#555555";
    brightRed = "#d30719";
    brightGreen = "#00c230";
    brightYellow = "#c9c900";
    brightBlue = "#2f32ce";
    brightMagenta = "#e483ce";
    brightCyan = "#00d8c6";
    brightWhite = "#000000";
  };

  orange = "#e09448";
  brightOrange = "#cc8133";
  cursor = "#3b48e3";

  tools = {
    bat = "ansi";
  };
}
