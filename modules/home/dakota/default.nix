{ config, pkgs, lib, ... }:

{
  home.username = "dakota";
  home.homeDirectory = "/home/dakota";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };

  imports = [
    # App launcher
    ./programs/rofi/rofi.nix

    # Audio
    ./programs/cava/cava.nix

    # Browser
    ./programs/firefox/firefox.nix

    # GTK theme
    ./programs/gtk/gtk.nix

    # IDE
    ./programs/vscode/vscode.nix

    # Desktop environment / window manager
    ./programs/hypr/hyprland-settings.nix
    ./programs/hypr/hyprland-binds.nix
    
    ./programs/waybar/waybar.nix
     
    # Shell
    ./programs/zsh/zsh.nix
    ./programs/starship/starship.nix 

    # Terminal emulator
    ./programs/ghostty/ghostty.nix
  ];
}
