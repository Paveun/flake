{ config, pkgs, user, lib, hyprland, ... }:

{
  imports = [
    ../waybar
  ];
  home-manager.sharedModules = [
    ./home.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    xwayland.hidpi = true;
    nvidiaPatches = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  # Configure X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
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

  security.polkit.enable = true;
  security.pam.services.${user}.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};
  services.udisks2.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  environment.systemPackages = with pkgs; [
    wofi
    hyprpaper
    dunst
    libsecret
    libgnome-keyring
    swaylock-effects
    udiskie
    xsettingsd
    lxappearance
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.ark
  ];
}
