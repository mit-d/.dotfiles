# emil -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/emil.yaml
# Author: limelier
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/emil.nix. Edits here are lost on the
# next run.

{
  name = "emil";
  displayName = "emil";
  author = "limelier";
  variant = "light";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#efefef";
  surfaceDim = "#ffffff";
  surfaceBright = "#9c9caf";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#efefef";
  surfaceContainer = "#bebed2";
  surfaceContainerHigh = "#adadc0";
  surfaceContainerHighest = "#9c9caf";
  surfaceVariant = "#bebed2";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1a1a2f";
  onSurface = "#313145";
  onSurfaceMuted = "#404054";
  onSurfaceVariant = "#505063";
  onSurfaceFaint = "#7c7c98";

  # --- Borders and dividers -----------------------------------------------
  outline = "#7c7c98";
  outlineVariant = "#9e9eaf";

  # --- Accent roles -------------------------------------------------------
  primary = "#471397";
  onPrimary = "#efefef";
  primaryContainer = "#a8a0d2";
  onPrimaryContainer = "#1a1a2f";
  secondary = "#2155d6";
  onSecondary = "#efefef";
  tertiary = "#6916b6";
  onTertiary = "#efefef";
  error = "#f43979";
  onError = "#1a1a2f";
  inverseSurface = "#313145";
  inverseOnSurface = "#efefef";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#bebed2";
    red = "#f43979";
    green = "#0073a8";
    yellow = "#ff669b";
    blue = "#471397";
    magenta = "#6916b6";
    cyan = "#2155d6";
    white = "#313145";
    brightBlack = "#7c7c98";
    brightRed = "#de1b68";
    brightGreen = "#00618f";
    brightYellow = "#e95289";
    brightBlue = "#37007c";
    brightMagenta = "#57009b";
    brightCyan = "#1041c1";
    brightWhite = "#1a1a2f";
  };

  orange = "#d22a8b";
  brightOrange = "#bd0379";
  cursor = "#471397";

  tools = {
    bat = "ansi";
  };
}
