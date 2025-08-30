{ ... }:

{
  imports = [
    # Common
    ./boot.nix
    ./environment.nix
    ./programs.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./theme.nix
    ./virtualisation.nix
    ./wayland.nix
  ];
}