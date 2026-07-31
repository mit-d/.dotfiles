# Heetch Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/heetch-light.yaml
# Author: Geoffrey Teale (tealeg@gmail.com), Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/heetch-light.nix. Edits here are lost on the
# next run.

{
  name = "heetch-light";
  displayName = "Heetch Light";
  author = "Geoffrey Teale (tealeg@gmail.com), Tinted Theming (https://github.com/tinted-theming)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#feffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#bbb7be";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#feffff";
  surfaceContainer = "#dedae2";
  surfaceContainerHigh = "#ccc8d0";
  surfaceContainerHighest = "#bbb7be";
  surfaceVariant = "#dedae2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#190134";
  onSurface = "#5a496e";
  onSurfaceMuted = "#6a5b7c";
  onSurfaceVariant = "#7b6d8b";
  onSurfaceFaint = "#9c92a8";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9c92a8";
  outlineVariant = "#bdb6c5";

  # --- Accent roles -------------------------------------------------------
  primary = "#5ba2b6";
  onPrimary = "#190134";
  primaryContainer = "#c1dbe3";
  onPrimaryContainer = "#190134";
  secondary = "#47f9f5";
  onSecondary = "#190134";
  tertiary = "#8f6c97";
  onTertiary = "#ffffff";
  error = "#f80059";
  onError = "#190134";
  inverseSurface = "#5a496e";
  inverseOnSurface = "#feffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#dedae2";
    red = "#f80059";
    green = "#5bb66a";
    yellow = "#bd9701";
    blue = "#5ba2b6";
    magenta = "#8f6c97";
    cyan = "#47f9f5";
    white = "#5a496e";
    brightBlack = "#9c92a8";
    brightRed = "#d9004d";
    brightGreen = "#47a358";
    brightYellow = "#a78500";
    brightBlue = "#488fa3";
    brightMagenta = "#7d5b85";
    brightCyan = "#21e5e1";
    brightWhite = "#190134";
  };

  orange = "#bd0152";
  brightOrange = "#a00044";
  cursor = "#5a9eb3";

  tools = {
    bat = "ansi";
  };
}
