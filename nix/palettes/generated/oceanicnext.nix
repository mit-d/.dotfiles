# OceanicNext -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/oceanicnext.yaml
# Author: https://github.com/voronianski/oceanic-next-color-scheme
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/oceanicnext.nix. Edits here are lost on the
# next run.

{
  name = "oceanicnext";
  displayName = "OceanicNext";
  author = "https://github.com/voronianski/oceanic-next-color-scheme";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1b2b34";
  surfaceDim = "#0e1e26";
  surfaceBright = "#515b64";
  surfaceContainerLowest = "#0e1e26";
  surfaceContainerLow = "#1b2b34";
  surfaceContainer = "#343d46";
  surfaceContainerHigh = "#424c55";
  surfaceContainerHighest = "#515b64";
  surfaceVariant = "#343d46";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d8dee9";
  onSurface = "#c0c5ce";
  onSurfaceMuted = "#b3b9c4";
  onSurfaceVariant = "#a7adba";
  onSurfaceFaint = "#65737e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#65737e";
  outlineVariant = "#4f5b66";

  # --- Accent roles -------------------------------------------------------
  primary = "#6699cc";
  onPrimary = "#1b2b34";
  primaryContainer = "#36526a";
  onPrimaryContainer = "#d8dee9";
  secondary = "#5fb3b3";
  onSecondary = "#1b2b34";
  tertiary = "#c594c5";
  onTertiary = "#1b2b34";
  error = "#ec5f67";
  onError = "#ffffff";
  inverseSurface = "#c0c5ce";
  inverseOnSurface = "#1b2b34";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#343d46";
    red = "#ec5f67";
    green = "#99c794";
    yellow = "#fac863";
    blue = "#6699cc";
    magenta = "#c594c5";
    cyan = "#5fb3b3";
    white = "#c0c5ce";
    brightBlack = "#65737e";
    brightRed = "#ff757a";
    brightGreen = "#acdba7";
    brightYellow = "#ffe0a4";
    brightBlue = "#78ace0";
    brightMagenta = "#d9a7d9";
    brightCyan = "#72c6c6";
    brightWhite = "#d8dee9";
  };

  orange = "#f99157";
  brightOrange = "#ffac81";
  cursor = "#6699cc";

  tools = {
    bat = "ansi";
  };
}
