{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      # System
      brightnessctl
      feh
      gh
      git
      killall
      neovim
      tree
      xdg-utils
      xorg.xinit
    ];
    
    defaultPackages = lib.mkForce [
      pkgs.strace
    ];
  };
}