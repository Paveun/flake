{
  config,
  pkgs,
  lib,
  user,
  ...
}: {
  # home.pointerCursor = {
  #   gtk.enable = true;
  #   package = pkgs.catppuccin-cursors.frappeRosewater;
  #   name = "Catppuccin-Frappe-Rosewater-Cursors";
  #   size = 24;
  # };
  gtk = {
    enable = true;
    # font = {
    #   name = "Roboto";
    #   package = pkgs.roboto;
    # };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "frappe";
        accent = "rosewater";
      };
    };
    # cursorTheme = {
    #   name = "Catppuccin-Frappe-Rosewater-Cursors";
    #   package = pkgs.catppuccin-cursors.frappeRosewater;
    # };
    # theme = {
    #   name = "Catppuccin-Frappe-Compact-Rosewater-Dark";
    #   package = pkgs.catppuccin-gtk.override {
    #     variant = "frappe";
    #     accents = ["rosewater"];
    #     size = "compact";
    #     tweaks = ["normal"];
    #   };
    # };
    # catppuccin = {
    #   enable = true;
    #   flavour = "frappe";
    #   accent = "rosewater";
    #   size = "compact";
    #   tweaks = [ "normal" ];
    #   # cursor = {
    #   #   enable = true;
    #   #   accent = "rosewater";
    #   # };
    # };
  };
}
