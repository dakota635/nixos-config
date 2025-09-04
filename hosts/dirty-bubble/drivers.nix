{ pkgs, ... }:

{
  virtualisation.vmware.guest.enable = true;

  services.xserver.videoDrivers = [ "vmware" ];

  hardware.opengl.enable = true;

  environment.systemPackages = with pkgs; [
    xorg.xf86video_vmware
    mesa
  ];
}
