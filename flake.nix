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

    import-tree.url = "github:vic/import-tree";

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

  outputs = inputs@{ self, nixpkgs, home-manager, import-tree, stylix, ... }:
  let
    system = "x86_64-linux";
    
    mkHost = { hostPath }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ( import-tree ./modules/nixos )
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          hostPath
          {
            home-manager.users.dakota.imports = [
              ( import-tree ./modules/home/dakota )
            ];
          }
        ];
      };
  in {
    nixosConfigurations = {
      barnacle-boy = mkHost { hostPath = (import-tree ./modules/hosts/barnacle-boy ); };
      dirty-bubble  = mkHost { hostPath = (import-tree ./modules/hosts/dirty-bubble ); };
    };
  };
}
