{
  config,
  pkgs,
  user,
  lib,
  ...
}: {
  # Configure X11
  services = {
    desktopManager.plasma6.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "plasma";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      (catppuccin-kde.override {
        flavour = ["frappe"];
        accents = ["rosewater"];
        winDecStyles = ["classic"];
      })
    ];
    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      oxygen
      konsole
      plasma-browser-integration
    ];
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-kde ];
  # };

  services.xserver.libinput.enable = true;
  users.users.${user}.extraGroups = [
    "input"
  ];
}
