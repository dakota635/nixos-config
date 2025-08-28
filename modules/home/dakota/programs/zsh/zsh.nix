{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/dakota/nixos-config";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" ];
    };
  };
}
