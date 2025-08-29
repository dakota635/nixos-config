{ config, pkgs, lib, ... }:

{
  imports = [
    # App launcher
    ./programs/rofi/rofi.nix

    # Audio
    ./programs/cava/cava.nix
    #./programs/spotify-player/spotify-player.nix

    # Browser
    ./programs/firefox/firefox.nix

    # GTK theme
    ./programs/gtk/gtk.nix

    # Home and home-manager
    ./programs/home/home.nix

    # IDE
    ./programs/vscode/vscode.nix

    # Desktop environment / window manager
    ./programs/hypr/hyprland-settings.nix
    ./programs/hypr/hyprland-binds.nix
    
    ./programs/waybar/waybar.nix
     
    # Shell
    ./programs/zsh/zsh.nix
    ./programs/starship/starship.nix 
    ./programs/fzf/fzf.nix

    # Terminal emulator
    ./programs/ghostty/ghostty.nix
  ];
}
