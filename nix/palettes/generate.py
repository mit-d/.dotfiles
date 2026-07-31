#!/usr/bin/env python3
"""Generate the palette library from tinted-theming/schemes.

A base16 scheme is sixteen colours with documented roles. The palette schema
this repo consumes is a Material 3 role set: nine surfaces, five text tones,
two outlines, six accent pairs, sixteen ANSI slots. So most of this file is the
derivation from the smaller set to the larger one, done in OKLab so that
"one step lighter" means the same thing to the eye in every scheme.

Run it through the flake so the inputs are pinned:

    nix run .#gen-palettes

See ./README.md for the schema and ./generated/_report.md for what the last run
had to derive, nudge or skip.
"""

from __future__ import annotations

import argparse
import math
import os
import re
import subprocess
import sys
import unicodedata
from dataclasses import dataclass
from pathlib import Path

# Bump when a derivation rule below changes.
#
# This lands in every generated palette's `version`, which is what Firefox
# compares to decide whether to reinstall a policy-installed theme. Firefox
# does not notice that install_url points at a new store path, so regenerating
# with changed rules but an unbumped GENERATOR_VERSION leaves already-installed
# profiles on the old colours -- silently.
GENERATOR_VERSION = 2

# Generated palettes version as 3.<GENERATOR_VERSION>.0. Major 3 clears the
# hand-authored palettes this library replaced, which reached 2.1.0; Firefox
# refuses to downgrade an extension, so a generated palette has to outrank its
# hand-authored predecessor under the same extension id.
VERSION_MAJOR = 3


# --- Colour ------------------------------------------------------------------
#
# Two colour spaces, each for what it is actually good at. OKLab for anything
# perceptual -- "lighten by one step", "mix halfway" -- because sRGB and HSL
# both lie about lightness. WCAG relative luminance for contrast ratios,
# because that is the number every accessibility guideline is written against.


@dataclass(frozen=True)
class Color:
    r: float  # all channels are sRGB in 0..1
    g: float
    b: float

    @staticmethod
    def from_hex(text: str) -> Color:
        h = text.strip().lstrip("#")
        if len(h) == 3:
            h = "".join(c * 2 for c in h)
        if len(h) != 6 or not re.fullmatch(r"[0-9a-fA-F]{6}", h):
            raise ValueError(f"not a hex colour: {text!r}")
        return Color(*(int(h[i : i + 2], 16) / 255 for i in (0, 2, 4)))

    def to_hex(self) -> str:
        return "#" + "".join(f"{round(max(0.0, min(1.0, c)) * 255):02x}" for c in self)

    def map(self, fn) -> Color:
        return Color(*(fn(c) for c in self))

    def __iter__(self):
        return iter((self.r, self.g, self.b))


def _srgb_to_linear(c: float) -> float:
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4


def _linear_to_srgb(c: float) -> float:
    return 12.92 * c if c <= 0.0031308 else 1.055 * (c ** (1 / 2.4)) - 0.055


def to_oklab(c: Color) -> tuple[float, float, float]:
    r, g, b = (_srgb_to_linear(x) for x in c)
    l = 0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b
    m = 0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b
    s = 0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b
    l_, m_, s_ = (math.copysign(abs(v) ** (1 / 3), v) for v in (l, m, s))
    return (
        0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_,
        1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_,
        0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_,
    )


def from_oklab(lab: tuple[float, float, float]) -> Color:
    L, a, b = lab
    l_ = L + 0.3963377774 * a + 0.2158037573 * b
    m_ = L - 0.1055613458 * a - 0.0638541728 * b
    s_ = L - 0.0894841775 * a - 1.2914855480 * b
    l, m, s = (v**3 for v in (l_, m_, s_))
    return Color(
        4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s,
        -1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s,
        -0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s,
    ).map(_linear_to_srgb)


def to_oklch(c: Color) -> tuple[float, float, float]:
    L, a, b = to_oklab(c)
    return L, math.hypot(a, b), math.atan2(b, a)


def from_oklch(L: float, C: float, h: float) -> Color:
    return from_oklab((L, C * math.cos(h), C * math.sin(h)))


def in_gamut(c: Color) -> bool:
    return all(-1e-4 <= x <= 1 + 1e-4 for x in c)


def lightness(c: Color) -> float:
    return to_oklab(c)[0]


