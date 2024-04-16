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
      catppuccin.enable = true;
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
