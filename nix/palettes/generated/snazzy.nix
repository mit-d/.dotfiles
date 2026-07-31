# Snazzy -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/snazzy.yaml
# Author: Chawye Hsu (https://github.com/chawyehsu), based on Hyper Snazzy Theme (https://github.com/sindresorhus/hyper-snazzy)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/snazzy.nix. Edits here are lost on the
# next run.

{
  name = "snazzy";
  displayName = "Snazzy";
  author = "Chawye Hsu (https://github.com/chawyehsu), based on Hyper Snazzy Theme (https://github.com/sindresorhus/hyper-snazzy)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#282a36";
  surfaceDim = "#1e202b";
  surfaceBright = "#4b4c55";
  surfaceContainerLowest = "#1e202b";
  surfaceContainerLow = "#282a36";
  surfaceContainer = "#34353e";
  surfaceContainerHigh = "#3f404a";
  surfaceContainerHighest = "#4b4c55";
  surfaceVariant = "#34353e";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f1f1f0";
  onSurface = "#e2e4e5";
  onSurfaceMuted = "#c3c4c7";
  onSurfaceVariant = "#a5a5a9";
  onSurfaceFaint = "#78787e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#78787e";
  outlineVariant = "#43454f";

  # --- Accent roles -------------------------------------------------------
  primary = "#57c7ff";
  onPrimary = "#282a36";
  primaryContainer = "#3e617c";
  onPrimaryContainer = "#f1f1f0";
  secondary = "#9aedfe";
  onSecondary = "#282a36";
  tertiary = "#ff6ac1";
  onTertiary = "#282a36";
  error = "#ff5c57";
  onError = "#282a36";
  inverseSurface = "#e2e4e5";
  inverseOnSurface = "#282a36";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#34353e";
    red = "#ff5c57";
    green = "#5af78e";
    yellow = "#f3f99d";
    blue = "#57c7ff";
    magenta = "#ff6ac1";
    cyan = "#9aedfe";
    white = "#e2e4e5";
    brightBlack = "#78787e";
    brightRed = "#ff847c";
    brightGreen = "#aaffbe";
    brightYellow = "#ffffff";
    brightBlue = "#90d7ff";
    brightMagenta = "#ff93ce";
    brightCyan = "#d8f8ff";
    brightWhite = "#f1f1f0";
  };

  orange = "#ff9f43";
  brightOrange = "#ffbc84";
  cursor = "#57c7ff";

  tools = {
    bat = "ansi";
  };
}
