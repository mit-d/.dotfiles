# Primer Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/primer-light.yaml
# Author: Jimmy Lin
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/primer-light.nix. Edits here are lost on the
# next run.

{
  name = "primer-light";
  displayName = "Primer Light";
  author = "Jimmy Lin";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fafbfc";
  surfaceDim = "#ffffff";
  surfaceBright = "#bdc0c4";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fafbfc";
  surfaceContainer = "#e1e4e8";
  surfaceContainerHigh = "#cfd2d6";
  surfaceContainerHighest = "#bdc0c4";
  surfaceVariant = "#e1e4e8";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1b1f23";
  onSurface = "#2f363d";
  onSurfaceMuted = "#394149";
  onSurfaceVariant = "#444d56";
  onSurfaceFaint = "#959da5";

  # --- Borders and dividers -----------------------------------------------
  outline = "#959da5";
  outlineVariant = "#d1d5da";

  # --- Accent roles -------------------------------------------------------
  primary = "#0366d6";
  onPrimary = "#fafbfc";
  primaryContainer = "#a5c4f2";
  onPrimaryContainer = "#1b1f23";
  secondary = "#79b8ff";
  onSecondary = "#1b1f23";
  tertiary = "#ea4aaa";
  onTertiary = "#1b1f23";
  error = "#d73a49";
  onError = "#030304";
  inverseSurface = "#2f363d";
  inverseOnSurface = "#fafbfc";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#e1e4e8";
    red = "#d73a49";
    green = "#28a745";
    yellow = "#ffd33d";
    blue = "#0366d6";
    magenta = "#ea4aaa";
    cyan = "#79b8ff";
    white = "#2f363d";
    brightBlack = "#959da5";
    brightRed = "#c22138";
    brightGreen = "#009433";
    brightYellow = "#ebbf1b";
    brightBlue = "#0056b7";
    brightMagenta = "#d53497";
    brightCyan = "#67a5eb";
    brightWhite = "#1b1f23";
  };

  orange = "#f66a0a";
  brightOrange = "#db5c00";
  cursor = "#0366d6";

  tools = {
    bat = "ansi";
  };
}
