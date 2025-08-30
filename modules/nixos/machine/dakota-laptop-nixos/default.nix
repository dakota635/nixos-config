{ ... }:

{
  imports = [
    ../../common/default.nix
    ../../window-manager/hyprland.nix
    
    ./drivers.nix
    ./hardware-configuration.nix
    ./networking-host-name.nix
  ];
}