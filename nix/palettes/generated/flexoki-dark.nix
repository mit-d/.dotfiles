# Flexoki Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/flexoki-dark.yaml
# Author: Steph Ango (https://github.com/kepano/flexoki)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/flexoki-dark.nix. Edits here are lost on the
# next run.

{
  name = "flexoki-dark";
  displayName = "Flexoki Dark";
  author = "Steph Ango (https://github.com/kepano/flexoki)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#100f0f";
  surfaceDim = "#060505";
  surfaceBright = "#363534";
  surfaceContainerLowest = "#060505";
  surfaceContainerLow = "#100f0f";
  surfaceContainer = "#1c1b1a";
  surfaceContainerHigh = "#292827";
  surfaceContainerHighest = "#363534";
  surfaceVariant = "#1c1b1a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fffcf0";
  onSurface = "#cecdc3";
  onSurfaceMuted = "#aaa8a1";
  onSurfaceVariant = "#878580";
  onSurfaceFaint = "#575653";

  # --- Borders and dividers -----------------------------------------------
  outline = "#575653";
  outlineVariant = "#2f2e2c";

  # --- Accent roles -------------------------------------------------------
  primary = "#4385be";
  onPrimary = "#100f0f";
  primaryContainer = "#25384a";
  onPrimaryContainer = "#fffcf0";
  secondary = "#3aa99f";
  onSecondary = "#100f0f";
  tertiary = "#8b7ec8";
  onTertiary = "#100f0f";
  error = "#d14d41";
  onError = "#0d0c0c";
  inverseSurface = "#cecdc3";
  inverseOnSurface = "#100f0f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1c1b1a";
    red = "#d14d41";
    green = "#879a39";
    yellow = "#d0a215";
    blue = "#4385be";
    magenta = "#8b7ec8";
    cyan = "#3aa99f";
    white = "#cecdc3";
    brightBlack = "#575653";
    brightRed = "#e66053";
    brightGreen = "#99ad4d";
    brightYellow = "#e4b536";
    brightBlue = "#5597d2";
    brightMagenta = "#9d90dc";
    brightCyan = "#50bcb2";
    brightWhite = "#fffcf0";
  };

  orange = "#da702c";
  brightOrange = "#ef8342";
  cursor = "#4385be";

  tools = {
    bat = "ansi";
  };
}
