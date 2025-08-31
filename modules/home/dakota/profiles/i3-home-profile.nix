{ ... }:

{
  imports = [
    # App launcher
    ../applications/rofi/rofi.nix

    # Desktop environment / window manager
    ../applications/i3/i3.nix
    ../applications/picom/picom.nix

    # Notifications
    ../applications/dunst/dunst.nix
  ];
}
