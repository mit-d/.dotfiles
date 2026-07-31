# Chicago Night -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/chicago-night.yaml
# Author: Wendell, Ryan <ryanjwendell@gmail.com>
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/chicago-night.nix. Edits here are lost on the
# next run.

{
  name = "chicago-night";
  displayName = "Chicago Night";
  author = "Wendell, Ryan <ryanjwendell@gmail.com>";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1e2a24";
  surfaceDim = "#111d17";
  surfaceBright = "#47594f";
  surfaceContainerLowest = "#111d17";
  surfaceContainerLow = "#1e2a24";
  surfaceContainer = "#2a3b32";
  surfaceContainerHigh = "#384a40";
  surfaceContainerHighest = "#47594f";
  surfaceVariant = "#2a3b32";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#dbe3de";
  onSurface = "#a7b8af";
  onSurfaceMuted = "#98a9a0";
  onSurfaceVariant = "#8a9a91";
  onSurfaceFaint = "#5f7368";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5f7368";
  outlineVariant = "#364c40";

  # --- Accent roles -------------------------------------------------------
  primary = "#522398";
  onPrimary = "#dbe3de";
  primaryContainer = "#302d4f";
  onPrimaryContainer = "#dbe3de";
  secondary = "#00a1de";
  onSecondary = "#1e2a24";
  tertiary = "#e27ea6";
  onTertiary = "#1e2a24";
  error = "#c60c30";
  onError = "#dbe3de";
  inverseSurface = "#a7b8af";
  inverseOnSurface = "#1e2a24";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2a3b32";
    red = "#c60c30";
    green = "#009b3a";
    yellow = "#f9e300";
    blue = "#522398";
    magenta = "#e27ea6";
    cyan = "#00a1de";
    white = "#a7b8af";
    brightBlack = "#5f7368";
    brightRed = "#dc2f41";
    brightGreen = "#2bae4d";
    brightYellow = "#fff7af";
    brightBlue = "#6237ac";
    brightMagenta = "#f791b9";
    brightCyan = "#2fb4f2";
    brightWhite = "#dbe3de";
  };

  orange = "#f9461c";
  brightOrange = "#ff6e4f";
  cursor = "#7863b1";

  tools = {
    bat = "ansi";
  };
}
