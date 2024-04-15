{ config, pkgs, lib, user, ... }:

{
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
      ".config/hypr/hyprpaper.conf"={
        # source = ./hypr/hyprpaper.conf;
        text = ''
          preload = $HOME/.config/wallpaper/default.png
          wallpaper = ,$HOME/.config/wallpaper/default.png
          splash = false
        '';
      };
      ".config/hypr/hyprlock.conf"={
        source = ./hypr/hyprlock.conf;
      };
    };
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.catppuccin-cursors.frappeRosewater;
      name = "Catppuccin-Frappe-Rosewater-Cursors";
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    packages = with pkgs; [
      hyprpaper
      hyprcursor
      hyprlock
      nwg-look
      pavucontrol
      playerctl
      kdePackages.breeze
      kdePackages.qtwayland
      qt6Packages.qt6ct
      # libsForQt5.qt5.qtgraphicaleffects
      feh
    ];
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
  
  qt = {
    enable = true;
    platformTheme = "gtk";
  };
  
  services = 
  {
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
