# Palettes

One palette themes every surface in this config. Swapping the whole system to a
different theme is a one-line edit.

```nix
# nix/palettes/active.nix
import ./load.nix "nord"
```

Then `sudo darwin-rebuild switch --flake ~/.dotfiles`. Everything that reads the
palette follows: terminal, browser chrome, desktop background, k9s, tmux status,
fish and zsh colours, bat, fzf, btop, Obsidian.

Two need a manual step, because the application offers nowhere to write:

| App | Step |
| -- | -- |
| Obsidian | Enable the `palette` CSS snippet once, in Settings -> Appearance |
| Slack | `nix run .#slack-theme`, paste into Preferences -> Appearance |

### Obsidian

A switch writes `<vault>/.obsidian/snippets/palette.css`, and Obsidian hot-reloads
it. Enabling a snippet is recorded in `.obsidian/appearance.json`, which Obsidian
rewrites itself, so that file stays unmanaged and the toggle is one-time.

The snippet is written as a real file rather than a store symlink, unlike
everything else here: the vault is a git repository that tracks `.obsidian` and
syncs to iOS, where a `/nix/store` path would dangle. It will show up in the
vault's `git status` after each palette switch -- gitignore it there if that is
noise.

It sets Obsidian's neutral ramp, accent and eight extended colours, *and* every
documented semantic variable. The primitives alone would be tidier, but the
base-NN to semantic mapping is not part of the documented API. Setting both means
community themes that only read the primitives keep their design and pick up the
palette -- the Things theme sets `--color-base-*` and never
`--background-primary`, so it restyles cleanly.

Accent is handed over as `--accent-h/s/l` rather than a hex, so Obsidian derives
`--color-accent-1` and `-2` by its own rules instead of this config inventing
hover shades. That conversion happens in `lib.nix` at read time, not in the
generated palettes: an override that changes `primary` would otherwise leave a
precomputed HSL describing the colour it replaced.

### Slack

Slack's theme lives in account-synced preferences, not a file, so there is
nothing a switch can write. `nix run .#slack-theme [name]` prints the
eight-colour string it accepts and copies it to the clipboard.

Only the sidebar is themeable this way -- eight colours, no message pane. The
message pane follows the OS light/dark setting, which `nix/darwin/defaults.nix`
already drives from `variant`, so it tracks the palette's polarity if not its
hues.

Any name in `generated/_index.nix` works. There are 335.

## Browsing

```bash
nix run .#palettes
```

An fzf picker with a live truecolour preview of each palette: the surface ramp,
the five text tones with their measured contrast, accent chips filled with their
own on-colour, a mock tab strip and status line, and the ANSI 16. `enter` prints
the line to paste into `active.nix`; `ctrl-a` rewrites it in place.

The preview reads a prebuilt JSON of the whole library
(`nix run .#palette-data`), resolved through `load.nix`, so it redraws instantly
and shows what the system would actually use -- overrides included.

## Layout

| Path | What it is |
| -- | -- |
| `active.nix` | The switch: names the one palette in use |
| `load.nix` | Looks a name up in the library and merges `overrides/` over it |
| `generated/` | The library. **Rewritten wholesale; never hand-edit** |
| `generated/_index.nix` | name -> file, so consumers can enumerate names without evaluating palettes |
| `generated/_report.md` | What the last run had to derive, nudge or skip |
| `overrides/<name>.nix` | Local edits to one palette, applied on top of the generated values |
| `generate.py` | The generator |
| `preview.py` | Renders one palette for the `nix run .#palettes` picker |
| `validate.py` | Enforces the guarantees below, as `nix flake check` |

## Regenerating

```bash
nix run .#gen-palettes            # rewrite generated/ from the pinned schemes
nix flake update tinted-schemes   # pull newer upstream data first, if wanted
```

The generator writes into the working tree, so run it from the repo (or pass the
repo path). It also runs `nixfmt` over its output, because the flake's `lint`
check would otherwise fail on it. New files have to be `git add`ed before a
build sees them -- the flake only reads tracked files.

## Source

[`tinted-theming/schemes`][schemes] (MIT), the `base16` family: 335 schemes,
including gruvbox, nord, solarized, catppuccin, everforest, rose-pine and
tokyo-night. Pinned as the `tinted-schemes` flake input.

A base16 scheme is sixteen colours with [documented roles][styling]: `base00`
through `base07` are an ordered background-to-foreground ramp, `base08` through
`base0F` are accents. Mapping happens by *role*, never by lightness, so the same
rules work for light and dark schemes -- in a light scheme the ramp runs
light-to-dark but `base00` is still the background and `base05` still the
default foreground.

### Why not base24

The repo also has a `base24` family, whose spec adds real bright-ANSI slots
(`base12`-`base17`) and two extra background steps -- on paper a better fit for
this schema, since it would remove the derivation below.

