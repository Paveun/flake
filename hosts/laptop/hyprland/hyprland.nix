{ config, pkgs, user, lib, ... }:

{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.udisks2.enable = true;
  programs.thunar.enable = true;

  programs.waybar.enable = true;
  qt.platformTheme = "qt5ct";
  
  environment.variables = {
        # This will become a global environment variable
       "QT_QPA_PLATFORMTHEME"="qt5ct";
     };

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    pavucontrol
    networkmanagerapplet
    wofi
    hyprpaper
    dunst
    udiskie
    lxappearance
    libsForQt5.dolphin
    libsForQt5.qt5ct
  ];
}