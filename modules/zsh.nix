{ config, lib, ... }:

let
  NIXOS-CONFIG = config.custom.nixosConfigPath;
in {
  config = {
    nixosModules = {
      programs.zsh.enable = true;
    };

    homeManagerModules = {
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
    };
  };
}
