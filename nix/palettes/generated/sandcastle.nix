# Sandcastle -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/sandcastle.yaml
# Author: George Essig (https://github.com/gessig)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/sandcastle.nix. Edits here are lost on the
# next run.

{
  name = "sandcastle";
  displayName = "Sandcastle";
  author = "George Essig (https://github.com/gessig)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#282c34";
  surfaceDim = "#23262e";
  surfaceBright = "#373e47";
  surfaceContainerLowest = "#23262e";
  surfaceContainerLow = "#282c34";
  surfaceContainer = "#2c323b";
  surfaceContainerHigh = "#323841";
  surfaceContainerHighest = "#373e47";
  surfaceVariant = "#2c323b";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fdf4c1";
  onSurface = "#a89984";
  onSurfaceMuted = "#9d8e7c";
  onSurfaceVariant = "#928374";
  onSurfaceFaint = "#685e55";

  # --- Borders and dividers -----------------------------------------------
  outline = "#70665b";
  outlineVariant = "#3e4451";

  # --- Accent roles -------------------------------------------------------
  primary = "#83a598";
  onPrimary = "#282c34";
  primaryContainer = "#495758";
  onPrimaryContainer = "#fdf4c1";
  secondary = "#83a598";
  onSecondary = "#282c34";
  tertiary = "#d75f5f";
  onTertiary = "#ffffff";
  error = "#83a598";
  onError = "#282c34";
  inverseSurface = "#a89984";
  inverseOnSurface = "#282c34";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2c323b";
    red = "#83a598";
    green = "#528b8b";
    yellow = "#a07e3b";
    blue = "#83a598";
    magenta = "#d75f5f";
    cyan = "#83a598";
    white = "#a89984";
    brightBlack = "#665c54";
    brightRed = "#95b8ab";
    brightGreen = "#649d9d";
    brightYellow = "#b3904e";
    brightBlue = "#95b8ab";
    brightMagenta = "#ec7271";
    brightCyan = "#95b8ab";
    brightWhite = "#fdf4c1";
  };

  orange = "#a07e3b";
  brightOrange = "#b3904e";
  cursor = "#83a598";

  tools = {
    bat = "ansi";
  };
}
