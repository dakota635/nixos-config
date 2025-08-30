{ pkgs, ... }:

{
  services = {
    blueman.enable = true;

    displayManager.sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland.enable = true;
    };

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
      excludePackages = [ pkgs.xterm ];
    };
  };
}