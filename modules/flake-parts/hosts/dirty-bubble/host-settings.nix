{ pkgs, ... }:

{
  networking.hostName = "dirty-bubble";
  
  virtualisation.vmware.guest.enable = true;

  services.xserver.videoDrivers = [ "vmware" ];

  hardware.graphics.enable = true;

  environment = {
    systemPackages = with pkgs; [
      xorg.xf86videovmware
      mesa
    ];
    variables = {
      WLR_RENDERER = "pixman";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
    };
  };
}
