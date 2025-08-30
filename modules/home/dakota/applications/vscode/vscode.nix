{ lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
      ];

      userSettings = {
        "editor.fontFamily" = lib.mkForce "JetBrainsMono Nerd Font, Symbols Nerd Font, monospace";
        "editor.fontLigatures" = true;
      };
    };
  };
}
