{ pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/synth-midnight-dark.yaml";
    image = ../../../../assets/wallpaper/synthwave-axiom-design.png;
    polarity = "dark";
  };
}