{ config, pkgs, lib, user, ... }:

{
 home.file = {
    ".config/waybar/config"={
      source = ./config;
    };
    ".config/waybar/style.css"={
      source = ./style.css;
    };
    ".config/waybar/mediaplayer.py"={
      source = ./medialpayer.py;
    };
  };
}
