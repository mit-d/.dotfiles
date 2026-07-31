# Purpledream -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/purpledream.yaml
# Author: malet
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/purpledream.nix. Edits here are lost on the
# next run.

{
  name = "purpledream";
  displayName = "Purpledream";
  author = "malet";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#100510";
  surfaceDim = "#050005";
  surfaceBright = "#4d3c4d";
  surfaceContainerLowest = "#050005";
  surfaceContainerLow = "#100510";
  surfaceContainer = "#302030";
  surfaceContainerHigh = "#3e2e3e";
  surfaceContainerHighest = "#4d3c4d";
  surfaceVariant = "#302030";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fff0ff";
  onSurface = "#ddd0dd";
  onSurfaceMuted = "#ccc0cc";
  onSurfaceVariant = "#bbb0bb";
  onSurfaceFaint = "#605060";

  # --- Borders and dividers -----------------------------------------------
  outline = "#605060";
  outlineVariant = "#403040";

  # --- Accent roles -------------------------------------------------------
  primary = "#00a0f0";
  onPrimary = "#100510";
  primaryContainer = "#24395b";
  onPrimaryContainer = "#fff0ff";
  secondary = "#0075b0";
  onSecondary = "#fff0ff";
  tertiary = "#b000d0";
  onTertiary = "#fff0ff";
  error = "#ff1d0d";
  onError = "#100510";
  inverseSurface = "#ddd0dd";
  inverseOnSurface = "#100510";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#302030";
    red = "#ff1d0d";
    green = "#14cc64";
    yellow = "#f000a0";
    blue = "#00a0f0";
    magenta = "#b000d0";
    cyan = "#0075b0";
    white = "#ddd0dd";
    brightBlack = "#605060";
    brightRed = "#ff614e";
    brightGreen = "#3ce077";
    brightYellow = "#ff43b1";
    brightBlue = "#3eb3ff";
    brightMagenta = "#c42de5";
    brightCyan = "#2587c4";
    brightWhite = "#fff0ff";
  };

  orange = "#ccae14";
  brightOrange = "#dfc137";
  cursor = "#00a0f0";

  tools = {
    bat = "ansi";
  };
}
