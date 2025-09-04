{ ... }:

{
  imports = [
    # App launcher
    ./applications/app-launcher/rofi/rofi.nix

    # Audio
    ./applications/audio/cava/cava.nix
    ./applications/audio/spotify-player/spotify-player.nix

    # Browser
    ./applications/browser/firefox/firefox.nix

    # Desktop environment / window manager
    ./applications/desktop-environment/gnome/gnome-dconf.nix
    ./applications/desktop-environment/hyprland/hyprland-settings.nix
    ./applications/desktop-environment/hyprland/hyprland-binds.nix
    ./applications/desktop-environment/waybar/waybar.nix

    # File manager
    ./applications/file-manager/yazi/yazi.nix

    # Gaming
    ./applications/gaming/mangohud/mangohud.nix

    # Theme
    ./applications/theme/gtk/gtk.nix

    # Home-manager
    ./applications/home-manager/home/home.nix

    # IDE
    ./applications/ide/vscode/vscode.nix
    ./applications/ide/vscode/jupyter-kernel-support.nix
    ./applications/ide/neovim/neovim.nix

    # Notifications
    ./applications/notifications/mako/mako.nix
     
    # Shell
    ./applications/shell/zsh/zsh.nix
    ./applications/shell/starship/starship.nix 

    # Terminal emulator
    ./applications/terminal-emulator/alacritty/alacritty.nix

    # Utilities
    ./applications/utilities/git/git.nix
  ];
}
