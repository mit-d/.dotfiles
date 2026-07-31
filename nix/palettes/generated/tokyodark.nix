# Tokyodark -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tokyodark.yaml
# Author: Jamy Golden (https://github.com/JamyGolden), Based on Tokyodark.nvim (https://github.com/tiagovla/tokyodark.nvim)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tokyodark.nix. Edits here are lost on the
# next run.

{
  name = "tokyodark";
  displayName = "Tokyodark";
  author = "Jamy Golden (https://github.com/JamyGolden), Based on Tokyodark.nvim (https://github.com/tiagovla/tokyodark.nvim)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#11121d";
  surfaceDim = "#060710";
  surfaceBright = "#3c3e51";
  surfaceContainerLowest = "#060710";
  surfaceContainerLow = "#11121d";
  surfaceContainer = "#212234";
  surfaceContainerHigh = "#2e3042";
  surfaceContainerHighest = "#3c3e51";
  surfaceVariant = "#212234";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#bcc2dc";
  onSurface = "#a0a8cd";
  onSurfaceMuted = "#747b90";
  onSurfaceVariant = "#656b77";
  onSurfaceFaint = "#484d5b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#505564";
  outlineVariant = "#2d2e41";

  # --- Accent roles -------------------------------------------------------
  primary = "#7199ee";
  onPrimary = "#11121d";
  primaryContainer = "#334064";
  onPrimaryContainer = "#bcc2dc";
  secondary = "#9fbbf3";
  onSecondary = "#11121d";
  tertiary = "#a485dd";
  onTertiary = "#11121d";
  error = "#ee6d85";
  onError = "#11121d";
  inverseSurface = "#a0a8cd";
  inverseOnSurface = "#11121d";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#212234";
    red = "#ee6d85";
    green = "#95c561";
    yellow = "#d7a65f";
    blue = "#7199ee";
    magenta = "#a485dd";
    cyan = "#9fbbf3";
    white = "#a0a8cd";
    brightBlack = "#353945";
    brightRed = "#ff8499";
    brightGreen = "#a8d974";
    brightYellow = "#ebb972";
    brightBlue = "#85acff";
    brightMagenta = "#b798f1";
    brightCyan = "#b6cfff";
    brightWhite = "#bcc2dc";
  };

  orange = "#f6955b";
  brightOrange = "#ffae80";
  cursor = "#7199ee";

  tools = {
    bat = "ansi";
  };
}
