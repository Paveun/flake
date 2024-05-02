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
  sops.secrets = {
    "private_keys/laptop" = {
      path = "/home/${user}/.ssh/id_laptop";
    };
  };
  home.file = {
    ".ssh/id_laptop.pub" = {
      source = ./keys/id_laptop.pub;
    };
  };
  home.packages = with pkgs; [
  ];
}
