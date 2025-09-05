{ pkgs, ... }:

{
  users.users.dakota = {
    isNormalUser = true;
    description = "Dakota Wilburn";
    extraGroups = [
      "networkmanager"
      "wheel" 
      "docker"
    ];
    shell = pkgs.zsh;
  };
}