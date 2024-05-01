{
  config,
  pkgs,
  lib,
  user,
  ...
}: {
  imports = [
    ./global
    ../wm/plasma
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.11";
  };
  home.packages = with pkgs; [
    liquidctl
    razergenie
    via
    alsa-scarlett-gui
  ];
}
