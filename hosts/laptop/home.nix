{
  config,
  pkgs,
  lib,
  user,
  ...
}: {
  imports = [
    ../common/home.nix
    ../../home-manager/wm/hyprland
  ];

  home.packages = with pkgs; [
  ];
}
