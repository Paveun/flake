{ config, pkgs, user, lib, ... }:

{
  programs.fish.shellAliases = {
    nvim = "lvim";
  };
  home-manager.sharedModules = [
    ./home.nix
  ];
}
