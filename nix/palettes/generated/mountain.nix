# Mountain -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/mountain.yaml
# Author: gnsfujiwara (https://github.com/gnsfujiwara)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/mountain.nix. Edits here are lost on the
# next run.

{
  name = "mountain";
  displayName = "Mountain";
  author = "gnsfujiwara (https://github.com/gnsfujiwara)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0f0f0f";
  surfaceDim = "#060606";
  surfaceBright = "#2f2f2f";
  surfaceContainerLowest = "#060606";
  surfaceContainerLow = "#0f0f0f";
  surfaceContainer = "#191919";
  surfaceContainerHigh = "#242424";
  surfaceContainerHighest = "#2f2f2f";
  surfaceVariant = "#191919";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f0f0f0";
  onSurface = "#cacaca";
  onSurfaceMuted = "#888888";
  onSurfaceVariant = "#6a6a69";
  onSurfaceFaint = "#4c4b4b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#545453";
  outlineVariant = "#2e2e2d";

  # --- Accent roles -------------------------------------------------------
  primary = "#8f8aac";
  onPrimary = "#0f0f0f";
  primaryContainer = "#3b3944";
  onPrimaryContainer = "#f0f0f0";
  secondary = "#8aabac";
  onSecondary = "#0f0f0f";
  tertiary = "#ac8aac";
  onTertiary = "#0f0f0f";
  error = "#ac8a8c";
  onError = "#0f0f0f";
  inverseSurface = "#cacaca";
  inverseOnSurface = "#0f0f0f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#191919";
    red = "#ac8a8c";
    green = "#8aac8b";
    yellow = "#aca98a";
    blue = "#8f8aac";
    magenta = "#ac8aac";
    cyan = "#8aabac";
    white = "#cacaca";
    brightBlack = "#393939";
    brightRed = "#bf9c9e";
    brightGreen = "#9cbf9d";
    brightYellow = "#bfbc9c";
    brightBlue = "#a19cbf";
    brightMagenta = "#bf9cbf";
    brightCyan = "#9cbebf";
    brightWhite = "#f0f0f0";
  };

  orange = "#ceb188";
  brightOrange = "#e2c49b";
  cursor = "#8f8aac";

  tools = {
    bat = "ansi";
  };
}
