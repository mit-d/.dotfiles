# Waybar Upgrade - Clean Minimal + Audio Dropdown

## Goals

Upgrade waybar from a functional-but-basic setup to a polished, clean minimal
bar with better interaction patterns.

## Visual Refinements

- **Module grouping with subtle separators**: thin vertical dividers
  (`border-left`) between logical groups (system monitors, audio, tray+power)
  instead of everything running together
- **Better spacing**: increase padding, add margin between module groups for
  visual breathing room
- **Typographic cleanup**: bump font size 13px → 14px, consistent icon-text
  spacing
- **Subtler hover states**: replace the purple underline with a gentle
  background highlight matching the module's color at low opacity
- **Transition animations**: smooth color transitions on state changes (normal →
  warning → critical)

## Audio Floating Dropdown

- Add Hyprland window rules for `pwvucontrol`: small floating window pinned to
  top-right near bar, auto-close on focus loss
- Wire to wireplumber module `on-click` (replacing current `pwvucontrol` launch)
- Keep scroll-to-adjust-volume and right-click-to-mute

## Network

- Remove the `network` module - nm-applet in the tray already covers this with a
  proper GTK dropdown
- One less redundant widget

## Other QoL

- **Workspace indicators**: dot/underline style distinguishing workspaces with
  windows vs empty
- **Consistent click actions**: ensure all system modules open btop to the
  relevant tab
- **Clock**: keep existing format and calendar tooltip, tighten styling

## Files to Modify

- `waybar/.config/waybar/config.jsonc` - module list, remove network, update
  on-click for wireplumber
- `waybar/.config/waybar/style.css` - all visual refinements
- `hypr/.config/hypr/hyprland.conf` - add window rules for pwvucontrol floating
  dropdown
