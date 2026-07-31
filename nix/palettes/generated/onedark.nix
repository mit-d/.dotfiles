# OneDark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/onedark.yaml
# Author: Lalit Magant (http://github.com/tilal6991)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/onedark.nix. Edits here are lost on the
# next run.

{
  name = "onedark";
  displayName = "OneDark";
  author = "Lalit Magant (http://github.com/tilal6991)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#282c34";
  surfaceDim = "#1b1f26";
  surfaceBright = "#525963";
  surfaceContainerLowest = "#1b1f26";
  surfaceContainerLow = "#282c34";
  surfaceContainer = "#353b45";
  surfaceContainerHigh = "#434a54";
  surfaceContainerHighest = "#525963";
  surfaceVariant = "#353b45";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#c8ccd4";
  onSurface = "#abb2bf";
  onSurfaceMuted = "#838a94";
  onSurfaceVariant = "#7a8088";
  onSurfaceFaint = "#5b5f69";

  # --- Borders and dividers -----------------------------------------------
  outline = "#646872";
  outlineVariant = "#3e4451";

  # --- Accent roles -------------------------------------------------------
  primary = "#61afef";
  onPrimary = "#282c34";
  primaryContainer = "#3f5a76";
  onPrimaryContainer = "#caced5";
  secondary = "#56b6c2";
  onSecondary = "#282c34";
  tertiary = "#c678dd";
  onTertiary = "#282c34";
  error = "#e06c75";
  onError = "#ffffff";
  inverseSurface = "#abb2bf";
  inverseOnSurface = "#282c34";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#353b45";
    red = "#e06c75";
    green = "#98c379";
    yellow = "#e5c07b";
    blue = "#61afef";
    magenta = "#c678dd";
    cyan = "#56b6c2";
    white = "#abb2bf";
    brightBlack = "#545862";
    brightRed = "#f57f87";
    brightGreen = "#abd78c";
    brightYellow = "#f9d38e";
    brightBlue = "#7ac2ff";
    brightMagenta = "#da8bf1";
    brightCyan = "#6ac9d5";
    brightWhite = "#c8ccd4";
  };

  orange = "#d19a66";
  brightOrange = "#e5ad78";
  cursor = "#61afef";

  tools = {
    bat = "ansi";
  };
}
