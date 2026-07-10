{ ... }:
{
  # Curated set: captured from the machine 2026-07-10 and confirmed by
  # Derek, plus opted-in extras. Undeclared settings stay manual.
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
    };

    CustomUserPreferences."com.apple.desktopservices" = {
      DSDontWriteNetworkStores = true;
      DSDontWriteUSBStores = true;
    };
  };
}
