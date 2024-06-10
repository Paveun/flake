{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
        defaultSession = "gnome";
      };
      desktopManager.gnome.enable = true;
    };
    dbus.packages = with pkgs; [gnome2.GConf];
  };
  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
  ];
  environment.sessionVariables.MUTTER_DEBUG_KMS_THREAD_TYPE = "user";
}
