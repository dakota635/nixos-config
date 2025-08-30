{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
      gh
      git
      killall
      neovim
      xdg-utils
    ];
    
    defaultPackages = lib.mkForce [
      pkgs.strace
    ];
  };
}