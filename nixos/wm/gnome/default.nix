{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };
      desktopManager.gnome.enable = true;
    };
    displayManager = {
      defaultSession = "gnome";
    };
    dbus.packages = with pkgs; [gnome2.GConf];
  };
  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    caffeine
    alphabetical-app-grid
  ];
  environment.sessionVariables.MUTTER_DEBUG_KMS_THREAD_TYPE = "user";
}
