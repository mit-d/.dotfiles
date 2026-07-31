# Gruvbox light, hard -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-light-hard.yaml
# Author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-light-hard.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-light-hard";
  displayName = "Gruvbox light, hard";
  author = "Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f9f5d7";
  surfaceDim = "#ffffff";
  surfaceBright = "#c7b890";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f9f5d7";
  surfaceContainer = "#ebdbb2";
  surfaceContainerHigh = "#d9c9a1";
  surfaceContainerHighest = "#c7b890";
  surfaceVariant = "#ebdbb2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#282828";
  onSurface = "#504945";
  onSurfaceMuted = "#5b524c";
  onSurfaceVariant = "#665c54";
  onSurfaceFaint = "#b3a58c";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a79a84";
  outlineVariant = "#d5c4a1";

  # --- Accent roles -------------------------------------------------------
  primary = "#076678";
  onPrimary = "#f9f5d7";
  primaryContainer = "#a5bdb3";
  onPrimaryContainer = "#282828";
  secondary = "#427b58";
  onSecondary = "#f9f5d7";
  tertiary = "#8f3f71";
  onTertiary = "#f9f5d7";
  error = "#9d0006";
  onError = "#f9f5d7";
  inverseSurface = "#504945";
  inverseOnSurface = "#f9f5d7";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ebdbb2";
    red = "#9d0006";
    green = "#79740e";
    yellow = "#b57614";
    blue = "#076678";
    magenta = "#8f3f71";
    cyan = "#427b58";
    white = "#504945";
    brightBlack = "#bdae93";
    brightRed = "#800004";
    brightGreen = "#676200";
    brightYellow = "#9f6500";
    brightBlue = "#005464";
    brightMagenta = "#7c2e60";
    brightCyan = "#306947";
    brightWhite = "#282828";
  };

  orange = "#af3a03";
  brightOrange = "#942f00";
  cursor = "#076678";

  tools = {
    bat = "gruvbox-light";
  };
}
