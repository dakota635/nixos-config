{ ... }:

{
  imports = [
    ./system-config/boot.nix
    ./system-config/hardware.nix
    ./system-config/networking.nix
    ./system-config/packages.nix
    ./system-config/programs.nix
    ./system-config/services.nix
    ./system-config/steam.nix
    ./system-config/system.nix
    ./system-config/theme.nix
    ./system-config/users.nix
    ./system-config/virtualisation.nix

    ./system-config/desktop-environments/gnome.nix
    ./system-config/desktop-environments/hyprland.nix
  ];
}