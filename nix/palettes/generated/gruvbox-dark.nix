# Gruvbox dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/gruvbox-dark.yaml
# Author: Tinted Theming (https://github.com/tinted-theming), morhetz (https://github.com/morhetz/gruvbox)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/gruvbox-dark.nix. Edits here are lost on the
# next run.

{
  name = "gruvbox-dark";
  displayName = "Gruvbox dark";
  author = "Tinted Theming (https://github.com/tinted-theming), morhetz (https://github.com/morhetz/gruvbox)";
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
  onSurfaceStrong = "#f9f5d7";
  onSurface = "#ebdbb2";
  onSurfaceMuted = "#beae92";
  onSurfaceVariant = "#928374";
  onSurfaceFaint = "#665c54";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6c635a";
  outlineVariant = "#504945";

  # --- Accent roles -------------------------------------------------------
  primary = "#458588";
  onPrimary = "#ffffff";
  primaryContainer = "#35494a";
  onPrimaryContainer = "#f9f5d7";
  secondary = "#689d6a";
  onSecondary = "#282828";
  tertiary = "#b16286";
  onTertiary = "#ffffff";
  error = "#cc241d";
  onError = "#f9f5d7";
  inverseSurface = "#ebdbb2";
  inverseOnSurface = "#282828";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#3c3836";
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    magenta = "#b16286";
    cyan = "#689d6a";
    white = "#ebdbb2";
    brightBlack = "#665c54";
    brightRed = "#e23d32";
    brightGreen = "#aaaa35";
    brightYellow = "#ebac3c";
    brightBlue = "#57979a";
    brightMagenta = "#c57498";
    brightCyan = "#7ab07c";
    brightWhite = "#f9f5d7";
  };

  orange = "#d65d0e";
  brightOrange = "#eb702c";
  cursor = "#458588";

  tools = {
    bat = "gruvbox-dark";
  };
}
