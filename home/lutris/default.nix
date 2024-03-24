{ config, pkgs, user, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    lutris
  ];
}
