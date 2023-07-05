{ config, pkgs, lib, user, ... }:

{
 home.file = {
    ".config/wallpapers/mountain.jpg"={
      source = ../../resources/mountain.jpg;
    };
    ".config/wallpapers/mountain2.jpg"={
      source = ../../resources/mountain2.jpg;
    };
  };
}