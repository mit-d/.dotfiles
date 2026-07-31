# Swamp Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/swamp-light.yaml
# Author: Masroof Maindak (https://github.com/masroof-maindak)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/swamp-light.nix. Edits here are lost on the
# next run.

{
  name = "swamp-light";
  displayName = "Swamp Light";
  author = "Masroof Maindak (https://github.com/masroof-maindak)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f1e3d1";
  surfaceDim = "#fff6eb";
  surfaceBright = "#baab9a";
  surfaceContainerLowest = "#fff6eb";
  surfaceContainerLow = "#f1e3d1";
  surfaceContainer = "#ddcebc";
  surfaceContainerHigh = "#cbbcab";
  surfaceContainerHighest = "#baab9a";
  surfaceVariant = "#ddcebc";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#55483a";
  onSurface = "#64513e";
  onSurfaceMuted = "#7d6c59";
  onSurfaceVariant = "#847664";
  onSurfaceFaint = "#a99887";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9f8e7d";
  outlineVariant = "#c9b9a7";

  # --- Accent roles -------------------------------------------------------
  primary = "#bf7979";
  onPrimary = "#282522";
  primaryContainer = "#dfbaaf";
  onPrimaryContainer = "#55483a";
  secondary = "#d09700";
  onSecondary = "#41362b";
  tertiary = "#9e5581";
  onTertiary = "#f7efe4";
  error = "#d09700";
  onError = "#41362b";
  inverseSurface = "#64513e";
  inverseOnSurface = "#f1e3d1";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ddcebc";
    red = "#d09700";
    green = "#908d6a";
    yellow = "#993333";
    blue = "#bf7979";
    magenta = "#9e5581";
    cyan = "#d09700";
    white = "#64513e";
    brightBlack = "#b5a492";
    brightRed = "#b98600";
    brightGreen = "#7e7b59";
    brightYellow = "#851f23";
    brightBlue = "#ab6768";
    brightMagenta = "#8b446f";
    brightCyan = "#b98600";
    brightWhite = "#55483a";
  };

  orange = "#64513e";
  brightOrange = "#53412e";
  cursor = "#b07370";

  tools = {
    bat = "ansi";
  };
}
