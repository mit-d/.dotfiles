# Brush Trees Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/brushtrees-dark.yaml
# Author: Abraham White <abelincoln.white@gmail.com>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/brushtrees-dark.nix. Edits here are lost on the
# next run.

{
  name = "brushtrees-dark";
  displayName = "Brush Trees Dark";
  author = "Abraham White <abelincoln.white@gmail.com>";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#485867";
  surfaceDim = "#394957";
  surfaceBright = "#7a8d9b";
  surfaceContainerLowest = "#394957";
  surfaceContainerLow = "#485867";
  surfaceContainer = "#5a6d7a";
  surfaceContainerHigh = "#6a7d8a";
  surfaceContainerHighest = "#7a8d9b";
  surfaceVariant = "#5a6d7a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f7fbfa";
  onSurface = "#bccfd1";
  onSurfaceMuted = "#b0c3c7";
  onSurfaceVariant = "#a2b7bc";
  onSurfaceFaint = "#8299a1";

  # --- Borders and dividers -----------------------------------------------
  outline = "#849ba2";
  outlineVariant = "#6d828e";

  # --- Accent roles -------------------------------------------------------
  primary = "#868cb3";
  onPrimary = "#282828";
  primaryContainer = "#5f6b83";
  onPrimaryContainer = "#f7fbfa";
  secondary = "#86b3b3";
  onSecondary = "#35414d";
  tertiary = "#b386b2";
  onTertiary = "#2e2e2e";
  error = "#b38686";
  onError = "#2a2b2b";
  inverseSurface = "#bccfd1";
  inverseOnSurface = "#485867";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#5a6d7a";
    red = "#b38686";
    green = "#87b386";
    yellow = "#aab386";
    blue = "#868cb3";
    magenta = "#b386b2";
    cyan = "#86b3b3";
    white = "#b0c5c8";
    brightBlack = "#8299a1";
    brightRed = "#c69898";
    brightGreen = "#99c698";
    brightYellow = "#bdc698";
    brightBlue = "#989ec6";
    brightMagenta = "#c698c5";
    brightCyan = "#99c6c6";
    brightWhite = "#f7fbfa";
  };

  orange = "#d8bba2";
  brightOrange = "#ecceb5";
  cursor = "#9fa5c3";

  tools = {
    bat = "ansi";
  };
}
