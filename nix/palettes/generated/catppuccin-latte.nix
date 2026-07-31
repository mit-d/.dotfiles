# Catppuccin Latte -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/catppuccin-latte.yaml
# Author: https://github.com/catppuccin/catppuccin
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/catppuccin-latte.nix. Edits here are lost on the
# next run.

{
  name = "catppuccin-latte";
  displayName = "Catppuccin Latte";
  author = "https://github.com/catppuccin/catppuccin";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#eff1f5";
  surfaceDim = "#f7f9fd";
  surfaceBright = "#d6d9df";
  surfaceContainerLowest = "#f7f9fd";
  surfaceContainerLow = "#eff1f5";
  surfaceContainer = "#e6e9ef";
  surfaceContainerHigh = "#dee1e7";
  surfaceContainerHighest = "#d6d9df";
  surfaceVariant = "#e6e9ef";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#3f4c93";
  onSurface = "#4d506a";
  onSurfaceMuted = "#727589";
  onSurfaceVariant = "#7d808a";
  onSurfaceFaint = "#8fa1eb";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7f94f5";
  outlineVariant = "#c8cddc";

  # --- Accent roles -------------------------------------------------------
  primary = "#1e66f5";
  onPrimary = "#f3f5f8";
  primaryContainer = "#a1c0fa";
  onPrimaryContainer = "#3d498e";
  secondary = "#179299";
  onSecondary = "#ffffff";
  tertiary = "#8839ef";
  onTertiary = "#eff1f5";
  error = "#d20f39";
  onError = "#eff1f5";
  inverseSurface = "#4d506a";
  inverseOnSurface = "#eff1f5";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e6e9ef";
    red = "#d20f39";
    green = "#40a02b";
    yellow = "#df8e1d";
    blue = "#1e66f5";
    magenta = "#8839ef";
    cyan = "#179299";
    white = "#4c4f69";
    brightBlack = "#bcc0cc";
    brightRed = "#b6002e";
    brightGreen = "#2b8d0f";
    brightYellow = "#c97c00";
    brightBlue = "#0652e0";
    brightMagenta = "#771dda";
    brightCyan = "#007f85";
    brightWhite = "#7287fd";
  };

  orange = "#fe640b";
  brightOrange = "#e25700";
  cursor = "#1e66f5";

  tools = {
    bat = "Catppuccin Latte";
  };
}
