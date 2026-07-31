# Canonical Gruvbox Dark Hard palette.
#
# Single source of truth for the Firefox theme: nix/darwin/firefox.nix feeds
# it into both the generated static-theme manifest and the CSS custom
# properties prepended to userChrome.css, so no hex value is written twice.
#
# Note this is the *canonical* gruvbox mapping, which differs slightly from
# hypr/.config/hypr/palettes/gruvbox-dark-hard.conf -- that file is a partial
# 10-colour palette generated from a Ghostty theme, and it maps `$orange` to
# #d79921, which is canonically gruvbox *yellow*.
{
  # Firefox decides whether to reinstall a policy-installed theme by comparing
  # `version`, NOT by noticing that install_url points at a new store path.
  # Bump this whenever a colour below changes, or the edit will not take
  # effect in an already-installed profile.
  version = "1.0.0";

  # Backgrounds, darkest first. "hard" refers to bg0_hard being darker than
  # the medium variant's #282828.
  bg0_hard = "#1d2021";
  bg0 = "#282828";
  bg1 = "#3c3836";
  bg2 = "#504945";
  bg3 = "#665c54";
  bg4 = "#7c6f64";

  # Foregrounds, lightest first.
  fg0 = "#fbf1c7";
  fg1 = "#ebdbb2";
  fg2 = "#d5c4a1";
  fg3 = "#bdae93";
  fg4 = "#a89984";

  gray = "#928374";

  # Neutral accents.
  red = "#cc241d";
  green = "#98971a";
  yellow = "#d79921";
  blue = "#458588";
  purple = "#b16286";
  aqua = "#689d6a";
  orange = "#d65d0e";

  # Bright accents, used for anything that needs to read as active or
  # attention-worthy against the hard background.
  brightRed = "#fb4934";
  brightGreen = "#b8bb26";
  brightYellow = "#fabd2f";
  brightBlue = "#83a598";
  brightPurple = "#d3869b";
  brightAqua = "#8ec07c";
  brightOrange = "#fe8019";
}
