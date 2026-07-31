# Penumbra Dark Contrast Plus Plus -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/penumbra-dark-contrast-plus-plus.yaml
# Author: Zachary Weiss (https://github.com/zacharyweiss)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/penumbra-dark-contrast-plus-plus.nix. Edits here are lost on the
# next run.

{
  name = "penumbra-dark-contrast-plus-plus";
  displayName = "Penumbra Dark Contrast Plus Plus";
  author = "Zachary Weiss (https://github.com/zacharyweiss)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#0d0f13";
  surfaceDim = "#040508";
  surfaceBright = "#313539";
  surfaceContainerLowest = "#040508";
  surfaceContainerLow = "#0d0f13";
  surfaceContainer = "#181b1f";
  surfaceContainerHigh = "#24282c";
  surfaceContainerHighest = "#313539";
  surfaceVariant = "#181b1f";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fffdfb";
  onSurface = "#dedede";
  onSurfaceMuted = "#c6c6c6";
  onSurfaceVariant = "#aeaeae";
  onSurfaceFaint = "#636363";

  # --- Borders and dividers -----------------------------------------------
  outline = "#636363";
  outlineVariant = "#3e4044";

  # --- Accent roles -------------------------------------------------------
  primary = "#6eb2fd";
  onPrimary = "#0d0f13";
  primaryContainer = "#2f4661";
  onPrimaryContainer = "#fffdfb";
  secondary = "#00c4d7";
  onSecondary = "#0d0f13";
  tertiary = "#b69cf6";
  onTertiary = "#0d0f13";
  error = "#f58c81";
  onError = "#0d0f13";
  inverseSurface = "#dedede";
  inverseOnSurface = "#0d0f13";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#181b1f";
    red = "#f58c81";
    green = "#54c794";
    yellow = "#a9b852";
    blue = "#6eb2fd";
    magenta = "#b69cf6";
    cyan = "#00c4d7";
    white = "#dedede";
    brightBlack = "#636363";
    brightRed = "#ffa69b";
    brightGreen = "#69dba7";
    brightYellow = "#bccb66";
    brightBlue = "#92c5ff";
    brightMagenta = "#c7b3ff";
    brightCyan = "#36d8eb";
    brightWhite = "#fffdfb";
  };

  orange = "#e09f47";
  brightOrange = "#f4b25b";
  cursor = "#6eb2fd";

  tools = {
    bat = "ansi";
  };
}
