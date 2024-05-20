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
    # ./catppuccin.nix
    ./stylix.nix
    ./wallpaper
  ];
}
