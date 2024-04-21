{
  config,
  inputs,
  pkgs,
  lib,
  user,
  catppuccin,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.nixvim.homeManagerModules.nixvim
    ../../home-manager/terminal
    ../../home-manager/packages
    # ../../home-manager/themes
    ../../home-manager/ide/lunarvim
    ../../home-manager/ide/nixvim
    ../../home-manager/packages/firefox.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.11";
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager = {
      enable = true;
    };
  };
}
