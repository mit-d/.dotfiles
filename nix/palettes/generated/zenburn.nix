# Zenburn -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/zenburn.yaml
# Author: elnawe
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/zenburn.nix. Edits here are lost on the
# next run.

{
  name = "zenburn";
  displayName = "Zenburn";
  author = "elnawe";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#383838";
  surfaceDim = "#303030";
  surfaceBright = "#505050";
  surfaceContainerLowest = "#303030";
  surfaceContainerLow = "#383838";
  surfaceContainer = "#404040";
  surfaceContainerHigh = "#484848";
  surfaceContainerHighest = "#505050";
  surfaceVariant = "#404040";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#dcdccc";
  onSurfaceMuted = "#adada5";
  onSurfaceVariant = "#8d8d8c";
  onSurfaceFaint = "#6f6f6f";

  # --- Borders and dividers -----------------------------------------------
  outline = "#747473";
  outlineVariant = "#606060";

  # --- Accent roles -------------------------------------------------------
  primary = "#7cb8bb";
  onPrimary = "#383838";
  primaryContainer = "#526667";
  onPrimaryContainer = "#ffffff";
  secondary = "#93e0e3";
  onSecondary = "#383838";
  tertiary = "#dc8cc3";
  onTertiary = "#383838";
  error = "#dca3a3";
  onError = "#383838";
  inverseSurface = "#dcdccc";
  inverseOnSurface = "#383838";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#404040";
    red = "#dca3a3";
    green = "#5f7f5f";
    yellow = "#e0cf9f";
    blue = "#7cb8bb";
    magenta = "#dc8cc3";
    cyan = "#93e0e3";
    white = "#dcdccc";
    brightBlack = "#6f6f6f";
    brightRed = "#f0b6b6";
    brightGreen = "#709170";
    brightYellow = "#f4e3b2";
    brightBlue = "#8fcbce";
    brightMagenta = "#f09fd6";
    brightCyan = "#a6f4f7";
    brightWhite = "#ffffff";
  };

  orange = "#dfaf8f";
  brightOrange = "#f3c2a2";
  cursor = "#7cb8bb";

  tools = {
    bat = "zenburn";
  };
}
