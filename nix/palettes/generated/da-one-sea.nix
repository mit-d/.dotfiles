# Da One Sea -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/da-one-sea.yaml
# Author: NNB (https://github.com/NNBnh)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/da-one-sea.nix. Edits here are lost on the
# next run.

{
  name = "da-one-sea";
  displayName = "Da One Sea";
  author = "NNB (https://github.com/NNBnh)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#22273d";
  surfaceDim = "#151a2f";
  surfaceBright = "#545e79";
  surfaceContainerLowest = "#151a2f";
  surfaceContainerLow = "#22273d";
  surfaceContainer = "#374059";
  surfaceContainerHigh = "#454f69";
  surfaceContainerHighest = "#545e79";
  surfaceVariant = "#374059";

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
  onPrimary = "#22273d";
  primaryContainer = "#3e5a81";
  onPrimaryContainer = "#ffffff";
  secondary = "#8af5ff";
  onSecondary = "#22273d";
  tertiary = "#e799ff";
  onTertiary = "#22273d";
  error = "#fa7883";
  onError = "#22273d";
  inverseSurface = "#ffffff";
  inverseOnSurface = "#22273d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#374059";
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
    brightWhite = "#ebebeb";
  };

  orange = "#ffc387";
  brightOrange = "#ffddbd";
  cursor = "#6bb8ff";

  tools = {
    bat = "ansi";
  };
}
