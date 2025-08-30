{ ... }:

{
  imports = [
    ../../common/default.nix
    ../../window-manager/i3.nix
    
    ./drivers.nix
    ./hardware-configuration.nix
    ./networking-host-name.nix
  ];
}