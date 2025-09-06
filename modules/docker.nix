{ config, ... }:

{
  config = {
    nixosModules = {
    virtualisation.docker = {
        enable = true;
      
        # Resource limits
        daemon.settings = {
          experimental = true;
          default-address-pools = [
            {
              base = "172.30.0.0/16";
              size = 24;
            }
          ];
        };
      };
    };
  };
}