{ config, pkgs, lib, user, catppuccin, ... }:

{
  home.file = {
    ".config/wallpaper/default.png"={
      source = ./default.png;
    };
  };
}
