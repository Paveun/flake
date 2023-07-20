{ config, pkgs, lib, user, ... }:

{
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