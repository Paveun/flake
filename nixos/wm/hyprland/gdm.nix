{pkgs, ...}: {
  services = {
    displayManager = {
      gdm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "hyprland";
    };
    gnome.gnome-keyring.enable = true;
  };

  security.pam.services.gdm.enableGnomeKeyring = true;
}
