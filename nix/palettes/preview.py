#!/usr/bin/env python3
"""Render one palette as a truecolour preview, for the fzf picker.

    preview.py <palettes.json> <name>

Reads the prebuilt JSON rather than evaluating nix per keystroke, so the
preview is instant and -- because that JSON comes from load.nix -- it shows
what the system would actually use, overrides included.
"""

from __future__ import annotations

import json
import os
import re
import sys

RESET = "\x1b[0m"

def _size(name: str, fallback_name: str, default: int) -> int:
    """Pane dimension from the environment, defensively.

    A crash here would render as a traceback filling the preview pane, which is
    a poor trade for trusting an environment variable.
    """
    for value in (os.environ.get(name), os.environ.get(fallback_name)):
        try:
            if value and int(value) > 0:
                return int(value)
        except ValueError:
            pass
    return default


# fzf exports the preview pane's inner size, border already accounted for.
# The fallbacks only matter when running this by hand.
WIDTH = _size("FZF_PREVIEW_COLUMNS", "COLUMNS", 60)
HEIGHT = _size("FZF_PREVIEW_LINES", "LINES", 40)

ANSI = re.compile(r"\x1b\[[0-9;]*m")


def fit(text: str, width: int) -> tuple[str, int]:
    """Trim to `width` visible columns, keeping every escape sequence.

    Escapes have to survive trimming even past the cut, or a dropped reset
    leaks a background colour into the rest of the pane. So they are copied
    verbatim while only printing characters count toward the width.
    """
    out: list[str] = []
    columns = 0
    i = 0
    while i < len(text):
        match = ANSI.match(text, i)
        if match:
            out.append(match.group())
            i = match.end()
            continue
        if columns < width:
            out.append(text[i])
            columns += 1
        i += 1
    return "".join(out), columns


def rgb(hex_color: str) -> tuple[int, int, int]:
    h = hex_color.lstrip("#")
    return tuple(int(h[i : i + 2], 16) for i in (0, 2, 4))


def fg(hex_color: str) -> str:
    r, g, b = rgb(hex_color)
    return f"\x1b[38;2;{r};{g};{b}m"


def bg(hex_color: str) -> str:
    r, g, b = rgb(hex_color)
    return f"\x1b[48;2;{r};{g};{b}m"


def _channel(c: float) -> float:
    c /= 255
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4


def luminance(hex_color: str) -> float:
    r, g, b = (_channel(x) for x in rgb(hex_color))
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


def contrast(a: str, b: str) -> float:
    la, lb = luminance(a), luminance(b)
    hi, lo = max(la, lb), min(la, lb)
    return (hi + 0.05) / (lo + 0.05)


def swatch(colors: list[str], width: int = 4) -> str:
    return "".join(f"{bg(c)}{' ' * width}" for c in colors) + RESET


