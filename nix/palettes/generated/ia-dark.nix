# iA Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/ia-dark.yaml
# Author: iA Inc. (modified by aramisgithub)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/ia-dark.nix. Edits here are lost on the
# next run.

{
  name = "ia-dark";
  displayName = "iA Dark";
  author = "iA Inc. (modified by aramisgithub)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1a1a1a";
  surfaceDim = "#121212";
  surfaceBright = "#333333";
  surfaceContainerLowest = "#121212";
  surfaceContainerLow = "#1a1a1a";
  surfaceContainer = "#222222";
  surfaceContainerHigh = "#2a2a2a";
  surfaceContainerHighest = "#333333";
  surfaceVariant = "#222222";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f8f8f8";
  onSurface = "#cccccc";
  onSurfaceMuted = "#c2c2c2";
  onSurfaceVariant = "#b8b8b8";
  onSurfaceFaint = "#767676";

  # --- Borders and dividers -----------------------------------------------
  outline = "#767676";
  outlineVariant = "#1d414d";

  # --- Accent roles -------------------------------------------------------
  primary = "#8eccdd";
  onPrimary = "#1a1a1a";
  primaryContainer = "#43575c";
  onPrimaryContainer = "#f8f8f8";
  secondary = "#7c9cae";
  onSecondary = "#1a1a1a";
  tertiary = "#b98eb2";
  onTertiary = "#1a1a1a";
  error = "#d88568";
  onError = "#1a1a1a";
  inverseSurface = "#cccccc";
  inverseOnSurface = "#1a1a1a";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#222222";
    red = "#d88568";
    green = "#83a471";
    yellow = "#b99353";
    blue = "#8eccdd";
    magenta = "#b98eb2";
    cyan = "#7c9cae";
    white = "#cccccc";
    brightBlack = "#767676";
    brightRed = "#ec987a";
    brightGreen = "#95b783";
    brightYellow = "#cca665";
    brightBlue = "#a1e0f1";
    brightMagenta = "#cca0c5";
    brightCyan = "#8eafc1";
    brightWhite = "#f8f8f8";
  };

  orange = "#d86868";
  brightOrange = "#ed7b7a";
  cursor = "#8eccdd";

  tools = {
    bat = "ansi";
  };
}
