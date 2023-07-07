{ config, pkgs, user, lib, ... }:

{
  home-manager.sharedModules = [
    ./home.nix
  ];
}