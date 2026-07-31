# Atelier Heath Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-heath-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-heath-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-heath-light";
  displayName = "Atelier Heath Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f7f3f7";
  surfaceDim = "#ffffff";
  surfaceBright = "#b5a7b5";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f7f3f7";
  surfaceContainer = "#d8cad8";
  surfaceContainerHigh = "#c6b8c6";
  surfaceContainerHighest = "#b5a7b5";
  surfaceVariant = "#d8cad8";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#1b181b";
  onSurface = "#695d69";
  onSurfaceMuted = "#706370";
  onSurfaceVariant = "#776977";
  onSurfaceFaint = "#9e8f9e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#9e8f9e";
  outlineVariant = "#ab9bab";

  # --- Accent roles -------------------------------------------------------
  primary = "#516aec";
  onPrimary = "#fefefe";
  primaryContainer = "#b3c1f7";
  onPrimaryContainer = "#1b181b";
  secondary = "#159393";
  onSecondary = "#1b181b";
  tertiary = "#7b59c0";
  onTertiary = "#f7f3f7";
  error = "#ca402b";
  onError = "#f8f4f8";
  inverseSurface = "#695d69";
  inverseOnSurface = "#f7f3f7";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#d8cad8";
    red = "#ca402b";
    green = "#918b3b";
    yellow = "#bb8a35";
    blue = "#516aec";
    magenta = "#7b59c0";
    cyan = "#159393";
    white = "#695d69";
    brightBlack = "#9e8f9e";
    brightRed = "#b52a16";
    brightGreen = "#7f7927";
    brightYellow = "#a8781e";
    brightBlue = "#4257d7";
    brightMagenta = "#6a47ac";
    brightCyan = "#008080";
    brightWhite = "#1b181b";
  };

  orange = "#a65926";
  brightOrange = "#93470f";
  cursor = "#516aec";

  tools = {
    bat = "ansi";
  };
}
