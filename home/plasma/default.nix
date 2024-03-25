{ config, pkgs, user, lib, ... }:

{
  # Configure X11
  services = {
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
        defaultSession = "plasma";
      };
    };
  };
  
  environment.systemPackages = with pkgs; [
    catppuccin-kde
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    oxygen
    konsole
    plasma-browser-integration
  ];

  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal.enable = true;
  xdg.portal.wlr.enable = true;

  services.xserver.libinput.enable = true;
  users.users.${user}.extraGroups = [
    "input"
  ];
}
