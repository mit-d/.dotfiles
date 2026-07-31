# Colour helpers for consumers that need something other than a hex string.
#
#   (import ./lib.nix).hexToHsl "#fabd2f"  =>  { h = 41; s = 96; l = 58; }
#
# Deliberately computed here rather than baked into the generated palettes.
# An override that changes `primary` -- which nix/palettes/overrides/gruvbox-dark-hard.nix
# does -- would leave a precomputed HSL describing the colour it replaced, and
# that kind of stale-derived-value bug is silent.
let
  # Both cases, so this needs no `lib` and can be imported from anywhere.
  digits = {
    "0" = 0;
    "1" = 1;
    "2" = 2;
    "3" = 3;
    "4" = 4;
    "5" = 5;
    "6" = 6;
    "7" = 7;
    "8" = 8;
    "9" = 9;
    a = 10;
    b = 11;
    c = 12;
    d = 13;
    e = 14;
    f = 15;
    A = 10;
    B = 11;
    C = 12;
    D = 13;
    E = 14;
    F = 15;
  };

  digit = c: digits.${c} or (throw "hexToHsl: '${c}' is not a hex digit");

  pair = s: i: 16 * digit (builtins.substring i 1 s) + digit (builtins.substring (i + 1) 1 s);

  round = x: builtins.floor (x + 0.5);

  hexChars = "0123456789abcdef";

  byte =
    n:
    let
      v =
        if n < 0 then
          0
        else if n > 255 then
          255
        else
          round n;
    in
    builtins.substring (v / 16) 1 hexChars + builtins.substring (v - 16 * (v / 16)) 1 hexChars;
in
rec {
  # "#rrggbb" -> { r, g, b } as floats in 0..1.
  hexToRgb =
    hex:
    let
      h = if builtins.substring 0 1 hex == "#" then builtins.substring 1 6 hex else hex;
    in
    if builtins.stringLength h != 6 then
      throw "hexToRgb: expected 6 hex digits, got ${hex}"
    else
      {
        r = (pair h 0) / 255.0;
        g = (pair h 2) / 255.0;
        b = (pair h 4) / 255.0;
      };

  # "#rrggbb" -> { h, s, l } with h in degrees and s/l as whole percentages,
  # which is the form Obsidian's --accent-h/--accent-s/--accent-l wants.
  hexToHsl =
    hex:
    let
      c = hexToRgb hex;
      max =
        if c.r >= c.g && c.r >= c.b then
          c.r
        else if c.g >= c.b then
          c.g
        else
          c.b;
      min =
        if c.r <= c.g && c.r <= c.b then
          c.r
        else if c.g <= c.b then
          c.g
        else
          c.b;
      l = (max + min) / 2;
      d = max - min;
      s =
        if d == 0 then
          0
        else if l > 0.5 then
          d / (2 - max - min)
        else
          d / (max + min);
      h6 =
        if d == 0 then
          0
        else if max == c.r then
          (c.g - c.b) / d + (if c.g < c.b then 6 else 0)
        else if max == c.g then
          (c.b - c.r) / d + 2
        else
          (c.r - c.g) / d + 4;
    in
    {
      h = round (h6 * 60);
      s = round (s * 100);
      l = round (l * 100);
    };

  # Blend two colours, `t` of the way from a to b. Plain sRGB rather than the
  # OKLab the generator uses: this only exists for subtle tints -- a diff line
  # that should read as "green, but barely" -- where being perceptually exact
  # matters less than not pulling a colour-science implementation into nix.
  mix =
    a: b: t:
    let
      x = hexToRgb a;
      y = hexToRgb b;
      chan = p: q: byte (255 * (p + (q - p) * t));
    in
    "#" + chan x.r y.r + chan x.g y.g + chan x.b y.b;

  # IntelliJ colour scheme values are bare hex, with no leading '#'.
  noHash = hex: if builtins.substring 0 1 hex == "#" then builtins.substring 1 6 hex else hex;
}
