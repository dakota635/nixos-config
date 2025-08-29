{ pkgs, ... }:

{
  hardware = {
    bluetooth.enable = true;

    graphics = {
      enable = true;
      
      extraPackages = with pkgs; [
        intel-media-driver   # Intel VAAPI driver for video decode
        vaapiVdpau           # bridge for apps expecting VDPAU
        mangohud
      ];
      
      extraPackages32 = with pkgs; [
        mangohud
      ];
    };
  };
}