# Green Screen -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/greenscreen.yaml
# Author: Chris Kempson (http://chriskempson.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/greenscreen.nix. Edits here are lost on the
# next run.

{
  name = "greenscreen";
  displayName = "Green Screen";
  author = "Chris Kempson (http://chriskempson.com)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#001100";
  surfaceDim = "#000500";
  surfaceBright = "#22511f";
  surfaceContainerLowest = "#000500";
  surfaceContainerLow = "#001100";
  surfaceContainer = "#003300";
  surfaceContainerHigh = "#11420f";
  surfaceContainerHighest = "#22511f";
  surfaceVariant = "#003300";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#00ff00";
  onSurface = "#00bb00";
  onSurfaceMuted = "#00aa00";
  onSurfaceVariant = "#009900";
  onSurfaceFaint = "#007700";

  # --- Borders and dividers -----------------------------------------------
  outline = "#007700";
  outlineVariant = "#005500";

  # --- Accent roles -------------------------------------------------------
  primary = "#009900";
  onPrimary = "#001100";
  primaryContainer = "#004000";
  onPrimaryContainer = "#00ff00";
  secondary = "#005500";
  onSecondary = "#00ff00";
  tertiary = "#00bb00";
  onTertiary = "#001100";
  error = "#007700";
  onError = "#6cff64";
  inverseSurface = "#00bb00";
  inverseOnSurface = "#001100";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#003300";
    red = "#007700";
    green = "#00bb00";
    yellow = "#007700";
    blue = "#009900";
    magenta = "#00bb00";
    cyan = "#005500";
    white = "#00bb00";
    brightBlack = "#007700";
    brightRed = "#238920";
    brightGreen = "#31cf2c";
    brightYellow = "#238920";
    brightBlue = "#2bac26";
    brightMagenta = "#31cf2c";
    brightCyan = "#1c6618";
    brightWhite = "#00ff00";
  };

  orange = "#009900";
  brightOrange = "#2bac26";
  cursor = "#009900";

  tools = {
    bat = "ansi";
  };
}
