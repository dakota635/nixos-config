{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar; # or pkgs.waybar-hyprland if available
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin = "6 0 0 0";
        modules-left   = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right  = [
          "tray" "pulseaudio" "network"
          "bluetooth" "temperature" "cpu"
          "memory" "battery" "backlight"
          "idle_inhibitor"
        ];
        # Examples:
        "clock" = { format = "{:%a %b %d  %H:%M}"; tooltip-format = "{:%F %T}"; };
        "pulseaudio" = { format = "{icon} {volume}%"; format-muted = "󰖁"; };
        "network" = { format-wifi = "󰤨 {signalStrength}%"; format-ethernet = "󰈁"; format-disconnected = "󰤮"; tooltip = true; };
        "bluetooth" = { format = ""; format-connected = " {device_alias}"; };
        "battery" = { format = "{icon} {capacity}%"; states = { critical = 15; warning = 30; }; };
        "backlight" = { format = "󰃝 {percent}%"; };
        "cpu" = { format = " {usage}%"; tooltip = false; };
        "memory" = { format = " {used:0.0f}G"; tooltip = false; };
        "temperature" = { format = " {temperatureC}°C"; hwmon-path = "/sys/class/thermal/thermal_zone0/temp"; };
        "idle_inhibitor" = { format = "{icon}"; format-icons = { activated = ""; deactivated = ""; }; };
        "hyprland/window" = { format = "{}"; max-length = 80; };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = { "1"=""; "2"=""; "3"=""; "4"="󰓇"; "5"="󰈙"; };
          persistent-workspaces = { "*" = [ 1 2 3 4 5 ]; };
        };
        "tray" = { spacing = 8; };
      };
    };
  };
}
