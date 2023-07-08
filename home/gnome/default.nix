{ config, pkgs, user, lib, ... }:

{
  # Configure X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    desktopManager.gnome.enable = true;
    displayManager = {
      gdm.enable = true;
      # defaultSession = "plasmawayland";
    };
  };

  environment.gnome.excludePackages = (with pkgs; [
    # gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    # gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    # gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  services.xserver.libinput.enable = true;
  users.users.${user}.extraGroups = [
    "input"
  ];
}