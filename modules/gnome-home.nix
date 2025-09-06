{ config, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "forge@jmmaranan.com"
        ];

        favorite-apps = [
          "firefox.desktop"
          "com.mitchellh.ghostty.desktop"
          "code.desktop"
          "thunar.desktop"
        ];
      };

      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.75;
        noise-amount = 0;
      };
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    forge
  ];
}