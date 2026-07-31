# Windows NT Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/windows-nt-light.yaml
# Author: Fergus Collins (https://github.com/ferguscollins)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/windows-nt-light.nix. Edits here are lost on the
# next run.

{
  name = "windows-nt-light";
  displayName = "Windows NT Light";
  author = "Fergus Collins (https://github.com/ferguscollins)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#c6c6c6";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#eaeaea";
  surfaceContainerHigh = "#d8d8d8";
  surfaceContainerHighest = "#c6c6c6";
  surfaceVariant = "#eaeaea";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#000000";
  onSurface = "#777777";
  onSurfaceMuted = "#7f7f7f";
  onSurfaceVariant = "#898989";
  onSurfaceFaint = "#afafaf";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a4a4a4";
  outlineVariant = "#d5d5d5";

  # --- Accent roles -------------------------------------------------------
  primary = "#000080";
  onPrimary = "#ffffff";
  primaryContainer = "#8fa6d3";
  onPrimaryContainer = "#000000";
  secondary = "#008080";
  onSecondary = "#ffffff";
  tertiary = "#800080";
  onTertiary = "#ffffff";
  error = "#800000";
  onError = "#ffffff";
  inverseSurface = "#777777";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#eaeaea";
    red = "#800000";
    green = "#008000";
    yellow = "#808000";
    blue = "#000080";
    magenta = "#800080";
    cyan = "#008080";
    white = "#808080";
    brightBlack = "#c0c0c0";
    brightRed = "#640000";
    brightGreen = "#006c00";
    brightYellow = "#6e6e00";
    brightBlue = "#000a50";
    brightMagenta = "#670067";
    brightCyan = "#006d6d";
    brightWhite = "#000000";
  };

  orange = "#ffff00";
  brightOrange = "#eaea00";
  cursor = "#000080";

  tools = {
    bat = "ansi";
  };
}
