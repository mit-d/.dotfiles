# Measured Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/measured-dark.yaml
# Author: Measured (https://measured.co)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/measured-dark.nix. Edits here are lost on the
# next run.

{
  name = "measured-dark";
  displayName = "Measured Dark";
  author = "Measured (https://measured.co)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#00211f";
  surfaceDim = "#001312";
  surfaceBright = "#255855";
  surfaceContainerLowest = "#001312";
  surfaceContainerLow = "#00211f";
  surfaceContainer = "#003a38";
  surfaceContainerHigh = "#144946";
  surfaceContainerHighest = "#255855";
  surfaceVariant = "#003a38";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5f5f5";
  onSurface = "#dcdcdc";
  onSurfaceMuted = "#cfcfcf";
  onSurfaceVariant = "#c3c3c3";
  onSurfaceFaint = "#ababab";

  # --- Borders and dividers -----------------------------------------------
  outline = "#ababab";
  outlineVariant = "#005453";

  # --- Accent roles -------------------------------------------------------
  primary = "#88b0da";
  onPrimary = "#00211f";
  primaryContainer = "#30535f";
  onPrimaryContainer = "#f5f5f5";
  secondary = "#62c0be";
  onSecondary = "#00211f";
  tertiary = "#b39be0";
  onTertiary = "#00211f";
  error = "#ce7e8e";
  onError = "#00211f";
  inverseSurface = "#dcdcdc";
  inverseOnSurface = "#00211f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#003a38";
    red = "#ce7e8e";
    green = "#56c16f";
    yellow = "#bfac4e";
    blue = "#88b0da";
    magenta = "#b39be0";
    cyan = "#62c0be";
    white = "#dcdcdc";
    brightBlack = "#ababab";
    brightRed = "#e290a0";
    brightGreen = "#6ad581";
    brightYellow = "#d2bf62";
    brightBlue = "#9ac3ee";
    brightMagenta = "#c6aef4";
    brightCyan = "#76d3d1";
    brightWhite = "#f5f5f5";
  };

  orange = "#dca37c";
  brightOrange = "#f0b68e";
  cursor = "#88b0da";

  tools = {
    bat = "ansi";
  };
}
