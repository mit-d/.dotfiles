# PaperColor Dark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/papercolor-dark.yaml
# Author: Jon Leopard (http://github.com/jonleopard), Tinted Theming (https://github.com/tinted-theming), based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/papercolor-dark.nix. Edits here are lost on the
# next run.

{
  name = "papercolor-dark";
  displayName = "PaperColor Dark";
  author = "Jon Leopard (http://github.com/jonleopard), Tinted Theming (https://github.com/tinted-theming), based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1c1c1c";
  surfaceDim = "#101010";
  surfaceBright = "#535353";
  surfaceContainerLowest = "#101010";
  surfaceContainerLow = "#1c1c1c";
  surfaceContainer = "#363636";
  surfaceContainerHigh = "#444444";
  surfaceContainerHighest = "#535353";
  surfaceVariant = "#363636";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#d0d0d0";
  onSurface = "#9e9e9e";
  onSurfaceMuted = "#8f8f8f";
  onSurfaceVariant = "#808080";
  onSurfaceFaint = "#585858";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5b5b5b";
  outlineVariant = "#424242";

  # --- Accent roles -------------------------------------------------------
  primary = "#5fafd7";
  onPrimary = "#1c1c1c";
  primaryContainer = "#374f5c";
  onPrimaryContainer = "#d0d0d0";
  secondary = "#00afaf";
  onSecondary = "#1c1c1c";
  tertiary = "#af87d7";
  onTertiary = "#1c1c1c";
  error = "#ff5faf";
  onError = "#1c1c1c";
  inverseSurface = "#9e9e9e";
  inverseOnSurface = "#1c1c1c";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#363636";
    red = "#ff5faf";
    green = "#5faf5f";
    yellow = "#ffaf00";
    blue = "#5fafd7";
    magenta = "#af87d7";
    cyan = "#00afaf";
    white = "#9e9e9e";
    brightBlack = "#585858";
    brightRed = "#ff8abf";
    brightGreen = "#72c271";
    brightYellow = "#ffca7d";
    brightBlue = "#72c2eb";
    brightMagenta = "#c29aeb";
    brightCyan = "#31c2c2";
    brightWhite = "#d0d0d0";
  };

  orange = "#d7af5f";
  brightOrange = "#ebc272";
  cursor = "#5fafd7";

  tools = {
    bat = "ansi";
  };
}
