# Waybar Upgrade Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to
> implement this plan task-by-task.

**Goal:** Upgrade waybar to a clean minimal style with better spacing,
separators, hover states, and a floating audio dropdown.

**Architecture:** Config-only changes across three files: waybar config
(modules), waybar CSS (all visuals), and hyprland rules (pwvucontrol window
rule). No new dependencies. No custom scripts to add - existing memory.sh and
temps.sh are unchanged.

**Tech Stack:** Waybar (jsonc config + GTK3 CSS), Hyprland (window rules)

---

## Task 1: Remove network module and clean up config

Files: Modify `waybar/.config/waybar/config.jsonc`

### Step 1: Remove network module from modules-right and delete its config block

In `config.jsonc`, change `modules-right` to remove `"network"`:

```jsonc
"modules-right": [
  "tray",
  "cpu",
  "custom/memory",
  "custom/temperature",
  "wireplumber",
  "custom/power"
],
```

Delete the entire `"network"` block (lines 74-81 in current file):

```jsonc
// DELETE THIS ENTIRE BLOCK:
"network": {
  "format-wifi": " {essid}",
  "format-ethernet": " ETH",
  "format-disconnected": " offline",
  "tooltip-format-wifi": "...",
  "tooltip-format-ethernet": "...",
  "on-click": "ghostty -e btop"
},
```

### Step 2: Verify config is valid JSON

Run:
`python3 -c "import json; json.load(open('waybar/.config/waybar/config.jsonc'))"`

This will fail because of jsonc comments. Instead just eyeball the structure or
run waybar in a test. Skip automated validation for jsonc.

### Step 3: Commit

```bash
git add waybar/.config/waybar/config.jsonc
git commit -m "feat(waybar): remove network module in favor of nm-applet tray"
```

---

## Task 2: Add pwvucontrol floating dropdown window rule

Files: Modify `hypr/.config/hypr/rules.conf`

### Step 1: Add window rule for pwvucontrol

Append to the end of `rules.conf`:

```hypr
# Audio control dropdown (pwvucontrol)
windowrule {
    name = float-pwvucontrol
    match:class = com.saivert.pwvucontrol

    float = yes
    size = 500 400
    move = 100%-520 40
    pin = on
}
```

Notes for the implementing engineer:

