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

  # Configure X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    displayManager = {
      gdm.enable = true;
      defaultSession = "hyprland";
    };
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.udisks2.enable = true;
  programs.thunar.enable = true;

  qt.platformTheme = "qt5ct";
  
  environment.variables = {
      # This will become a global environment variable
      "QT_QPA_PLATFORMTHEME"="qt5ct";
    };

  environment.systemPackages = with pkgs; [
    wofi
    hyprpaper
    dunst
    udiskie
    xsecurelock
    lxappearance
    libsForQt5.dolphin
    libsForQt5.qt5ct
    libsForQt5.polkit-kde-agent
    libsForQt5.qt5.qtwayland
  ];
}