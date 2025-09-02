{ pkgs, ... }:

{
  services.xserver = {
    displayManager.startx.enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
     ];
    };
  };

  xdg.portal = {
    enable = true;
    config.i3.default = [ "gtk" ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}