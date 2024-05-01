{
  config,
  pkgs,
  lib,
  user,
  catppuccin,
  ...
}: {
  programs = {
    alacritty = {
      enable = true;
      # catppuccin.enable = true;
      settings = {
        env = {
          TERM = "alacritty";
          WINIT_X11_SCALE_FACTOR = "1.0";
        };
        window = {
          dynamic_padding = true;
          opacity = 0.95;
          title = "Alacritty";
          dimensions = {
            columns = 110;
            lines = 30;
          };
          padding = {
            x = 6;
            y = 6;
          };
          class = {
            general = "Alacritty";
            instance = "Alacritty";
          };
        };
        font = {
          size = 10;
          offset = {
            x = 0;
            y = 1;
          };
          normal = {
            family = "JetBrains Mono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "JetBrains Mono Nerd Font";
            style = "Bold";
          };
          bold_italic = {
            family = "JetBrains Mono Nerd Font";
            style = "Bold Italic";
          };
          italic = {
            family = "JetBrains Mono Nerd Font";
            style = "Italic";
          };
        };
        colors = with config.colorScheme.colors; {
          bright = {
            black = "#${base04}";
            blue = "#${base0D}";
            cyan = "#${base0C}";
            green = "#${base0B}";
            magenta = "#${base0E}";
            red = "#${base08}";
            white = "#${base07}";
            yellow = "#${base0A}";
          };
          dim = {
            black = "#${base03}";
            blue = "#${base0D}";
            cyan = "#${base0C}";
            green = "#${base0B}";
            magenta = "#${base0E}";
            red = "#${base08}";
            white = "#${base07}";
            yellow = "#${base0A}";
          };
          normal = {
            black = "#${base03}";
            blue = "#${base0D}";
            cyan = "#${base0C}";
            green = "#${base0B}";
            magenta = "#${base0E}";
            red = "#${base08}";
            white = "#${base07}";
            yellow = "#${base0A}";
          };
          primary = {
            background = "#${base00}";
            bright_foreground = "#${base05}";
            dim_foreground = "#${base05}";
            foreground = "#${base05}";
          };
          cursor = {
            cursor = "#${base06}";
            text = "#${base00}";
          };
          footer_bar = {
            background = "#${base07}";
            foreground = "#${base00}";
          };
          hints.end = {
            background = "#${base07}";
            foreground = "#${base00}";
          };
          hints.start = {
            background = "#${base0A}";
            foreground = "#${base00}";
          };
          search.focused_match = {
            background = "#${base0B}";
            foreground = "#${base00}";
          };
          search.matches = {
            background = "#${base07}";
            foreground = "#${base00}";
          };
          selection = {
            background = "#${base06}";
            text = "#${base00}";
          };
          vi_mode_cursor = {
            background = "#${base07}";
            foreground = "#${base00}";
          };
          indexed_colors = [
            {
              color = "#${base09}";
              index = 16;
            }
            {
              color = "#${base06}";
              index = 17;
            }
          ];
        };
      };
    };
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
  };

  xresources.properties = {
    "Xft.dpi" = 96;
  };
}
