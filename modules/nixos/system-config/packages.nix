{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      # System
      brightnessctl
      feh
      gh
      git
      killall
      neovim
      tree
      xdg-utils
      xorg.xinit

      # Java
      jdk

      # Python
      python3
      python3Packages.jupyter
      python3Packages.ipykernel
    ];
    
    defaultPackages = lib.mkForce [
      pkgs.strace
    ];
  };
}