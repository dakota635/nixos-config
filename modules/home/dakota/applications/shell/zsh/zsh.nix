{ lib, ... }:

let
  NIXOS-CONFIG = "/home/dakota/nixos-config";
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = "fastfetch";

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ${NIXOS-CONFIG}";
      dev-java = "nix develop ${NIXOS-CONFIG}#devShells.java"; 
      dev-python = "nix develop ${NIXOS-CONFIG}#devShells.python";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "gh" "docker" ];
    };
  };
}
