# Windows High Contrast Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/windows-highcontrast-light.yaml
# Author: Fergus Collins (https://github.com/ferguscollins)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/windows-highcontrast-light.nix. Edits here are lost on the
# next run.

{
  name = "windows-highcontrast-light";
  displayName = "Windows High Contrast Light";
  author = "Fergus Collins (https://github.com/ferguscollins)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fcfcfc";
  surfaceDim = "#ffffff";
  surfaceBright = "#c4c4c4";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fcfcfc";
  surfaceContainer = "#e8e8e8";
  surfaceContainerHigh = "#d6d6d6";
  surfaceContainerHighest = "#c4c4c4";
  surfaceVariant = "#e8e8e8";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#000000";
  onSurface = "#545454";
  onSurfaceMuted = "#696969";
  onSurfaceVariant = "#7e7e7e";
  onSurfaceFaint = "#acacac";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a2a1a1";
  outlineVariant = "#d4d4d4";

  # --- Accent roles -------------------------------------------------------
  primary = "#000080";
  onPrimary = "#fcfcfc";
  primaryContainer = "#8da4d1";
  onPrimaryContainer = "#000000";
  secondary = "#008080";
  onSecondary = "#fcfcfc";
  tertiary = "#800080";
  onTertiary = "#fcfcfc";
  error = "#800000";
  onError = "#fcfcfc";
  inverseSurface = "#545454";
  inverseOnSurface = "#fcfcfc";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e8e8e8";
    red = "#800000";
    green = "#008000";
    yellow = "#808000";
    blue = "#000080";
    magenta = "#800080";
    cyan = "#008080";
    white = "#545454";
    brightBlack = "#c0c0c0";
    brightRed = "#640000";
    brightGreen = "#006c00";
    brightYellow = "#6e6e00";
    brightBlue = "#000a50";
    brightMagenta = "#670067";
    brightCyan = "#006d6d";
    brightWhite = "#000000";
  };

  orange = "#fcfc54";
  brightOrange = "#e8e839";
  cursor = "#000080";

  tools = {
    bat = "ansi";
  };
}
