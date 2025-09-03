{ ... }:

{
  imports = [
    # App launcher
    ../applications/fuzzel/fuzzel.nix

    # Desktop environment / window manager
    ../applications/hyprland/hyprland-settings.nix
    ../applications/hyprland/hyprland-binds.nix
    
    ../applications/waybar/waybar.nix

    # Notifications
    ../applications/mako/mako.nix
  ];
}
