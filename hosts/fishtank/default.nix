{ config, pkgs, user, lib, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
      kernelParams =
        [
          "acpi_rev_override"
          "mem_sleep_default=deep"
          #"intel_iommu=igfx_off"
          #"nvidia-drm.modeset=1"
        ];
      kernelPackages = pkgs.linuxPackages_5_4;
      extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    };

  networking.hostName = "fishtank"; # Define your hostname.

  hardware.openrazer.enable = true;
  users.users.${user}.extraGroups = [ "openrazer" ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
  ];

  # Configuring Nvidia PRIME
  services.xserver.videoDrivers = ["nvidia"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    nvidiaSettings = true;
    modesetting.enable = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}