def set_lightness(c: Color, L: float) -> Color:
    """Move a colour to a target OKLab lightness, keeping its hue.

    Naively rebuilding from OKLCh can land outside sRGB -- a fully saturated
    red has nowhere to go when asked to be very light. Chroma is reduced until
    the result is representable, which is what "as close as sRGB allows" means.
    """
    _, C, h = to_oklch(c)
    L = max(0.0, min(1.0, L))
    if C < 1e-6:
        return from_oklch(L, 0.0, h)
    lo, hi = 0.0, C
    if in_gamut(from_oklch(L, C, h)):
        return from_oklch(L, C, h)
    for _ in range(24):
        mid = (lo + hi) / 2
        if in_gamut(from_oklch(L, mid, h)):
            lo = mid
        else:
            hi = mid
    return from_oklch(L, lo, h)


def shift_lightness(c: Color, delta: float) -> Color:
    return set_lightness(c, lightness(c) + delta)


def mix(a: Color, b: Color, t: float) -> Color:
    """Blend in OKLab, so a 50% mix looks like the midpoint."""
    la, lb = to_oklab(a), to_oklab(b)
    return from_oklab(tuple(x + (y - x) * t for x, y in zip(la, lb)))


def quantize(c: Color) -> Color:
    """Round to the 8-bit value that will actually be written.

    Contrast has to be measured on this, not on the float colour. Searching in
    float space and quantizing afterwards lands a colour just under its floor --
    it made 71 of 2010 accent pairs miss 4.5:1 by less than 0.07, which turns a
    stated guarantee into an almost.
    """
    return Color.from_hex(c.to_hex())


def relative_luminance(c: Color) -> float:
    r, g, b = (_srgb_to_linear(x) for x in c)
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


def contrast(a: Color, b: Color) -> float:
    la, lb = relative_luminance(a), relative_luminance(b)
    hi, lo = max(la, lb), min(la, lb)
    return (hi + 0.05) / (lo + 0.05)


def ensure_contrast(fg: Color, bg: Color, ratio: float, anchor: Color) -> Color:
    """Push `fg` toward `anchor` until it reads at `ratio` against `bg`.

    Used to make a guarantee the source data does not: that every text tone is
    legible on the surface it is named for. Schemes vary wildly in how much
    contrast they consider acceptable, and several put "comments" well below
    anything readable.
    """
    if contrast(quantize(fg), bg) >= ratio:
        return fg
    lo, hi = 0.0, 1.0
    if contrast(quantize(anchor), bg) < ratio:
        # Even the anchor is too weak, so fall back to black or white --
        # whichever measures better against this particular background.
        #
        # Choosing by the background's luminance instead ("dark background means
        # white text") is wrong for mid-tone fills and fails silently: on nord's
        # tertiary #b48ead, luminance 0.31 says white, but white reads at 2.9:1
        # there while black reads at 7.3:1.
        anchor = max(
            (Color(1, 1, 1), Color(0, 0, 0)), key=lambda c: contrast(c, bg)
        )
        if contrast(anchor, bg) < ratio:
            return anchor
    for _ in range(24):
        mid = (lo + hi) / 2
        if contrast(quantize(mix(fg, anchor, mid)), bg) >= ratio:
            hi = mid
        else:
            lo = mid
    # The search brackets the boundary; `hi` is the side known to satisfy it.
    return quantize(mix(fg, anchor, hi))


def cap_contrast(fg: Color, bg: Color, ratio: float, toward: Color) -> Color:
    """Inverse of ensure_contrast: pull `fg` back to at most `ratio`.

    Keeps the five text tones monotonic. Without it a scheme whose base04 is
    more contrasty than its base05 produces a "muted" tone that shouts louder
    than the default foreground.
    """
    if contrast(quantize(fg), bg) <= ratio:
        return fg
    lo, hi = 0.0, 1.0
    for _ in range(24):
        mid = (lo + hi) / 2
        if contrast(quantize(mix(fg, toward, mid)), bg) <= ratio:
            hi = mid
        else:
            lo = mid
    return quantize(mix(fg, toward, hi))


# --- The smaller palette -----------------------------------------------------


BASE16_SLOTS = [f"base0{c}" for c in "0123456789ABCDEF"]

