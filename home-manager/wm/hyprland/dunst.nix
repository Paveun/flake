{config, ...}: {
  services = {
    dunst = {
      enable = true;
      # settings = with config.colorScheme.colors; {
      #   global = {
      #     frame_color = "#${base07}";
      #     separator_color = "frame";
      #   };
      #   urgency_low = {
      #     background = "#${base00}";
      #     foreground = "#${base05}";
      #   };
      #   urgency_normal = {
      #     background = "#${base00}";
      #     foreground = "#${base05}";
      #   };
      #   urgency_critical = {
      #     background = "#${base00}";
      #     foreground = "#${base05}";
      #     frame_color = "#${base09}";
      #   };
      # };
    };
  };
}
