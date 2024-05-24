{pkgs, ...}: {
  services = {
    xserver.displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };
    displayManager.defaultSession = "hyprland";
    gnome.gnome-keyring.enable = true;
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
}