Its files are not trustworthy where they overlap with base16. `base24/atelier-sulphurpool.yaml`
puts the grey `#898ea4` in the Yellow slot, the grey-blue `#5e6687` in Bright
Yellow and the dark navy `#293256` in Bright Green. Those read as a bad
mechanical conversion, and the overlap is only 53 schemes -- neither `nord` nor
`gruvbox-dark-hard` is among them. Pass `--systems base16,base24` to opt in.

## Deriving Material 3 roles from sixteen colours

Sixteen source colours have to cover nine surfaces, five text tones, two
outlines, six accent pairs and sixteen ANSI slots. The gap is closed
arithmetically rather than by taste, in **OKLab**, so "one step lighter" means
the same thing to the eye in every scheme. Contrast is measured as a **WCAG
ratio**, because that is what legibility guidance is written against.

Everything below is expressed relative to the *foreground direction* -- lighter
in a dark scheme, darker in a light one -- so one set of rules covers both.

### `variant`

Measured from `base00`, not read from the file. It drives things that are not
colours (macOS `AppleInterfaceStyle`, Firefox's `color_scheme`, Ghostty's
`window-theme`), so a wrong value shows up as light text on light chrome. Nothing
in the current library disagrees with its own label; the check is there because
that failure is silent and cheap to rule out. Disagreements would be listed in
`_report.md`.

### Surfaces

