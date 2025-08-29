{ config, pkgs, lib, ... }:

{
  home.username = "dakota";
  home.homeDirectory = "/home/dakota";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
    TERMINAL = "ghostty";
  };
}