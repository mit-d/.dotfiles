# Primer Dark Dimmed -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/primer-dark-dimmed.yaml
# Author: Jimmy Lin
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/primer-dark-dimmed.nix. Edits here are lost on the
# next run.

{
  name = "primer-dark-dimmed";
  displayName = "Primer Dark Dimmed";
  author = "Jimmy Lin";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#1c2128";
  surfaceDim = "#10141b";
  surfaceBright = "#545c65";
  surfaceContainerLowest = "#10141b";
  surfaceContainerLow = "#1c2128";
  surfaceContainer = "#373e47";
  surfaceContainerHigh = "#454d56";
  surfaceContainerHighest = "#545c65";
  surfaceVariant = "#373e47";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#cdd9e5";
  onSurface = "#909dab";
  onSurfaceMuted = "#83909d";
  onSurfaceVariant = "#768390";
  onSurfaceFaint = "#545d68";

  # --- Borders and dividers -----------------------------------------------
  outline = "#565f6a";
  outlineVariant = "#444c56";

  # --- Accent roles -------------------------------------------------------
  primary = "#539bf5";
  onPrimary = "#1c2128";
  primaryContainer = "#314c6f";
  onPrimaryContainer = "#cdd9e5";
  secondary = "#96d0ff";
  onSecondary = "#1c2128";
  tertiary = "#e275ad";
  onTertiary = "#1c2128";
  error = "#f47067";
  onError = "#1c2128";
  inverseSurface = "#909dab";
  inverseOnSurface = "#1c2128";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#373e47";
    red = "#f47067";
    green = "#57ab5a";
    yellow = "#c69026";
    blue = "#539bf5";
    magenta = "#e275ad";
    cyan = "#96d0ff";
    white = "#909dab";
    brightBlack = "#545d68";
    brightRed = "#ff8b81";
    brightGreen = "#6abe6c";
    brightYellow = "#daa33e";
    brightBlue = "#70afff";
    brightMagenta = "#f788c0";
    brightCyan = "#bee1ff";
    brightWhite = "#cdd9e5";
  };

  orange = "#e0823d";
  brightOrange = "#f59551";
  cursor = "#539bf5";

  tools = {
    bat = "ansi";
  };
}
