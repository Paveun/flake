{ config, pkgs, lib, user, ... }:

{
 home.file = {
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
  services.network-manager-applet.enable = true;
}