{
  config,
  pkgs,
  lib,
  user,
  ...
}: {
  imports = [
    ./wofi
    ./waybar
    ./hyprland.nix
    ../../themes
  ];

  home = {
    file = {
      # ".config/hypr/hyprland.conf"={
      #   source = ./hypr/hyprland.conf;
      # };
      ".config/hypr/hyprpaper.conf" = {
        # source = ./hypr/hyprpaper.conf;
        text = ''
          preload = $HOME/.config/wallpaper/default.png
          wallpaper = ,$HOME/.config/wallpaper/default.png
          splash = false
        '';
      };
      ".config/hypr/hyprlock.conf" = {
        source = ./hypr/hyprlock.conf;
      };
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    packages = with pkgs; [
      hyprpaper
      hyprcursor
      hyprlock
      wl-clipboard
      nwg-look
      pavucontrol
      playerctl
      # kdePackages.breeze
      # kdePackages.qtwayland
      # qt6Packages.qt6ct
      # libsForQt5.qt5.qtgraphicaleffects
      feh
    ];
  };

  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
      xdgOpenUsePortal = true;
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  services = {
    network-manager-applet.enable = true;
    playerctld.enable = true;
    cliphist.enable = true;
    udiskie = {
      enable = true;
      automount = true;
      tray = "never";
    };
    dunst = {
      enable = true;
      settings = with config.colorScheme.colors; {
        global = {
          frame_color = "#${base07}";
          separator_color = "frame";
        };
        urgency_low = {
          background = "#${base00}";
          foreground = "#${base05}";
        };
        urgency_normal = {
          background = "#${base00}";
          foreground = "#${base05}";
        };
        urgency_critical = {
          background = "#${base00}";
          foreground = "#${base05}";
          frame_color = "#${base09}";
        };
      };
    };
  };

  # programs = {
  #   swaylock = {
  #     enable = true;
  #     catppuccin.enable = true;
  #   };
  # };

  # gtk = {
  #   enable = true;
  #   font = {
  #     name = "Roboto";
  #     package = pkgs.roboto;
  #   };
  #   cursorTheme = {
  #     name = "frappeRosewater";
  #     package = pkgs.catppuccin-cursors.frappeRosewater;
  #   };
  #   # iconTheme = {
  #   #   name = "Catppuccin-Frappe-Rosewater-Icons";
  #   #   package = pkgs.catppuccin-papirus-folders.override {
  #   #     flavor = "frappe";
  #   #     accent = "rosewater";
  #   #   };
  #   # };
  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };
  #   theme = {
  #     name = "Catppuccin-Frappe-Compact-Rosewater-Dark";
  #     package = pkgs.catppuccin-gtk.override {
  #       accents = [ "rosewater" ];
  #       size = "compact";
  #       tweaks = [ "rimless" ];
  #       variant = "frappe";
  #     };
  #   };
  #   # iconTheme = {
  #   #   name = "Papirus-Dark";
  #   #   package = pkgs.papirus-icon-theme;
  #   # };
  # };
}
