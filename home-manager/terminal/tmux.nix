{
  config,
  pkgs,
  lib,
  user,
  catppuccin,
  ...
}: {
  programs = {
    tmux = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
