# Cerulean Signal Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/cerulean-signal-dark.yaml
# Author: Aaron Colichia (https://aaron.colichia.org/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/cerulean-signal-dark.nix. Edits here are lost on the
# next run.

{
  name = "cerulean-signal-dark";
  displayName = "Cerulean Signal Dark";
  author = "Aaron Colichia (https://aaron.colichia.org/)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#101722";
  surfaceDim = "#0b121d";
  surfaceBright = "#1d2734";
  surfaceContainerLowest = "#0b121d";
  surfaceContainerLow = "#101722";
  surfaceContainer = "#131c29";
  surfaceContainerHigh = "#18212f";
  surfaceContainerHighest = "#1d2734";
  surfaceVariant = "#131c29";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f7f9fc";
  onSurface = "#dce6f2";
  onSurfaceMuted = "#c3cfde";
  onSurfaceVariant = "#aab8ca";
  onSurfaceFaint = "#8fa0b5";

  # --- Borders and dividers -----------------------------------------------
  outline = "#8fa0b5";
  outlineVariant = "#173a5a";

  # --- Accent roles -------------------------------------------------------
  primary = "#7dd3ff";
  onPrimary = "#101722";
  primaryContainer = "#36576d";
  onPrimaryContainer = "#f7f9fc";
  secondary = "#58d9df";
  onSecondary = "#101722";
  tertiary = "#ff74d4";
  onTertiary = "#101722";
  error = "#ff8a9a";
  onError = "#101722";
  inverseSurface = "#dce6f2";
  inverseOnSurface = "#101722";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#131c29";
    red = "#ff8a9a";
    green = "#70e1b0";
    yellow = "#e2c85f";
    blue = "#7dd3ff";
    magenta = "#ff74d4";
    cyan = "#58d9df";
    white = "#dce6f2";
    brightBlack = "#8fa0b5";
    brightRed = "#ffabb4";
    brightGreen = "#84f5c3";
    brightYellow = "#f6dc73";
    brightBlue = "#afe3ff";
    brightMagenta = "#ff9cdd";
    brightCyan = "#6eedf3";
    brightWhite = "#f7f9fc";
  };

  orange = "#f5a35c";
  brightOrange = "#ffbb83";
  cursor = "#7dd3ff";

  tools = {
    bat = "ansi";
  };
}
