{ pkgs, inputs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = pkgs.fetchurl {
      url = "https://cdna.artstation.com/p/assets/images/images/026/481/586/large/alena-aenami-wait.jpg";
      sha256 = "sha256-B6OmvvgPaL5W8JR+uXiENXwStpwnNF59nLh/YErcV7I=";
    };
    polarity = "dark";
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only
    ];
  };
}