{ ... }:

{
  imports = [
    ./desktop-environments
    ./gaming
    ./packages
    
    ./boot.nix
    ./global-variables.nix
    ./hardware.nix
    ./networking.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./system.nix
    ./theme.nix
    ./users.nix
    ./virtualisation.nix
  ];
}