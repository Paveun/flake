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
  services.gnome.gnome-keyring.enable = true;
}