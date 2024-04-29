{
  pkgs,
  ...
}: {
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-sddm-corners";
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
  environment = {
    systemPackages = with pkgs; [
      # libsForQt5.qt5.qtgraphicaleffects
      catppuccin-sddm-corners
    ];
    # sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
