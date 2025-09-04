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

    # Desktop environment / window manager
    ./applications/gnome/gnome-dconf.nix
    ./applications/hyprland/hyprland-settings.nix
    ./applications/hyprland/hyprland-binds.nix
    ./applications/waybar/waybar.nix

    # Gaming
    ./applications/mangohud/mangohud.nix

    # GTK theme
    ./applications/gtk/gtk.nix

    # Home and home-manager
    ./applications/home/home.nix

    # IDE
    ./applications/vscode/vscode.nix
    ./applications/vscode/jupyter-kernel-support.nix
    ./applications/neovim/neovim.nix

    # Notifications
    ./applications/mako/mako.nix
     
    # Shell
    ./applications/zsh/zsh.nix
    ./applications/starship/starship.nix 

    # Terminal emulator
    ./applications/alacritty/alacritty.nix
  ];
}
