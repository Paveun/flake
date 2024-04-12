{ config, pkgs, lib, user, ... }:

{
  imports = [
    ./wofi
    ./waybar
  ];

  home.file = {
    ".config/hypr/hyprland.conf"={
      source = ./hypr/hyprland.conf;
    };
    ".config/hypr/hyprpaper.conf"={
      source = ./hypr/hyprpaper.conf;
    };
  };
  
  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
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
  
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.frappeRosewater;
    name = "Catppuccin-Frappe-Rosewater-Cursors";
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
    hyprpaper
    hyprcursor
    nwg-look
    pavucontrol
    playerctl
    # kdePackages.dolphin
    kdePackages.breeze
    kdePackages.qtwayland
    qt6Packages.qt6ct
    # libsForQt5.qt5.qtgraphicaleffects
    # qt6.qtwayland
    # fluent-icon-theme
    # kora-icon-theme
    feh
  ];

  services = 
  {
    network-manager-applet.enable = true;
    playerctld.enable = true;
    udiskie = {
      enable = true;
      automount = true;
    };
    dunst = {
      enable = true;
      settings = {
        global = {
          frame_color = "#8caaee";
          separator_color = "frame";
        };
        urgency_low = {
          background = "#303446";
          foreground = "#c6d0f5";
        };
        urgency_normal = {
          background = "#303446";
          foreground = "#c6d0f5";
        };
        urgency_critical = {
          background = "#303446";
          foreground = "#c6d0f5";
          frame_color = "#ef9f76";
        };
      };
    };
  };

  programs = {
    swaylock = {
      enable = true;
    };
  };

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
