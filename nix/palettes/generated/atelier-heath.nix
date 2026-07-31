# Atelier Heath -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-heath.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-heath.nix. Edits here are lost on the
# next run.

{
  name = "atelier-heath";
  displayName = "Atelier Heath";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1b181b";
  surfaceDim = "#0f0d0f";
  surfaceBright = "#433d43";
  surfaceContainerLowest = "#0f0d0f";
  surfaceContainerLow = "#1b181b";
  surfaceContainer = "#292329";
  surfaceContainerHigh = "#363036";
  surfaceContainerHighest = "#433d43";
  surfaceVariant = "#292329";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f7f3f7";
  onSurface = "#ab9bab";
  onSurfaceMuted = "#a495a4";
  onSurfaceVariant = "#9e8f9e";
  onSurfaceFaint = "#776977";

  # --- Borders and dividers -----------------------------------------------
  outline = "#776977";
  outlineVariant = "#695d69";

  # --- Accent roles -------------------------------------------------------
  primary = "#516aec";
  onPrimary = "#fefefe";
  primaryContainer = "#2e3763";
  onPrimaryContainer = "#f7f3f7";
  secondary = "#159393";
  onSecondary = "#1b181b";
  tertiary = "#7b59c0";
  onTertiary = "#f7f3f7";
  error = "#ca402b";
  onError = "#f8f4f8";
  inverseSurface = "#ab9bab";
  inverseOnSurface = "#1b181b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#292329";
    red = "#ca402b";
    green = "#918b3b";
    yellow = "#bb8a35";
    blue = "#516aec";
    magenta = "#7b59c0";
    cyan = "#159393";
    white = "#ab9bab";
    brightBlack = "#776977";
    brightRed = "#df543e";
    brightGreen = "#a39d4e";
    brightYellow = "#ce9d49";
    brightBlue = "#627eff";
    brightMagenta = "#8d6bd4";
    brightCyan = "#34a6a5";
    brightWhite = "#f7f3f7";
  };

  orange = "#a65926";
  brightOrange = "#ba6b39";
  cursor = "#516aec";

  tools = {
    bat = "ansi";
  };
}
