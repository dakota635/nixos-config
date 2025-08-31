{ pkgs, ... }:

{
  catppuccin = {
    enable = true;
    flavor = "latte";
  
    accent = "green";
    plymouth.enable = false;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    image = ./assets/wallpaper/forest-studio-ghibli.png;
    polarity = "dark";

    targets = {
      grub.enable = false;
    };
  };
}