Only `base00` and `base01` are background colours. `base02` ("Selection
Background") and `base03` ("Comments") drift a long way toward the foreground in
light schemes -- solarized-light puts `#93a1a1` in `base02` -- so using them as
container fills produces grey slabs where a panel should be. That was a real bug
in the hand-authored palettes this library replaced.

So the upper containers are extrapolated from the `base00` -> `base01` step
instead, at that scheme's own step size, clamped to 0.022-0.055 OKLab lightness
so a scheme with `base00 == base01` still gets a usable ramp.

| Role | From |
| -- | -- |
| `surface`, `surfaceContainerLow` | `base00` |
| `surfaceContainer`, `surfaceVariant` | `base01` |
| `surfaceContainerHigh` | `base01` + one step |
| `surfaceContainerHighest`, `surfaceBright` | `base01` + two steps |
| `surfaceContainerLowest`, `surfaceDim` | `base00` - one step |

The ramp runs *away* from `surface`, so consumers must not assume a direction.

### Text

| Role | From | Contrast floor vs `surface` |
| -- | -- | -- |
| `onSurfaceStrong` | `base07` or `base06`, whichever reads better | 7.0 (AAA) |
| `onSurface` | `base05` | 4.5 (AA) |
| `onSurfaceMuted` | midpoint of `base05` and `base04` | 4.0 |
| `onSurfaceVariant` | `base04` | 3.5 |
| `onSurfaceFaint` | `base03` | 2.2 |

A floor is a legibility threshold, not a target, and that distinction sets the
numbers. Requiring AAA of `onSurface` lifted 94 of 335 schemes while only 19 were
below AA -- the median scheme sits at 5.4:1 quite deliberately, and rewriting it
to 7.0 substitutes an accessibility grade for the author's judgement. Only
`onSurfaceStrong`, which exists to be the emphatic tone and is the anchor
everything else is lifted toward, is held to AAA.

`base07` is nominally the most contrasting foreground but not every scheme
honours that -- base16's `nord` puts Frost cyan `#8FBCBB` there -- so the two
light foregrounds are compared and the better one wins.

A tone below its floor is lifted toward `onSurfaceStrong`. The five are then
kept monotonic in contrast, which matters in both directions: a "muted" tone
that outshouts the default foreground reads as emphasis where none was meant.
These floors are why text is legible on schemes whose own choices are not.

Where `base05` out-contrasts both light foregrounds -- charcoal-light reads 7.07
against 7.05 -- `onSurfaceStrong` is lifted rather than `onSurface` dimmed.
`onSurface` is the most-used colour in the palette; pulling it back to satisfy an
ordering would be the wrong way round.

All of this is measured on the **quantized** eight-bit value, not the float one.
Searching in float space and rounding afterwards lands colours just under their
floor -- it silently put 71 of 2010 accent pairs below 4.5:1 by less than 0.07.
`validate.py` re-checks every floor and ordering from the written files, so the
table above is enforced rather than asserted.

`onSurfaceStrong`, `onSurfaceMuted` and `onSurfaceFaint` are extensions --
Material 3 proper stops at `onSurface` and `onSurfaceVariant`, but terminal
themes routinely need five steps.

### Outlines

`outline` from `base03` at a 3.0 floor, `outlineVariant` from `base02` at 1.4.

### Accents

`base0D` is base16's UI accent -- functions, headings, links -- so it is the
closest thing the source has to a Material `primary`. Which hue is a given
theme's signature is taste rather than something derivable, so a different
choice belongs in `overrides/` (see `overrides/gruvbox-dark-hard.nix`).

| Role | From |
| -- | -- |
| `primary` | `base0D` |
| `secondary` | `base0C` |
| `tertiary` | `base0E` |
| `error` | `base08` |
| `primaryContainer` | `primary` mixed 62% toward `surface` |
| `inverseSurface` / `inverseOnSurface` | `onSurface` / `surface` |
| `cursor` | `primary`, floored at 3.0 |

Every `on*` colour follows Material's rule: whichever of `surface` or
`onSurfaceStrong` reads better on that fill, then floored at 4.5. It is computed
rather than stated, which is what stops an accent pair from being illegible.

### ANSI 16

Stated explicitly, **not** derived from the roles above -- Material 3 has no
notion of sixteen indexed colours, but terminals address them by number
(Ghostty's `palette = N=...`, `fish_color_*`, k9s skins, tmux colours). Mapping
either direction would be lossy, so a palette declares both.

base16 supplies eight accents for sixteen slots, and its own shell template
fills the bright half by duplicating the normal one, leaving bright text
indistinguishable. Instead:

- the eight accents go in the **normal** slots exactly as the scheme defines
  them -- those are the slots almost everything uses, and they stay a faithful
  copy of the source;
- the **bright** half is derived one 0.06 lightness step more visible. Putting
  the derived values in the less-used half confines the invention to where being
  slightly off matters least.

Chroma is held constant as lightness rises, which makes brights a little paler
than a theme's own. Boosting chroma to compensate sends yellow-greens to the
edge of sRGB -- gruvbox's `#b8bb26` becomes an acid `#cccf00` -- and across 335
palettes predictable beats optimal.

`black` is `base01`, not `base00`: a black equal to the background makes
anything printed in it invisible. `white` is `base05`, `brightBlack` is `base03`,
`brightWhite` is `onSurfaceStrong`.

### `tools`

`tools.bat` names a bat builtin, because bat themes are compiled Sublime colour
schemes rather than a list of hex values. 19 palettes have a real match; the rest
get `ansi`, which draws only on the sixteen ANSI colours Ghostty sets from this
same palette -- so still themed, just with fewer distinct syntax scopes.

btop had the same problem and no longer does: `nix/home/btop.nix` generates a
real `.theme` file from the palette. That is strictly better than a name lookup
because it works for all 335 and picks up `overrides/`. bat could go the same
way.

## Overriding

`generated/` is rewritten on every run, so edits there are lost. Put them in
`overrides/<name>.nix`, which `load.nix` merges over the generated palette:

```nix
# nix/palettes/overrides/nord.nix
{
  primary = "#88c0d0"; # nord8, Nord's signature, over base0D's nord9
  ansi.brightCyan = "#8fbcbb";
}
```

The merge recurses, so changing one ANSI slot does not mean restating the other
fifteen. An override may also be a function of the generated palette when it
wants to refer to values it is not replacing:

```nix
base: { cursor = base.ansi.brightYellow; }
```

`overrides/gruvbox-dark-hard.nix` is a worked example: it restores gruvbox's
yellow signature and its canonical terminal palette, both of which the
role-based mapping cannot know about.

## Adding a theme that is not in tinted-theming

The generator's input is a sixteen-colour `Source`, so the cheapest route is a
base16 YAML file of your own passed via `--schemes`. Failing that, write the
full schema by hand into `generated/` -- but it will be deleted on the next run,
so prefer contributing the scheme upstream or keeping a local scheme directory.

## Schema

Consumers read these keys. There is no enforcement: a missing one surfaces as a
nix evaluation error naming the attribute, which is a clear enough failure.

```
name displayName author variant version

surface surfaceDim surfaceBright surfaceVariant
surfaceContainerLowest surfaceContainerLow surfaceContainer
surfaceContainerHigh surfaceContainerHighest

onSurfaceStrong onSurface onSurfaceMuted onSurfaceVariant onSurfaceFaint
outline outlineVariant

primary onPrimary primaryContainer onPrimaryContainer
secondary onSecondary tertiary onTertiary error onError
inverseSurface inverseOnSurface

ansi.{black,red,green,yellow,blue,magenta,cyan,white}
ansi.{brightBlack,brightRed,brightGreen,brightYellow,brightBlue,brightMagenta,brightCyan,brightWhite}

orange brightOrange cursor
tools.bat
```

`version` reaches Firefox's theme manifest. Firefox compares it to decide
whether to reinstall a policy-installed theme and ignores `install_url` pointing
at a new store path, so a changed colour with an unbumped version is silently
not applied. Generated palettes carry `3.<GENERATOR_VERSION>.0`; bump
`GENERATOR_VERSION` in `generate.py` when a derivation rule changes.

[schemes]: https://github.com/tinted-theming/schemes
[styling]: https://github.com/tinted-theming/home/blob/main/styling.md
