{ ... }:

{
  imports = [
    ./dconf/dconf.nix
    ./nix/nix.nix
    ./nix/nixpkgs.nix
    ./power-management/upower.nix
    ./time/time.nix
    ./xserver/xserver.nix
  ];
}