# Precious Light Warm -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/precious-light-warm.yaml
# Author: 4lex4 <4lex49@zoho.com>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/precious-light-warm.nix. Edits here are lost on the
# next run.

{
  name = "precious-light-warm";
  displayName = "Precious Light Warm";
  author = "4lex4 <4lex49@zoho.com>";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fff5e5";
  surfaceDim = "#ffffff";
  surfaceBright = "#cac2b4";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fff5e5";
  surfaceContainer = "#ece4d6";
  surfaceContainerHigh = "#dbd3c5";
  surfaceContainerHighest = "#cac2b4";
  surfaceVariant = "#ece4d6";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#4e5359";
  onSurface = "#4e5359";
  onSurfaceMuted = "#55595f";
  onSurfaceVariant = "#5d6065";
  onSurfaceFaint = "#7f8080";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7f8080";
  outlineVariant = "#d7d1c7";

  # --- Accent roles -------------------------------------------------------
  primary = "#246da5";
  onPrimary = "#fff5e5";
  primaryContainer = "#aec1cf";
  onPrimaryContainer = "#4a4e54";
  secondary = "#0e7767";
  onSecondary = "#fff5e5";
  tertiary = "#7a50c6";
  onTertiary = "#fff5e5";
  error = "#b14745";
  onError = "#fff5e5";
  inverseSurface = "#4e5359";
  inverseOnSurface = "#fff5e5";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ece4d6";
    red = "#b14745";
    green = "#557300";
    yellow = "#876500";
    blue = "#246da5";
    magenta = "#7a50c6";
    cyan = "#0e7767";
    white = "#4e5359";
    brightBlack = "#7f8080";
    brightRed = "#9d3434";
    brightGreen = "#476000";
    brightYellow = "#725500";
    brightBlue = "#0a5b92";
    brightMagenta = "#693db2";
    brightCyan = "#006456";
    brightWhite = "#4e5359";
  };

  orange = "#a25600";
  brightOrange = "#8a4800";
  cursor = "#246da5";

  tools = {
    bat = "ansi";
  };
}
