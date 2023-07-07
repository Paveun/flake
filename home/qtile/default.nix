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
