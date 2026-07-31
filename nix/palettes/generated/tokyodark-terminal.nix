# Tokyodark Terminal -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyodark-terminal.yaml
# Author: Tiagovla (https://github.com/tiagovla/)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyodark-terminal.nix. Edits here are lost on the
# next run.

{
  name = "tokyodark-terminal";
  displayName = "Tokyodark Terminal";
  author = "Tiagovla (https://github.com/tiagovla/)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#11121d";
  surfaceDim = "#080913";
  surfaceBright = "#2e2f3f";
  surfaceContainerLowest = "#080913";
  surfaceContainerLow = "#11121d";
  surfaceContainer = "#1a1b2a";
  surfaceContainerHigh = "#242535";
  surfaceContainerHighest = "#2e2f3f";
  surfaceVariant = "#1a1b2a";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#a0a8cd";
  onSurface = "#a0a8cd";
  onSurfaceMuted = "#747b90";
  onSurfaceVariant = "#656c7c";
  onSurfaceFaint = "#474d5c";

  # --- Borders and dividers -----------------------------------------------
  outline = "#4f5566";
  outlineVariant = "#2d2e42";

  # --- Accent roles -------------------------------------------------------
  primary = "#7199ee";
  onPrimary = "#11121d";
  primaryContainer = "#334064";
  onPrimaryContainer = "#a3abcf";
  secondary = "#38a89d";
  onSecondary = "#11121d";
  tertiary = "#a485dd";
  onTertiary = "#11121d";
  error = "#ee6d85";
  onError = "#11121d";
  inverseSurface = "#a0a8cd";
  inverseOnSurface = "#11121d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#1a1b2a";
    red = "#ee6d85";
    green = "#95c561";
    yellow = "#d7a65f";
    blue = "#7199ee";
    magenta = "#a485dd";
    cyan = "#38a89d";
    white = "#a0a8cd";
    brightBlack = "#282c34";
    brightRed = "#ff8499";
    brightGreen = "#a8d974";
    brightYellow = "#ebb972";
    brightBlue = "#85acff";
    brightMagenta = "#b798f1";
    brightCyan = "#4fbbb0";
    brightWhite = "#b3bbe1";
  };

  orange = "#f6955b";
  brightOrange = "#ffae80";
  cursor = "#7199ee";

  tools = {
    bat = "ansi";
  };
}
