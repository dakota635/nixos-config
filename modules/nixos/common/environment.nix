{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      gh
      git
      killall
      neovim
      xdg-utils
    ];
    
    defaultPackages = lib.mkForce [
      pkgs.strace
    ];
  };
}