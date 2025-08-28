{
  description = "NixOS configuration";

  inputs = {
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

  outputs = {
      self,
      home-manager,
      hyprland,
      nixpkgs,
      stylix
  }: {
    nixosConfigurations = {
      dakota-laptop-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/core/default.nix
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          { 
            home-manager.users.dakota = {
              imports = [
                ./modules/home/dakota/default.nix
              ];
            };
          }
        ];
      };
    };
  };
}
