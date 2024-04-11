{ config, pkgs, lib, user, ... }:

{
  imports = [
    ../common/home.nix
    ../../home-manager/wm/plasma
  ]; 

  home.packages = with pkgs; [
    liquidctl
    razergenie
    via
  ];
}
