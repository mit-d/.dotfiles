# Local edits to the generated `gruvbox-dark-hard` palette.
#
# The generator maps base16's slots onto Material roles by their documented
# meaning, which is right in general and loses two things that are specifically
# gruvbox:
#
#   1. base16 puts its UI accent in base0D, which for gruvbox is the blue
#      #83a598. But gruvbox's signature is its warm yellow -- that is what the
#      theme is recognisably *for*. Which hue is a theme's "primary" is taste,
#      not something derivable from sixteen colours, so it belongs here.
#
#   2. base16's eight accents are gruvbox's *bright* set (#fb4934 red, not
#      #cc241d). Faithful to base16, and a perfectly good rendering -- it is what
#      every base16-gruvbox user sees -- but brighter than gruvbox proper.
#      Restored to the canonical terminal palette here.
#
# Everything not mentioned stays generated, including the surface ramp and the
# text-contrast floors. Delete this file to see the unmodified library palette.
{
  # gruvbox's warm yellow as the signature accent, with blue and aqua falling
  # out as the supporting pair.
  primary = "#fabd2f";
  primaryContainer = "#d79921";
  onPrimaryContainer = "#1d2021";
  secondary = "#83a598";
  tertiary = "#8ec07c";

  # gruvbox's own default foreground. base16 assigns fg2 (#d5c4a1) to base05.
  onSurface = "#ebdbb2";
  onSurfaceMuted = "#d5c4a1";
  inverseSurface = "#ebdbb2";

  # Canonical gruvbox terminal palette. `black` is left as the generated value
  # (base01) rather than gruvbox's #1d2021, which on the hard variant is exactly
  # the background -- anything printed in it would be invisible.
  ansi = {
    red = "#cc241d";
    green = "#98971a";
    yellow = "#d79921";
    blue = "#458588";
    magenta = "#b16286";
    cyan = "#689d6a";
    white = "#a89984";

    brightBlack = "#928374";
    brightRed = "#fb4934";
    brightGreen = "#b8bb26";
    brightYellow = "#fabd2f";
    brightBlue = "#83a598";
    brightMagenta = "#d3869b";
    brightCyan = "#8ec07c";
    brightWhite = "#ebdbb2";
  };

  orange = "#d65d0e";
  brightOrange = "#fe8019";
  cursor = "#fe8019";
}
