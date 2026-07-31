# vulcan -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/vulcan.yaml
# Author: Andrey Varfolomeev
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/vulcan.nix. Edits here are lost on the
# next run.

{
  name = "vulcan";
  displayName = "vulcan";
  author = "Andrey Varfolomeev";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#041523";
  surfaceDim = "#000914";
  surfaceBright = "#2d3f57";
  surfaceContainerLowest = "#000914";
  surfaceContainerLow = "#041523";
  surfaceContainer = "#122339";
  surfaceContainerHigh = "#1f3148";
  surfaceContainerHighest = "#2d3f57";
  surfaceVariant = "#122339";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#8da3b2";
  onSurface = "#668194";
  onSurfaceMuted = "#697688";
  onSurfaceVariant = "#6c6b79";
  onSurfaceFaint = "#7a5759";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7a5759";
  outlineVariant = "#003552";

  # --- Accent roles -------------------------------------------------------
  primary = "#977d7c";
  onPrimary = "#041523";
  primaryContainer = "#383a44";
  onPrimaryContainer = "#91a7b5";
  secondary = "#977d7c";
  onSecondary = "#041523";
  tertiary = "#9198a3";
  onTertiary = "#041523";
  error = "#818591";
  onError = "#041523";
  inverseSurface = "#668194";
  inverseOnSurface = "#041523";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#122339";
    red = "#818591";
    green = "#977d7c";
    yellow = "#adb4b9";
    blue = "#977d7c";
    magenta = "#9198a3";
    cyan = "#977d7c";
    white = "#5b778c";
    brightBlack = "#7a5759";
    brightRed = "#9397a3";
    brightGreen = "#aa8f8e";
    brightYellow = "#c0c7cc";
    brightBlue = "#aa8f8e";
    brightMagenta = "#a3abb6";
    brightCyan = "#aa8f8e";
    brightWhite = "#8da3b2";
  };

  orange = "#9198a3";
  brightOrange = "#a3abb6";
  cursor = "#977d7c";

  tools = {
    bat = "ansi";
  };
}
