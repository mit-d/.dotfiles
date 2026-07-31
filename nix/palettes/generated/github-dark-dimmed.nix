# Github Dark Dimmed -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/github-dark-dimmed.yaml
# Author: Tinted Theming (https://github.com/tinted-theming)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/github-dark-dimmed.nix. Edits here are lost on the
# next run.

{
  name = "github-dark-dimmed";
  displayName = "Github Dark Dimmed";
  author = "Tinted Theming (https://github.com/tinted-theming)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#22272e";
  surfaceDim = "#171c22";
  surfaceBright = "#464c55";
  surfaceContainerLowest = "#171c22";
  surfaceContainerLow = "#22272e";
  surfaceContainer = "#2d333b";
  surfaceContainerHigh = "#393f48";
  surfaceContainerHighest = "#464c55";
  surfaceVariant = "#2d333b";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#adbac7";
  onSurfaceMuted = "#919eab";
  onSurfaceVariant = "#768390";
  onSurfaceFaint = "#636e7b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#636e7b";
  outlineVariant = "#545d68";

  # --- Accent roles -------------------------------------------------------
  primary = "#dcbdfb";
  onPrimary = "#22272e";
  primaryContainer = "#625c75";
  onPrimaryContainer = "#ffffff";
  secondary = "#8ddb8c";
  onSecondary = "#22272e";
  tertiary = "#f47067";
  onTertiary = "#22272e";
  error = "#f69d50";
  onError = "#22272e";
  inverseSurface = "#adbac7";
  inverseOnSurface = "#22272e";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2d333b";
    red = "#f69d50";
    green = "#96d0ff";
    yellow = "#ae7c14";
    blue = "#dcbdfb";
    magenta = "#f47067";
    cyan = "#8ddb8c";
    white = "#adbac7";
    brightBlack = "#636e7b";
    brightRed = "#ffb67b";
    brightGreen = "#bee1ff";
    brightYellow = "#c18e30";
    brightBlue = "#ead6ff";
    brightMagenta = "#ff8b81";
    brightCyan = "#a0ef9f";
    brightWhite = "#ffffff";
  };

  orange = "#6cb6ff";
  brightOrange = "#94c9ff";
  cursor = "#dcbdfb";

  tools = {
    bat = "ansi";
  };
}
