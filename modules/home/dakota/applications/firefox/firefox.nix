{ ... }:

{
  programs.firefox = {
    enable = true;
    profiles.dakota = {
      id = 0;
      name = "dakota";
      isDefault = true;
      extensions.force = true;
    };
  };


  stylix.targets.firefox.profileNames = [ "dakota" ];
}
