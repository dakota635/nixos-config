{ ... }:

{
  imports = [
    ./bootloader.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./network.nix
    ./programs.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./steam.nix
    ./theme.nix
    ./users.nix
    ./virtualisation.nix
    ./wayland.nix
  ];
}