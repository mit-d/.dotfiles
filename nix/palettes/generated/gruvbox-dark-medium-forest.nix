# Gruvbox Dark Medium (Forest) -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-dark-medium-forest.yaml
# Author: Muhammad Talha (muhammadtalha.quant@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-dark-medium-forest.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-dark-medium-forest";
  displayName = "Gruvbox Dark Medium (Forest)";
  author = "Muhammad Talha (muhammadtalha.quant@gmail.com), morhetz (https://github.com/morhetz/gruvbox)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#282828";
  surfaceDim = "#1b1b1b";
  surfaceBright = "#5a5553";
  surfaceContainerLowest = "#1b1b1b";
  surfaceContainerLow = "#282828";
  surfaceContainer = "#3c3836";
  surfaceContainerHigh = "#4b4644";
  surfaceContainerHighest = "#5a5553";
  surfaceVariant = "#3c3836";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fbf1c7";
  onSurface = "#d5c4a1";
  onSurfaceMuted = "#c9b99a";
  onSurfaceVariant = "#bdae93";
  onSurfaceFaint = "#665c50";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6d6356";
  outlineVariant = "#504945";

  # --- Accent roles -------------------------------------------------------
  primary = "#b8bb26";
  onPrimary = "#282828";
  primaryContainer = "#5a5c33";
  onPrimaryContainer = "#fbf1c7";
  secondary = "#5f6c1f";
  onSecondary = "#fbf1c7";
  tertiary = "#96bda2";
  onTertiary = "#282828";
  error = "#fb4934";
  onError = "#ffffff";
  inverseSurface = "#d5c4a1";
  inverseOnSurface = "#282828";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3c3836";
    red = "#fb4934";
    green = "#b8bb26";
    yellow = "#fabd2f";
    blue = "#b8bb26";
    magenta = "#96bda2";
    cyan = "#5f6c1f";
    white = "#d5c4a1";
    brightBlack = "#665c50";
    brightRed = "#ff735e";
    brightGreen = "#cbcf42";
    brightYellow = "#ffd584";
    brightBlue = "#cbcf42";
    brightMagenta = "#a9d0b5";
    brightCyan = "#707e33";
    brightWhite = "#fbf1c7";
  };

  orange = "#fe8019";
  brightOrange = "#ffa065";
  cursor = "#b8bb26";

  tools = {
    bat = "ansi";
  };
}
