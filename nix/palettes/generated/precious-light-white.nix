# Precious Light White -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/precious-light-white.yaml
# Author: 4lex4 <4lex49@zoho.com>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/precious-light-white.nix. Edits here are lost on the
# next run.

{
  name = "precious-light-white";
  displayName = "Precious Light White";
  author = "4lex4 <4lex49@zoho.com>";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#ffffff";
  surfaceDim = "#ffffff";
  surfaceBright = "#cacaca";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#ffffff";
  surfaceContainer = "#ededed";
  surfaceContainerHigh = "#dbdbdb";
  surfaceContainerHighest = "#cacaca";
  surfaceVariant = "#ededed";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#555555";
  onSurface = "#555555";
  onSurfaceMuted = "#5c5c5c";
  onSurfaceVariant = "#636363";
  onSurfaceFaint = "#848484";

  # --- Borders and dividers -----------------------------------------------
  outline = "#848484";
  outlineVariant = "#dad9d9";

  # --- Accent roles -------------------------------------------------------
  primary = "#186daa";
  onPrimary = "#ffffff";
  primaryContainer = "#abc7e0";
  onPrimaryContainer = "#515151";
  secondary = "#087767";
  onSecondary = "#ffffff";
  tertiary = "#7b4ecb";
  onTertiary = "#ffffff";
  error = "#af4947";
  onError = "#ffffff";
  inverseSurface = "#555555";
  inverseOnSurface = "#ffffff";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#ededed";
    red = "#af4947";
    green = "#557301";
    yellow = "#876500";
    blue = "#186daa";
    magenta = "#7b4ecb";
    cyan = "#087767";
    white = "#555555";
    brightBlack = "#848484";
    brightRed = "#9b3737";
    brightGreen = "#476000";
    brightYellow = "#725500";
    brightBlue = "#005b94";
    brightMagenta = "#6a3bb7";
    brightCyan = "#006456";
    brightWhite = "#454545";
  };

  orange = "#a0570d";
  brightOrange = "#894800";
  cursor = "#186daa";

  tools = {
    bat = "ansi";
  };
}
