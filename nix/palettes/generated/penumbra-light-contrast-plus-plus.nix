# Penumbra Light Contrast Plus Plus -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/penumbra-light-contrast-plus-plus.yaml
# Author: Zachary Weiss (https://github.com/zacharyweiss)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/penumbra-light-contrast-plus-plus.nix. Edits here are lost on the
# next run.

{
  name = "penumbra-light-contrast-plus-plus";
  displayName = "Penumbra Light Contrast Plus Plus";
  author = "Zachary Weiss (https://github.com/zacharyweiss)";
  variant = "light";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#fffdfb";
  surfaceDim = "#ffffff";
  surfaceBright = "#f0e8de";
  surfaceContainerLowest = "#ffffff";
  surfaceContainerLow = "#fffdfb";
  surfaceContainer = "#fff7ed";
  surfaceContainerHigh = "#f8f0e6";
  surfaceContainerHighest = "#f0e8de";
  surfaceVariant = "#fff7ed";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#0d0f13";
  onSurface = "#636363";
  onSurfaceMuted = "#7e7e7e";
  onSurfaceVariant = "#878889";
  onSurfaceFaint = "#adadaf";

  # --- Borders and dividers -----------------------------------------------
  outline = "#a2a3a4";
  outlineVariant = "#e2d7c7";

  # --- Accent roles -------------------------------------------------------
  primary = "#6eb2fd";
  onPrimary = "#0d0f13";
  primaryContainer = "#c9e1fe";
  onPrimaryContainer = "#0d0f13";
  secondary = "#00c4d7";
  onSecondary = "#0d0f13";
  tertiary = "#b69cf6";
  onTertiary = "#0d0f13";
  error = "#f58c81";
  onError = "#0d0f13";
  inverseSurface = "#636363";
  inverseOnSurface = "#fffdfb";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#fff7ed";
    red = "#f58c81";
    green = "#54c794";
    yellow = "#a9b852";
    blue = "#6eb2fd";
    magenta = "#b69cf6";
    cyan = "#00c4d7";
    white = "#636363";
    brightBlack = "#dedede";
    brightRed = "#e0796f";
    brightGreen = "#3eb482";
    brightYellow = "#97a53e";
    brightBlue = "#5b9fe9";
    brightMagenta = "#a389e2";
    brightCyan = "#00afc0";
    brightWhite = "#0d0f13";
  };

  orange = "#e09f47";
  brightOrange = "#cc8c31";
  cursor = "#5f97d6";

  tools = {
    bat = "ansi";
  };
}
