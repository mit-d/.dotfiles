# Atelier Seaside Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/atelier-seaside-light.yaml
# Author: Bram de Haan (http://atelierbramdehaan.nl)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/atelier-seaside-light.nix. Edits here are lost on the
# next run.

{
  name = "atelier-seaside-light";
  displayName = "Atelier Seaside Light";
  author = "Bram de Haan (http://atelierbramdehaan.nl)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#f4fbf4";
  surfaceDim = "#ffffff";
  surfaceBright = "#acc4ac";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#f4fbf4";
  surfaceContainer = "#cfe8cf";
  surfaceContainerHigh = "#bdd6bd";
  surfaceContainerHighest = "#acc4ac";
  surfaceVariant = "#cfe8cf";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#131513";
  onSurface = "#5e6e5e";
  onSurfaceMuted = "#637563";
  onSurfaceVariant = "#687d68";
  onSurfaceFaint = "#809980";

  # --- Borders and dividers -----------------------------------------------
  outline = "#809980";
  outlineVariant = "#8ca68c";

  # --- Accent roles -------------------------------------------------------
  primary = "#3d62f5";
  onPrimary = "#f4fbf4";
  primaryContainer = "#a9c5fa";
  onPrimaryContainer = "#131513";
  secondary = "#1999b3";
  onSecondary = "#131513";
  tertiary = "#ad2bee";
  onTertiary = "#f4fbf4";
  error = "#e6193c";
  onError = "#fafdfa";
  inverseSurface = "#5e6e5e";
  inverseOnSurface = "#f4fbf4";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#cfe8cf";
    red = "#e6193c";
    green = "#29a329";
    yellow = "#98981b";
    blue = "#3d62f5";
    magenta = "#ad2bee";
    cyan = "#1999b3";
    white = "#5e6e5e";
    brightBlack = "#809980";
    brightRed = "#cb0030";
    brightGreen = "#01900a";
    brightYellow = "#868500";
    brightBlue = "#2f4ee0";
    brightMagenta = "#9a00d8";
    brightCyan = "#00869e";
    brightWhite = "#131513";
  };

  orange = "#87711d";
  brightOrange = "#756000";
  cursor = "#3d62f5";

  tools = {
    bat = "ansi";
  };
}
