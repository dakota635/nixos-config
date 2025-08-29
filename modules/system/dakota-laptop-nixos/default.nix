{ ... }:

{
  imports = [
    # Common
    ../common/boot.nix
    ../common/programs.nix
    ../common/services.nix
    ../common/steam.nix
    ../common/system.nix
    ../common/theme.nix
    ../common/virtualisation.nix
    ../common/wayland.nix

    # dakota-laptop-nixos
    ../dakota-laptop-nixos/hardware.nix
    ../dakota-laptop-nixos/hardware-configuration.nix
    ../dakota-laptop-nixos/network.nix
    ../dakota-laptop-nixos/users.nix
  ];
}