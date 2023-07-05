{ config, pkgs, lib, user, ... }:

{
 home.file = {
    ".config/hypr/hyprland.conf"={
      source = ./hyprland.conf;
    };
    ".config/hypr/hyprpaper.conf"={
      source = ./hyprpaper.conf;
    };
    ".config/waybar/config"={
      source = ../waybar/config;
    };
    ".config/waybar/style.css"={
      source = ../waybar/style.css;
    };
    ".config/wallpapers/mountain.jpg"={
      source = ../../resources/mountain.jpg;
    };
    ".config/wallpapers/mountain2.jpg"={
      source = ../../resources/mountain2.jpg;
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