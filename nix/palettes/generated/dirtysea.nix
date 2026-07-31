# dirtysea -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/dirtysea.yaml
# Author: Kahlil (Kal) Hodgson
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/dirtysea.nix. Edits here are lost on the
# next run.

{
  name = "dirtysea";
  displayName = "dirtysea";
  author = "Kahlil (Kal) Hodgson";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#e0e0e0";
  surfaceDim = "#e9e9e9";
  surfaceBright = "#bec7be";
  surfaceContainerLowest = "#e9e9e9";
  surfaceContainerLow = "#e0e0e0";
  surfaceContainer = "#d0dad0";
  surfaceContainerHigh = "#c7d1c7";
  surfaceContainerHighest = "#bec7be";
  surfaceVariant = "#d0dad0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#000000";
  onSurface = "#000000";
  onSurfaceMuted = "#060606";
  onSurfaceVariant = "#202020";
  onSurfaceFaint = "#707070";

  # --- Borders and dividers -----------------------------------------------
  outline = "#707070";
  outlineVariant = "#bfbebe";

  # --- Accent roles -------------------------------------------------------
  primary = "#007300";
  onPrimary = "#e0e0e0";
  primaryContainer = "#96b793";
  onPrimaryContainer = "#000000";
  secondary = "#755b00";
  onSecondary = "#e0e0e0";
  tertiary = "#000090";
  onTertiary = "#e0e0e0";
  error = "#840000";
  onError = "#e0e0e0";
  inverseSurface = "#000000";
  inverseOnSurface = "#e0e0e0";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#d0dad0";
    red = "#840000";
    green = "#730073";
    yellow = "#755b00";
    blue = "#007300";
    magenta = "#000090";
    cyan = "#755b00";
    white = "#000000";
    brightBlack = "#707070";
    brightRed = "#680000";
    brightGreen = "#5b005b";
    brightYellow = "#614b00";
    brightBlue = "#005f00";
    brightMagenta = "#000d5e";
    brightCyan = "#614b00";
    brightWhite = "#010101";
  };

  orange = "#006565";
  brightOrange = "#005353";
  cursor = "#007300";

  tools = {
    bat = "ansi";
  };
}
