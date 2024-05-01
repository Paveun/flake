{
  config,
  pkgs,
  lib,
  user,
  ...
}: {
  imports = [
    ./global
    ../wm/hyprland
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.11";
  };
  home.packages = with pkgs; [
  ];
}
