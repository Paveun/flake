{ config, pkgs, lib, user, ... }:

{
  home.file = {
    ".config/hypr/hyprland.conf"={
      source = ./hypr/hyprland.conf;
    };
    ".config/hypr/hyprpaper.conf"={
      source = ./hypr/hyprpaper.conf;
    };
    ".config/waybar/config"={
      source = ./waybar/config;
    };
    ".config/waybar/style.css"={
      source = ./waybar/style.css;
    };
    ".config/waybar/mediaplayer.py"={
      source = ./waybar/mediaplayer.py;
    };
    ".config/wofi/config"={
      source = ./wofi/config;
    };
    ".config/wofi/style.css"={
      source = ./wofi/style.css;
    };
    # ".config/bottom/bottom.toml"={
    #   source = ./bottom/bottom.toml;
    # };
  };
  
  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
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
  
  home.pointerCursor.gtk.enable = true;
  home.pointerCursor.package = pkgs.catppuccin-cursors.frappeRosewater;
  home.pointerCursor.name = "Catppuccin-Frappe-Rosewater-Cursors";
  
  home.packages = with pkgs; [
    feh
  ];

  services.dunst = {
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

  # xdg.configFile = {
  #   "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
  #   "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
  #   "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  # };

  # xdg.desktopEntries = {
  #   chrome = {
  #     comment = "Google Chrome web browser";
  #     exec = "google-chrome-stable --enable-accelerated-video-decode --enable-features=UseOzonePlatform --ozone-platform=wayland";
  #     genericName = "Google Chrome";
  #     icon = "google-chrome-stable";
  #     name = "Google Chrome";
  #     type = "Application";
  #   };
  # };
}
