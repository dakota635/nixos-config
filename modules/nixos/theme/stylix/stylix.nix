{ pkgs, ... }:

let 
  schemes = {
    forest = {
      scheme = "everforest-dark-hard.yaml";
      bg = "forest-studio-ghibli.png";
    };
    mocha  = {
      scheme = "catppuccin-mocha.yaml";
      bg = "alena-aenami-wait.jpg";
    };
    synthwave = {
      scheme = "synth-midnight-dark.yaml";
    bg = "synthwave-axiom-design.png";
    };
  };

  selectedScheme = schemes.synthwave;
in {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${selectedScheme.scheme}";
    image = ./assets/wallpaper/${selectedScheme.bg};
    polarity = "dark";
  };
}