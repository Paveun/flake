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
        colors = {};
        colors.bright = with config.colorScheme.colors; {
          black = "#${base04}";
          blue = "#${base0D}";
          cyan = "#${base0C}";
          green = "#${base0B}";
          magenta = "#${base0E}";
          red = "#${base08}";
          white = "#${base07}";
          yellow = "#${base0A}";
        };
        colors.dim = with config.colorScheme.colors; {
          black = "#${base03}";
          blue = "#${base0D}";
          cyan = "#${base0C}";
          green = "#${base0B}";
          magenta = "#${base0E}";
          red = "#${base08}";
          white = "#${base07}";
          yellow = "#${base0A}";
        };
        colors.normal = with config.colorScheme.colors; {
          black = "#${base03}";
          blue = "#${base0D}";
          cyan = "#${base0C}";
          green = "#${base0B}";
          magenta = "#${base0E}";
          red = "#${base08}";
          white = "#${base07}";
          yellow = "#${base0A}";
        };
        colors.primary = with config.colorScheme.colors; {
          background = "#${base00}";
          bright_foreground = "#${base05}";
          dim_foreground = "#${base05}";
          foreground = "#${base05}";
        };
        colors.cursor = with config.colorScheme.colors; {
          cursor ="#${base06}";
          text = "#${base00}";
        };
        colors.footer_bar = with config.colorScheme.colors; {
          background = "#${base07}";
          foreground = "#${base00}";
        };
        colors.hints.end = with config.colorScheme.colors; {
          background = "#${base07}";
          foreground = "#${base00}";
        };
        colors.hints.start = with config.colorScheme.colors; {
          background = "#${base0A}";
          foreground = "#${base00}";
        };
        colors.search.focused_match = with config.colorScheme.colors; {
          background = "#${base0B}";
          foreground = "#${base00}";
        };
        colors.search.matches = with config.colorScheme.colors; {
          background = "#${base07}";
          foreground = "#${base00}";
        };
        colors.selection = with config.colorScheme.colors; {
          background = "#${base06}";
          text = "#${base00}";
        };
        colors.vi_mode_cursor = with config.colorScheme.colors; {
          background = "#${base07}";
          foreground = "#${base00}";
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
