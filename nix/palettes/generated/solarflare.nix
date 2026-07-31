# Solar Flare -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/solarflare.yaml
# Author: Chuck Harmston (https://chuck.harmston.ch)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/solarflare.nix. Edits here are lost on the
# next run.

{
  name = "solarflare";
  displayName = "Solar Flare";
  author = "Chuck Harmston (https://chuck.harmston.ch)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#18262f";
  surfaceDim = "#101e26";
  surfaceBright = "#33404a";
  surfaceContainerLowest = "#101e26";
  surfaceContainerLow = "#18262f";
  surfaceContainer = "#222e38";
  surfaceContainerHigh = "#2a3741";
  surfaceContainerHighest = "#33404a";
  surfaceVariant = "#222e38";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f5f7fa";
  onSurface = "#a6afb8";
  onSurfaceMuted = "#95a1ab";
  onSurfaceVariant = "#85939e";
  onSurfaceFaint = "#667581";

  # --- Borders and dividers -----------------------------------------------
  outline = "#667581";
  outlineVariant = "#586875";

  # --- Accent roles -------------------------------------------------------
  primary = "#33b5e1";
  onPrimary = "#18262f";
  primaryContainer = "#27586d";
  onPrimaryContainer = "#f5f7fa";
  secondary = "#52cbb0";
  onSecondary = "#18262f";
  tertiary = "#a363d5";
  onTertiary = "#0e191f";
  error = "#ef5253";
  onError = "#17242d";
  inverseSurface = "#a6afb8";
  inverseOnSurface = "#18262f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#222e38";
    red = "#ef5253";
    green = "#7cc844";
    yellow = "#e4b51c";
    blue = "#33b5e1";
    magenta = "#a363d5";
    cyan = "#52cbb0";
    white = "#a6afb8";
    brightBlack = "#667581";
    brightRed = "#ff6c6a";
    brightGreen = "#8fdc59";
    brightYellow = "#f8c93c";
    brightBlue = "#4cc8f5";
    brightMagenta = "#b676e9";
    brightCyan = "#68dfc3";
    brightWhite = "#f5f7fa";
  };

  orange = "#e66b2b";
  brightOrange = "#fb7e41";
  cursor = "#33b5e1";

  tools = {
    bat = "ansi";
  };
}
