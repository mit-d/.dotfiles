# Tomorrow Night -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tomorrow-night.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tomorrow-night.nix. Edits here are lost on the
# next run.

{
  name = "tomorrow-night";
  displayName = "Tomorrow Night";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1d1f21";
  surfaceDim = "#121416";
  surfaceBright = "#404246";
  surfaceContainerLowest = "#121416";
  surfaceContainerLow = "#1d1f21";
  surfaceContainer = "#282a2e";
  surfaceContainerHigh = "#34363a";
  surfaceContainerHighest = "#404246";
  surfaceVariant = "#282a2e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#c5c8c6";
  onSurfaceMuted = "#bcbfbd";
  onSurfaceVariant = "#b4b7b4";
  onSurfaceFaint = "#969896";

  # --- Borders and dividers -----------------------------------------------
  outline = "#969896";
  outlineVariant = "#373b41";

  # --- Accent roles -------------------------------------------------------
  primary = "#81a2be";
  onPrimary = "#1d1f21";
  primaryContainer = "#404d57";
  onPrimaryContainer = "#ffffff";
  secondary = "#8abeb7";
  onSecondary = "#1d1f21";
  tertiary = "#b294bb";
  onTertiary = "#1d1f21";
  error = "#cc6666";
  onError = "#ffffff";
  inverseSurface = "#c5c8c6";
  inverseOnSurface = "#1d1f21";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282a2e";
    red = "#cc6666";
    green = "#b5bd68";
    yellow = "#f0c674";
    blue = "#81a2be";
    magenta = "#b294bb";
    cyan = "#8abeb7";
    white = "#c5c8c6";
    brightBlack = "#969896";
    brightRed = "#e17878";
    brightGreen = "#c8d07b";
    brightYellow = "#ffdb96";
    brightBlue = "#93b5d1";
    brightMagenta = "#c5a7ce";
    brightCyan = "#9dd1ca";
    brightWhite = "#ffffff";
  };

  orange = "#de935f";
  brightOrange = "#f2a672";
  cursor = "#81a2be";

  tools = {
    bat = "ansi";
  };
}
