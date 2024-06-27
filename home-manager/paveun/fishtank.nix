{
  config,
  pkgs,
  lib,
  user,
  ...
}: {
  imports = [
    ./global
    # ../wm/plasma
    ../wm/gnome
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "23.11";
  };
  sops.secrets = {
    "private_keys/fishtank" = {
      path = "/home/${user}/.ssh/id_fishtank";
      mode = "0400";
    };
  };
  home.file = {
    ".ssh/id_fishtank.pub" = {
      source = ./keys/id_fishtank.pub;
    };
  };
  home.packages = with pkgs; [
    liquidctl
    # razergenie
    via
    alsa-scarlett-gui
  ];
}
