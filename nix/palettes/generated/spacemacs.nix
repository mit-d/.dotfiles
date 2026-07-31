# Spacemacs -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/spacemacs.yaml
# Author: Nasser Alshammari (https://github.com/nashamri/spacemacs-theme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/spacemacs.nix. Edits here are lost on the
# next run.

{
  name = "spacemacs";
  displayName = "Spacemacs";
  author = "Nasser Alshammari (https://github.com/nashamri/spacemacs-theme)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1f2022";
  surfaceDim = "#17181a";
  surfaceBright = "#393939";
  surfaceContainerLowest = "#17181a";
  surfaceContainerLow = "#1f2022";
  surfaceContainer = "#282828";
  surfaceContainerHigh = "#303030";
  surfaceContainerHighest = "#393939";
  surfaceVariant = "#282828";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f8f8f8";
  onSurface = "#a3a3a3";
  onSurfaceMuted = "#a3a3a3";
  onSurfaceVariant = "#a3a3a3";
  onSurfaceFaint = "#585858";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5e5e5e";
  outlineVariant = "#444155";

  # --- Accent roles -------------------------------------------------------
  primary = "#4f97d7";
  onPrimary = "#1f2022";
  primaryContainer = "#334a61";
  onPrimaryContainer = "#f8f8f8";
  secondary = "#2d9574";
  onSecondary = "#ffffff";
  tertiary = "#a31db1";
  onTertiary = "#f8f8f8";
  error = "#f2241f";
  onError = "#ffffff";
  inverseSurface = "#a3a3a3";
  inverseOnSurface = "#1f2022";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282828";
    red = "#f2241f";
    green = "#67b11d";
    yellow = "#b1951d";
    blue = "#4f97d7";
    magenta = "#a31db1";
    cyan = "#2d9574";
    white = "#a3a3a3";
    brightBlack = "#585858";
    brightRed = "#ff5143";
    brightGreen = "#79c439";
    brightYellow = "#c4a838";
    brightBlue = "#62aaeb";
    brightMagenta = "#b737c5";
    brightCyan = "#44a886";
    brightWhite = "#f8f8f8";
  };

  orange = "#ffa500";
  brightOrange = "#ffc176";
  cursor = "#4f97d7";

  tools = {
    bat = "ansi";
  };
}
