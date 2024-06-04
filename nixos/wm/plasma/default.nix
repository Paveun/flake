{
  pkgs,
  user,
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
        # wayland.enable = true;
      };
      defaultSession = "plasma";
    };
    libinput.enable = true;
  };

  environment = {
    # systemPackages = with pkgs; [
    # ];
    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      oxygen
      konsole
      plasma-browser-integration
    ];
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  users.users.${user}.extraGroups = [
    "input"
  ];
}
