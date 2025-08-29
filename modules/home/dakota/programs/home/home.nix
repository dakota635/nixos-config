{ ... }:

{
  home.username = "dakota";
  home.homeDirectory = "/home/dakota";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
    TERMINAL = "ghostty";
  };

  home.file.".config/MangoHud/MangoHud.conf".text = ''
    cpu_stats
    gpu_stats
    ram
    vram
    io_read
    io_write
    fps
    frametime
    frametime_graph
    background_alpha=0.3
  '';
}