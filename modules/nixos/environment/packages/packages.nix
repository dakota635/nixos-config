{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      feh
      gh
      ghostty
      git
      htop
      killall
      neovim
      qdirstat
      rofi
      tree
      xdg-utils
      xorg.xinit
    ];

    defaultPackages = lib.mkForce [ ];
  };
}