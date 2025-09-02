{ ... }:

{
  imports = [
    # Audio
    ../applications/cava/cava.nix
    ../applications/spotify-player/spotify-player.nix

    # Browser
    ../applications/firefox/firefox.nix

    # Gaming
    ../applications/mangohud/mangohud.nix

    # GTK theme
    ../applications/gtk/gtk.nix

    # Home and home-manager
    ../applications/home/home.nix

    # IDE
    ../applications/vscode/vscode.nix
    ../applications/vscode/jupyter-kernel-support.nix
    ../applications/neovim/neovim.nix
     
    # Shell
    ../applications/zsh/zsh.nix
    ../applications/starship/starship.nix 

    # Terminal emulator
    ../applications/ghostty/ghostty.nix
  ];
}
