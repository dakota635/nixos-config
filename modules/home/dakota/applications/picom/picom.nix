{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    package = pkgs.picom;

    settings = {
      # Rounded corners
      corner-radius = 12;
      round-borders = 1;

      # Transparency
      inactive-opacity = 0.85;
      active-opacity   = 1.0;
      frame-opacity    = 1.0;

      # Shadows
      shadow = true;
      shadow-radius = 12;
      shadow-opacity = 0.5;

      # Fade animations
      fading = true;
      fade-in-step = 0.03;
      fade-out-step = 0.03;
    };
  };
}
