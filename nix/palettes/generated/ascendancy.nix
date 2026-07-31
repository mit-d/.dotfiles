# Ascendancy -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/ascendancy.yaml
# Author: EmergentMind (https://github.com/emergentmind/ascendancy-scheme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/ascendancy.nix. Edits here are lost on the
# next run.

{
  name = "ascendancy";
  displayName = "Ascendancy";
  author = "EmergentMind (https://github.com/emergentmind/ascendancy-scheme)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#282828";
  surfaceDim = "#232323";
  surfaceBright = "#2c3a49";
  surfaceContainerLowest = "#232323";
  surfaceContainerLow = "#282828";
  surfaceContainer = "#212f3d";
  surfaceContainerHigh = "#263543";
  surfaceContainerHighest = "#2c3a49";
  surfaceVariant = "#212f3d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fbf1c7";
  onSurface = "#d5c7a1";
  onSurfaceMuted = "#c9ba9a";
  onSurfaceVariant = "#bdae93";
  onSurfaceFaint = "#928374";

  # --- Borders and dividers -----------------------------------------------
  outline = "#928374";
  outlineVariant = "#504945";

  # --- Accent roles -------------------------------------------------------
  primary = "#458588";
  onPrimary = "#ffffff";
  primaryContainer = "#35494a";
  onPrimaryContainer = "#fbf1c7";
  secondary = "#8f3f71";
  onSecondary = "#fbf1c7";
  tertiary = "#fabd2f";
  onTertiary = "#282828";
  error = "#d05000";
  onError = "#ffffff";
  inverseSurface = "#d5c7a1";
  inverseOnSurface = "#282828";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#212f3d";
    red = "#d05000";
    green = "#b8bb26";
    yellow = "#ffcc1b";
    blue = "#458588";
    magenta = "#fabd2f";
    cyan = "#8f3f71";
    white = "#d5c7a1";
    brightBlack = "#928374";
    brightRed = "#e56324";
    brightGreen = "#cbcf42";
    brightYellow = "#ffe49d";
    brightBlue = "#57979a";
    brightMagenta = "#ffd584";
    brightCyan = "#a25083";
    brightWhite = "#fbf1c7";
  };

  orange = "#fe8019";
  brightOrange = "#ffa065";
  cursor = "#458588";

  tools = {
    bat = "ansi";
  };
}
