# Tango -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/tango.yaml
# Author: @Schnouki, based on the Tango Desktop Project
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/tango.nix. Edits here are lost on the
# next run.

{
  name = "tango";
  displayName = "Tango";
  author = "@Schnouki, based on the Tango Desktop Project";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2e3436";
  surfaceDim = "#212628";
  surfaceBright = "#c3ff98";
  surfaceContainerLowest = "#212628";
  surfaceContainerLow = "#2e3436";
  surfaceContainer = "#8ae234";
  surfaceContainerHigh = "#9cf54c";
  surfaceContainerHighest = "#c3ff98";
  surfaceVariant = "#8ae234";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#eeeeec";
  onSurface = "#d3d7cf";
  onSurfaceMuted = "#a3bbd0";
  onSurfaceVariant = "#729fcf";
  onSurfaceFaint = "#656763";

  # --- Borders and dividers -----------------------------------------------
  outline = "#6e6f6c";
  outlineVariant = "#fce94f";

  # --- Accent roles -------------------------------------------------------
  primary = "#3465a4";
  onPrimary = "#eeeeec";
  primaryContainer = "#32475e";
  onPrimaryContainer = "#eeeeec";
  secondary = "#06989a";
  onSecondary = "#1f2325";
  tertiary = "#75507b";
  onTertiary = "#eeeeec";
  error = "#cc0000";
  onError = "#eeeeec";
  inverseSurface = "#d3d7cf";
  inverseOnSurface = "#2e3436";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#8ae234";
    red = "#cc0000";
    green = "#4e9a06";
    yellow = "#c4a000";
    blue = "#3465a4";
    magenta = "#75507b";
    cyan = "#06989a";
    white = "#d3d7cf";
    brightBlack = "#555753";
    brightRed = "#e22b20";
    brightGreen = "#60ad2a";
    brightYellow = "#d7b32d";
    brightBlue = "#4577b7";
    brightMagenta = "#87618d";
    brightCyan = "#2fabad";
    brightWhite = "#eeeeec";
  };

  orange = "#ef2929";
  brightOrange = "#ff4e45";
  cursor = "#557eb2";

  tools = {
    bat = "ansi";
  };
}
