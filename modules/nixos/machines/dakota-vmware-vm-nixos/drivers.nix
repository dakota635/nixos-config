{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ open-vm-tools ];

  systemd.services.vmtoolsd.enable = true;
  
  virtualisation.vmware.guest.enable = true;
}