{ pkgs, lib, config, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;

    config = rec {
      modifier = "Mod4";

      bars = [
        (
          {
            position = "top";
          }
          // config.stylix.targets.i3.exportedBarConfig
        )
      ];
      window.border = 0;

      gaps = {
        inner = 15;
        outer = 5;
      };

      keybindings = lib.mkOptionDefault {

        # Applications
        "${modifier}+Return"    = "exec ${pkgs.ghostty}/bin/ghostty";
        "${modifier}+d"         = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
        "${modifier}+Shift+d"   = "exec ${pkgs.rofi}/bin/rofi -show window";

        # System
        "${modifier}+Shift+x"   = "exec systemctl suspend";
      };

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ${config.stylix.image}";
          always = true;
          notification = false;
        }
      ];
    };
  };
}