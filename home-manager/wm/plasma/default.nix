{ config, pkgs, lib, user, catppuccin, ... }:

{
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

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.frappeRosewater;
    name = "Catppuccin-Frappe-Rosewater-Cursors";
  };
}
