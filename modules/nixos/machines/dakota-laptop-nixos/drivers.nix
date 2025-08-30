{ pkgs, ... }:

{
  hardware = {
      graphics.extraPackages = with pkgs; [
        intel-media-driver   # Intel VAAPI driver for video decode
        vaapiVdpau           # bridge for apps expecting VDPAU
      ];
  };
}