# What each slot means, per tinted-theming's styling.md. Named here so the
# derivation below reads in role terms rather than slot numbers.
ROLE_OF_SLOT = {
    "base00": "bg",  # Default Background
    "base01": "bg_alt",  # Lighter Background (status bars)
    "base02": "selection",  # Selection Background
    "base03": "comment",  # Comments, Invisibles, Line Highlighting
    "base04": "fg_dim",  # Dark Foreground (status bars)
    "base05": "fg",  # Default Foreground
    "base06": "fg_light",  # Light Foreground
    "base07": "fg_lightest",  # The Lightest Foreground
    "base08": "red",  # Variables, Diff Deleted
    "base09": "orange",  # Integers, Constants
    "base0A": "yellow",  # Classes, Markup Bold
    "base0B": "green",  # Strings, Diff Inserted
    "base0C": "cyan",  # Support, Regular Expressions
    "base0D": "blue",  # Functions, Methods, Headings
    "base0E": "magenta",  # Keywords, Storage
    "base0F": "brown",  # Deprecated
}


@dataclass
class Source:
    """A minimal palette: the sixteen roles above, plus metadata.

    Anything that can fill this in can become a full palette, which is the
    point -- a theme that is not in tinted-theming only has to supply sixteen
    colours.
    """

    slug: str
    display_name: str
    author: str
    declared_variant: str
    system: str
    upstream: str
    colors: dict[str, Color]

    def __getattr__(self, role: str) -> Color:
        try:
            return self.colors[role]
        except KeyError as exc:
            raise AttributeError(role) from exc


def ascii_fold(text: str) -> str:
    """Strip the file down to ASCII.

    A pre-commit hook in this repo rejects non-ASCII, and scheme authors' names
    are full of accents. Decompose, drop the combining marks, then drop
    whatever is left that will not fit.
    """
    decomposed = unicodedata.normalize("NFKD", text)
    stripped = "".join(c for c in decomposed if not unicodedata.combining(c))
    return "".join(c if ord(c) < 128 else "?" for c in stripped)


def parse_scheme(path: Path) -> Source:
    """Read one scheme YAML.

    Hand-parsed rather than via PyYAML: the files are a flat mapping with a
    single nested `palette`, PyYAML would be another dependency to pin, and a
    strict parser that rejects anything unexpected is a feature here -- a
    scheme this does not understand should fail loudly, not silently produce a
    palette with one slot missing.
    """
    meta: dict[str, str] = {}
    colors: dict[str, Color] = {}
    in_palette = False
    in_block = False

    # Values are unquoted about as often as quoted, may contain spaces and
    # parentheses ("j-c-m (https://github.com/j-c-m/)"), and a `description: |`
    # block runs over several indented lines. A slot line is matched separately
    # and strictly, because that is the part that must not be misread: a colour
    # value contains a '#', so comment-stripping cannot come first.
    top_level = re.compile(r"^([A-Za-z0-9_-]+)\s*:\s*(.*)$")
    slot_line = re.compile(
        r"""^\s+(base0[0-9A-Fa-f])\s*:\s*
            ["']?(\#?[0-9a-fA-F]{6}|\#?[0-9a-fA-F]{3})["']?
            \s* (?:\#.*)? $""",
        re.VERBOSE,
    )

    for lineno, raw in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        if not raw.strip() or raw.lstrip().startswith("#"):
            continue

        if raw[0] in " \t":
            if in_block:
                continue
            if in_palette:
                slot = slot_line.match(raw.rstrip())
                if not slot:
                    raise ValueError(f"{path.name}:{lineno}: cannot parse slot {raw!r}")
                key = "base0" + slot.group(1)[-1].upper()
                if key not in BASE16_SLOTS:
                    raise ValueError(f"{path.name}:{lineno}: unknown slot {key!r}")
                colors[ROLE_OF_SLOT[key]] = Color.from_hex(slot.group(2))
                continue
            raise ValueError(f"{path.name}:{lineno}: indented key outside palette")

        entry = top_level.match(raw.rstrip())
        if not entry:
            raise ValueError(f"{path.name}:{lineno}: cannot parse {raw!r}")
        key, value = entry.group(1), entry.group(2).strip()

        in_palette = key == "palette"
        in_block = bool(re.fullmatch(r"[|>][-+]?\d*", value))
        if in_palette or in_block:
            continue

        if len(value) >= 2 and value[0] == value[-1] and value[0] in "\"'":
            value = value[1:-1]
        else:
            value = re.sub(r"\s+#.*$", "", value)
        meta[key] = value

    missing = [s for s in BASE16_SLOTS if ROLE_OF_SLOT[s] not in colors]
    if missing:
        raise ValueError(f"{path.name}: missing slots {', '.join(missing)}")

    return Source(
        slug=path.stem,
        display_name=ascii_fold(meta.get("name", path.stem)),
        author=ascii_fold(meta.get("author", "unknown")),
        declared_variant=meta.get("variant", ""),
        system=meta.get("system", "base16"),
        upstream=f"{path.parent.name}/{path.name}",
        colors=colors,
    )


