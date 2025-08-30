{
  description = "NixOS configuration";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { catppuccin, home-manager, nixpkgs, stylix, ... }:
  let
    commonModules = [
      catppuccin.nixosModules.catppuccin
      home-manager.nixosModules.home-manager
      stylix.nixosModules.stylix
      { home-manager.users.dakota = {
          imports = [ ./modules/home/dakota/default.nix ];
        };
      }
    ];

    mk = machinePath: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ machinePath ] ++ commonModules;
    };
  in {
    nixosConfigurations = {
      dakota-desktop-nixos = mk ./modules/nixos/machines/dakota-desktop-nixos/default.nix;
      dakota-laptop-nixos  = mk ./modules/nixos/machines/dakota-laptop-nixos/default.nix;
      dakota-vmware-vm-nixos = mk ./modules/nixos/machines/dakota-vmware-vm-nixos/default.nix;
    };
  };
}
