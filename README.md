# .dotfiles

[![CI](https://github.com/mit-d/.dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/mit-d/.dotfiles/actions/workflows/ci.yml)

Personal configuration files managed with
[GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a
stow package -- its contents mirror `~/`, and Stow creates symlinks from the
repo into your home directory.

## Quick Start

```bash
cd $HOME
git clone --recurse-submodules https://github.com/mit-d/.dotfiles
cd .dotfiles
make dry-run   # preview what will be linked
make stow      # create symlinks
```

The Makefile auto-detects your platform and stows the appropriate packages.
Override with `make stow FLAVOR=osx` or `make stow FLAVOR=arch`.

## Packages

| Package                     | Description                                                                                                                                    | Arch | macOS |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | :--: | :---: |
| [bash](bash/)               | `.bashrc`, `.bash_profile`, `.bash_logout`                                                                                                     |  x   |   x   |
| [fish](fish/)               | Fish shell with [Pure](https://github.com/pure-fish/pure) prompt                                                                               |  x   |   x   |
| [ghostty](ghostty/)         | [Ghostty](https://ghostty.org) terminal config + theme                                                                                         |  x   |   x   |
| [ghostty-osx](ghostty-osx/) | macOS-specific Ghostty overrides                                                                                                               |      |   x   |
| [git](git/)                 | `.gitconfig`, global ignore/attributes                                                                                                         |  x   |   x   |
| [hypr](hypr/)               | [Hyprland](https://hyprland.org) compositor, hyprlock, hypridle, wallpaper scripts, 90+ palettes                                               |  x   |       |
| [mako](mako/)               | Notification daemon                                                                                                                            |  x   |       |
| [mpv](mpv/)                 | Media player config + scripts ([easycrop](https://github.com/occivink/mpv-scripts), [mpv-cut](https://github.com/familyfriendlymikey/mpv-cut)) |  x   |   x   |
| [tmux](tmux/)               | `.tmux.conf`                                                                                                                                   |  x   |   x   |
| [vim](vim/)                 | Neovim (`init.vim`) + vim-plug + custom colorscheme                                                                                            |  x   |   x   |
| [waybar](waybar/)           | Status bar config + styling                                                                                                                    |  x   |       |
| [xdg](xdg/)                 | Default applications, desktop entries                                                                                                          |  x   |       |
| [zsh](zsh/)                 | Zsh with custom [abbreviation system](zsh/.zsh/abbr.zsh), prompt, completions                                                                  |  x   |   x   |

## Make Commands

| Command                           | Description                                |
| --------------------------------- | ------------------------------------------ |
| `make stow`                       | Symlink all packages for detected platform |
| `make restow`                     | Refresh symlinks (after adding files)      |
| `make delete`                     | Remove all symlinks                        |
| `make dry-run`                    | Preview without changes                    |
| `make list`                       | Show detected platform and package list    |
| `make adopt FILE=... PACKAGE=...` | Move an existing file into a stow package  |

## Shell

Default shell is **zsh**. After stowing, set it as default:

```bash
chsh -s /bin/zsh
```

The zsh config includes a fish-like [abbreviation system](zsh/.zsh/abbr.zsh)
with context-aware expansion (e.g. `sw` only expands to `switch` after `git`),
function abbreviations (`!!` for last command), cursor placeholders, and fish
import/export.

## Code Quality

Pre-commit hooks enforce formatting and linting across all config languages:

| Tool                                                                    | Scope                     |
| ----------------------------------------------------------------------- | ------------------------- |
| [ShellCheck](https://www.shellcheck.net)                                | Shell script analysis     |
| [shfmt](https://github.com/mvdan/sh)                                    | Shell formatting          |
| [beautysh](https://github.com/lovesegfault/beautysh)                    | Zsh formatting            |
| [StyLua](https://github.com/JohnnyMorganz/StyLua)                       | Lua formatting            |
| [Prettier](https://prettier.io)                                         | JSON, YAML, Markdown, CSS |
| [markdownlint](https://github.com/DavidAnson/markdownlint)              | Markdown linting          |
| [codespell](https://github.com/codespell-project/codespell)             | Spell checking            |
| [fish_indent](https://fishshell.com/docs/current/cmds/fish_indent.html) | Fish formatting           |
| [check-unicode](https://github.com/mit-d/check-unicode)                 | Unicode validation        |

## Docs

- [Setup guide](docs/setup.md) -- detailed install + stow walkthrough
- [Hyprland notes](docs/hyprland.md)
- [Arch packages](docs/arch-packages.md)

## Submodules

This repo uses git submodules for vendored plugins:

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [mpv-cut](https://github.com/familyfriendlymikey/mpv-cut)

To initialize after cloning without `--recurse-submodules`:

```bash
git submodule update --init --recursive
```
