{ pkgs, ... }:

{
  services = {
    # services.displayManager.sddm = {
    #   enable = true;
    #   package = pkgs.kdePackages.sddm;
    #   wayland.enable = true;
    # };

    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    pipewire.enable = true;
    pipewire.pulse.enable = true;

    blueman.enable = true;

    upower.enable = true;

    gvfs.enable = true;

    tumbler.enable = true;
  };
}