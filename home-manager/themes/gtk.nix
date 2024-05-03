{
  config,
  pkgs,
  lib,
  user,
  ...
}: {
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
    # cursorTheme = {
    #   name = "Catppuccin-Frappe-Rosewater-Cursors";
    #   package = pkgs.catppuccin-cursors.frappeRosewater;
    # };
    catppuccin = {
      enable = true;
      flavour = "frappe";
      accent = "rosewater";
      size = "compact";
      tweaks = [ "normal" ];
      cursor = {
        enable = true;
        accent = "rosewater";
      };
    };
  };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
