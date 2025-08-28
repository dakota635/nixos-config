{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    wayland.enable = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  services.blueman.enable = true;

  services.upower.enable = true;
  
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}