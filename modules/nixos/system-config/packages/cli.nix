{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      feh
      gh
      git
      killall
      neovim
      tree
      xdg-utils
      xorg.xinit
    ];
  };
}