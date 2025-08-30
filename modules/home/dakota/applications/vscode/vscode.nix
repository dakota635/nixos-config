{ lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    
    userSettings = {
      "editor.fontFamily" = lib.mkForce "JetBrainsMono Nerd Font, Symbols Nerd Font, monospace";
      "editor.fontLigatures" = true;
    };

    profiles.default.extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
    ];
  };
}
