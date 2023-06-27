{ config, pkgs, user, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];


  networking.hostName = "fishtank"; # Define your hostname.

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
    modesetting.enable = true;
    powerManagement.enable = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}