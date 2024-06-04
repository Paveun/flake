{
  config,
  pkgs,
  lib,
  user,
  catppuccin,
  ...
}: {
  imports = [
    ../../themes/wallpaper
    ../../themes/stylix.nix
    # ../../themes/catppuccin.nix
    # ../../themes/gtk.nix
  ];

  stylix.targets.gtk.enable = false;
  stylix.targets.kde.enable = false;

  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde];
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

  home.packages = with pkgs; [
    wl-clipboard
    catppuccin-cursors.frappeRosewater
    (catppuccin-kde.override {
      flavour = ["frappe"];
      accents = ["rosewater"];
      winDecStyles = ["modern"];
    })
    (catppuccin-gtk.override {
      variant = "frappe";
      accents = ["rosewater"];
    })
    (catppuccin-papirus-folders.override {
      flavor = "frappe";
      accent = "rosewater";
    })
  ];

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   package = pkgs.catppuccin-cursors.frappeRosewater;
  #   name = "Catppuccin-Frappe-Rosewater-Cursors";
  # };
}
