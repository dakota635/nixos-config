{ ... }:

{
  imports = [
    ../../common/common-nixos.nix
    
    ../../display-server-protocol/wayland.nix
    ../../display-server-protocol/x11.nix

    ./drivers.nix
    ./hardware-configuration.nix
    ./networking-host-name.nix
  ];
}