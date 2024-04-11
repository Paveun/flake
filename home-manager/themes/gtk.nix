{ config, pkgs, lib, user, catppuccin, ... }:

{
  gtk = {
    enable = true;
    font = {
      name = "Roboto";
      package = pkgs.roboto;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Catppuccin-Frappe-Rosewater-Cursors";
      package = pkgs.catppuccin-cursors.frappeRosewater;
    };
    catppuccin = {
      enable = true;
      size = "compact";
    };
  };
}
