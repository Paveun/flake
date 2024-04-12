{ config, pkgs, user, lib, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland ];
  # };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    displayManager = {
      sddm = {
        enable = true;
        theme = "${(pkgs.fetchFromGitHub {
          owner = "rototrash";
          repo = "tokyo-night-sddm";
          rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
          sha256 = "JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
        })}";
      };
      defaultSession = "hyprland";
    };
  };

  qt.style = "gtk";
  qt.platformTheme = "qt6ct";
  
  security.pam.services.sddm.enableKwallet = true;
  security.pam.services.swaylock = {};
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  environment = {
    systemPackages = with pkgs; [
      hyprpaper
      hyprcursor
      nwg-look
      pavucontrol
      networkmanagerapplet
      playerctl
      swaylock-effects
      udiskie
      kdePackages.dolphin
      kdePackages.breeze
      libsForQt5.qt5.qtgraphicaleffects
      qt6Packages.qt6ct
      qt6.qtwayland
      fluent-icon-theme
      kora-icon-theme
    ];
  sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