- `match:class = com.saivert.pwvucontrol` is the actual window class for
  pwvucontrol (verify with `hyprctl clients` if it doesn't match)
- `move = 100%-520 40` positions it 520px from right edge (500 width + 20
  margin), 40px from top (below the bar)
- `pin = on` keeps it visible across workspaces while open
- The existing `on-click: "pwvucontrol"` in waybar config already launches it;
  this rule just makes it float in the right spot

### Step 2: Commit

```bash
git add hypr/.config/hypr/rules.conf
git commit -m "feat(hypr): add window rule for pwvucontrol as floating dropdown"
```

---

## Task 3: CSS overhaul - base styles and typography

Files: Modify `waybar/.config/waybar/style.css`

### Step 1: Update base font size and global bar styles

Replace the `*` block:

```css
* {
  font-family:
    SauceCodePro Nerd Font,
    FontAwesome,
    sans-serif;
  font-size: 14px;
  min-height: 0;
}
```

Replace the `window#waybar` block:

```css
window#waybar {
  background-color: rgba(12, 12, 12, 0.9);
  border-bottom: 1px solid #343434;
  color: #f6f6ef;
}
```

Changes: font 13px to 14px, `min-height: 0` prevents GTK minimum sizing issues,
opacity 0.85 to 0.9 for slightly more solid feel, border 2px to 1px for
subtlety, removed transition properties (we'll add per-module transitions
instead).

### Step 2: Update button base styles

Replace the `button` and `button:hover` blocks:

```css
button {
  box-shadow: none;
  border: none;
  border-radius: 0;
}

button:hover {
  background: inherit;
}
```

Remove the purple underline hover - we'll add module-specific hover styles
later.

### Step 3: Commit

```bash
git add waybar/.config/waybar/style.css
git commit -m "refactor(waybar): update base typography and bar styles"
```

---

## Task 4: CSS overhaul - workspace indicators

Files: Modify `waybar/.config/waybar/style.css`

### Step 1: Replace workspace button styles

Replace all workspace-related CSS blocks with:

```css
/* Workspaces */
#workspaces button {
  padding: 0 6px;
  margin: 4px 1px;
  background-color: transparent;
  color: #625e4c;
  border-radius: 2px;
  border-bottom: 2px solid transparent;
  transition: all 0.2s ease;
}

#workspaces button:hover {
  background: rgba(52, 52, 52, 0.5);
  color: #f6f6ef;
}

#workspaces button.active {
  color: #f6f6ef;
  border-bottom: 2px solid #9d65ff;
}

#workspaces button.empty {
  color: #3d3b30;
}
```

Changes: added border-bottom indicator for active workspace (replaces box-shadow
inset), dimmer empty workspaces, transition animation, removed `.focused`
duplicate (`.active` is the hyprland class), tighter padding.

### Step 2: Commit

```bash
git add waybar/.config/waybar/style.css
git commit -m "feat(waybar): improve workspace indicators with underline style"
```

---

## Task 5: CSS overhaul - module spacing and separators

Files: Modify `waybar/.config/waybar/style.css`

### Step 1: Replace shared module styling block

Replace the shared module styling block (the one starting `#clock, #cpu, ...`)
and the `#window, #workspaces` margin block with:

```css
/* Shared module styling */
#clock,
#cpu,
#custom-memory,
#custom-temperature,
#wireplumber,
#tray,
#custom-power {
  padding: 0 12px;
  margin: 4px 0;
  color: #f6f6ef;
  background-color: transparent;
  transition:
    color 0.3s ease,
    background-color 0.3s ease;
}

#window,
#workspaces {
  margin: 0 4px;
}

/* Separators between module groups */
#cpu {
  border-left: 1px solid #343434;
  padding-left: 14px;
}

#wireplumber {
  border-left: 1px solid #343434;
  padding-left: 14px;
}

#tray {
  border-left: 1px solid #343434;
  padding-left: 14px;
}
```

This creates visual groups: `[tray | cpu mem temp | audio | power]` with thin
borders between them. Removed `#pulseaudio` and `#pipewire-audio` from the
shared list (not in use), removed `#network` (deleted in task 1). Added
`margin: 4px 0` for vertical breathing room. Added transition for smooth color
changes.

### Step 2: Commit

```bash
git add waybar/.config/waybar/style.css
git commit -m "feat(waybar): add module group separators and improve spacing"
```

---

## Task 6: CSS overhaul - per-module colors and hover states

Files: Modify `waybar/.config/waybar/style.css`

### Step 1: Replace all per-module color blocks

Replace everything from `/* Clock */` onwards through the end of the file with:

```css
/* Clock */
#clock {
  color: #e0d561;
}

#clock:hover {
  background-color: rgba(224, 213, 97, 0.1);
}

/* System tray */
#tray {
  color: #f6f6ef;
}

#tray > .passive {
  -gtk-icon-effect: dim;
}

#tray > .needs-attention {
  -gtk-icon-effect: highlight;
  background-color: #f4005f;
}

/* CPU */
#cpu {
  color: #58d1eb;
}

#cpu:hover {
  background-color: rgba(88, 209, 235, 0.1);
}

#cpu.warning {
  color: #fa8419;
}

#cpu.critical {
  color: #f4005f;
}

/* Memory */
#custom-memory {
  color: #9d65ff;
}

#custom-memory:hover {
  background-color: rgba(157, 101, 255, 0.1);
}

#custom-memory.warning {
  color: #fa8419;
}

#custom-memory.critical {
  color: #f4005f;
}

/* Temperature */
#custom-temperature {
  color: #98e024;
}

#custom-temperature:hover {
  background-color: rgba(152, 224, 36, 0.1);
}

#custom-temperature.critical {
  color: #f4005f;
}

/* Audio */
#wireplumber {
  color: #9d65ff;
}

#wireplumber:hover {
  background-color: rgba(157, 101, 255, 0.1);
}

#wireplumber.muted {
  color: #625e4c;
}

/* Power */
#custom-power {
  color: #f4005f;
  padding: 0 14px;
}

#custom-power:hover {
  background-color: rgba(244, 0, 95, 0.15);
  border-radius: 2px;
}
```

Changes: each module gets a matching-color hover background at 10% opacity
(subtle glow), removed `#pulseaudio`/`#pipewire-audio` references (not in use),
removed `#network` styles (deleted module), power button hover is slightly
stronger (15%) for visual emphasis.

### Step 2: Commit

```bash
git add waybar/.config/waybar/style.css
git commit -m "feat(waybar): add subtle color-matched hover states for all modules"
```

---

## Task 7: Verify and test

### Step 1: Restart waybar to pick up all changes

Run: `killall waybar && uwsm app -- waybar &`

### Step 2: Visual checks

- Bar should appear with slightly larger text (14px)
- Module groups should have thin vertical separators between them
- Hovering any module should show a subtle color-matched background glow
- Active workspace should have purple underline, empty ones should be very dim
- Network module should be gone (nm-applet still visible in tray)

### Step 3: Interaction checks

- Click audio icon: pwvucontrol should appear as floating window near top-right
- Click away from pwvucontrol: it stays (no auto-close, user closes manually)
- Scroll on audio: volume should change
- Right-click audio: should toggle mute
- Click cpu/memory/temp: should open btop

### Step 4: Commit any final tweaks, if needed
