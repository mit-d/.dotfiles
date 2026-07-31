# Solarized Light, expressed in the shared palette schema.
#
# Exists partly to prove the schema is real: solarized names its tones
# base03..base3 and has no concept of gruvbox's bg0_hard, so if every consumer
# still works after pointing ./active.nix here, the abstraction holds.
#
# Ethan Schoonover's canonical values (https://ethanschoonover.com/solarized/).
# In the light variant the ramp inverts: base3 is the lightest background and
# base00 the primary text, which is exactly why consumers must treat the
# surfaceContainer ramp as "away from surface" rather than "lighter".
{
  name = "solarized-light";
  variant = "light";
  version = "1.2.0";

  # Bump on ANY change that reaches Firefox's theme manifest, not just colours.
  # Firefox compares this version to decide whether to reinstall a
  # policy-installed theme and ignores install_url pointing at a new store path,
  # so an unbumped change is silently not applied. This bit once already: fixing
  # content_color_scheme from "dark" to "light" left the version alone, Firefox
  # kept the previously-installed 1.0.0, and the new tab page stayed dark on a
  # light frame.

  # Surfaces.
  #
  # Solarized publishes only TWO genuinely light backgrounds -- base3 (#fdf6e3)
  # and base2 (#eee8d5) -- but the schema needs five container steps. An earlier
  # version padded the ramp with base1/base0, which are *foreground* tones, so
  # surfaceContainerHigh became #93a1a1: that is the slate-grey urlbar dropdown,
  # and it made the text on it barely legible.
  #
  # The three steps above base2 are therefore interpolated rather than canonical.
  # They are marked as such because hand-interpolating ramps is exactly where
  # these mistakes come from; see ./README.md on generating palettes instead.
  surface = "#fdf6e3"; # base3
  surfaceDim = "#eee8d5"; # base2
  surfaceBright = "#fdf6e3"; # base3
  surfaceContainerLowest = "#fdf6e3"; # base3
  surfaceContainerLow = "#f7f0dd"; # interpolated
  surfaceContainer = "#eee8d5"; # base2
  surfaceContainerHigh = "#e4ddc8"; # interpolated
  surfaceContainerHighest = "#d9d2bc"; # interpolated
  surfaceVariant = "#eee8d5"; # base2

  # Text. base00 is solarized light's body text, base01 its emphasised text.
  onSurfaceStrong = "#586e75"; # base01
  onSurface = "#657b83"; # base00
  onSurfaceMuted = "#839496"; # base0
  onSurfaceVariant = "#93a1a1"; # base1
  onSurfaceFaint = "#a8b3b3"; # lighter than base1

  outline = "#93a1a1"; # base1
  outlineVariant = "#d9d2bc"; # interpolated: a divider must read against base3

  # Solarized's signature accent is its blue.
  primary = "#268bd2"; # blue
  onPrimary = "#fdf6e3"; # base3
  primaryContainer = "#eee8d5"; # base2
  onPrimaryContainer = "#586e75"; # base01

  secondary = "#2aa198"; # cyan
  onSecondary = "#fdf6e3";

  tertiary = "#859900"; # green
  onTertiary = "#fdf6e3";

  error = "#dc322f"; # red
  onError = "#fdf6e3";

  # Inverted pair: the dark end of the solarized ramp.
  inverseSurface = "#002b36"; # base03
  inverseOnSurface = "#fdf6e3"; # base3

  # ANSI 16. Solarized's mapping is deliberate and well-known: the "bright"
  # slots are its base tones rather than lighter accents, which is why solarized
  # looks wrong in terminals that assume bright == lighter.
  ansi = {
    black = "#073642"; # base02
    red = "#dc322f";
    green = "#859900";
    yellow = "#b58900";
    blue = "#268bd2";
    magenta = "#d33682";
    cyan = "#2aa198";
    white = "#eee8d5"; # base2

    brightBlack = "#002b36"; # base03
    brightRed = "#cb4b16"; # orange
    brightGreen = "#586e75"; # base01
    brightYellow = "#657b83"; # base00
    brightBlue = "#839496"; # base0
    brightMagenta = "#6c71c4"; # violet
    brightCyan = "#93a1a1"; # base1
    brightWhite = "#fdf6e3"; # base3
  };

  orange = "#cb4b16";
  brightOrange = "#cb4b16";

  # Blue reads better than orange as a caret on paper-coloured background.
  cursor = "#268bd2";

  # See the gruvbox palette for why these are stated per-palette.
  tools = {
    bat = "Solarized (light)"; # `bat --list-themes`
    btop = "solarized_light"; # $out/share/btop/themes
  };
}
