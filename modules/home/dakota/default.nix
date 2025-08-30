{ ... }:

{
  imports = [
    # App launcher
    ./applications/fuzzel/fuzzel.nix

    # Audio
    ./applications/cava/cava.nix
    ./applications/spotify-player/spotify-player.nix

    # Browser
    ./applications/firefox/firefox.nix

    # Gaming
    ./applications/mangohud/mangohud.nix

    # GTK theme
    ./applications/gtk/gtk.nix

    # Home and home-manager
    ./applications/home/home.nix

    # IDE
    ./applications/vscode/vscode.nix
    ./applications/neovim/neovim.nix

    # Desktop environment / window manager
    ./applications/hypr/hyprland-settings.nix
    ./applications/hypr/hyprland-binds.nix
    
    ./applications/waybar/waybar.nix

    # Notifications
    ./applications/mako/mako.nix
     
    # Shell
    ./applications/zsh/zsh.nix
    ./applications/starship/starship.nix 

    # Terminal emulator
    ./applications/ghostty/ghostty.nix
  ];
}
