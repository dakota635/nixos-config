{ pkgs, ... }:

{
  programs.i3 = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    configPackages = with pkgs; [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}