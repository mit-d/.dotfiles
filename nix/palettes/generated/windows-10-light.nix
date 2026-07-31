# Windows 10 Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/windows-10-light.yaml
# Author: Fergus Collins (https://github.com/ferguscollins)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/windows-10-light.nix. Edits here are lost on the
# next run.

{
  name = "windows-10-light";
  displayName = "Windows 10 Light";
  author = "Fergus Collins (https://github.com/ferguscollins)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f2f2f2";
  surfaceDim = "#ffffff";
  surfaceBright = "#cbcbcb";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f2f2f2";
  surfaceContainer = "#e5e5e5";
  surfaceContainerHigh = "#d8d8d8";
  surfaceContainerHighest = "#cbcbcb";
  surfaceVariant = "#e5e5e5";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#0c0c0c";
  onSurface = "#6f6e6e";
  onSurfaceMuted = "#777777";
  onSurfaceVariant = "#808080";
  onSurfaceFaint = "#a5a5a5";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9a9a9a";
  outlineVariant = "#cfcece";

  # --- Accent roles -------------------------------------------------------
  primary = "#0037da";
  onPrimary = "#f2f2f2";
  primaryContainer = "#94b3f0";
  onPrimaryContainer = "#0c0c0c";
  secondary = "#3a96dd";
  onSecondary = "#0c0c0c";
  tertiary = "#881798";
  onTertiary = "#f2f2f2";
  error = "#c50f1f";
  onError = "#f2f2f2";
  inverseSurface = "#6f6e6e";
  inverseOnSurface = "#f2f2f2";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e5e5e5";
    red = "#c50f1f";
    green = "#13a10e";
    yellow = "#c19c00";
    blue = "#0037da";
    magenta = "#881798";
    cyan = "#3a96dd";
    white = "#767676";
    brightBlack = "#cccccc";
    brightRed = "#a90015";
    brightGreen = "#038c00";
    brightYellow = "#ab8a00";
    brightBlue = "#002cb4";
    brightMagenta = "#730082";
    brightCyan = "#2383c9";
    brightWhite = "#0c0c0c";
  };

  orange = "#f9f1a5";
  brightOrange = "#e5dd92";
  cursor = "#0037da";

  tools = {
    bat = "ansi";
  };
}