# --- Deriving the Material 3 roles -------------------------------------------
#
# Contrast floors, in WCAG ratios against `surface`. These are the guarantees the
# library makes on top of the source data: a floor is a legibility threshold, not
# a target.
#
# That distinction decides the numbers. Requiring AAA (7.0) of `onSurface` lifted
# 94 of 335 schemes, but only 19 of those were below AA -- the median scheme sits
# at 5.4:1 quite deliberately, and rewriting it to 7.0 replaces the author's
# judgement with an accessibility grade nobody asked for. So `onSurface` is held
# to AA and only `onSurfaceStrong`, which exists to be the emphatic tone and is
# also the anchor everything else is lifted toward, is held to AAA.
MIN_CONTRAST = {
    "onSurfaceStrong": 7.0,
    "onSurface": 4.5,  # WCAG AA for body text
    "onSurfaceMuted": 4.0,
    "onSurfaceVariant": 3.5,
    "onSurfaceFaint": 2.2,  # disabled text; meant to recede
    "outline": 2.5,
    "outlineVariant": 1.4,
    "cursor": 3.0,
    "on_accent": 4.5,
}

# How far apart consecutive surface steps sit, in OKLab lightness. The scheme's
# own base00 -> base01 distance is used where it is sane, so a low-contrast
# theme stays low-contrast, but clamped: several schemes set base00 == base01,
# which would collapse the whole ramp into one colour.
SURFACE_STEP_MIN = 0.022
SURFACE_STEP_MAX = 0.055

# Separation between a normal ANSI colour and its bright counterpart, in OKLab
# lightness. Chroma is deliberately held constant, which does make brights a
# little paler than the theme's own. Boosting chroma to compensate keeps them
# vivid for most schemes but sends yellow-greens to the edge of sRGB -- gruvbox's
# #b8bb26 becomes an acid #cccf00 -- and across a library this size predictable
# matters more than optimal.
ANSI_BRIGHT_STEP = 0.06

ANSI_NORMAL_SLOTS = [
    "black",
    "red",
    "green",
    "yellow",
    "blue",
    "magenta",
    "cyan",
    "white",
]


@dataclass
class Notes:
    """What the derivation had to do beyond copying values across."""

    slug: str
    messages: list[str]

    def add(self, message: str) -> None:
        self.messages.append(message)


