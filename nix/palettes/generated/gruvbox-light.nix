# Gruvbox Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-light.yaml
# Author: Tinted Theming (https://github.com/tinted-theming), morhetz (https://github.com/morhetz/gruvbox)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-light.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-light";
  displayName = "Gruvbox Light";
  author = "Tinted Theming (https://github.com/tinted-theming), morhetz (https://github.com/morhetz/gruvbox)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fbf1c7";
  surfaceDim = "#ffffff";
  surfaceBright = "#c7b890";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fbf1c7";
  surfaceContainer = "#ebdbb2";
  surfaceContainerHigh = "#d9c9a1";
  surfaceContainerHighest = "#c7b890";
  surfaceVariant = "#ebdbb2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1d2021";
  onSurface = "#3c3836";
  onSurfaceMuted = "#5b534c";
  onSurfaceVariant = "#7c6f64";
  onSurfaceFaint = "#b0a28a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a49882";
  outlineVariant = "#d5c4a1";

  # --- Accent roles -------------------------------------------------------
  primary = "#458588";
  onPrimary = "#ffffff";
  primaryContainer = "#b6c7b0";
  onPrimaryContainer = "#1d2021";
  secondary = "#689d6a";
  onSecondary = "#1d2021";
  tertiary = "#b16286";
  onTertiary = "#ffffff";
  error = "#cc241d";
  onError = "#fbf1c7";
  inverseSurface = "#3c3836";
  inverseOnSurface = "#fbf1c7";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ebdbb2";
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    magenta = "#b16286";
    cyan = "#689d6a";
    white = "#3c3836";
    brightBlack = "#bdae93";
    brightRed = "#b50005";
    brightGreen = "#868400";
    brightYellow = "#c28700";
    brightBlue = "#327376";
    brightMagenta = "#9d5074";
    brightCyan = "#568b59";
    brightWhite = "#1d2021";
  };

  orange = "#d65d0e";
  brightOrange = "#bc4f00";
  cursor = "#458588";

  tools = {
    bat = "gruvbox-light";
  };
}
