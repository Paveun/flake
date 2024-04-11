{ config, pkgs, lib, user, catppuccin, ... }:

{
  imports = [
    ../../home-manager/terminal
    ../../home-manager/packages
    ../../home-manager/themes
  ];

  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  xdg.enable = true;

  programs = {
    home-manager = {
      enable = true;
    };
  };
}