def derive(src: Source, notes: Notes) -> dict:
    bg = src.bg

    # Trust the pixels over the label. `variant` drives things that are not
    # colours -- macOS AppleInterfaceStyle, Firefox's color_scheme, Ghostty's
    # window-theme -- so getting it wrong is visible as light text on a light
    # chrome, and a handful of schemes are mislabelled upstream.
    measured = "dark" if lightness(bg) < 0.5 else "light"
    if src.declared_variant and src.declared_variant != measured:
        notes.add(
            f"variant: upstream says {src.declared_variant!r}, "
            f"base00 {bg.to_hex()} measures {measured!r}; using {measured!r}"
        )
    variant = measured

    # "Toward the foreground" is lighter in a dark theme and darker in a light
    # one. Every step below is expressed in these terms so one set of rules
    # covers both.
    fg_dir = 1.0 if variant == "dark" else -1.0

    # --- Surfaces
    #
    # Only base00 and base01 are background colours. base02 ("Selection
    # Background") and base03 ("Comments") drift a long way toward the
    # foreground in light schemes -- solarized-light puts #93a1a1 in base02 --
    # so using them as container surfaces produces the grey slabs that made an
    # earlier hand-authored palette unusable. The upper containers are
    # extrapolated from the base00 -> base01 step instead.
    raw_step = abs(lightness(src.bg_alt) - lightness(bg))
    step = max(SURFACE_STEP_MIN, min(SURFACE_STEP_MAX, raw_step))
    if raw_step < SURFACE_STEP_MIN:
        notes.add(
            f"surfaces: base00/base01 differ by only {raw_step:.3f} in lightness; "
            f"using a {step:.3f} step so the container ramp stays distinguishable"
        )

    surface = bg
    surface_container = src.bg_alt
    surface_lowest = shift_lightness(bg, -fg_dir * step)
    surface_high = shift_lightness(src.bg_alt, fg_dir * step)
    surface_highest = shift_lightness(src.bg_alt, fg_dir * 2 * step)

    # --- Text
    #
    # base07 is nominally the most contrasting foreground, but not every scheme
    # honours that: base16's nord puts Frost cyan #8FBCBB there. Pick whichever
    # of the two light foregrounds actually reads best.
    strong = max((src.fg_lightest, src.fg_light), key=lambda c: contrast(c, surface))

    # `onSurfaceStrong` has to outrank `onSurface`, and in a few schemes base05
    # is more contrasty than either light foreground -- charcoal-light reads 7.07
    # at base05 against 7.05 at base06. Lift strong rather than dim onSurface:
    # onSurface is the most-used colour in the palette, and pulling it back to
    # satisfy an ordering is the wrong way round.
    strong = ensure_contrast(
        strong,
        surface,
        max(MIN_CONTRAST["onSurfaceStrong"], contrast(quantize(src.fg), surface)),
        max((Color(1, 1, 1), Color(0, 0, 0)), key=lambda c: contrast(c, surface)),
    )

    if strong is not src.fg_lightest:
        notes.add(
            f"onSurfaceStrong: base07 {src.fg_lightest.to_hex()} reads at "
            f"{contrast(src.fg_lightest, surface):.1f}:1, base06 "
            f"{src.fg_light.to_hex()} at {contrast(src.fg_light, surface):.1f}:1; "
            "using base06"
        )

    text = {
        "onSurfaceStrong": strong,
        "onSurface": src.fg,
        "onSurfaceMuted": mix(src.fg, src.fg_dim, 0.5),
        "onSurfaceVariant": src.fg_dim,
        "onSurfaceFaint": src.comment,
    }

    # Floor each tone, then keep the five monotonic. Both directions matter: a
    # tone below its floor is illegible, and a "muted" tone louder than the
    # default foreground reads as emphasis where none was meant.
    ceiling = None
    for role in (
        "onSurfaceStrong",
        "onSurface",
        "onSurfaceMuted",
        "onSurfaceVariant",
        "onSurfaceFaint",
    ):
        before = text[role]
        lifted = ensure_contrast(before, surface, MIN_CONTRAST[role], strong)
        if lifted.to_hex() != before.to_hex():
            notes.add(
                f"{role}: {before.to_hex()} read at {contrast(before, surface):.1f}:1 "
                f"against surface, lifted to {lifted.to_hex()} "
                f"({contrast(lifted, surface):.1f}:1)"
            )
        if ceiling is not None:
            lifted = cap_contrast(lifted, surface, ceiling, surface)
        text[role] = lifted
        ceiling = contrast(lifted, surface)

    outline = ensure_contrast(src.comment, surface, MIN_CONTRAST["outline"], strong)
    outline_variant = ensure_contrast(
        src.selection, surface, MIN_CONTRAST["outlineVariant"], strong
    )

    # --- Accents
    #
    # base0D is base16's UI accent -- functions, headings, links -- so it is the
    # closest thing the source has to a Material `primary`. A theme whose
    # signature is a different hue (gruvbox's yellow) is a matter of taste
    # rather than a defect, so it belongs in ./overrides, not here.
    def on_color(fill: Color) -> Color:
        """Material's rule: whichever of the surface or the strongest text
        colour reads better on this fill.

        The fill is quantized first, because that is the value the file will
        hold. Measuring against the float colour picks an on-colour that misses
        the floor by a hair once both are written out.
        """
        fill = quantize(fill)
        best = max((surface, strong), key=lambda c: contrast(c, fill))
        return ensure_contrast(best, fill, MIN_CONTRAST["on_accent"], best)

    primary = src.blue
    primary_container = quantize(mix(primary, surface, 0.62))

    accents = {
        "primary": primary,
        "onPrimary": on_color(primary),
        "primaryContainer": primary_container,
        "onPrimaryContainer": on_color(primary_container),
        "secondary": src.cyan,
        "onSecondary": on_color(src.cyan),
        "tertiary": src.magenta,
        "onTertiary": on_color(src.magenta),
        "error": src.red,
        "onError": on_color(src.red),
        "inverseSurface": text["onSurface"],
        "inverseOnSurface": surface,
    }

    # --- ANSI 16
    #
    # base16 supplies eight accents; a terminal wants sixteen slots, and its own
    # shell template fills the bright half by duplicating the normal one, which
    # leaves bright text indistinguishable from normal.
    #
    # So the eight accents go in the *normal* slots exactly as the scheme
    # defines them -- those are the slots almost everything actually uses, and
    # they stay a faithful copy of the source -- and the bright half is derived
    # one step more visible. Putting the derived values in the less-used half is
    # deliberate: it confines the invention to where being slightly off matters
    # least.
    #
    # "More visible" means away from the background, so brights are lighter on a
    # dark theme and darker on a light one. That is the opposite of what the word
    # suggests for light themes, but it is what keeps them legible.
    def bright(c: Color) -> Color:
        lifted = shift_lightness(c, fg_dir * ANSI_BRIGHT_STEP)
        # A colour already at the end of the ramp cannot move further, and
        # returning it unchanged would recreate the duplication this avoids.
        # Fall back to separating it in the other direction.
        if abs(lightness(lifted) - lightness(c)) < ANSI_BRIGHT_STEP / 3:
            lifted = shift_lightness(c, -fg_dir * ANSI_BRIGHT_STEP)
        return lifted

    # black is base01, not base00: a black equal to the background makes
    # anything printed in it invisible.
    ansi = {
        "black": src.bg_alt,
        "red": src.red,
        "green": src.green,
        "yellow": src.yellow,
        "blue": src.blue,
        "magenta": src.magenta,
        "cyan": src.cyan,
        "white": src.fg,
        "brightBlack": src.comment,
        "brightRed": bright(src.red),
        "brightGreen": bright(src.green),
        "brightYellow": bright(src.yellow),
        "brightBlue": bright(src.blue),
        "brightMagenta": bright(src.magenta),
        "brightCyan": bright(src.cyan),
        "brightWhite": strong,
    }

    # The neutral slots are the ones most likely to collide, because they come
    # from the ramp rather than from the accents: rose-pine sets
    # base05 == base06 == base07, so white and brightWhite both land on #e0def4,
    # and qualia sets base01 == base03. A bright slot equal to its normal one
    # makes the bright half of the palette do nothing, so separate them.
    for slot in ANSI_NORMAL_SLOTS:
        bright_key = "bright" + slot[0].upper() + slot[1:]
        if ansi[slot].to_hex() == ansi[bright_key].to_hex():
            ansi[bright_key] = bright(ansi[slot])
            notes.add(
                f"ansi.{bright_key}: equalled ansi.{slot} ({ansi[slot].to_hex()}) "
                f"in the source; derived {ansi[bright_key].to_hex()} a step apart"
            )

    cursor = ensure_contrast(primary, surface, MIN_CONTRAST["cursor"], strong)

    return {
        "meta": {
            "name": src.slug,
            "displayName": src.display_name,
            "author": src.author,
            "variant": variant,
            "version": f"{VERSION_MAJOR}.{GENERATOR_VERSION}.0",
            "source": f"tinted-theming/schemes {src.upstream}",
        },
        "surfaces": {
            "surface": surface,
            "surfaceDim": surface_lowest,
            "surfaceBright": surface_highest,
            "surfaceContainerLowest": surface_lowest,
            "surfaceContainerLow": surface,
            "surfaceContainer": surface_container,
            "surfaceContainerHigh": surface_high,
            "surfaceContainerHighest": surface_highest,
            "surfaceVariant": surface_container,
        },
        "text": text,
        "outlines": {"outline": outline, "outlineVariant": outline_variant},
        "accents": accents,
        "ansi": ansi,
        "extra": {
            "orange": src.orange,
            "brightOrange": bright(src.orange),
            "cursor": cursor,
        },
    }


