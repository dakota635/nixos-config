{ config, pkgs, ... }:

{
  config = {
    nixosModules = {
      users.users.dakota.packages = with pkgs; [
        (wineWowPackages.full.override {
          wineRelease = "staging";
          mingwSupport = true;
        })
        winetricks
      ];
    };
  };
}
