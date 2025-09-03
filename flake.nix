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
    desktopEnvs = {
      gnome = {
        system = ./modules/nixos/imports/gnome-system-imports.nix;
        home   = ./modules/home/dakota/imports/gnome-home-imports.nix;
      };
      hyprland = {
        system = ./modules/nixos/imports/hyprland-system-imports.nix;
        home   = ./modules/home/dakota/imports/hyprland-home-imports.nix;
      };
    };

    mkHost = { machinePath, desktopEnv }:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          ./modules/nixos/imports/common-system-imports.nix
          machinePath
          desktopEnv.system
          {
            home-manager.users.dakota.imports = [
              ./modules/home/dakota/imports/common-home-imports.nix
              desktopEnv.home
            ];
          }
        ];
      };
  in {
    nixosConfigurations = {
      dakota-desktop-nixos = mkHost {
        machinePath = ./machines/dakota-desktop-nixos/dakota-desktop-nixos-imports.nix;
        desktopEnv = desktopEnvs.hyprland;
      };

      dakota-laptop-nixos = mkHost {
        machinePath = ./machines/dakota-laptop-nixos/dakota-laptop-nixos-imports.nix;
        desktopEnv = desktopEnvs.hyprland;
      };

      dakota-vmware-vm-nixos = mkHost {
        machinePath = ./machines/dakota-vmware-vm-nixos/dakota-vmware-vm-nixos-imports.nix;
        desktopEnv = desktopEnvs.gnome;
      };
    };
  };
}
