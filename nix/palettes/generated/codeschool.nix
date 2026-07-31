# Codeschool -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/codeschool.yaml
# Author: blockloop
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/codeschool.nix. Edits here are lost on the
# next run.

{
  name = "codeschool";
  displayName = "Codeschool";
  author = "blockloop";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#232c31";
  surfaceDim = "#192226";
  surfaceBright = "#324d70";
  surfaceContainerLowest = "#192226";
  surfaceContainerLow = "#232c31";
  surfaceContainer = "#1c3657";
  surfaceContainerHigh = "#274163";
  surfaceContainerHighest = "#324d70";
  surfaceVariant = "#1c3657";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#b5d8f6";
  onSurface = "#9ea7a6";
  onSurfaceMuted = "#919899";
  onSurfaceVariant = "#84898c";
  onSurfaceFaint = "#536161";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5a6a6c";
  outlineVariant = "#37434b";

  # --- Accent roles -------------------------------------------------------
  primary = "#484d79";
  onPrimary = "#b5d8f6";
  primaryContainer = "#30384b";
  onPrimaryContainer = "#b5d8f6";
  secondary = "#b02f30";
  onSecondary = "#beddf7";
  tertiary = "#c59820";
  onTertiary = "#232c31";
  error = "#2a5491";
  onError = "#b5d8f6";
  inverseSurface = "#9ea7a6";
  inverseOnSurface = "#232c31";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1c3657";
    red = "#2a5491";
    green = "#237986";
    yellow = "#a03b1e";
    blue = "#484d79";
    magenta = "#c59820";
    cyan = "#b02f30";
    white = "#9ea7a6";
    brightBlack = "#3f4944";
    brightRed = "#3b65a4";
    brightGreen = "#398b98";
    brightYellow = "#b44d31";
    brightBlue = "#585e8b";
    brightMagenta = "#d9ab3b";
    brightCyan = "#c54341";
    brightWhite = "#b5d8f6";
  };

  orange = "#43820d";
  brightOrange = "#559429";
  cursor = "#65729b";

  tools = {
    bat = "ansi";
  };
}
