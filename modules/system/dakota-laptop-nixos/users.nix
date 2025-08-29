{
  pkgs,
  inputs,
  username,
  host,
  ...
}:

{
  users.users.dakota = {
    isNormalUser = true;
    description = "Dakota Wilburn";
    extraGroups = [
      "networkmanager"
      "wheel" 
      "docker"
    ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}