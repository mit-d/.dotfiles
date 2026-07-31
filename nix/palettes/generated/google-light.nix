# Google Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/google-light.yaml
# Author: Seth Wright (http://sethawright.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/google-light.nix. Edits here are lost on the
# next run.

{
  name = "google-light";
  displayName = "Google Light";
  author = "Seth Wright (http://sethawright.com)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#bcbcbc";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#e0e0e0";
  surfaceContainerHigh = "#cecece";
  surfaceContainerHighest = "#bcbcbc";
  surfaceVariant = "#e0e0e0";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1d1f21";
  onSurface = "#373b41";
  onSurfaceMuted = "#65686a";
  onSurfaceVariant = "#878988";
  onSurfaceFaint = "#adafad";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a2a4a2";
  outlineVariant = "#c5c8c6";

  # --- Accent roles -------------------------------------------------------
  primary = "#3971ed";
  onPrimary = "#0a0909";
  primaryContainer = "#b2cbfd";
  onPrimaryContainer = "#1d1f21";
  secondary = "#3971ed";
  onSecondary = "#0a0909";
  tertiary = "#a36ac7";
  onTertiary = "#191a1c";
  error = "#cc342b";
  onError = "#ffffff";
  inverseSurface = "#373b41";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e0e0e0";
    red = "#cc342b";
    green = "#198844";
    yellow = "#fba922";
    blue = "#3971ed";
    magenta = "#a36ac7";
    cyan = "#3971ed";
    white = "#373b41";
    brightBlack = "#b4b7b4";
    brightRed = "#b71a16";
    brightGreen = "#007536";
    brightYellow = "#e59700";
    brightBlue = "#285ed8";
    brightMagenta = "#9058b3";
    brightCyan = "#285ed8";
    brightWhite = "#1d1f21";
  };

  orange = "#f96a38";
  brightOrange = "#e45621";
  cursor = "#3971ed";

  tools = {
    bat = "ansi";
  };
}
