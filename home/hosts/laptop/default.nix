{ config, pkgs, user, lib, nixvim, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../alacritty
    # ../../plasma
    ../../hyprland
    ../../lunarvim
    # ../../nixvim
    ../../lutris
  ];

  boot = {
    kernelParams =
      [
        "acpi_rev_override"
        "mem_sleep_default=deep"
        "intel_iommu=igfx_off"
      ];
    kernelPackages = pkgs.linuxPackages_latest;
    # extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  networking.hostName = "intl";

  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  };

  hardware.tuxedo-keyboard.enable = true;

  hardware.acpilight.enable = true;

  users.users.${user}.extraGroups = [
    "input"
    # "plugdev"
  ];
  services.xserver.videoDrivers = ["nvidia"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    # modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    prime = {
      # offload.enable = true;
      # offload.enableOffloadCmd = true;
      sync.enable = true; # Keeps GPU always on
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
