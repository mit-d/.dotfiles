# macOS Packages

Everything is installed via [Homebrew](https://brew.sh).

## Core

```sh
brew install \
  git stow zsh tmux neovim \
  fzf bat curl jq tree
```

## Development

```sh
brew install \
  gh glab go-task uv ruff \
  nvm python@3.12 openjdk \
  shellcheck shfmt prettier markdownlint-cli2 \
  cmake ninja llvm libomp clang-format lcov lefthook
```

## Utilities

```sh
brew install \
  htop fastfetch mpv imagemagick pv \
  gnu-sed gnu-getopt gawk yq fx csvkit \
  most cowsay cmatrix
```

## Casks

```sh
brew install --cask \
  ghostty firefox@nightly google-chrome \
  docker-desktop jetbrains-toolbox \
  sublime-merge bruno raycast \
  slack zoom standard-notes \
  1password
```

## Fonts

```sh
brew install --cask \
  font-sauce-code-pro-nerd-font \
  font-source-code-pro \
  font-noto-sans \
  font-noto-sans-mono \
  font-noto-sans-cjk \
  font-noto-sans-symbols \
  font-noto-sans-symbols-2 \
  font-noto-sans-math \
  font-noto-serif \
  font-noto-serif-cjk \
  font-noto-color-emoji
```

## Flavors

Each platform has a **flavor file** (`flavors/<name>.conf`) listing which stow
packages to link. The Makefile auto-detects the platform or you can override:

```sh
make stow FLAVOR=osx
```

Platform-specific configs use Ghostty's optional include pattern:

```ini
# ghostty/.config/ghostty/config (shared, always stowed)
config-file = ?config-osx
```

The `?` prefix means "skip if missing." The `ghostty-osx` package is only in
`flavors/osx.conf`, so the override file only exists on macOS.

## Verify

```sh
check-deps
```

## References

- [Homebrew](https://brew.sh)
- [Homebrew Formulae](https://formulae.brew.sh)
