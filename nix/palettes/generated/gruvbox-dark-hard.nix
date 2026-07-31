# Gruvbox dark, hard -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-dark-hard.yaml
# Author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-dark-hard.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-dark-hard";
  displayName = "Gruvbox dark, hard";
  author = "Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1d2021";
  surfaceDim = "#111314";
  surfaceBright = "#5a5553";
  surfaceContainerLowest = "#111314";
  surfaceContainerLow = "#1d2021";
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
  outline = "#665c54";
  outlineVariant = "#504945";

  # --- Accent roles -------------------------------------------------------
  primary = "#83a598";
  onPrimary = "#1d2021";
  primaryContainer = "#414e4b";
  onPrimaryContainer = "#fbf1c7";
  secondary = "#8ec07c";
  onSecondary = "#1d2021";
  tertiary = "#d3869b";
  onTertiary = "#1d2021";
  error = "#fb4934";
  onError = "#1d2021";
  inverseSurface = "#d5c4a1";
  inverseOnSurface = "#1d2021";

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
