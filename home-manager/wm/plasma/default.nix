{ config, pkgs, lib, user, catppuccin, ... }:

{
  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde];
      xdgOpenUsePortal = true;
      config = {
        common = {
          default = [
            "kde"
          ];
        };
      };
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.frappeRosewater;
    name = "Catppuccin-Frappe-Rosewater-Cursors";
  };
}
