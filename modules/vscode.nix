{ config, lib, pkgs, ... }:

{
  config = {
    homeManagerModules = {
      programs.vscode = {
        enable = true;
        
        profiles.default = {
          extensions = with pkgs.vscode-extensions; [
            # Java
            redhat.java
            vscjava.vscode-java-pack
            
            # Nix
            bbenoist.nix

            # DevShell
            arrterian.nix-env-selector

            # Python
            ms-python.python
            ms-toolsai.jupyter
          ];

          userSettings = {
            "editor.fontFamily" = lib.mkForce "JetBrainsMono Nerd Font, Symbols Nerd Font, monospace";
            "editor.fontLigatures" = true;
          };
        };
      };
    };
  };
}
