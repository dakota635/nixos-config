{ inputs, lib, ... }:

{
  flake.nixosConfigurations = {
    dirty-bubble = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        ./.
        ../../../../modules/nixos
        {
          home-manager.users.dakota.imports = [
            ../../../../modules/home/dakota
          ];
        }
      ];
    };
  };
}
