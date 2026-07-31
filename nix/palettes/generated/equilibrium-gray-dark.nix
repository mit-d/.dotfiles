# Equilibrium Gray Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/equilibrium-gray-dark.yaml
# Author: Carlo Abelli
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/equilibrium-gray-dark.nix. Edits here are lost on the
# next run.

{
  name = "equilibrium-gray-dark";
  displayName = "Equilibrium Gray Dark";
  author = "Carlo Abelli";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#111111";
  surfaceDim = "#080808";
  surfaceBright = "#303030";
  surfaceContainerLowest = "#080808";
  surfaceContainerLow = "#111111";
  surfaceContainer = "#1b1b1b";
  surfaceContainerHigh = "#262626";
  surfaceContainerHighest = "#303030";
  surfaceVariant = "#1b1b1b";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#e2e2e2";
  onSurface = "#ababab";
  onSurfaceMuted = "#9e9e9e";
  onSurfaceVariant = "#919191";
  onSurfaceFaint = "#777777";

  # --- Borders and dividers -----------------------------------------------
  outline = "#777777";
  outlineVariant = "#2e2e2e";

  # --- Accent roles -------------------------------------------------------
  primary = "#008dd1";
  onPrimary = "#111111";
  primaryContainer = "#1c3c52";
  onPrimaryContainer = "#e2e2e2";
  secondary = "#00948b";
  onSecondary = "#111111";
  tertiary = "#6a7fd2";
  onTertiary = "#111111";
  error = "#f04339";
  onError = "#111111";
  inverseSurface = "#ababab";
  inverseOnSurface = "#111111";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1b1b1b";
    red = "#f04339";
    green = "#7f8b00";
    yellow = "#bb8801";
    blue = "#008dd1";
    magenta = "#6a7fd2";
    cyan = "#00948b";
    white = "#ababab";
    brightBlack = "#777777";
    brightRed = "#ff6254";
    brightGreen = "#919e26";
    brightYellow = "#ce9b2a";
    brightBlue = "#2ba0e5";
    brightMagenta = "#7b92e6";
    brightCyan = "#2ca79d";
    brightWhite = "#e2e2e2";
  };

  orange = "#df5923";
  brightOrange = "#f46c39";
  cursor = "#008dd1";

  tools = {
    bat = "ansi";
  };
}
