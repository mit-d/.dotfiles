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

## Architecture

**Stow Package Structure**: Each directory (bash/, zsh/, vim/, etc.) is a stow
package. Files inside are symlinked relative to `$HOME`. For example,
`zsh/.zshenv` becomes `~/.zshenv` and `vim/.config/nvim/` becomes
`~/.config/nvim/`.

**Ignored Packages**: The `IGNORE_DIRS` variable in `Makefile` excludes certain
packages from stowing (currently Linux-specific configs like dwm/, polybar/,
etc.).

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
