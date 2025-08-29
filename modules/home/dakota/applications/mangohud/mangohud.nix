{ lib, ... }:

{
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    
    settings = {
      cpu_stats = true;
      gpu_stats = true;
      ram = true;
      vram = true;
      fps = true;
      frametime = true;
      frametime_graph = true;
      throttling_status = true;
      throttling_status_graph = true;
      background_alpha = lib.mkForce 0.5;
    };
  };
}