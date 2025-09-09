{ ... }:

{
  imports = [
    ./gnome/gnome.nix
    ./gtk/gtk.nix
    ./hyprland/hyprland-settings.nix
    ./hyprland/hyprland-binds.nix
    ./mako/mako.nix
    ./rofi/rofi.nix
    ./waybar/waybar.nix
  ];
}
