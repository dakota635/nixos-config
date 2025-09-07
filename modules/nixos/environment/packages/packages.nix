{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      feh
      gh
      ghostty
      git
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