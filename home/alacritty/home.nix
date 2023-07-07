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
}