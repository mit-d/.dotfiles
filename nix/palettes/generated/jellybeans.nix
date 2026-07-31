# Jellybeans -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/jellybeans.yaml
# Author: FredHappyface (https://github.com/fredHappyface), converted to Base16 by https://github.com/nonetrix
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/jellybeans.nix. Edits here are lost on the
# next run.

{
  name = "jellybeans";
  displayName = "Jellybeans";
  author = "FredHappyface (https://github.com/fredHappyface), converted to Base16 by https://github.com/nonetrix";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#121212";
  surfaceDim = "#070707";
  surfaceBright = "#b4b4b4";
  surfaceContainerLowest = "#070707";
  surfaceContainerLow = "#121212";
  surfaceContainer = "#929292";
  surfaceContainerHigh = "#a3a3a3";
  surfaceContainerHighest = "#b4b4b4";
  surfaceVariant = "#929292";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#d5d5d5";
  onSurfaceMuted = "#d1d1d1";
  onSurfaceVariant = "#cdcdcd";
  onSurfaceFaint = "#c5c5c5";

  # --- Borders and dividers -----------------------------------------------
  outline = "#c5c5c5";
  outlineVariant = "#bdbdbd";

  # --- Accent roles -------------------------------------------------------
  primary = "#b1d8f6";
  onPrimary = "#121212";
  primaryContainer = "#48555e";
  onPrimaryContainer = "#ffffff";
  secondary = "#1ab2a8";
  onSecondary = "#121212";
  tertiary = "#fbdaff";
  onTertiary = "#121212";
  error = "#ffa1a1";
  onError = "#121212";
  inverseSurface = "#d5d5d5";
  inverseOnSurface = "#121212";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#929292";
    red = "#ffa1a1";
    green = "#bddeab";
    yellow = "#ffdca0";
    blue = "#b1d8f6";
    magenta = "#fbdaff";
    cyan = "#1ab2a8";
    white = "#d5d5d5";
    brightBlack = "#c5c5c5";
    brightRed = "#ffbfbe";
    brightGreen = "#d0f2be";
    brightYellow = "#fff4e1";
    brightBlue = "#cfeaff";
    brightMagenta = "#fef8ff";
    brightCyan = "#3bc5bb";
    brightWhite = "#ffffff";
  };

  orange = "#ffba7b";
  brightOrange = "#ffd5b0";
  cursor = "#b1d8f6";

  tools = {
    bat = "ansi";
  };
}
