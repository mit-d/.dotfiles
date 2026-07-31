# Brasa -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/brasa.yaml
# Author: Teshre
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/brasa.nix. Edits here are lost on the
# next run.

{
  name = "brasa";
  displayName = "Brasa";
  author = "Teshre";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1a0f0a";
  surfaceDim = "#0d0502";
  surfaceBright = "#48372e";
  surfaceContainerLowest = "#0d0502";
  surfaceContainerLow = "#1a0f0a";
  surfaceContainer = "#2b1c14";
  surfaceContainerHigh = "#392921";
  surfaceContainerHighest = "#48372e";
  surfaceVariant = "#2b1c14";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fbead8";
  onSurface = "#f0d8c0";
  onSurfaceMuted = "#d2baa4";
  onSurfaceVariant = "#b59d88";
  onSurfaceFaint = "#7a6150";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7a6150";
  outlineVariant = "#46271b";

  # --- Accent roles -------------------------------------------------------
  primary = "#9aa6e0";
  onPrimary = "#1a0f0a";
  primaryContainer = "#474352";
  onPrimaryContainer = "#fbead8";
  secondary = "#6bc8b8";
  onSecondary = "#1a0f0a";
  tertiary = "#e68aa2";
  onTertiary = "#1a0f0a";
  error = "#f2685a";
  onError = "#1a0f0a";
  inverseSurface = "#f0d8c0";
  inverseOnSurface = "#1a0f0a";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2b1c14";
    red = "#f2685a";
    green = "#b8c24a";
    yellow = "#f0b23a";
    blue = "#9aa6e0";
    magenta = "#e68aa2";
    cyan = "#6bc8b8";
    white = "#f0d8c0";
    brightBlack = "#7a6150";
    brightRed = "#ff8274";
    brightGreen = "#cbd65f";
    brightYellow = "#ffc765";
    brightBlue = "#adb9f4";
    brightMagenta = "#fb9db5";
    brightCyan = "#7fdccb";
    brightWhite = "#fbead8";
  };

  orange = "#ff7a4d";
  brightOrange = "#ff9c7c";
  cursor = "#9aa6e0";

  tools = {
    bat = "ansi";
  };
}
