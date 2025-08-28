{ pkgs, ... }:

{
  programs = {
    yazi.enable = true;

    zsh.enable = true;

    light.enable = true;

    # enable preference changes saving for xfce/thunar
    xfconf.enable = true;
    # test for archive plugin and neovim wrapper
    file-roller.enable = true;
    # add this after environment.systemPackages, otherwise it won't be found
    dconf.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

  };
}