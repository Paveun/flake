{ config, pkgs, user, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    #../../config/flatpak_font_fix.nix
  ];

  boot = {
    kernelParams =
      [
        "acpi_rev_override"
        "mem_sleep_default=deep"
        #"intel_iommu=igfx_off"
      ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  networking.hostName = "fishtank"; # Define your hostname.

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

  # Disable default KDE apps
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

  hardware.openrazer.enable = true;
  users.users.${user}.extraGroups = [
    "openrazer"
    "plugdev"
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
  ];

  # Configuring Nvidia
  services.xserver.videoDrivers = ["nvidia"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable =true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}