{ ... }:

{
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "dakota";
    homeDirectory = "/home/dakota";
    stateVersion = "25.11";

    sessionVariables = {
      EDITOR = "vim";
      TERMINAL = "ghostty";
      VISUAL = "vim";
    };
  };
}