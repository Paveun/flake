{ config, pkgs, lib, user, catppuccin, ... }:

{
  programs = {
    tmux = {
      enable = true;
      catpuccin.enable = true;
    };
  };
}
