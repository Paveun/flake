{
  config,
  pkgs,
  lib,
  user,
  catppuccin,
  ...
}: {
  imports = [
    ./gtk.nix
    ./catppuccin.nix
    ./wallpaper
  ];
}