def main() -> int:
    if len(sys.argv) != 3:
        print(__doc__, file=sys.stderr)
        return 2
    data = json.loads(open(sys.argv[1], encoding="utf-8").read())
    name = sys.argv[2].strip()
    if name not in data:
        print(f"no such palette: {name}", file=sys.stderr)
        return 1

    p = data[name]
    surface = p["surface"]
    on_surface = p["onSurface"]
    strong = p["onSurfaceStrong"]
    out: list[str] = []

    def line(text: str = "") -> None:
        out.append(text)

    # Everything sits on the palette's own background, so the preview pane looks
    # like the terminal would rather than like the current theme.
    def onsurface(text: str) -> str:
        return f"{bg(surface)}{fg(on_surface)}{text}{RESET}"

    line()
    line(
        f"{bg(surface)}{fg(strong)} {p['displayName']}{RESET}"
        f"{bg(surface)}{fg(p['onSurfaceFaint'])}  {p['variant']}  {RESET}"
    )
    # No explicit width: fit() trims to the pane and the fill pads the remainder.
    line(f"{bg(surface)}{fg(p['onSurfaceVariant'])} {p['author']}{RESET}")
    line()

    line(onsurface(" surfaces  dim -> bright"))
    line(
        f"{bg(surface)} "
        + swatch(
            [
                p["surfaceContainerLowest"],
                p["surface"],
                p["surfaceContainer"],
                p["surfaceContainerHigh"],
                p["surfaceContainerHighest"],
            ],
            width=6,
        )
    )
    line()

    line(onsurface(" text     contrast against surface"))
    for role in (
        "onSurfaceStrong",
        "onSurface",
        "onSurfaceMuted",
        "onSurfaceVariant",
        "onSurfaceFaint",
    ):
        ratio = contrast(p[role], surface)
        line(
            f"{bg(surface)} {fg(p[role])}The quick brown fox{RESET}"
            f"{bg(surface)}{fg(p['onSurfaceFaint'])}"
            f"  {role:<17}{ratio:5.1f}:1 {RESET}"
        )
    line()

    # Material names the inverse pair the other way round: inverseOnSurface, not
    # onInverseSurface.
    on_role = {
        "primary": "onPrimary",
        "secondary": "onSecondary",
        "tertiary": "onTertiary",
        "error": "onError",
        "primaryContainer": "onPrimaryContainer",
        "inverseSurface": "inverseOnSurface",
    }

    line(onsurface(" accents  each filled with its own on-colour"))
    for row in (
        ("primary", "secondary"),
        ("tertiary", "error"),
        ("primaryContainer", "inverseSurface"),
    ):
        chips = ""
        for role in row:
            on = p[on_role[role]]
            ratio = contrast(on, p[role])
            chips += (
                f"{bg(p[role])}{fg(on)} Aa {role:<16}{ratio:4.1f}:1 {RESET}"
                f"{bg(surface)} {RESET}"
            )
        line(f"{bg(surface)} {chips}")
    line()

    # What the tmux status line and Firefox tab strip will look like, since those
    # are the two surfaces a palette swap changes most visibly.
    line(onsurface(" chrome"))
    line(
        f"{bg(p['surfaceContainer'])}{fg(p['onSurfaceVariant'])}  tab  "
        f"{bg(surface)}{fg(strong)}  active tab  "
        f"{bg(p['surfaceContainer'])}{fg(p['onSurfaceFaint'])}  tab  {RESET}"
    )
    line(
        f"{bg(p['primary'])}{fg(p['onPrimary'])} status "
        f"{bg(p['surfaceContainerHigh'])}{fg(p['onSurface'])} 1:zsh  2:nvim "
        f"{bg(p['surfaceContainer'])}{fg(p['onSurfaceFaint'])} {name[:24]} {RESET}"
    )
    line()

    ansi = p["ansi"]
    normal = ["black", "red", "green", "yellow", "blue", "magenta", "cyan", "white"]
    line(onsurface(" ansi     normal / bright"))
    line(f"{bg(surface)} " + swatch([ansi[k] for k in normal], width=5))
    line(
        f"{bg(surface)} "
        + swatch([ansi["bright" + k[0].upper() + k[1:]] for k in normal], width=5)
    )
    line()

    line(
        f"{bg(surface)}{fg(p['onSurfaceFaint'])} bat {p['tools']['bat']}"
        f"   cursor {fg(p['cursor'])}block{fg(p['onSurfaceFaint'])}"
        f"   v{p['version']} {RESET}"
    )

    # Extend every line to the full pane width and add blank ones underneath, so
    # the palette's own surface covers the preview rather than sitting in a
    # rectangle on the enclosing terminal's background.
    blank = f"{bg(surface)}{' ' * WIDTH}{RESET}"
    filled = []
    for text in out[:HEIGHT]:
        trimmed, columns = fit(text, WIDTH)
        pad = WIDTH - columns
        filled.append(f"{trimmed}{bg(surface)}{' ' * pad}{RESET}" if pad else trimmed)
    filled += [blank] * (HEIGHT - len(filled))

    # No trailing newline: exactly HEIGHT lines, so fzf has nothing to scroll.
    sys.stdout.write("\n".join(filled))
    return 0


if __name__ == "__main__":
    sys.exit(main())
