{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    dbus.packages = with pkgs; [gnome2.GConf];
  };
  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
  ];
}
