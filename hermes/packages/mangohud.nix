{ inputs, pkgs, ... }: {

  programs.mangohud = {
    enable = true;
    settings = {
      gamemode = "";
      pci_dev = "0000:03:00.0";
      legacy_layout = false;
      offset_x = 3;
      offset_y = 0;
      gpu_stats = true;
      gpu_temp = true;
      throttling_status = true;
      cpu_stats = true;
      cpu_temp = true;
      fps = true;
      resolution = true;
      hud_compact = true;
      log_duration = 30;
      log_interval = 100;
      fps_limit_method = "late";
      vsync = 0;
      gl_vsync = -1;
      round_corners = 0;
      background_alpha = 0.0;
      alpha = 0.25;
      position = "top-left";
      table_columns = 3;
      font_size = 20;
      fps_sampling_period = 500;
      gpu_color = "ffffff";
      cpu_color = "ffffff";
      fps_value = "30,60";
      fps_color = "ffffff";
      frametime_color = "ffffff";
      vram_color = "ffffff";
      ram_color = "ffffff";
      wine_color = "ffffff";
      engine_color = "ffffff";
      text_color = "ffffff";
      media_player_color = "ffffff";
      network_color = "ffffff";
    };
  };
}
