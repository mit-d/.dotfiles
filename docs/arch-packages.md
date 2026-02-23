# Arch Packages

Everything except the cursor theme is in the official repos.

## Core

```sh
sudo pacman -S --needed \
  git stow zsh tmux neovim \
  fzf bat curl jq rsync
```

## Hyprland Desktop

```sh
sudo pacman -S --needed \
  hyprland hyprlock hypridle hyprpaper hyprlauncher \
  waybar mako ghostty \
  pipewire wireplumber \
  polkit-kde-agent xsettingsd
```

## Utilities

```sh
sudo pacman -S --needed \
  grim slurp wl-clipboard cliphist \
  brightnessctl playerctl btop htop \
  imv mpv zathura zathura-pdf-mupdf \
  opendoas yt-dlp
```

## Fonts & Theming

```sh
sudo pacman -S --needed \
  ttf-sourcecodepro-nerd ttf-roboto \
  noto-fonts noto-fonts-cjk noto-fonts-emoji \
  adw-gtk-theme
```

Cursor theme (AUR only):

```sh
yay -S bibata-cursor-theme-bin
```

## Optional

```sh
sudo pacman -S --needed docker kubectl
```

## All-in-One

```sh
sudo pacman -S --needed \
  git stow zsh tmux neovim fzf bat curl jq rsync \
  hyprland hyprlock hypridle hyprpaper hyprlauncher \
  waybar mako ghostty pipewire wireplumber \
  polkit-kde-agent xsettingsd \
  grim slurp wl-clipboard cliphist \
  brightnessctl playerctl btop htop \
  imv mpv zathura zathura-pdf-mupdf \
  opendoas yt-dlp \
  ttf-sourcecodepro-nerd ttf-roboto \
  noto-fonts noto-fonts-cjk noto-fonts-emoji \
  adw-gtk-theme

yay -S bibata-cursor-theme-bin
```

## Verify

```sh
check-deps
```

## References

- [Arch Wiki: Hyprland](https://wiki.archlinux.org/title/Hyprland)
- [Arch Wiki: PipeWire](https://wiki.archlinux.org/title/PipeWire)
- [Arch Wiki: Font Configuration](https://wiki.archlinux.org/title/Font_configuration)
- [Arch Wiki: Ghostty](https://wiki.archlinux.org/title/Ghostty)
- [Hyprland Wiki](https://wiki.hyprland.org/)
