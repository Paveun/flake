{ config, pkgs, lib, user, ... }:

{
  imports = [
    ../common/home.nix
  ];

  home.packages = with pkgs; [
  ];
}
