# Flexoki Light -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/flexoki-light.yaml
# Author: Steph Ango (https://github.com/kepano/flexoki)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/flexoki-light.nix. Edits here are lost on the
# next run.

{
  name = "flexoki-light";
  displayName = "Flexoki Light";
  author = "Steph Ango (https://github.com/kepano/flexoki)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fffcf0";
  surfaceDim = "#ffffff";
  surfaceBright = "#dad8cd";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fffcf0";
  surfaceContainer = "#f2f0e5";
  surfaceContainerHigh = "#e6e4d9";
  surfaceContainerHighest = "#dad8cd";
  surfaceVariant = "#f2f0e5";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#100f0f";
  onSurface = "#403e3c";
  onSurfaceMuted = "#6e6c67";
  onSurfaceVariant = "#898781";
  onSurfaceFaint = "#aeada4";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a3a29a";
  outlineVariant = "#d9d7cd";

  # --- Accent roles -------------------------------------------------------
  primary = "#205ea6";
  onPrimary = "#fffcf0";
  primaryContainer = "#aabfd7";
  onPrimaryContainer = "#100f0f";
  secondary = "#24837b";
  onSecondary = "#fffef8";
  tertiary = "#5e409d";
  onTertiary = "#fffcf0";
  error = "#af3029";
  onError = "#fffcf0";
  inverseSurface = "#403e3c";
  inverseOnSurface = "#fffcf0";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#f2f0e5";
    red = "#af3029";
    green = "#66800b";
    yellow = "#ad8301";
    blue = "#205ea6";
    magenta = "#5e409d";
    cyan = "#24837b";
    white = "#403e3c";
    brightBlack = "#cecdc3";
    brightRed = "#9a1916";
    brightGreen = "#566d00";
    brightYellow = "#977200";
    brightBlue = "#094c93";
    brightMagenta = "#4e2e8a";
    brightCyan = "#00716a";
    brightWhite = "#100f0f";
  };

  orange = "#bc5215";
  brightOrange = "#a54200";
  cursor = "#205ea6";

  tools = {
    bat = "ansi";
  };
}
