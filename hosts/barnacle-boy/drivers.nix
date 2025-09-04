{ pkgs, ... }:

{
  services.xserver.videoDrivers = [ "modesetting" ];

  hardware = {
    cpu.intel.updateMicrocode = true;

    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libvdpau-va-gl
      ];
    };
  };
}
