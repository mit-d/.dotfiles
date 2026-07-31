# OneDark Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/onedark-dark.yaml
# Author: olimorris (https://github.com/olimorris)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/onedark-dark.nix. Edits here are lost on the
# next run.

{
  name = "onedark-dark";
  displayName = "OneDark Dark";
  author = "olimorris (https://github.com/olimorris)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#000000";
  surfaceDim = "#000000";
  surfaceBright = "#373a40";
  surfaceContainerLowest = "#000000";
  surfaceContainerLow = "#000000";
  surfaceContainer = "#1c1f24";
  surfaceContainerHigh = "#292c32";
  surfaceContainerHighest = "#373a40";
  surfaceVariant = "#1c1f24";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#c8ccd4";
  onSurface = "#abb2bf";
  onSurfaceMuted = "#7f8690";
  onSurfaceVariant = "#5e646c";
  onSurfaceFaint = "#434852";

  # --- Borders and dividers -----------------------------------------------
  outline = "#494e58";
  outlineVariant = "#2c313a";

  # --- Accent roles -------------------------------------------------------
  primary = "#61afef";
  onPrimary = "#000000";
  primaryContainer = "#132a3d";
  onPrimaryContainer = "#c8ccd4";
  secondary = "#2bbac5";
  onSecondary = "#000000";
  tertiary = "#d55fde";
  onTertiary = "#000000";
  error = "#ef596f";
  onError = "#000000";
  inverseSurface = "#abb2bf";
  inverseOnSurface = "#000000";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1c1f24";
    red = "#ef596f";
    green = "#89ca78";
    yellow = "#e5c07b";
    blue = "#61afef";
    magenta = "#d55fde";
    cyan = "#2bbac5";
    white = "#abb2bf";
    brightBlack = "#434852";
    brightRed = "#ff7384";
    brightGreen = "#9cde8b";
    brightYellow = "#f9d38e";
    brightBlue = "#7ac2ff";
    brightMagenta = "#e973f2";
    brightCyan = "#47cdd8";
    brightWhite = "#c8ccd4";
  };

  orange = "#d19a66";
  brightOrange = "#e5ad78";
  cursor = "#61afef";

  tools = {
    bat = "ansi";
  };
}
