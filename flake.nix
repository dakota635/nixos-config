{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
  let
    system = "x86_64-linux";

    commonModules = [
      home-manager.nixosModules.home-manager
      stylix.nixosModules.stylix
      ./modules/nixos/common/common-nixos.nix
    ];

    mkHost = { path, homeProfiles }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; }; 
        modules =
          commonModules ++ [
            path
            { home-manager.users.dakota = {
                imports =
                  [ ./modules/home/dakota/profiles/common-home-profile.nix ]
                  ++ homeProfiles;
              };
            }
          ];
      };
  in {
    nixosConfigurations = {
      dakota-desktop-nixos = mkHost {
        path = ./modules/nixos/machine/dakota-desktop-nixos/dakota-desktop-nixos.nix;
        homeProfiles = [
          ./modules/home/dakota/profiles/hyprland-home-profile.nix
        ];
      };

      dakota-laptop-nixos = mkHost {
        path = ./modules/nixos/machine/dakota-laptop-nixos/dakota-laptop-nixos.nix;
        homeProfiles = [
          ./modules/home/dakota/profiles/hyprland-home-profile.nix
        ];
      };

      dakota-vmware-vm-nixos = mkHost {
        path = ./modules/nixos/machine/dakota-vmware-vm-nixos/dakota-vmware-vm-nixos.nix;
        homeProfiles = [
          ./modules/home/dakota/profiles/i3-home-profile.nix
        ];
      };
    };
  };
}
