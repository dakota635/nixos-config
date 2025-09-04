{ inputs, lib, ... }:

{
  flake.nixosConfigurations = {
    barnacle-boy = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        ./imports.nix
        ../../modules/nixos/imports/common-system-imports.nix
        ../../modules/nixos/imports/hyprland-system-imports.nix
        {
          home-manager.users.dakota.imports = [
            ../../modules/home/dakota/imports/common-home-imports.nix
            ../../modules/home/dakota/imports/hyprland-home-imports.nix
          ];
        }
      ];
    };
  };
}
