# Install Flavors Design

## Problem

`make stow` installs everything for Arch. No way to support macOS or other
environments without per-branch divergence.

## Solution

Flavor files -- simple text files that list which packages to stow per platform.
The Makefile auto-detects the OS and reads the right file.

## Flavor files

```text
flavors/
  arch.conf
  osx.conf
```

Format: one package name per line. `#` comments. Only packages listed get stowed
-- unlisted directories (docs/, tests/, flavors/) are implicitly ignored.

Example `arch.conf`:

```text
# Arch Linux (Hyprland)
bash
fish
ghostty
git
hypr
mako
mpv
tmux
vim
waybar
xdg
zsh
```

## Auto-detection

Priority:

1. Explicit `FLAVOR=` override -- use directly, skip detection
2. `uname -s` = `Darwin` -> `osx`
3. `uname -s` = `Linux` + `/etc/arch-release` exists -> `arch`
4. Otherwise -> hard error listing available flavors from `flavors/*.conf`

## Makefile changes

- Remove `IGNORE_DIRS`
- Replace wildcard-based `STOW_DIRS` with reading from `flavors/$(FLAVOR).conf`
- All existing targets (stow, restow, delete, dry-run, list, adopt) unchanged --
  they consume `STOW_DIRS` the same way
- `make list` updated to show detected flavor
- `make help` updated to document `FLAVOR=` option

## Config variants

Per-package OS differences are handled within configs using conditionals (as
already done in zsh), not by the flavor system. The flavor system only controls
which packages get stowed.

## Adding a new flavor

1. Create `flavors/<name>.conf` listing the packages
2. Optionally add a detection rule to the Makefile
