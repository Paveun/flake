{pkgs, ...}: {
  imports = [
    ../../themes/wallpaper
    ../../themes/stylix.nix
    # ../../themes/gtk.nix
  ];

  # stylix.targets.gtk.enable = false;
  # stylix.targets.kde.enable = false;

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
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = "zen.desktop";
        "x-scheme-handler/https" = "zen.desktop";
        "x-scheme-handler/about" = "zen.desktop";
        "x-scheme-handler/unknown" = "zen.desktop";
      };
    };
  };

  home.packages = with pkgs; [
    wl-clipboard
    # catppuccin-cursors.frappeRosewater
    # (catppuccin-kde.override {
    #   flavour = ["frappe"];
    #   accents = ["rosewater"];
    #   winDecStyles = ["modern"];
    # })
    # (catppuccin-gtk.override {
    #   variant = "frappe";
    #   accents = ["rosewater"];
    # })
    # rose-pine-gtk-theme
    # (catppuccin-papirus-folders.override {
    #   flavor = "frappe";
    #   accent = "rosewater";
    # })
  ];
}
