{ pkgs, ... }:

{
  services = {
    blueman.enable = true;

    gvfs.enable = true;

    pipewire = {
          enable = true;
          pulse.enable = true;
        };
 
    greetd = {
      enable = true;
    };

    tumbler.enable = true;
    
    upower.enable = true;

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = [ pkgs.xterm ];
    };
  };
}