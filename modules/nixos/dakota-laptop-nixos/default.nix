{ ... }:

{
  imports = [
    # Common
    ../common/default.nix

    # dakota-laptop-nixos
    ./hardware.nix
    ./hardware-configuration.nix
    ./network.nix
    ./users.nix
  ];
}