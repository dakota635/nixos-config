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

    desktopEnvs = {
      gnome = {
        system = ./modules/nixos/desktop-environment/gnome.nix;
        home = ./modules/home/dakota/profiles/gnome-home-profile.nix;
      };
      hyprland = {
        system = ./modules/nixos/window-manager/hyprland.nix;
        home = ./modules/home/dakota/profiles/hyprland-home-profile.nix;
      };
      i3 = {
        system = ./modules/nixos/window-manager/hyprland.nix;
        home = ./modules/home/dakota/profiles/hyprland-home-profile.nix;
      };
    };

    machineTemplate = { machinePath, desktopEnv }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          ./modules/nixos/common/common-nixos.nix
          machinePath
          desktopEnv.system
          {
            home-manager.users.dakota = {
              imports = [
                ./modules/home/dakota/profiles/common-home-profile.nix
                desktopEnv.home
              ];
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      dakota-desktop-nixos = machineTemplate {
        machinePath = ./modules/nixos/machine/dakota-desktop-nixos/dakota-desktop-nixos.nix;
        desktopEnv = desktopEnvs.hyprland;
      };

      dakota-laptop-nixos = machineTemplate {
        machinePath = ./modules/nixos/machine/dakota-laptop-nixos/dakota-laptop-nixos.nix;
        desktopEnv = desktopEnvs.gnome;
      };

      dakota-vmware-vm-nixos = machineTemplate {
        machinePath = ./modules/nixos/machine/dakota-vmware-vm-nixos/dakota-vmware-vm-nixos.nix;
        desktopEnv = desktopEnvs.i3;
      };
    };
  };
}
