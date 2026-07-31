# Gruvbox light, soft -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-light-soft.yaml
# Author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-light-soft.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-light-soft";
  displayName = "Gruvbox light, soft";
  author = "Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f2e5bc";
  surfaceDim = "#fbeec5";
  surfaceBright = "#d9c9a0";
  surfaceContainerLowest = "#fbeec5";
  surfaceContainerLow = "#f2e5bc";
  surfaceContainer = "#ebdbb2";
  surfaceContainerHigh = "#e2d2a9";
  surfaceContainerHighest = "#d9c9a0";
  surfaceVariant = "#ebdbb2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#282828";
  onSurface = "#504945";
  onSurfaceMuted = "#5b524c";
  onSurfaceVariant = "#665c54";
  onSurfaceFaint = "#a79a83";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9c907b";
  outlineVariant = "#d2c29f";

  # --- Accent roles -------------------------------------------------------
  primary = "#076678";
  onPrimary = "#f2e5bc";
  primaryContainer = "#a1b4a3";
  onPrimaryContainer = "#282828";
  secondary = "#427b58";
  onSecondary = "#f9f3e0";
  tertiary = "#8f3f71";
  onTertiary = "#f2e5bc";
  error = "#9d0006";
  onError = "#f2e5bc";
  inverseSurface = "#504945";
  inverseOnSurface = "#f2e5bc";

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
