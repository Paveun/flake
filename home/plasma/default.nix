{ config, pkgs, user, lib, ... }:

{
  # Configure X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
      defaultSession = "plasma";
    };
  };
  
  environment.systemPackages = with pkgs; [
    catppuccin-kde
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
#    gwenview
#    okular
    oxygen
#    khelpcenter
    konsole
    plasma-browser-integration
#    print-manager
  ];

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  services.xserver.libinput.enable = true;
  users.users.${user}.extraGroups = [
    "input"
  ];
}
