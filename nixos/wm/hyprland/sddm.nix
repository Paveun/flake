{pkgs, ...}: {
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        # theme = "${(pkgs.fetchFromGitHub {
        #   owner = "rototrash";
        #   repo = "tokyo-night-sddm";
        #   rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
        #   sha256 = "JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
        # })}";
      };
      defaultSession = "hyprland";
    };
    gnome.gnome-keyring.enable = true;
  };

  security.pam.services.sddm.enableGnomeKeyring = true;
}
