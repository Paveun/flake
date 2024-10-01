{pkgs, ...}: {
  imports = [
    ../../themes
  ];
  dconf = {
    enable = true;
    settings = {
      # "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          caffeine.extensionUuid
          user-themes.extensionUuid
          alphabetical-app-grid.extensionUuid
        ];
      };
      # "org.gnome.mutter" = {
      #   check-alive-timeout = 15000;
      # };
    };
  };
  home.packages = with pkgs; [
    wl-clipboard
  ];
}
