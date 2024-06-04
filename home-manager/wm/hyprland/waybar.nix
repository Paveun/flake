{config, ...}: {
  home.file = {
    # ".config/waybar/config" = {
    #   source = ./config;
    # };
    # ".config/waybar/style.css" = {
    #   source = ./style.css;
    # };
  };
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top"; # Waybar at top layer
        position = "top"; # Waybar position (top|bottom|left|right)
        height = 30; # Waybar height (to be removed for auto height)
        # width = 1280; # Waybar width
        spacing = 4; # Gaps between modules (4px)
        modules-left = ["hyprland/workspaces" "hyprland/mode" "custom/playerctl#backward" "custom/playerctl#play" "custom/playerctl#forward" "custom/playerctl#label"];
        modules-center = ["hyprland/window"];
        modules-right = ["pulseaudio" "network" "cpu" "memory" "temperature" "backlight" "battery" "battery#bat2" "clock" "tray"];
        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        "hyprland/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        tray = {
          # icon-size = 21;
          spacing = 10;
        };
        clock = {
          # timezone = "America/New_York";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };
        temperature = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };
        backlight = {
          # device = "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        battery = {
          states = {
            # good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          # format-good = ""; # An empty format will hide the module
          # format-full = "";
          format-icons = ["" "" "" "" ""];
        };
        "battery#bat2" = {
          bat = "BAT2";
        };
        network = {
          # interface = "wlp2*"; # (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          # scroll-step = 1; # %, can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };
        "custom/playerctl#backward" = {
          format = "󰙣 ";
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          return-type = "json";
          on-click = "playerctl previous";
          on-scroll-up = "playerctl volume .05+";
          on-scroll-down = "playerctl volume .05-";
        };
        "custom/playerctl#play" = {
          format = "{icon}";
          return-type = "json";
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          on-click = "playerctl play-pause";
          on-scroll-up = "playerctl volume .05+";
          on-scroll-down = "playerctl volume .05-";
          format-icons = {
            Playing = "<span>󰏥 </span>";
            Paused = "<span> </span>";
            Stopped = "<span> </span>";
          };
        };
        "custom/playerctl#forward" = {
          format = "󰙡 ";
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          return-type = "json";
          on-click = "playerctl next";
          on-scroll-up = "playerctl volume .05+";
          on-scroll-down = "playerctl volume .05-";
        };
        "custom/playerctl#label" = {
          format = "<span>󰎈 {} 󰎈</span>";
          return-type = "json";
          max-length = 40;
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          on-click = "";
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetbrainsMono Nerd Font Mono";
        font-size: 13px;
        min-height: 0;
      }
      window#waybar {
        /*background: transparent;*/
        background: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base05};
      }
      #window {
        /* color: #${config.lib.stylix.colors.base0F}; */
        color: #${config.lib.stylix.colors.base0A};
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
        color: #${config.lib.stylix.colors.base05};
        border-top: 3px solid transparent;
        border-bottom: 3px solid transparent;
      }
      #workspaces button:hover {
        border-bottom: 3px solid #${config.lib.stylix.colors.base05};
      }
      #workspaces button.active {
        color: #${config.lib.stylix.colors.base08};
        /* border-top: 3px solid #${config.lib.stylix.colors.base08}; */
        border-bottom: 3px solid #${config.lib.stylix.colors.base08};
      }
      #mode {
        background: #${config.lib.stylix.colors.base04};
        border-bottom: 3px solid #${config.lib.stylix.colors.base05};
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
        color: #${config.lib.stylix.colors.base08};
      }
      #battery.charging {
      }
      @keyframes blink {
        to {
          background-color: #${config.lib.stylix.colors.base06};
          color: #${config.lib.stylix.colors.base08};
        }
      }
      #battery.warning:not(.charging) {
        color: #${config.lib.stylix.colors.base07};
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
        background: #${config.lib.stylix.colors.base08};
      }
      #pulseaudio {
      }
      #pulseaudio.muted {
      }
      #custom-media {
        color: #${config.lib.stylix.colors.base0B};
      }
      #custom-playerctl {
        color: #${config.lib.stylix.colors.base0B};
      }
      #tray {
      }
    '';
  };
}
