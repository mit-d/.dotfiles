# Deep Oceanic Next -- generated, do not edit.
#
# Source: tinted-theming/schemes base16/deep-oceanic-next.yaml
# Author: spearkkk (https://github.com/spearkkk)
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/deep-oceanic-next.nix. Edits here are lost on the
# next run.

{
  name = "deep-oceanic-next";
  displayName = "Deep Oceanic Next";
  author = "spearkkk (https://github.com/spearkkk)";
  variant = "dark";
  version = "3.1.0";

  # --- Surfaces -----------------------------------------------------------
  surface = "#001c1f";
  surfaceDim = "#000f11";
  surfaceBright = "#1e444c";
  surfaceContainerLowest = "#000f11";
  surfaceContainerLow = "#001c1f";
  surfaceContainer = "#002931";
  surfaceContainerHigh = "#0f363e";
  surfaceContainerHighest = "#1e444c";
  surfaceVariant = "#002931";

  # --- Text, strongest to faintest ----------------------------------------
  onSurfaceStrong = "#f2f7f9";
  onSurface = "#d4e1e8";
  onSurfaceMuted = "#82bac5";
  onSurfaceVariant = "#0093a3";
  onSurfaceFaint = "#215761";

  # --- Borders and dividers -----------------------------------------------
  outline = "#2e5f68";
  outlineVariant = "#043842";

  # --- Accent roles -------------------------------------------------------
  primary = "#568ccf";
  onPrimary = "#001c1f";
  primaryContainer = "#1c435c";
  onPrimaryContainer = "#f2f7f9";
  secondary = "#4fb7ae";
  onSecondary = "#001c1f";
  tertiary = "#8b66d6";
  onTertiary = "#ffffff";
  error = "#d3464d";
  onError = "#ffffff";
  inverseSurface = "#d4e1e8";
  inverseOnSurface = "#001c1f";

  # --- ANSI 16 ------------------------------------------------------------
  ansi = {
    black = "#002931";
    red = "#d3464d";
    green = "#63b784";
    yellow = "#f3b863";
    blue = "#568ccf";
    magenta = "#8b66d6";
    cyan = "#4fb7ae";
    white = "#d4e1e8";
    brightBlack = "#004852";
    brightRed = "#e85a5e";
    brightGreen = "#76ca96";
    brightYellow = "#ffce8b";
    brightBlue = "#689fe3";
    brightMagenta = "#9d79ea";
    brightCyan = "#64cac1";
    brightWhite = "#f2f7f9";
  };

  orange = "#e37552";
  brightOrange = "#f88864";
  cursor = "#568ccf";

  tools = {
    bat = "ansi";
  };
}
