{config, ...}: {
  home.file = {
    ".config/waybar/config" = {
      source = ./config;
    };
    # ".config/waybar/style.css" = {
    #   source = ./style.css;
    # };
  };

  programs.waybar = {
    enable = true;
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }
      window#waybar {
        /*background: transparent;*/
        background: #${config.colorscheme.colors.base00};
        color: #${config.colorscheme.colors.base05};
      }
      #window {
        color: #${config.colorscheme.colors.base0F};
        font-weight: bold;
        font-family: "Roboto";
      }
      /*
      #workspaces {
          padding: 0 5px;
      }
      */
      #workspaces button {
        padding: 0 5px;
        background: transparent;
        color: #${config.colorscheme.colors.base05};
        border-top: 2px solid transparent;
      }
      #workspaces button.active {
        color: #${config.colorscheme.colors.base08};
        border-top: 2px solid #${config.colorscheme.colors.base08};
      }
      #mode {
        background: #${config.colorscheme.colors.base04};
        border-bottom: 3px solid white;
      }
      #clock,
      #battery,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #custom-media,
      #tray,
      #custom-playerctl
      #backlight
      #battery
      #temperature
      #mode {
        padding: 0 3px;
        margin: 0 2px;
      }
      #clock {
        font-weight: bold;
      }
      #battery {
      }
      #battery icon {
        color: #${config.colorscheme.colors.base08};
      }
      #battery.charging {
      }
      @keyframes blink {
        to {
          background-color: #${config.colorscheme.colors.base06};
          color: #${config.colorscheme.colors.base08};
        }
      }
      #battery.warning:not(.charging) {
        color: #${config.colorscheme.colors.base07};
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      #cpu {
      }
      #memory {
      }
      #network {
      }
      #network.disconnected {
        background: #${config.colorscheme.colors.base08};
      }
      #pulseaudio {
      }
      #pulseaudio.muted {
      }
      #custom-media {
        color: #${config.colorscheme.colors.base0B};
      }
      #custom-playerctl {
        color: #${config.colorscheme.colors.base0B};
      }
      #tray {
      }
    '';
  };
}
