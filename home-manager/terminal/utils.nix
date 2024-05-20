{
  config,
  pkgs,
  lib,
  user,
  catppuccin,
  ...
}: {
  programs = {
    bottom = {
      enable = true;
      # catppuccin.enable = true;
    };
    btop = {
      enable = true;
      # catppuccin.enable = true;
    };
    ranger = {
      # enable = true;
    };
  };
}
