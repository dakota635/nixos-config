{ pkgs, ... }:

{
  services = {
    blueman.enable = true;

    displayManager.ly.enable = true;

    gvfs.enable = true;

    pipewire = {
          enable = true;
          pulse.enable = true;
        };

    tumbler.enable = true;
    
    upower.enable = true;

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}