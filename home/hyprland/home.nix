{ config, pkgs, lib, user, ... }:

{
  home.packages = with pkgs; [
    feh
  ];
  home.file = {
    ".config/hypr/hyprland.conf"={
      source = ./hyprland.conf;
    };
    ".config/hypr/hyprpaper.conf"={
      source = ./hyprpaper.conf;
    };
  };
  gtk = {
    enable = true;
    font.name = "Roboto";
    theme = {
      name = "Juno";
      package = pkgs.juno-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  xdg.desktopEntries = {
    chrome = {
      comment = "Google Chrome web browser";
      exec = "google-chrome-stable --enable-accelerated-video-decode --enable-features=UseOzonePlatform --ozone-platform=wayland";
      genericName = "Google Chrome";
      icon = "google-chrome-stable";
      name = "Google Chrome";
      type = "Application";
    };
  };
}