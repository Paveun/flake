{ config, pkgs, lib, user, ... }:

{
 home.file = {
    ".config/alacritty/alacritty.yml"={
      source = ./alacritty.yml;
    };
  };
  home.sessionVariables = {
    TERMINAL = "alacritty";
  };
  programs = {
    alacritty = {
      enable = true;
    };
    fish = {
      enable = true;
      shellAliases = {
        ssh = "TERM=xterm-256color command ssh";
      };
    };
  };
}