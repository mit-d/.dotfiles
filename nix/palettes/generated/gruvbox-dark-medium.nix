# Gruvbox dark, medium -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-dark-medium.yaml
# Author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-dark-medium.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-dark-medium";
  displayName = "Gruvbox dark, medium";
  author = "Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)";
  variant = "dark";
  version = "3.2.0";

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
  onSurfaceFaint = "#665c54";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6d6359";
  outlineVariant = "#504945";

  # --- Accent roles -------------------------------------------------------
  primary = "#83a598";
  onPrimary = "#282828";
  primaryContainer = "#495450";
  onPrimaryContainer = "#fbf1c7";
  secondary = "#8ec07c";
  onSecondary = "#282828";
  tertiary = "#d3869b";
  onTertiary = "#282828";
  error = "#fb4934";
  onError = "#252424";
  inverseSurface = "#d5c4a1";
  inverseOnSurface = "#282828";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3c3836";
    red = "#fb4934";
    green = "#b8bb26";
    yellow = "#fabd2f";
    blue = "#83a598";
    magenta = "#d3869b";
    cyan = "#8ec07c";
    white = "#d5c4a1";
    brightBlack = "#665c54";
    brightRed = "#ff735e";
    brightGreen = "#cbcf42";
    brightYellow = "#ffd584";
    brightBlue = "#95b8ab";
    brightMagenta = "#e798ae";
    brightCyan = "#a1d38e";
    brightWhite = "#fbf1c7";
  };

  orange = "#fe8019";
  brightOrange = "#ffa065";
  cursor = "#83a598";

  tools = {
    bat = "gruvbox-dark";
  };
}
