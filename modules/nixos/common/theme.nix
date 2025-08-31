{ pkgs, ... }:

{
  catppuccin = {
    enable = true;
    flavor = "mocha";
  
    accent = "blue";
    plymouth.enable = false;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./assets/wallpaper/synthwave-axiom-design.png;
    polarity = "dark";

    targets = {
      grub.enable = false;
    };
  };
}