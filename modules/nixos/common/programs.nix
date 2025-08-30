{ pkgs, ... }:

{
  programs = {
    dconf.enable = true;
    file-roller.enable = true;
    light.enable = true;
    nano.enable = false;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    xfconf.enable = true;
    yazi.enable = true;
    zsh.enable = true;
  };
}