# --- Per-tool builtin theme names --------------------------------------------
#
# bat themes are compiled Sublime colour schemes, so bat cannot be handed a list
# of hex values the way Ghostty, fzf or tmux can. It does ship an `ansi` theme
# that draws only on the terminal's sixteen ANSI colours, which Ghostty sets from
# this same palette -- so a palette with no matching builtin still comes out
# themed, just with fewer distinct syntax scopes.
#
# btop is not here despite the same limitation: nix/home/btop.nix generates a
# real theme file from the palette, which is better than any name lookup because
# it also picks up nix/palettes/overrides. bat could eventually go the same way.
BAT_ANSI_FALLBACK = "ansi"

# Where a builtin exists but is spelled differently. Kept small and explicit:
# fuzzy matching happily pairs "solarized-light" with "solarized-dark".
TOOL_ALIASES = {
    "bat": {
        "gruvbox-dark-hard": "gruvbox-dark",
        "gruvbox-dark-medium": "gruvbox-dark",
        "gruvbox-dark-soft": "gruvbox-dark",
        "gruvbox-light-hard": "gruvbox-light",
        "gruvbox-light-medium": "gruvbox-light",
        "gruvbox-light-soft": "gruvbox-light",
        "solarized-dark": "Solarized (dark)",
        "solarized-light": "Solarized (light)",
        "monokai": "Monokai Extended",
    },
}


