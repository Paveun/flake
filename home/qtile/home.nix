{ config, pkgs, lib, user, ... }:

{
 home.file = {
    ".config/wallpapers/wallpaper.jpg"={
      source = ../wallpaper.jpg;
    };
    ".config/qtile/config.py"={
      source = ./config.py;
    };
    ".config/qtile/autostart.sh"={
      source = ./autostart.sh;
    };
    ".config/qtile/icons"={
      source = ./icons;
    };
  };
}