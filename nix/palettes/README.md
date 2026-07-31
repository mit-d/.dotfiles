# Palettes

One palette themes every surface in this config. Swapping the whole system to a
different theme is a one-line edit to `active.nix`.

## Swapping

```nix
# nix/palettes/active.nix
import ./solarized-light.nix
```

Then `sudo darwin-rebuild switch --flake ~/.dotfiles`. Everything that reads the
palette follows: terminal, browser chrome, desktop background, k9s, tmux status,
fish colours, bat, fzf, btop.

## Schema

Semantic roles use [Material 3][m3] colour-role names. Gruvbox calls its darkest
background `bg0_hard` and solarized calls it `base03`; neither name appears here,
because a palette has to be swappable without every consumer knowing which theme
is loaded.

### Meta

| Key | Meaning |
| -- | -- |
| `name` | File-safe identifier, e.g. `gruvbox-dark-hard` |
| `variant` | `"dark"` or `"light"`. Consumers branch on this for things that are not colours -- macOS `AppleInterfaceStyle`, Ghostty `window-theme`, Firefox `color_scheme`, bat's theme name |
| `version` | Bump on any colour change. Firefox decides whether to reinstall a policy-installed theme by comparing this, **not** by noticing the store path changed |

### Surfaces

The container ramp runs *away* from `surface` -- lighter for a dark theme, darker
for a light one. Consumers must not assume a direction.

| Key | Typical use |
| -- | -- |
| `surface` | Window/terminal background, desktop |
| `surfaceDim` / `surfaceBright` | Extremes of the ramp |
| `surfaceContainerLowest` ... `surfaceContainerHighest` | Five steps: panels, selections, borders, scrollbars |
| `surfaceVariant` | Alternate panel fill |

### Text

| Key | Typical use |
| -- | -- |
| `onSurfaceStrong` | Emphasised/focused text |
| `onSurface` | Default foreground |
| `onSurfaceMuted` | Secondary text |
| `onSurfaceVariant` | Comments, placeholders |
| `onSurfaceFaint` | Disabled text |

`onSurfaceStrong`, `onSurfaceMuted` and `onSurfaceFaint` are extensions --
Material 3 proper stops at `onSurface` and `onSurfaceVariant`, but terminal
themes routinely need five steps of foreground.

### Accents

| Key | Typical use |
| -- | -- |
| `primary` / `onPrimary` | The theme's signature colour; active tab lines, focus rings, prompts |
| `primaryContainer` / `onPrimaryContainer` | Filled emphasis |
| `secondary` / `onSecondary`, `tertiary` / `onTertiary` | Supporting accents |
| `error` / `onError` | Failures, dirty state |
| `inverseSurface` / `inverseOnSurface` | Selections, current-line highlights |
| `outline`, `outlineVariant` | Borders, dividers |

### ANSI 16

Stated explicitly in an `ansi` attrset, **not** derived from the roles above.
Material 3 has no notion of 16 indexed colours, but terminals address them by
number: Ghostty's `palette = N=...`, `fish_color_*`, k9s skins, tmux colours.
Mapping either direction would be lossy, so a palette declares both.

```
black red green yellow blue magenta cyan white
brightBlack brightRed brightGreen brightYellow brightBlue brightMagenta brightCyan brightWhite
```

### Outside both systems

| Key | Meaning |
| -- | -- |
| `orange`, `brightOrange` | Not an ANSI slot, but gruvbox and solarized both define one |
| `cursor` | Terminal cursor; usually a bright accent for contrast against `surface` |

## Adding a palette

Copy an existing file, keep every key, change only the values. There is no
schema enforcement -- a missing key surfaces as a nix evaluation error naming the
attribute, which is a clear enough failure.

[m3]: https://m3.material.io/styles/color/roles
