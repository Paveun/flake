{ config, pkgs, user, lib, ... }:

{
  home-manager.sharedModules = [
    ./home.nix
  ];
  services.xserver.windowManager.qtile = {
    enable = true;
    package = pkgs.qtile-unwrapped;
    backend = "x11";
    extraPackages = python3Packages: with python3Packages; [
      qtile-extras
    ];
  };

  # Thunar setup
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  # Extra app setup
  services.xserver.desktopManager.xterm.enable = false;
  services.gnome.gnome-keyring.enable = true;
  programs.nm-applet.enable = true;
  environment.systemPackages = with pkgs; [
    rofi
    feh
    picom
    networkmanagerapplet
    lxde.lxsession
    dmenu
    xsecurelock
  ];
}
