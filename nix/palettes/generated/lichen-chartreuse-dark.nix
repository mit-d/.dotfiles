# Lichen Chartreuse Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/lichen-chartreuse-dark.yaml
# Author: Aaron Colichia (https://aaron.colichia.org/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/lichen-chartreuse-dark.nix. Edits here are lost on the
# next run.

{
  name = "lichen-chartreuse-dark";
  displayName = "Lichen Chartreuse Dark";
  author = "Aaron Colichia (https://aaron.colichia.org/)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#151613";
  surfaceDim = "#0e0f0c";
  surfaceBright = "#2c2e2a";
  surfaceContainerLowest = "#0e0f0c";
  surfaceContainerLow = "#151613";
  surfaceContainer = "#1c1e1a";
  surfaceContainerHigh = "#242622";
  surfaceContainerHighest = "#2c2e2a";
  surfaceVariant = "#1c1e1a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#fcfcfa";
  onSurface = "#e0e5da";
  onSurfaceMuted = "#bfc5b8";
  onSurfaceVariant = "#a0a598";
  onSurfaceFaint = "#899282";

  # --- Borders and dividers -----------------------------------------------
  outline = "#899282";
  outlineVariant = "#3e5123";

  # --- Accent roles -------------------------------------------------------
  primary = "#78adc4";
  onPrimary = "#151613";
  primaryContainer = "#384a4f";
  onPrimaryContainer = "#fcfcfa";
  secondary = "#9cc6c9";
  onSecondary = "#151613";
  tertiary = "#bfa6d4";
  onTertiary = "#151613";
  error = "#e28b82";
  onError = "#151613";
  inverseSurface = "#e0e5da";
  inverseOnSurface = "#151613";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1c1e1a";
    red = "#e28b82";
    green = "#83bda5";
    yellow = "#b2d084";
    blue = "#78adc4";
    magenta = "#bfa6d4";
    cyan = "#9cc6c9";
    white = "#e0e5da";
    brightBlack = "#899282";
    brightRed = "#f79e94";
    brightGreen = "#96d0b8";
    brightYellow = "#c5e497";
    brightBlue = "#8ac0d7";
    brightMagenta = "#d2b9e8";
    brightCyan = "#afd9dc";
    brightWhite = "#fcfcfa";
  };

  orange = "#d5ad73";
  brightOrange = "#e9c086";
  cursor = "#78adc4";

  tools = {
    bat = "ansi";
  };
}
