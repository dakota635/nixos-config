{ pkgs, ... }:

{
 users.users.dakota.packages = with pkgs; [
   (wineWowPackages.full.override {
     wineRelease = "staging";
     mingwSupport = true;
   })
   winetricks
 ];

  environment.variables = {
    WINEPREFIX = "$HOME/.wine-battlenet";
    WINEARCH = "win64";
  };
}