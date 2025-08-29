{ pkgs, host, ... }:

{
  networking = {
    hostName = "dakota-laptop-nixos";
    networkmanager.enable = true;
  };
}