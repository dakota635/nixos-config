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

  outputs = {
      self,
      catppuccin,
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
          catppuccin.nixosModules.catppuccin
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
