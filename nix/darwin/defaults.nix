{ ... }: {
  system.defaults = {
    dock = {
      autohide = true;
      tilesize = 72;
      show-recents = false;
    };

    finder = {
      ShowPathbar = true;
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv";
    };

    NSGlobalDomain = {
      KeyRepeat = 2;
      InitialKeyRepeat = 25;
      ApplePressAndHoldEnabled = false;
      AppleInterfaceStyle = "Dark";

      # Ctrl-Cmd-drag anywhere inside a window to move it, rather than having to
      # grab the title bar. Undocumented in System Settings but a real, supported
      # AppKit setting.
      NSWindowShouldDragOnGesture = true;
    };

    CustomUserPreferences."com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };
  };
}
