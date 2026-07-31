# Brush Trees -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/brushtrees.yaml
# Author: Abraham White <abelincoln.white@gmail.com>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/brushtrees.nix. Edits here are lost on the
# next run.

{
  name = "brushtrees";
  displayName = "Brush Trees";
  author = "Abraham White <abelincoln.white@gmail.com>";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#e3efef";
  surfaceDim = "#fcffff";
  surfaceBright = "#a6b8b9";
  surfaceContainerLowest = "#fcffff";
  surfaceContainerLow = "#e3efef";
  surfaceContainer = "#c9dbdc";
  surfaceContainerHigh = "#b7c9ca";
  surfaceContainerHighest = "#a6b8b9";
  surfaceVariant = "#c9dbdc";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#42505e";
  onSurface = "#5b6e7c";
  onSurfaceMuted = "#637683";
  onSurfaceVariant = "#6c808b";
  onSurfaceFaint = "#8fa5ac";

  # --- Borders and dividers -----------------------------------------------
  outline = "#859aa2";
  outlineVariant = "#b0c5c8";

  # --- Accent roles -------------------------------------------------------
  primary = "#868cb3";
  onPrimary = "#ffffff";
  primaryContainer = "#bec9d8";
  onPrimaryContainer = "#465665";
  secondary = "#86b3b3";
  onSecondary = "#ffffff";
  tertiary = "#b386b2";
  onTertiary = "#ffffff";
  error = "#b38686";
  onError = "#ffffff";
  inverseSurface = "#5b6e7c";
  inverseOnSurface = "#e3efef";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#c9dbdc";
    red = "#b38686";
    green = "#87b386";
    yellow = "#aab386";
    blue = "#868cb3";
    magenta = "#b386b2";
    cyan = "#86b3b3";
    white = "#6d828e";
    brightBlack = "#98afb5";
    brightRed = "#a07474";
    brightGreen = "#75a074";
    brightYellow = "#98a074";
    brightBlue = "#747aa0";
    brightMagenta = "#a0749f";
    brightCyan = "#74a0a0";
    brightWhite = "#485867";
  };

  orange = "#d8bba2";
  brightOrange = "#c5a890";
  cursor = "#8087ab";

  tools = {
    bat = "ansi";
  };
}
