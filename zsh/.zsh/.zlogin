# .zlogin file for zsh(1).
#
# This file is sourced only for login shells. It
# should contain commands that should be executed only
# in login shells. It should be used to set the terminal
# type and run a series of external commands (fortune,
# msgs, from, etc.)
#
# Global Order: zshenv, zprofile, zshrc, zlogin

# macOS: Remap caps lock to ctrl (only once per login session)
if [[ "$OSTYPE" == darwin* ]]; then
  hidutil property --set '{"UserKeyMapping":[
    {"HIDKeyboardModifierMappingSrc": 0x700000039,"HIDKeyboardModifierMappingDst": 0x7000000E0},
    {"HIDKeyboardModifierMappingSrc": 0x7000000E0,"HIDKeyboardModifierMappingDst": 0x700000039}
  ]}' >/dev/null 2>&1
fi