def normalise(name: str) -> str:
    return re.sub(r"[^a-z0-9]", "", name.lower())


def tool_theme(slug: str, available: list[str], tool: str, fallback: str) -> str:
    alias = TOOL_ALIASES.get(tool, {}).get(slug)
    if alias and alias in available:
        return alias
    by_normal = {normalise(a): a for a in available}
    return by_normal.get(normalise(slug), fallback)


# --- Emitting nix ------------------------------------------------------------

HEADER = """\
# {display} -- generated, do not edit.
#
# Source: {source}
# Author: {author}
# Regenerate the whole library with `nix run .#gen-palettes`.
#
# The Material 3 roles below are derived from that scheme's sixteen colours.
# ../README.md documents the schema and the derivation rules; ./_report.md
# records what this palette in particular needed.
#
# To change a value, add ../overrides/{slug}.nix. Edits here are lost on the
# next run.
"""

SEPARATOR_WIDTH = 76


def render(palette: dict) -> str:
    m = palette["meta"]
    out = [
        HEADER.format(
            display=m["displayName"],
            source=m["source"],
            author=m["author"],
            slug=m["name"],
        ),
        "{",
    ]

    def emit(key: str, value: str) -> None:
        out.append(f'  {key} = "{value}";')

    for key in ("name", "displayName", "author", "variant", "version"):
        emit(key, m[key])

    sections = [
        ("Surfaces", "surfaces"),
        ("Text, strongest to faintest", "text"),
        ("Borders and dividers", "outlines"),
        ("Accent roles", "accents"),
    ]
    def separator(title: str) -> str:
        prefix = f"  # --- {title} "
        return prefix + "-" * max(3, SEPARATOR_WIDTH - len(prefix))

    for title, group in sections:
        out.append("")
        out.append(separator(title))
        for key, color in palette[group].items():
            emit(key, color.to_hex())

    out.append("")
    out.append(separator("ANSI 16"))
    out.append("  ansi = {")
    for key, color in palette["ansi"].items():
        out.append(f'    {key} = "{color.to_hex()}";')
    out.append("  };")

    out.append("")
    for key, color in palette["extra"].items():
        emit(key, color.to_hex())

    out.append("")
    out.append("  tools = {")
    for key, value in palette["tools"].items():
        out.append(f'    {key} = "{value}";')
    out.append("  };")
    out.append("}")
    return "\n".join(out) + "\n"


INDEX_HEADER = """\
# Generated index of the palette library -- do not edit.
#
# Maps each palette name to its file. Consumers that only need the set of names
# get them without evaluating any palette body, which matters because
# ../../darwin/firefox.nix enumerates every name to block the extension ids of
# the palettes that are not active.
#
# Regenerate with `nix run .#gen-palettes`.
"""


def render_index(slugs: list[str]) -> str:
    lines = [INDEX_HEADER, "{"]
    for slug in slugs:
        lines.append(f'  "{slug}" = ./{slug}.nix;')
    lines.append("}")
    return "\n".join(lines) + "\n"


def render_report(
    total: int,
    written: list[str],
    skipped: list[tuple[str, str]],
    notes: list[Notes],
    tools_fallback: dict[str, list[str]],
) -> str:
    noted = [n for n in notes if n.messages]
    lines = [
        "# Palette library generation report",
        "",
        "Generated by `nix run .#gen-palettes`; do not edit.",
        "",
        f"- Schemes read: {total}",
        f"- Palettes written: {len(written)}",
        f"- Skipped: {len(skipped)}",
        f"- Needed at least one derivation note: {len(noted)}",
        "",
        "The derivation from sixteen source colours to the full Material 3 role",
        "set is described in ../README.md. This file records only where a",
        "particular scheme needed more than a straight mapping.",
        "",
    ]

    if skipped:
        lines += ["## Skipped", ""]
        lines += [f"- `{slug}`: {why}" for slug, why in sorted(skipped)]
        lines.append("")

    for tool, slugs in sorted(tools_fallback.items()):
        lines += [
            f"## {tool}: following terminal ANSI ({len(slugs)} palettes)",
            "",
            f"No builtin {tool} theme matches these, so they use the",
            "ANSI-following builtin. Ghostty sets all sixteen ANSI slots from the",
            "same palette, so the result is still themed.",
            "",
            "<details><summary>Show</summary>",
            "",
        ]
        lines += [f"- `{s}`" for s in sorted(slugs)]
        lines += ["", "</details>", ""]

    lines += ["## Per-palette notes", ""]
    if not noted:
        lines.append("None.")
    for n in sorted(noted, key=lambda x: x.slug):
        lines += [f"### `{n.slug}`", ""]
        lines += [f"- {m}" for m in n.messages]
        lines.append("")
    while lines and not lines[-1]:
        lines.pop()
    return "\n".join(lines) + "\n"


