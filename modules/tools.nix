{ pkgs, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      ghostty
      rofi
    ];
  };
}

