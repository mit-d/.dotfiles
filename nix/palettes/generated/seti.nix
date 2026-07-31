# Seti UI -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/seti.yaml
# Author:
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/seti.nix. Edits here are lost on the
# next run.

{
  name = "seti";
  displayName = "Seti UI";
  author = "";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#151718";
  surfaceDim = "#090b0c";
  surfaceBright = "#444647";
  surfaceContainerLowest = "#090b0c";
  surfaceContainerLow = "#151718";
  surfaceContainer = "#282a2b";
  surfaceContainerHigh = "#363839";
  surfaceContainerHighest = "#444647";
  surfaceVariant = "#282a2b";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#ffffff";
  onSurface = "#d6d6d6";
  onSurfaceMuted = "#94bed7";
  onSurfaceVariant = "#43a5d5";
  onSurfaceFaint = "#41535b";

  # --- Borders and dividers -----------------------------------------------
  outline = "#495a62";
  outlineVariant = "#3b758c";

  # --- Accent roles -------------------------------------------------------
  primary = "#55b5db";
  onPrimary = "#151718";
  primaryContainer = "#2f4d5a";
  onPrimaryContainer = "#ffffff";
  secondary = "#55dbbe";
  onSecondary = "#151718";
  tertiary = "#a074c4";
  onTertiary = "#151718";
  error = "#cd3f45";
  onError = "#ffffff";
  inverseSurface = "#d6d6d6";
  inverseOnSurface = "#151718";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#282a2b";
    red = "#cd3f45";
    green = "#9fca56";
    yellow = "#e6cd69";
    blue = "#55b5db";
    magenta = "#a074c4";
    cyan = "#55dbbe";
    white = "#d6d6d6";
    brightBlack = "#41535b";
    brightRed = "#e25356";
    brightGreen = "#b2de6a";
    brightYellow = "#fae17d";
    brightBlue = "#69c8ef";
    brightMagenta = "#b386d8";
    brightCyan = "#6cefd1";
    brightWhite = "#ffffff";
  };

  orange = "#db7b55";
  brightOrange = "#f08e67";
  cursor = "#55b5db";

  tools = {
    bat = "ansi";
  };
}
