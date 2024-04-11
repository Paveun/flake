{ config, pkgs, lib, user, catppuccin, ... }:

{
  imports = [
    ./gtk.nix
    ./wallpaper
  ];

  catppuccin.flavour = "frappe";
  catppuccin.accent = "rosewater";
}
