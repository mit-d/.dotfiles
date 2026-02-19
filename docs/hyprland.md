# Hyprland

## Config Structure

```text
hypr/.config/hypr/
  hyprland.conf       # main -- monitors, env, autostart, sources everything below
  theme.conf          # decorations, animations, gaps, blur
  input.conf          # keyboard, mouse, touchpad
  keybinds.conf       # all keybindings
  rules.conf          # window rules
  palettes/           # color palettes (sourced by theme.conf)
    monokai-dark-soda.conf  # active palette
```

The active palette is sourced by `theme.conf` and `hyprlock.conf`. Change it in
one place to re-theme the whole desktop.

## Key Bindings

`SUPER` is the mod key.

### Essentials

| Keys             | Action                      |
| ---------------- | --------------------------- |
| `Super + Return` | Terminal (Ghostty)          |
| `Super + D`      | App launcher (Hyprlauncher) |
| `Super + Q`      | Close window                |
| `Super + M`      | Exit Hyprland               |
| `Super + V`      | Clipboard history           |
| `Super + L`      | Lock screen                 |
| `Print`          | Screenshot (region select)  |

### Window Management

| Keys                      | Action                   |
| ------------------------- | ------------------------ |
| `Super + H/J/K/L`         | Focus left/down/up/right |
| `Super + Shift + H/J/K/L` | Move window              |
| `Super + 1-9`             | Switch workspace         |
| `Super + Shift + 1-9`     | Move window to workspace |
| `Super + F`               | Fullscreen               |
| `Super + Space`           | Toggle floating          |
| `Super + P`               | Pseudo-tile              |
| `Super + S`               | Toggle split             |

### Media

| Keys            | Action           |
| --------------- | ---------------- |
| Volume keys     | wpctl (PipeWire) |
| Brightness keys | brightnessctl    |
| Media keys      | playerctl        |

## Autostart

Managed in `hyprland.conf`. Services launched on login:

- PipeWire + WirePlumber (audio)
- Waybar (status bar)
- Mako (notifications)
- Hypridle (idle lock/dpms)
- Hyprpaper (wallpaper)
- Polkit agent (auth prompts)
- wl-paste + cliphist (clipboard history)

## Scripts

| Script              | What it does                                   |
| ------------------- | ---------------------------------------------- |
| `wallpaper-shuffle` | Random wallpaper from `~/Pictures/wallpapers/` |
| `scratchpad-pop`    | Pop a window from the scratchpad               |
| `gamemode.sh`       | Toggle animations/blur off for performance     |

## References

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Hyprland Configuration](https://wiki.hyprland.org/Configuring/Configuring-Hyprland/)
- [Hyprland Binds](https://wiki.hyprland.org/Configuring/Binds/)
- [Hyprland Window Rules](https://wiki.hyprland.org/Configuring/Window-Rules/)
- [Hyprlock](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/)
- [Hypridle](https://wiki.hyprland.org/Hypr-Ecosystem/hypridle/)
- [Arch Wiki: Hyprland](https://wiki.archlinux.org/title/Hyprland)
