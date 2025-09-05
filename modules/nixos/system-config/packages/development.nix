{ pkgs, lib, ... }: 

{
  environment = {
    systemPackages = with pkgs; [
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