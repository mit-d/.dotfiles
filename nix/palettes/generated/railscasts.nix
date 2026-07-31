# Railscasts -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/railscasts.yaml
# Author: Ryan Bates (http://railscasts.com)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/railscasts.nix. Edits here are lost on the
# next run.

{
  name = "railscasts";
  displayName = "Railscasts";
  author = "Ryan Bates (http://railscasts.com)";
  variant = "dark";
  version = "3.2.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#2b2b2b";
  surfaceDim = "#262626";
  surfaceBright = "#323440";
  surfaceContainerLowest = "#262626";
  surfaceContainerLow = "#2b2b2b";
  surfaceContainer = "#272935";
  surfaceContainerHigh = "#2c2e3b";
  surfaceContainerHighest = "#323440";
  surfaceVariant = "#272935";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f9f7f3";
  onSurface = "#e6e1dc";
  onSurfaceMuted = "#ddd8d2";
  onSurfaceVariant = "#d4cfc9";
  onSurfaceFaint = "#5a647e";

  # --- Borders and dividers -----------------------------------------------
  outline = "#5d6780";
  outlineVariant = "#3b4156";

  # --- Accent roles -------------------------------------------------------
  primary = "#6d9cbe";
  onPrimary = "#2b2b2b";
  primaryContainer = "#44535f";
  onPrimaryContainer = "#f9f7f3";
  secondary = "#519f50";
  onSecondary = "#282828";
  tertiary = "#b6b3eb";
  onTertiary = "#2b2b2b";
  error = "#da4939";
  onError = "#111010";
  inverseSurface = "#e6e1dc";
  inverseOnSurface = "#2b2b2b";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#272935";
    red = "#da4939";
    green = "#a5c261";
    yellow = "#ffc66d";
    blue = "#6d9cbe";
    magenta = "#b6b3eb";
    cyan = "#519f50";
    white = "#e6e1dc";
    brightBlack = "#5a647e";
    brightRed = "#ef5d4b";
    brightGreen = "#b8d674";
    brightYellow = "#ffdfb2";
    brightBlue = "#7fafd1";
    brightMagenta = "#c9c6ff";
    brightCyan = "#64b262";
    brightWhite = "#f9f7f3";
  };

  orange = "#cc7833";
  brightOrange = "#e08b47";
  cursor = "#6d9cbe";

  tools = {
    bat = "ansi";
  };
}
