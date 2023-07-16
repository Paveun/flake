{ config, pkgs, user, lib, tuxedo-nixos, hyprland, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ../../qtile
    ../../alacritty
    # ../../gnome
    # ../../plasma
    ../../hyprland
  ];

  boot = {
    kernelParams =
      [
        "acpi_rev_override"
        "mem_sleep_default=deep"
        "intel_iommu=igfx_off"
        "tuxedo_keyboard.mode=0"
        "tuxedo_keyboard.brightness=25"
        "tuxedo_keyboard.color_left=0x0000ff"
      ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  hardware.tuxedo-control-center.enable = true;
  hardware.tuxedo-keyboard.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1u"
    "nodejs-14.21.3"
    "electron-13.6.9"
  ];

  networking.hostName = "intl"; # Define your hostname.

  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
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
    open = true;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      # sync.enable = true; # Keeps GPU always on
      # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
      nvidiaBusId = "PCI:1:0:0";

      # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
      intelBusId = "PCI:0:2:0";
    };
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
