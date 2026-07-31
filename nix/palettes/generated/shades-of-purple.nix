# Shades of Purple -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/shades-of-purple.yaml
# Author: Iolar Demartini Junior (http://github.com/demartini), based on Shades of Purple Theme (https://github.com/ahmadawais/shades-of-purple-vscode)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/shades-of-purple.nix. Edits here are lost on the
# next run.

{
  name = "shades-of-purple";
  displayName = "Shades of Purple";
  author = "Iolar Demartini Junior (http://github.com/demartini), based on Shades of Purple Theme (https://github.com/ahmadawais/shades-of-purple-vscode)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1e1e3f";
  surfaceDim = "#121130";
  surfaceBright = "#6df956";
  surfaceContainerLowest = "#121130";
  surfaceContainerLow = "#1e1e3f";
  surfaceContainer = "#43d426";
  surfaceContainerHigh = "#59e740";
  surfaceContainerHighest = "#6df956";
  surfaceVariant = "#43d426";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#c7c7c7";
  onSurfaceMuted = "#94a0e7";
  onSurfaceVariant = "#6871ff";
  onSurfaceFaint = "#808080";

  # --- Borders and dividers -----------------------------------------------
  outline = "#808080";
  outlineVariant = "#f1d000";

  # --- Accent roles -------------------------------------------------------
  primary = "#6943ff";
  onPrimary = "#ffffff";
  primaryContainer = "#382e83";
  onPrimaryContainer = "#ffffff";
  secondary = "#00c5c7";
  onSecondary = "#1e1e3f";
  tertiary = "#ff2c70";
  onTertiary = "#1d1d3e";
  error = "#d90429";
  onError = "#ffffff";
  inverseSurface = "#c7c7c7";
  inverseOnSurface = "#1e1e3f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#43d426";
    red = "#d90429";
    green = "#3ad900";
    yellow = "#ffe700";
    blue = "#6943ff";
    magenta = "#ff2c70";
    cyan = "#00c5c7";
    white = "#c7c7c7";
    brightBlack = "#808080";
    brightRed = "#ef2f3c";
    brightGreen = "#54ed32";
    brightYellow = "#fffad0";
    brightBlue = "#7866ff";
    brightMagenta = "#ff688a";
    brightCyan = "#36d9da";
    brightWhite = "#ffffff";
  };

  orange = "#f92a1c";
  brightOrange = "#ff5e4c";
  cursor = "#6a47ff";

  tools = {
    bat = "ansi";
  };
}
