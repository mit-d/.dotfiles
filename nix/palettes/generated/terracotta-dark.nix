# Terracotta Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/terracotta-dark.yaml
# Author: Alexander Rossell Hayes (https://github.com/rossellhayes)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/terracotta-dark.nix. Edits here are lost on the
# next run.

{
  name = "terracotta-dark";
  displayName = "Terracotta Dark";
  author = "Alexander Rossell Hayes (https://github.com/rossellhayes)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#241d1a";
  surfaceDim = "#17110e";
  surfaceBright = "#534743";
  surfaceContainerLowest = "#17110e";
  surfaceContainerLow = "#241d1a";
  surfaceContainer = "#362b27";
  surfaceContainerHigh = "#443935";
  surfaceContainerHighest = "#534743";
  surfaceVariant = "#362b27";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#dcd2ce";
  onSurface = "#b8a59d";
  onSurfaceMuted = "#af9990";
  onSurfaceVariant = "#a78e84";
  onSurfaceFaint = "#62514a";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6b5952";
  outlineVariant = "#473933";

  # --- Accent roles -------------------------------------------------------
  primary = "#b0a4c3";
  onPrimary = "#241d1a";
  primaryContainer = "#554c54";
  onPrimaryContainer = "#dcd2ce";
  secondary = "#c0bcdb";
  onSecondary = "#241d1a";
  tertiary = "#d8a2b0";
  onTertiary = "#241d1a";
  error = "#f6998f";
  onError = "#241d1a";
  inverseSurface = "#b8a59d";
  inverseOnSurface = "#241d1a";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#362b27";
    red = "#f6998f";
    green = "#b6c68a";
    yellow = "#ffc37a";
    blue = "#b0a4c3";
    magenta = "#d8a2b0";
    cyan = "#c0bcdb";
    white = "#b8a59d";
    brightBlack = "#594740";
    brightRed = "#ffb3aa";
    brightGreen = "#c9d99d";
    brightYellow = "#ffddb6";
    brightBlue = "#c3b7d6";
    brightMagenta = "#ecb5c3";
    brightCyan = "#d3cfef";
    brightWhite = "#dcd2ce";
  };

  orange = "#ffa888";
  brightOrange = "#ffc5b0";
  cursor = "#b0a4c3";

  tools = {
    bat = "ansi";
  };
}
