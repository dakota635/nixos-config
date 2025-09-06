{ config, ... }:

{
  config = {
    homeManagerModules = {
      programs.yazi = {
        enable = true;
      };
    };
  };
}
