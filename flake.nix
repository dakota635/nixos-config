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

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, ... }:
  let
    mkHost = { machinePath }:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/nixos
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          machinePath
          {
            home-manager.users.dakota.imports = [
              ./modules/home/dakota
            ];
          }
        ];
      };
  in {
    nixosConfigurations = {
      barnacle-boy = mkHost { machinePath = ./modules/hosts/barnacle-boy; };
      dirty-bubble  = mkHost { machinePath = ./modules/hosts/dirty-bubble; };
    };
  };
}
