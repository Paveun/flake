{ config, pkgs, user, lib, ... }:

{
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
  programs.i3lock = {
    enable = true;
    package = pkgs.i3lock-blur;
  };
  environment.systemPackages = [
    pkgs.rofi
    pkgs.feh
    pkgs.picom
    pkgs.lxde.lxsession
    pkgs.dmenu
  ];
}
