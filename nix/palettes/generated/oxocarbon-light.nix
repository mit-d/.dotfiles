# Oxocarbon Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/oxocarbon-light.yaml
# Author: shaunsingh/IBM, Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/oxocarbon-light.nix. Edits here are lost on the
# next run.

{
  name = "oxocarbon-light";
  displayName = "Oxocarbon Light";
  author = "shaunsingh/IBM, Tinted Theming (https://github.com/tinted-theming)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f2f4f8";
  surfaceDim = "#ffffff";
  surfaceBright = "#babdc2";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f2f4f8";
  surfaceContainer = "#dde1e6";
  surfaceContainerHigh = "#cbcfd4";
  surfaceContainerHighest = "#babdc2";
  surfaceVariant = "#dde1e6";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#272d35";
  onSurface = "#525f70";
  onSurfaceMuted = "#5d6b7e";
  onSurfaceVariant = "#68788d";
  onSurfaceFaint = "#9da8b5";

  # --- Borders and dividers -----------------------------------------------
  outline = "#929daa";
  outlineVariant = "#bec6cf";

  # --- Accent roles -------------------------------------------------------
  primary = "#0f62fe";
  onPrimary = "#f2f4f8";
  primaryContainer = "#9fc2ff";
  onPrimaryContainer = "#272d35";
  secondary = "#673ab7";
  onSecondary = "#f2f4f8";
  tertiary = "#be95ff";
  onTertiary = "#272d35";
  error = "#ff7eb6";
  onError = "#272d35";
  inverseSurface = "#525f70";
  inverseOnSurface = "#f2f4f8";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#dde1e6";
    red = "#ff7eb6";
    green = "#42be65";
    yellow = "#ff6f00";
    blue = "#0f62fe";
    magenta = "#be95ff";
    cyan = "#673ab7";
    white = "#525f70";
    brightBlack = "#a1acba";
    brightRed = "#ea6ba3";
    brightGreen = "#28ab53";
    brightYellow = "#e36200";
    brightBlue = "#0050e1";
    brightMagenta = "#ab82ea";
    brightCyan = "#5725a3";
    brightWhite = "#272d35";
  };

  orange = "#ee5396";
  brightOrange = "#d83e84";
  cursor = "#0f62fe";

  tools = {
    bat = "ansi";
  };
}
