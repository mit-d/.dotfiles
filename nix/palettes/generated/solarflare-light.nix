# Solar Flare Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/solarflare-light.yaml
# Author: Chuck Harmston (https://chuck.harmston.ch)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/solarflare-light.nix. Edits here are lost on the
# next run.

{
  name = "solarflare-light";
  displayName = "Solar Flare Light";
  author = "Chuck Harmston (https://chuck.harmston.ch)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f5f7fa";
  surfaceDim = "#ffffff";
  surfaceBright = "#cdced2";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f5f7fa";
  surfaceContainer = "#e8e9ed";
  surfaceContainerHigh = "#dbdbdf";
  surfaceContainerHighest = "#cdced2";
  surfaceVariant = "#e8e9ed";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#18262f";
  onSurface = "#586875";
  onSurfaceMuted = "#5f6e7b";
  onSurfaceVariant = "#667581";
  onSurfaceFaint = "#85939e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#85939e";
  outlineVariant = "#a6afb8";

  # --- Accent roles -------------------------------------------------------
  primary = "#33b5e1";
  onPrimary = "#18262f";
  primaryContainer = "#b6dff1";
  onPrimaryContainer = "#18262f";
  secondary = "#52cbb0";
  onSecondary = "#18262f";
  tertiary = "#a363d5";
  onTertiary = "#0e191f";
  error = "#ef5253";
  onError = "#17242d";
  inverseSurface = "#586875";
  inverseOnSurface = "#f5f7fa";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e8e9ed";
    red = "#ef5253";
    green = "#7cc844";
    yellow = "#e4b51c";
    blue = "#33b5e1";
    magenta = "#a363d5";
    cyan = "#52cbb0";
    white = "#586875";
    brightBlack = "#85939e";
    brightRed = "#d93d41";
    brightGreen = "#6ab42d";
    brightYellow = "#cfa200";
    brightBlue = "#0ca2cd";
    brightMagenta = "#9150c1";
    brightCyan = "#3ab89d";
    brightWhite = "#18262f";
  };

  orange = "#e66b2b";
  brightOrange = "#d1580d";
  cursor = "#319ac0";

  tools = {
    bat = "ansi";
  };
}
