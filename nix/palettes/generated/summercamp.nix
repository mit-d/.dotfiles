# summercamp -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/summercamp.yaml
# Author: zoe firi (zoefiri.github.io)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/summercamp.nix. Edits here are lost on the
# next run.

{
  name = "summercamp";
  displayName = "summercamp";
  author = "zoe firi (zoefiri.github.io)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1c1810";
  surfaceDim = "#100c05";
  surfaceBright = "#464237";
  surfaceContainerLowest = "#100c05";
  surfaceContainerLow = "#1c1810";
  surfaceContainer = "#2a261c";
  surfaceContainerHigh = "#383429";
  surfaceContainerHighest = "#464237";
  surfaceVariant = "#2a261c";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f8f5de";
  onSurface = "#868168";
  onSurfaceMuted = "#7d7861";
  onSurfaceVariant = "#736f59";
  onSurfaceFaint = "#55503d";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5d5945";
  outlineVariant = "#3a3527";

  # --- Accent roles -------------------------------------------------------
  primary = "#489bf0";
  onPrimary = "#1c1810";
  primaryContainer = "#30475d";
  onPrimaryContainer = "#f8f5de";
  secondary = "#5aebbc";
  onSecondary = "#1c1810";
  tertiary = "#ff8080";
  onTertiary = "#1c1810";
  error = "#e35142";
  onError = "#1c1810";
  inverseSurface = "#868168";
  inverseOnSurface = "#1c1810";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#2a261c";
    red = "#e35142";
    green = "#5ceb5a";
    yellow = "#f2ff27";
    blue = "#489bf0";
    magenta = "#ff8080";
    cyan = "#5aebbc";
    white = "#736e55";
    brightBlack = "#504b38";
    brightRed = "#f96554";
    brightGreen = "#75ff71";
    brightYellow = "#ffffff";
    brightBlue = "#62aeff";
    brightMagenta = "#ffa29f";
    brightCyan = "#73ffcf";
    brightWhite = "#f8f5de";
  };

  orange = "#fba11b";
  brightOrange = "#ffbc6f";
  cursor = "#489bf0";

  tools = {
    bat = "ansi";
  };
}
