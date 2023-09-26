{ config, pkgs, user, lib, ... }:

{
  # Configure X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    desktopManager.plasma5.enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasmawayland";
    };
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    konsole
    plasma-browser-integration
    print-manager
  ];

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  services.xserver.libinput.enable = true;
  users.users.${user}.extraGroups = [
    "input"
  ];
}