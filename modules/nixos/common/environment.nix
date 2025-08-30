{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      fastfetch
      gh
      git
      killall
      mangohud
      neovim
      spotify-player
      unimatrix
      xdg-utils
    ];
    
    defaultPackages = lib.mkForce [
      pkgs.strace
    ];
  };
}