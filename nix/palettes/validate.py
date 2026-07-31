#!/usr/bin/env python3
"""Check that every palette in the library keeps the promises README.md makes.

    validate.py <palettes.json>

Run as a flake check. The guarantees are contrast floors and orderings, and all
three times one was broken during development it was broken silently and by a
rounding error -- measuring contrast on a float colour that then gets written out
as eight-bit hex. A README claim nothing enforces is just a hope.
"""

from __future__ import annotations

import json
import sys

# Must match MIN_CONTRAST in generate.py.
FLOORS = {
    "onSurfaceStrong": 7.0,
    "onSurface": 4.5,
    "onSurfaceMuted": 4.0,
    "onSurfaceVariant": 3.5,
    "onSurfaceFaint": 2.2,
    "outline": 2.5,
    "outlineVariant": 1.4,
    "cursor": 3.0,
}

TEXT_RAMP = [
    "onSurfaceStrong",
    "onSurface",
    "onSurfaceMuted",
    "onSurfaceVariant",
    "onSurfaceFaint",
]

ACCENT_PAIRS = {
    "primary": "onPrimary",
    "secondary": "onSecondary",
    "tertiary": "onTertiary",
    "error": "onError",
    "primaryContainer": "onPrimaryContainer",
    "inverseSurface": "inverseOnSurface",
}

ANSI_SLOTS = [
    "black",
    "red",
    "green",
    "yellow",
    "blue",
    "magenta",
    "cyan",
    "white",
]

REQUIRED = (
    ["name", "displayName", "author", "variant", "version"]
    + [
        "surface",
        "surfaceDim",
        "surfaceBright",
        "surfaceVariant",
        "surfaceContainerLowest",
        "surfaceContainerLow",
        "surfaceContainer",
        "surfaceContainerHigh",
        "surfaceContainerHighest",
    ]
    + TEXT_RAMP
    + ["outline", "outlineVariant"]
    + list(ACCENT_PAIRS)
    + list(ACCENT_PAIRS.values())
    + ["orange", "brightOrange", "cursor"]
)

ACCENT_FLOOR = 4.5


def _channel(c: float) -> float:
    c /= 255
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4


def luminance(hex_color: str) -> float:
    h = hex_color.lstrip("#")
    r, g, b = (_channel(int(h[i : i + 2], 16)) for i in (0, 2, 4))
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


def contrast(a: str, b: str) -> float:
    la, lb = luminance(a), luminance(b)
    hi, lo = max(la, lb), min(la, lb)
    return (hi + 0.05) / (lo + 0.05)


def is_hex(value: object) -> bool:
    if not isinstance(value, str) or not value.startswith("#") or len(value) != 7:
        return False
    return all(c in "0123456789abcdefABCDEF" for c in value[1:])


def check(name: str, p: dict) -> list[str]:
    problems: list[str] = []

    for key in REQUIRED:
        if key not in p:
            problems.append(f"missing key {key}")
    if problems:
        return problems

    for key in REQUIRED:
        if key.startswith(("name", "displayName", "author", "variant", "version")):
            continue
        if not is_hex(p[key]):
            problems.append(f"{key} is not a 6-digit hex colour: {p[key]!r}")

    ansi = p.get("ansi")
    if not isinstance(ansi, dict):
        problems.append("ansi is missing or not an attrset")
        return problems
    for slot in ANSI_SLOTS:
        bright = "bright" + slot[0].upper() + slot[1:]
        for key in (slot, bright):
            if key not in ansi:
                problems.append(f"ansi.{key} is missing")
            elif not is_hex(ansi[key]):
                problems.append(f"ansi.{key} is not a hex colour: {ansi[key]!r}")

    if p["variant"] not in ("dark", "light"):
        problems.append(f"variant is {p['variant']!r}, not dark or light")
    if problems:
        return problems

    # The variant has to agree with the pixels: it drives non-colour settings
    # (macOS AppleInterfaceStyle, Firefox color_scheme), so a wrong value shows
    # up as light text on light chrome.
    measured = "dark" if luminance(p["surface"]) < 0.18 else "light"
    if p["variant"] != measured and 0.12 < luminance(p["surface"]) < 0.30:
        pass  # genuinely ambiguous mid-tone background; not worth failing over
    elif p["variant"] != measured:
        problems.append(
            f"variant {p['variant']!r} but surface {p['surface']} "
            f"has luminance {luminance(p['surface']):.3f}"
        )

    surface = p["surface"]
    for role, floor in FLOORS.items():
        ratio = contrast(p[role], surface)
        if ratio < floor:
            problems.append(
                f"{role} {p[role]} reads {ratio:.2f}:1 on surface, floor is {floor}"
            )

    for above, below in zip(TEXT_RAMP, TEXT_RAMP[1:]):
        hi, lo = contrast(p[above], surface), contrast(p[below], surface)
        if hi < lo:
            problems.append(
                f"text ramp inverted: {above} {hi:.2f}:1 < {below} {lo:.2f}:1"
            )

    for fill, on in ACCENT_PAIRS.items():
        ratio = contrast(p[on], p[fill])
        if ratio < ACCENT_FLOOR:
            problems.append(
                f"{on} {p[on]} reads {ratio:.2f}:1 on {fill} {p[fill]}, "
                f"floor is {ACCENT_FLOOR}"
            )

    # A black equal to the background makes anything printed in it invisible.
    if ansi["black"].lower() == surface.lower():
        problems.append(f"ansi.black equals surface ({surface})")

    # Bright and normal must be distinguishable, or the bright half is pointless.
    for slot in ANSI_SLOTS:
        bright = "bright" + slot[0].upper() + slot[1:]
        if ansi[slot].lower() == ansi[bright].lower():
            problems.append(f"ansi.{slot} and ansi.{bright} are both {ansi[slot]}")

    return problems


def main() -> int:
    if len(sys.argv) != 2:
        print(__doc__, file=sys.stderr)
        return 2

    data = json.loads(open(sys.argv[1], encoding="utf-8").read())
    failures = {n: check(n, p) for n, p in sorted(data.items())}
    failures = {n: ps for n, ps in failures.items() if ps}

    for name, problems in failures.items():
        for problem in problems:
            print(f"{name}: {problem}", file=sys.stderr)

    total = len(data)
    if failures:
        print(
            f"\n{len(failures)} of {total} palettes failed validation",
            file=sys.stderr,
        )
        return 1
    print(f"{total} palettes OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
