# Catppuccin Macchiato -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/catppuccin-macchiato.yaml
# Author: https://github.com/catppuccin/catppuccin
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/catppuccin-macchiato.nix. Edits here are lost on the
# next run.

{
  name = "catppuccin-macchiato";
  displayName = "Catppuccin Macchiato";
  author = "https://github.com/catppuccin/catppuccin";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#24273a";
  surfaceDim = "#1d2032";
  surfaceBright = "#2c2e3f";
  surfaceContainerLowest = "#1d2032";
  surfaceContainerLow = "#24273a";
  surfaceContainer = "#1e2030";
  surfaceContainerHigh = "#252738";
  surfaceContainerHighest = "#2c2e3f";
  surfaceVariant = "#1e2030";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f4dbd6";
  onSurface = "#cad3f5";
  onSurfaceMuted = "#9197b4";
  onSurfaceVariant = "#7b7a8c";
  onSurfaceFaint = "#595b6f";

  # --- Borders and dividers -----------------------------------------------
  outline = "#636376";
  outlineVariant = "#3b3e53";

  # --- Accent roles -------------------------------------------------------
  primary = "#8aadf4";
  onPrimary = "#24273a";
  primaryContainer = "#48567b";
  onPrimaryContainer = "#f4dbd6";
  secondary = "#8bd5ca";
  onSecondary = "#24273a";
  tertiary = "#c6a0f6";
  onTertiary = "#24273a";
  error = "#ed8796";
  onError = "#24273a";
  inverseSurface = "#cad3f5";
  inverseOnSurface = "#24273a";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1e2030";
    red = "#ed8796";
    green = "#a6da95";
    yellow = "#eed49f";
    blue = "#8aadf4";
    magenta = "#c6a0f6";
    cyan = "#8bd5ca";
    white = "#cad3f5";
    brightBlack = "#494d64";
    brightRed = "#ff9ca9";
    brightGreen = "#b9eea8";
    brightYellow = "#ffe8ba";
    brightBlue = "#a1c1ff";
    brightMagenta = "#d6b7ff";
    brightCyan = "#9ee9dd";
    brightWhite = "#f4dbd6";
  };

  orange = "#f5a97f";
  brightOrange = "#ffc19f";
  cursor = "#8aadf4";

  tools = {
    bat = "Catppuccin Macchiato";
  };
}
