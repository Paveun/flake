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
  security.pam.services.${user}.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
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
    udiskie
    lxappearance
    libsForQt5.ark
  ];
}