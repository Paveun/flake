{ config, pkgs, lib, user, ... }:

{
 home.file = {
    ".config/alacritty/alacritty.toml"={
      source = ./alacritty.toml;
    };
  };
  # home.sessionVariables = {
  #   TERMINAL = "alacritty";
  # };
  # programs = {
  #   alacritty = {
  #     enable = true;
  #   };
  #   fish = {
  #     enable = true;
  #     interactiveShellInit = ''
  #       set fish_greeting # Disable greeting
  #     '';
  #     shellAliases = {
  #       ssh = "TERM=xterm-256color command ssh";
  #     };
  #   };
  # };
}
