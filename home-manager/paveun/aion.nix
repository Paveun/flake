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
  # sops.secrets = {
  #   "private_keys/aion" = {
  #     path = "/home/${user}/.ssh/id_aion";
  #     mode = "0400";
  #   };
  # };
  # home.file = {
  #   ".ssh/id_aion.pub" = {
  #     source = ./keys/id_aion.pub;
  #   };
  # };
  home.packages = with pkgs; [
    liquidctl
    # razergenie
    via
    alsa-scarlett-gui
  ];
}
