# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## Overview

This is a personal dotfiles repository managed with
[GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory
represents a "stow package" containing configuration files for a specific
application, with the directory structure mirroring where files should be
symlinked in `$HOME`.

## Commands

```bash
make stow      # Create symlinks for all non-ignored packages to $HOME
make restow    # Re-stow (repair/update existing symlinks)
make delete    # Remove all stowed symlinks
make dry-run   # Preview what would be stowed without making changes
make list      # Show all, ignored, and stowable directories
make adopt FILE=~/.config/app/config PACKAGE=app  # Adopt a file into a package
```

Options:

- `TARGET_DIR=<dir>` - Target directory for symlinks (default: `$HOME`)
- `VERBOSITY=<level>` - Stow verbosity 1-4 (default: 1)
- `FILE=<path>` - File to adopt (for adopt command)
- `PACKAGE=<name>` - Target package (for adopt command)

## Nix / nix-darwin

The repo root is a nix flake (`flake.nix`) providing the nix-darwin system
config for this Mac (`darwinConfigurations.warrantyhub`, with a hostname
alias so `--flake ~/.dotfiles` needs no attr). Three module directories:

`nix/modules/` - shared system modules, usable by a future NixOS host:

- `core.nix` - nix settings, shell enablement, primaryUser, stateVersion
- `packages.nix` - CLI packages (`environment.systemPackages`)
- `podman.nix` - podman machine setup

`nix/darwin/` - macOS-only system modules:

- `homebrew.nix` - declarative Homebrew (taps/brews/casks). Enforcing:
  `cleanup = "uninstall"` removes anything not declared on next switch
- `defaults.nix` - curated macOS `system.defaults`
- `fonts.nix` - fonts via `fonts.packages` (installed to
  `/Library/Fonts/Nix Fonts`)
- `obsidian-sync.nix` - vault sync agents
- `firefox.nix` - Firefox Nightly config: home-manager `programs.firefox`
  for profile files, plus enterprise policies via `CustomUserPreferences`.
  The browser itself is a cask; see `docs/firefox.md`

`nix/home/` - per-tool home-manager modules, wired up by `nix/home.nix`:
`bash.nix`, `fish.nix`, `ghostty.nix`, `git.nix`, `mpv.nix`, `nvim.nix`,
`zsh.nix`. Written platform-agnostic (darwin-only bits behind
`lib.mkIf pkgs.stdenv.isDarwin`) so a NixOS host can import the same list.
`nix/pkgs/` holds derivations for things absent from nixpkgs.

**Dotfiles on macOS are managed by home-manager, not stow.**
`flavors/osx.conf` is intentionally empty and `make stow` refuses to run.
To change config, edit the relevant `nix/home/<tool>.nix` and switch.

Rebuild: `sudo darwin-rebuild switch --flake ~/.dotfiles`.
Build-only check: `darwin-rebuild build --flake ~/.dotfiles`.
New software goes in `packages.nix` (nix, preferred) or `homebrew.nix`
(casks/taps/holdouts); ad-hoc `brew install`s are removed at the next
switch. `nix/` is NOT a stow package (not listed in any flavor file).
The flake only sees git-tracked files: `git add` new .nix files before
building.

Two gotchas that have already bitten:

- Config linked from the store is **read-only**. Anything a tool rewrites
  itself (`fish_variables`, `lazy-lock.json`, Firefox's `profiles.ini`)
  must stay unmanaged, and config must never derive a *write* path through
  a resolved symlink (`${0:A:h}` lands in `/nix/store`).
- Never link `~/.zsh`, `~/.zsh/completions` or `~/.local/bin` as whole
  directories. `~/.dotfiles_wh` stows files into all three, and a
  directory-level store symlink leaves them nowhere to go. That repo also
  passes `stow --no-folding` for the same reason.

The stow package directories (`bash/`, `fish/`, `zsh/`, ...) still exist
and are still used by the Arch machine via `flavors/arch.conf`. They stay
until that machine is replaced by NixOS.

## Architecture

**Stow Package Structure**: Each directory (bash/, zsh/, vim/, etc.) is a stow
package. Files inside are symlinked relative to `$HOME`. For example,
`zsh/.zshenv` becomes `~/.zshenv` and `vim/.config/nvim/` becomes
`~/.config/nvim/`.

**Package Selection**: Stow packages are selected per-platform by
`flavors/<flavor>.conf` (auto-detected from the OS; override with
`FLAVOR=<name>`). Directories not listed in the active flavor file are
ignored.

**Submodules**: The repo includes git submodules for zsh plugins:

- `zsh/.zsh/zsh-autosuggestions`
- `zsh/.zsh/zsh-syntax-highlighting`
- `mpv/.config/mpv/scripts/mpv-cut`

Initialize with `git submodule update --init --recursive`.

**Zsh Configuration**: Main config is modular under `zsh/.zsh/`:

- `.zshrc` - Main config, sources other files
- `abbr.zsh` - Shell abbreviations
- `alias.zsh` - Shell aliases
- `git.zsh` - Git-related functions
- `git_update_mr.zsh` - GitLab MR update tooling
- `prompt.zsh` - Prompt configuration
- `path.zsh` - PATH modifications
- `completion.zsh` - Completion settings
