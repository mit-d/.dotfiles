# Gruber -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruber.yaml
# Author: Patel, Nimai <nimai.m.patel@gmail.com>, colors from www.github.com/rexim/gruber-darker-theme
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruber.nix. Edits here are lost on the
# next run.

{
  name = "gruber";
  displayName = "Gruber";
  author = "Patel, Nimai <nimai.m.patel@gmail.com>, colors from www.github.com/rexim/gruber-darker-theme";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#181818";
  surfaceDim = "#0c0c0c";
  surfaceBright = "#635b5f";
  surfaceContainerLowest = "#0c0c0c";
  surfaceContainerLow = "#181818";
  surfaceContainer = "#453d41";
  surfaceContainerHigh = "#544c50";
  surfaceContainerHighest = "#635b5f";
  surfaceVariant = "#453d41";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5f5f5";
  onSurface = "#f4f4ff";
  onSurfaceMuted = "#ececf7";
  onSurfaceVariant = "#e4e4ef";
  onSurfaceFaint = "#564e53";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5e565b";
  outlineVariant = "#484848";

  # --- Accent roles -------------------------------------------------------
  primary = "#96a6c8";
  onPrimary = "#181818";
  primaryContainer = "#444954";
  onPrimaryContainer = "#f5f5f5";
  secondary = "#95a99f";
  onSecondary = "#181818";
  tertiary = "#9e95c7";
  onTertiary = "#181818";
  error = "#f43841";
  onError = "#181818";
  inverseSurface = "#f4f4ff";
  inverseOnSurface = "#181818";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#453d41";
    red = "#f43841";
    green = "#73c936";
    yellow = "#ffdd33";
    blue = "#96a6c8";
    magenta = "#9e95c7";
    cyan = "#95a99f";
    white = "#f4f4ff";
    brightBlack = "#52494e";
    brightRed = "#ff5f5e";
    brightGreen = "#86dd4d";
    brightYellow = "#fff3bc";
    brightBlue = "#a9b9dc";
    brightMagenta = "#b1a8db";
    brightCyan = "#a8bcb2";
    brightWhite = "#f5f5f5";
  };

  orange = "#c73c3f";
  brightOrange = "#dc5050";
  cursor = "#96a6c8";

  tools = {
    bat = "ansi";
  };
}
