{pkgs, ...}: {
  imports = [
    # ./sddm.nix
    ./gdm.nix
  ];
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    # gnome.gnome-keyring.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
  security.pam.services = {
    hyprlock = {};
    # sddm.enableGnomeKeyring = true;
    # sddm.kwallet.enable = true;
  };
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
