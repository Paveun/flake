{ config, pkgs, user, lib, ... }:

{
  home-manager.sharedModules = [
    ./home.nix
  ];
  environment = {
    systemPackages = with pkgs; [
        alacritty
    ];
  };
}