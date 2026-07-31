# Google Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/google-dark.yaml
# Author: Seth Wright (http://sethawright.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/google-dark.nix. Edits here are lost on the
# next run.

{
  name = "google-dark";
  displayName = "Google Dark";
  author = "Seth Wright (http://sethawright.com)";
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
  primary = "#3971ed";
  onPrimary = "#ffffff";
  primaryContainer = "#293e68";
  onPrimaryContainer = "#ffffff";
  secondary = "#3971ed";
  onSecondary = "#ffffff";
  tertiary = "#a36ac7";
  onTertiary = "#ffffff";
  error = "#cc342b";
  onError = "#ffffff";
  inverseSurface = "#c5c8c6";
  inverseOnSurface = "#1d1f21";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282a2e";
    red = "#cc342b";
    green = "#198844";
    yellow = "#fba922";
    blue = "#3971ed";
    magenta = "#a36ac7";
    cyan = "#3971ed";
    white = "#c5c8c6";
    brightBlack = "#969896";
    brightRed = "#e14a3e";
    brightGreen = "#339b55";
    brightYellow = "#ffc375";
    brightBlue = "#4c85ff";
    brightMagenta = "#b67cdb";
    brightCyan = "#4c85ff";
    brightWhite = "#ffffff";
  };

  orange = "#f96a38";
  brightOrange = "#ff8a64";
  cursor = "#3971ed";

  tools = {
    bat = "ansi";
  };
}
