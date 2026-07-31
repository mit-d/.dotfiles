# Sakura -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/sakura.yaml
# Author: Misterio77 (http://github.com/Misterio77)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/sakura.nix. Edits here are lost on the
# next run.

{
  name = "sakura";
  displayName = "Sakura";
  author = "Misterio77 (http://github.com/Misterio77)";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#feedf3";
  surfaceDim = "#fffbfc";
  surfaceBright = "#e5cfd4";
  surfaceContainerLowest = "#fffbfc";
  surfaceContainerLow = "#feedf3";
  surfaceContainer = "#f8e2e7";
  surfaceContainerHigh = "#eed8dd";
  surfaceContainerHighest = "#e5cfd4";
  surfaceVariant = "#f8e2e7";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#33292b";
  onSurface = "#564448";
  onSurfaceMuted = "#5e4a4e";
  onSurfaceVariant = "#665055";
  onSurfaceFaint = "#755f64";

  # --- Borders and dividers -----------------------------------------------
  outline = "#755f64";
  outlineVariant = "#dcc9ce";

  # --- Accent roles -------------------------------------------------------
  primary = "#006e93";
  onPrimary = "#feedf3";
  primaryContainer = "#aabccf";
  onPrimaryContainer = "#33292b";
  secondary = "#1d8991";
  onSecondary = "#141112";
  tertiary = "#5e2180";
  onTertiary = "#feedf3";
  error = "#df2d52";
  onError = "#050405";
  inverseSurface = "#564448";
  inverseOnSurface = "#feedf3";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f8e2e7";
    red = "#df2d52";
    green = "#2e916d";
    yellow = "#c29461";
    blue = "#006e93";
    magenta = "#5e2180";
    cyan = "#1d8991";
    white = "#564448";
    brightBlack = "#755f64";
    brightRed = "#c90741";
    brightGreen = "#127f5c";
    brightYellow = "#af824f";
    brightBlue = "#005c7b";
    brightMagenta = "#4d0a6e";
    brightCyan = "#00767e";
    brightWhite = "#33292b";
  };

  orange = "#f6661e";
  brightOrange = "#de5500";
  cursor = "#006e93";

  tools = {
    bat = "ansi";
  };
}
