{ lib, ... }:

{
  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
    
    settings = {
      alpha = lib.mkForce 1.0;
      background_alpha = lib.mkForce 0.0;

      # GPU data
      gpu_text = "GPU";
      gpu_stats = true;
      vram = true;
      ram = true;
      gpu_core_clock = true;
      gpu_mem_clock = true;
      gpu_temp = true;

      # CPU data
      cpu_text = "CPU";
      cpu_stats = true;
      core_load = true;
      core_bars = true;
      cpu_mhz = true;
      cpu_temp = true;

      # Game data
      fps = true;
      engine_version = true;

      # Misc data
      engine_short_names = true;
      vulkan_driver = true;
      frame_timing = true;

      # Font settings
      no_small_font = true;

      # HUD settings
      hud_no_margin = true;
      table_columns = 4;
    };
  };
}