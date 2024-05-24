{pkgs, ...}: {
  imports = [
    # ./sddm.nix
    ./gdm.nix
  ];
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services = {
    gvfs.enable = true;
    udisks2.enable = true;
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
  };
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
