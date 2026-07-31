# Sagelight -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/sagelight.yaml
# Author: Carter Veldhuizen
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/sagelight.nix. Edits here are lost on the
# next run.

{
  name = "sagelight";
  displayName = "Sagelight";
  author = "Carter Veldhuizen";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f8f8f8";
  surfaceDim = "#ffffff";
  surfaceBright = "#c9c9c9";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f8f8f8";
  surfaceContainer = "#e8e8e8";
  surfaceContainerHigh = "#d8d8d8";
  surfaceContainerHighest = "#c9c9c9";
  surfaceVariant = "#e8e8e8";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#181818";
  onSurface = "#383838";
  onSurfaceMuted = "#484848";
  onSurfaceVariant = "#585858";
  onSurfaceFaint = "#aaaaaa";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9f9f9f";
  outlineVariant = "#d4d4d4";

  # --- Accent roles -------------------------------------------------------
  primary = "#a0a7d2";
  onPrimary = "#181818";
  primaryContainer = "#d6d9ea";
  onPrimaryContainer = "#181818";
  secondary = "#a2d6f5";
  onSecondary = "#181818";
  tertiary = "#c8a0d2";
  onTertiary = "#181818";
  error = "#fa8480";
  onError = "#181818";
  inverseSurface = "#383838";
  inverseOnSurface = "#f8f8f8";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e8e8e8";
    red = "#fa8480";
    green = "#a0d2c8";
    yellow = "#ffdc61";
    blue = "#a0a7d2";
    magenta = "#c8a0d2";
    cyan = "#a2d6f5";
    white = "#383838";
    brightBlack = "#b8b8b8";
    brightRed = "#e5716e";
    brightGreen = "#8dbfb5";
    brightYellow = "#ebc84b";
    brightBlue = "#8e94bf";
    brightMagenta = "#b58ebf";
    brightCyan = "#8fc3e1";
    brightWhite = "#181818";
  };

  orange = "#ffaa61";
  brightOrange = "#ea974d";
  cursor = "#898eb2";

  tools = {
    bat = "ansi";
  };
}
