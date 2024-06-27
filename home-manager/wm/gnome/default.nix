{pkgs, ...}: {
  imports = [
    ../../themes
  ];
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          caffeine.extensionUuid
          # system-monitor.extensionUuid
          user-themes.extensionUuid
        ];
      };
    };
  };
  home.packages = with pkgs; [
    wl-clipboard
  ];
}
