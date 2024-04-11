{ config, pkgs, lib, user, catppuccin, ... }:

{
  imports = [
    ../../home-manager/terminal
    ../../home-manager/packages
    ../../home-manager/themes
    ../../home-manager/ide/lunarvim
    ../../home-manager/ide/nixvim
  ];

  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager = {
      enable = true;
    };
  };
}
