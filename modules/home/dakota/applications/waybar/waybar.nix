{ lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        margin = "6 0 0 0";
        modules-left   = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right  = [
          "cava" 
          "wireplumber"
          "network"
          "temperature"
          "cpu"
          "memory"
          "battery"
          "bluetooth"
          "idle_inhibitor"
        ];

        "clock" = { format = "{:%a %b %d  %H:%M}"; tooltip-format = "{:%F %T}"; };
        "wireplumber" = {
          format = "   {volume}%";
          format-muted = " 󰖁";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-up = "wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        };
        "network" = { format-wifi = "󰤨  {signalStrength}%"; format-ethernet = "󰈁"; format-disconnected = "󰤮"; tooltip = true; };
        "bluetooth" = { format = ""; format-connected = " {device_alias}"; };
        "battery" = {
          format = "{icon} {capacity}%";
          states = { critical = 15; warning = 30; };
          format-icons = [
            "󰂎" # 0–10%
            "󰁺" # 10–20%
            "󰁻" # 20–30%
            "󰁼" # 30–40%
            "󰁽" # 40–50%
            "󰁾" # 50–60%
            "󰁿" # 60–70%
            "󰂀" # 70–80%
            "󰂁" # 80–90%
            "󰂂" # 90–100%
            "󰁹" # charging
          ];
        };
        "cpu" = { format = "  {usage}%"; tooltip = false; };
        "memory" = { format = "  {used:0.0f}G"; tooltip = false; };
        "temperature" = { format = " {temperatureC}°C"; hwmon-path = "/sys/class/thermal/thermal_zone0/temp"; };
        "idle_inhibitor" = {format = "{icon}"; format-icons = { activated = " "; deactivated = " "; }; };
        "hyprland/window" = { format = "{}"; max-length = 80; };
        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = { "1"=""; "2"=""; "3"=""; "4"="󰓇"; "5"="󰈙"; };
          persistent-workspaces = { "*" = [ 1 2 3 4 5 ]; };
        };
        "cava" = import ./waybar-cava.nix { };
      };
    };
  };
}
