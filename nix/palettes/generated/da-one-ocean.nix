# Da One Ocean -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/da-one-ocean.yaml
# Author: NNB (https://github.com/NNBnh)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/da-one-ocean.nix. Edits here are lost on the
# next run.

{
  name = "da-one-ocean";
  displayName = "Da One Ocean";
  author = "NNB (https://github.com/NNBnh)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#171726";
  surfaceDim = "#0b0b19";
  surfaceBright = "#3d435b";
  surfaceContainerLowest = "#0b0b19";
  surfaceContainerLow = "#171726";
  surfaceContainer = "#22273d";
  surfaceContainerHigh = "#2f354c";
  surfaceContainerHighest = "#3d435b";
  surfaceVariant = "#22273d";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#ffffff";
  onSurfaceMuted = "#e3e3e3";
  onSurfaceVariant = "#c8c8c8";
  onSurfaceFaint = "#878d96";

  # --- Borders and dividers -----------------------------------------------
  outline = "#878d96";
  outlineVariant = "#525866";

  # --- Accent roles -------------------------------------------------------
  primary = "#6bb8ff";
  onPrimary = "#171726";
  primaryContainer = "#374e70";
  onPrimaryContainer = "#ffffff";
  secondary = "#8af5ff";
  onSecondary = "#171726";
  tertiary = "#e799ff";
  onTertiary = "#171726";
  error = "#fa7883";
  onError = "#171726";
  inverseSurface = "#ffffff";
  inverseOnSurface = "#171726";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#22273d";
    red = "#fa7883";
    green = "#98c379";
    yellow = "#ff9470";
    blue = "#6bb8ff";
    magenta = "#e799ff";
    cyan = "#8af5ff";
    white = "#ffffff";
    brightBlack = "#878d96";
    brightRed = "#ff979d";
    brightGreen = "#abd78c";
    brightYellow = "#ffb399";
    brightBlue = "#94cbff";
    brightMagenta = "#eeb9ff";
    brightCyan = "#dcfcff";
    brightWhite = "#ffffff";
  };

  orange = "#ffc387";
  brightOrange = "#ffddbd";
  cursor = "#6bb8ff";

  tools = {
    bat = "ansi";
  };
}
