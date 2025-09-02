{ ... }:

{
  imports = [
    ../../common/common-nixos.nix

    ./drivers.nix
    ./hardware-configuration.nix
    ./networking-host-name.nix
  ];
}