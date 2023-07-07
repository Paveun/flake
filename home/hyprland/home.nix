{ config, pkgs, lib, user, ... }:

{
 home.file = {
    ".config/hypr/hyprland.conf"={
      source = ./hyprland.conf;
    };
    ".config/hypr/hyprpaper.conf"={
      source = ./hyprpaper.conf;
    };
    ".config/wallpapers/wallpaper.jpg"={
      source = ../wallpaper.jpg;
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