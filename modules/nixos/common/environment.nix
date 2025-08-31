{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      feh
      gh
      git
      killall
      neovim
      xdg-utils
      xorg.xinit
    ];
    
    defaultPackages = lib.mkForce [
      pkgs.strace
    ];
  };
}