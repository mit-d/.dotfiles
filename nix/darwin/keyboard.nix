{ config, ... }:
{
  # Caps Lock <-> Left Control, as a true two-way swap.
  #
  # `system.keyboard.remapCapsLockToControl` only does half of this -- it maps
  # Caps to Control and leaves Control alone. The mapping below reproduces what
  # `hidutil property --get UserKeyMapping` already reported on this machine.
  #
  # The constants are HID usages OR'd with the keyboard usage page
  # (0x700000000): 0x39 is Caps Lock, 0xE0 is Left Control. nix-darwin writes
  # them as decimal, so these match its own style.
  system.keyboard = {
    enableKeyMapping = true;
    userKeyMapping = [
      {
        # Caps Lock -> Left Control
        HIDKeyboardModifierMappingSrc = 30064771129;
        HIDKeyboardModifierMappingDst = 30064771296;
      }
      {
        # Left Control -> Caps Lock
        HIDKeyboardModifierMappingSrc = 30064771296;
        HIDKeyboardModifierMappingDst = 30064771129;
      }
    ];
  };

  # The remap above does NOT survive a reboot on its own, which is the whole
  # complaint being fixed here. nix-darwin applies it from
  # `system.activationScripts.keyboard`, i.e. once per `darwin-rebuild switch`,
  # and `hidutil property --set` only mutates the running session -- it writes
  # nothing persistent. Reboot and the mapping is gone until the next switch.
  #
  # (The reason it currently survives is incidental: it was originally set
  # through System Settings, which writes a per-keyboard
  # `com.apple.keyboard.modifiermapping.<vid>-<pid>-0` key that macOS replays at
  # login. Declaring it in nix and then clearing it from System Settings would
  # silently lose that persistence.)
  #
  # So re-apply it at login from a user agent. The mapping is read back out of
  # `config.system.keyboard.userKeyMapping` rather than repeated, so there is
  # still exactly one definition above.
  launchd.user.agents.hidutil-keymap = {
    serviceConfig = {
      ProgramArguments = [
        "/usr/bin/hidutil"
        "property"
        "--set"
        (builtins.toJSON { UserKeyMapping = config.system.keyboard.userKeyMapping; })
      ];
      RunAtLoad = true;
      # hidutil sets the property and exits immediately; there is nothing to
      # keep alive, and restarting it in a loop would be pointless.
      KeepAlive = false;
    };
  };

  # Global hotkey: Ctrl-Cmd-T spawns a Ghostty window, the macOS equivalent of
  # Ubuntu's Ctrl-Alt-T.
  #
  # skhd rather than macOS's own shortcut mechanism because this needs to be
  # declarative and to actually survive a restart -- launchd keeps the agent
  # alive, whereas the built-in mechanism is what has been dropping the binding.
  #
  # `open -a` deliberately, NOT `open -na`. The -n flag means "open a new
  # instance even if one is already running", which would spawn a fresh window
  # on every press. Without it the hotkey focuses the existing Ghostty and only
  # launches one when none is running -- the behaviour the previous Shortcuts
  # binding had, and the right one when windows are really tmux clients.
  #
  # open(1) rather than the ghostty binary because Ghostty's CLI refuses to
  # start the emulator on macOS and only supports `+action` subcommands.
  # Resolving by name rather than path keeps this working wherever the bundle
  # lives, which matters because it moved out of /Applications when it stopped
  # being a Homebrew cask.
  #
  # CAVEAT: skhd captures keys through an event tap, so macOS will prompt for
  # Accessibility permission on first run. That grant is bound to the binary's
  # path, and the path is a nix store path -- so expect to re-approve it after a
  # nixpkgs bump changes the skhd version. Nothing breaks silently: the hotkey
  # just stops until it is re-granted.
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # Focus Ghostty, launching it only if it is not already running.
      # Absolute path to open(1) because the agent's environment is not a
      # login shell.
      ctrl + cmd - t : /usr/bin/open -a Ghostty
    '';
  };
}