# --- Driver ------------------------------------------------------------------


def list_bat_themes() -> list[str]:
    env = os.environ.get("BAT_THEMES")
    if env:
        return [t for t in env.splitlines() if t.strip()]
    try:
        out = subprocess.run(
            ["bat", "--list-themes"], capture_output=True, text=True, check=True
        ).stdout
        return [t.strip() for t in out.splitlines() if t.strip()]
    except (OSError, subprocess.CalledProcessError):
        return []


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--schemes",
        type=Path,
        default=os.environ.get("TINTED_SCHEMES"),
        help="checkout of tinted-theming/schemes",
    )
    parser.add_argument(
        "--out",
        type=Path,
        default=Path(__file__).parent / "generated",
        help="directory to write palettes into",
    )
    parser.add_argument(
        "--systems",
        default="base16",
        help=(
            "comma-separated scheme families to read. base24 is off by default: "
            "its files that also exist in base16 are bad mechanical conversions "
            "-- atelier-sulphurpool puts the grey #898ea4 in the Yellow slot and "
            "a dark navy in Bright Green"
        ),
    )
    parser.add_argument("--nixfmt", default="nixfmt", help="nixfmt executable")
    args = parser.parse_args()

    if not args.schemes:
        print(
            "error: pass --schemes or set TINTED_SCHEMES.\n"
            "       Run via `nix run .#gen-palettes` to have it set for you.",
            file=sys.stderr,
        )
        return 2

    files: list[Path] = []
    for system in args.systems.split(","):
        directory = args.schemes / system.strip()
        if not directory.is_dir():
            print(f"error: no such scheme family: {directory}", file=sys.stderr)
            return 2
        files += sorted(directory.glob("*.yaml"))
    if not files:
        print("error: no scheme files found", file=sys.stderr)
        return 2

    bat_themes = list_bat_themes()
    if not bat_themes:
        print("warning: no bat themes visible; all palettes will use the", file=sys.stderr)
        print("         ANSI fallback. Run via `nix run .#gen-palettes`.", file=sys.stderr)

    out: Path = args.out
    out.mkdir(parents=True, exist_ok=True)
    for stale in out.glob("*.nix"):
        stale.unlink()

    written: list[str] = []
    skipped: list[tuple[str, str]] = []
    all_notes: list[Notes] = []
    fallbacks: dict[str, list[str]] = {"bat": []}

    for path in files:
        try:
            src = parse_scheme(path)
        except ValueError as exc:
            skipped.append((path.stem, f"unreadable: {exc}"))
            continue

        notes = Notes(src.slug, [])
        try:
            palette = derive(src, notes)
        except (ValueError, ZeroDivisionError) as exc:
            skipped.append((src.slug, f"derivation failed: {exc}"))
            continue

        bat = tool_theme(src.slug, bat_themes, "bat", BAT_ANSI_FALLBACK)
        if bat == BAT_ANSI_FALLBACK:
            fallbacks["bat"].append(src.slug)
        palette["tools"] = {"bat": bat}

        (out / f"{src.slug}.nix").write_text(render(palette), encoding="utf-8")
        written.append(src.slug)
        all_notes.append(notes)

    (out / "_index.nix").write_text(render_index(written), encoding="utf-8")
    (out / "_report.md").write_text(
        render_report(len(files), written, skipped, all_notes, fallbacks),
        encoding="utf-8",
    )

    # The flake's lint check runs `nixfmt --check` over every .nix file, so
    # formatting the output is part of generating it rather than a follow-up.
    try:
        subprocess.run(
            [args.nixfmt, str(out)],
            check=True,
            capture_output=True,
            text=True,
        )
    except (OSError, subprocess.CalledProcessError) as exc:
        detail = getattr(exc, "stderr", "") or exc
        print(f"warning: nixfmt failed, output may not pass lint: {detail}", file=sys.stderr)

    print(f"wrote {len(written)} palettes to {out}")
    if skipped:
        print(f"skipped {len(skipped)}; see {out / '_report.md'}")
    noted = sum(1 for n in all_notes if n.messages)
    print(f"{noted} needed derivation notes; see {out / '_report.md'}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
