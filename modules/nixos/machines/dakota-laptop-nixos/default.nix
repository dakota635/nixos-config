{ ... }:

{
  imports = [
    ../../common/default.nix
    
    ./drivers.nix
    ./hardware-configuration.nix
    ./networking-host-name.nix
  ];
}