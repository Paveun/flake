{ config, pkgs, lib, user, catppuccin, ... }:

{
  programs = {
    git = {
      enable = true;
      userName = "paveun";
      userEmail = "a.tresierrajansen@gmail.com";
      lfs.enable = true;
    };
    gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
    };
    lazygit = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
