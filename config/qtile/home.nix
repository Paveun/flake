{ config, pkgs, lib, user, ... }:

{
 home.file = {
    ".config/wallpapers/mountain.jpg"={
      source = ../../resources/mountain.jpg;
    };
    ".config/wallpapers/mountain2.jpg"={
      source = ../../resources/mountain2.jpg;
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