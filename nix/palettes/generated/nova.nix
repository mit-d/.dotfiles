# Nova -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/nova.yaml
# Author: George Essig (https://github.com/gessig), Trevor D. Miller (https://trevordmiller.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/nova.nix. Edits here are lost on the
# next run.

{
  name = "nova";
  displayName = "Nova";
  author = "George Essig (https://github.com/gessig), Trevor D. Miller (https://trevordmiller.com)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#3c4c55";
  surfaceDim = "#2e3d46";
  surfaceBright = "#748894";
  surfaceContainerLowest = "#2e3d46";
  surfaceContainerLow = "#3c4c55";
  surfaceContainer = "#556873";
  surfaceContainerHigh = "#657883";
  surfaceContainerHighest = "#748894";
  surfaceVariant = "#556873";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e0e5e8";
  onSurface = "#c5d4dd";
  onSurfaceMuted = "#a7b7c1";
  onSurfaceVariant = "#94a5af";
  onSurfaceFaint = "#899ba6";

  # --- Borders and dividers -----------------------------------------------
  outline = "#899ba6";
  outlineVariant = "#6a7d89";

  # --- Accent roles -------------------------------------------------------
  primary = "#83afe5";
  onPrimary = "#ffffff";
  primaryContainer = "#567089";
  onPrimaryContainer = "#edf0f2";
  secondary = "#f2c38f";
  onSecondary = "#3c4c55";
  tertiary = "#9a93e1";
  onTertiary = "#ffffff";
  error = "#83afe5";
  onError = "#ffffff";
  inverseSurface = "#c5d4dd";
  inverseOnSurface = "#3c4c55";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#556873";
    red = "#83afe5";
    green = "#7fc1ca";
    yellow = "#a8ce93";
    blue = "#83afe5";
    magenta = "#9a93e1";
    cyan = "#f2c38f";
    white = "#c5d4dd";
    brightBlack = "#899ba6";
    brightRed = "#95c2f9";
    brightGreen = "#92d4de";
    brightYellow = "#bbe2a6";
    brightBlue = "#95c2f9";
    brightMagenta = "#aca6f5";
    brightCyan = "#ffd9af";
    brightWhite = "#899ba6";
  };

  orange = "#7fc1ca";
  brightOrange = "#92d4de";
  cursor = "#83afe5";

  tools = {
    bat = "ansi";
  };
}
