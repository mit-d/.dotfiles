# Setup

## Quick Start

```sh
git clone <repo> ~/.dotfiles && cd ~/.dotfiles
check-deps          # see what's missing
make dry-run        # preview symlinks
make stow           # create symlinks to ~/
```

## Stow Basics

Each top-level directory is a **package** -- its contents mirror `~/`.
[GNU Stow](https://www.gnu.org/software/stow/) creates symlinks from the repo
into your home directory.

```text
ghostty/.config/ghostty/config  ->  ~/.config/ghostty/config
zsh/.zsh/.zshrc                 ->  ~/.zsh/.zshrc
hypr/.local/bin/wallpaper-shuffle -> ~/.local/bin/wallpaper-shuffle
```

### Commands

| Command                                         | What it does                              |
| ----------------------------------------------- | ----------------------------------------- |
| `make stow`                                     | Symlink all packages                      |
| `make restow`                                   | Refresh symlinks (use after adding files) |
| `make delete`                                   | Remove all symlinks                       |
| `make dry-run`                                  | Preview without changes                   |
| `make list`                                     | Show active/ignored packages              |
| `make adopt FILE=~/.config/foo/bar PACKAGE=foo` | Move an existing file into a package      |

### Adding a New Config

```sh
# Example: adopt an existing config
make adopt FILE=~/.config/alacritty/alacritty.toml PACKAGE=alacritty

# Or create from scratch
mkdir -p alacritty/.config/alacritty
mv ~/.config/alacritty/alacritty.toml alacritty/.config/alacritty/
make restow
```

## Shell

Default shell is **zsh**. After stowing:

```sh
chsh -s /bin/zsh
```

Log out and back in. The zsh config lives under `zsh/.zsh/` and is pointed to by
`ZDOTDIR` in `zsh/.zshenv`.

## References

- [Arch Wiki: Dotfiles](https://wiki.archlinux.org/title/Dotfiles)
- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/)
- [Stow + Dotfiles walkthrough (Brandon Invergo)](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)
