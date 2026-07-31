# Atelier Seaside -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-seaside.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-seaside.nix. Edits here are lost on the
# next run.

{
  name = "atelier-seaside";
  displayName = "Atelier Seaside";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#131513";
  surfaceDim = "#080908";
  surfaceBright = "#404540";
  surfaceContainerLowest = "#080908";
  surfaceContainerLow = "#131513";
  surfaceContainer = "#242924";
  surfaceContainerHigh = "#323732";
  surfaceContainerHighest = "#404540";
  surfaceVariant = "#242924";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f4fbf4";
  onSurface = "#8ca68c";
  onSurfaceMuted = "#869f86";
  onSurfaceVariant = "#809980";
  onSurfaceFaint = "#687d68";

  # --- Borders and dividers -----------------------------------------------
  outline = "#687d68";
  outlineVariant = "#5e6e5e";

  # --- Accent roles -------------------------------------------------------
  primary = "#3d62f5";
  onPrimary = "#f4fbf4";
  primaryContainer = "#213361";
  onPrimaryContainer = "#f4fbf4";
  secondary = "#1999b3";
  onSecondary = "#131513";
  tertiary = "#ad2bee";
  onTertiary = "#f4fbf4";
  error = "#e6193c";
  onError = "#fafdfa";
  inverseSurface = "#8ca68c";
  inverseOnSurface = "#131513";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#242924";
    red = "#e6193c";
    green = "#29a329";
    yellow = "#98981b";
    blue = "#3d62f5";
    magenta = "#ad2bee";
    cyan = "#1999b3";
    white = "#8ca68c";
    brightBlack = "#687d68";
    brightRed = "#fc394e";
    brightGreen = "#41b63f";
    brightYellow = "#aaab36";
    brightBlue = "#5179ff";
    brightMagenta = "#be4bff";
    brightCyan = "#37acc6";
    brightWhite = "#f4fbf4";
  };

  orange = "#87711d";
  brightOrange = "#998333";
  cursor = "#3d62f5";

  tools = {
    bat = "ansi";
  };
}
