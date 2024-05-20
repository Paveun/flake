{
  config,
  pkgs,
  user,
  lib,
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
          # opacity = 0.95;
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
          # size = 10;
          offset = {
            x = 0;
            y = 1;
          };
          # normal = {
          #   family = "JetBrains Mono Nerd Font";
          #   style = "Regular";
          # };
          # bold = {
          #   family = "JetBrains Mono Nerd Font";
          #   style = "Bold";
          # };
          # bold_italic = {
          #   family = "JetBrains Mono Nerd Font";
          #   style = "Bold Italic";
          # };
          # italic = {
          #   family = "JetBrains Mono Nerd Font";
          #   style = "Italic";
          # };
        };
        # colors = with config.lib.stylix.colors; {
        #   bright = {
        #     black = lib.mkForce "#${base04}";
        #     blue = lib.mkForce "#${base0D}";
        #     cyan = lib.mkForce "#${base0C}";
        #     green = lib.mkForce "#${base0B}";
        #     magenta = lib.mkForce "#${base0E}";
        #     red = lib.mkForce "#${base08}";
        #     white = lib.mkForce "#${base07}";
        #     yellow = lib.mkForce "#${base0A}";
        #   };
        #   dim = {
        #     black = lib.mkForce "#${base03}";
        #     blue = lib.mkForce "#${base0D}";
        #     cyan = lib.mkForce "#${base0C}";
        #     green = lib.mkForce "#${base0B}";
        #     magenta = lib.mkForce "#${base0E}";
        #     red = lib.mkForce "#${base08}";
        #     white = lib.mkForce "#${base07}";
        #     yellow = lib.mkForce "#${base0A}";
        #   };
        #   normal = {
        #     black = lib.mkForce "#${base03}";
        #     blue = lib.mkForce "#${base0D}";
        #     cyan = lib.mkForce "#${base0C}";
        #     green = lib.mkForce "#${base0B}";
        #     magenta = lib.mkForce "#${base0E}";
        #     red = lib.mkForce "#${base08}";
        #     white = lib.mkForce "#${base07}";
        #     yellow = lib.mkForce "#${base0A}";
        #   };
        #   primary = {
        #     background = lib.mkForce "#${base00}";
        #     bright_foreground = lib.mkForce "#${base05}";
        #     dim_foreground = lib.mkForce "#${base05}";
        #     foreground = lib.mkForce "#${base05}";
        #   };
        #   cursor = {
        #     cursor = lib.mkForce "#${base06}";
        #     text = lib.mkForce "#${base00}";
        #   };
        #   footer_bar = {
        #     background = lib.mkForce "#${base07}";
        #     foreground = lib.mkForce "#${base00}";
        #   };
        #   hints.end = {
        #     background = lib.mkForce "#${base07}";
        #     foreground = lib.mkForce "#${base00}";
        #   };
        #   hints.start = {
        #     background = lib.mkForce "#${base0A}";
        #     foreground = lib.mkForce "#${base00}";
        #   };
        #   search.focused_match = {
        #     background = lib.mkForce "#${base0B}";
        #     foreground = lib.mkForce "#${base00}";
        #   };
        #   search.matches = {
        #     background = lib.mkForce "#${base07}";
        #     foreground = lib.mkForce "#${base00}";
        #   };
        #   selection = {
        #     background = lib.mkForce "#${base06}";
        #     text = lib.mkForce "#${base00}";
        #   };
        #   vi_mode_cursor = {
        #     background = lib.mkForce "#${base07}";
        #     foreground = lib.mkForce "#${base00}";
        #   };
        #   indexed_colors = [
        #     {
        #       color = lib.mkForce "#${base09}";
        #       index = 16;
        #     }
        #     {
        #       color = lib.mkForce "#${base06}";
        #       index = 17;
        #     }
        #   ];
        # };
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
