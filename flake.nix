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
    system = "x86_64-linux";
    pkgs   = nixpkgs.legacyPackages.${system};
    
    mkHost = { hostPath }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/nixos
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          hostPath
          {
            home-manager.users.dakota.imports = [
              ./modules/home/dakota
            ];
          }
        ];
      };
  in {
    nixosConfigurations = {
      barnacle-boy = mkHost { hostPath = ./modules/hosts/barnacle-boy; };
      dirty-bubble  = mkHost { hostPath = ./modules/hosts/dirty-bubble; };
    };
    devShells = {
      "${system}" = {
        basePython = import ./devShells/base/python/python.nix { inherit pkgs system; };
        baseJava   = import ./devShells/base/java/java.nix { inherit pkgs system; };
      };
    };
  };
}
