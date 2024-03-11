{ config, pkgs, user, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../alacritty
    ../../plasma
    ../../nixvim
  ];

  boot = {
    # kernelParams =
    #   [
    #     "acpi_rev_override"
    #     "mem_sleep_default=deep"
    #     "intel_iommu=igfx_off"
    #   ];
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "fishtank";

  hardware.openrazer.enable = true;
  users.users.${user}.extraGroups = [
    "openrazer"
    "plugdev"
  ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
