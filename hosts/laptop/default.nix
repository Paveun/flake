{ config, pkgs, user, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  hardware.tuxedo-keyboard.enable = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-511f83db-a000-4258-91fd-bf13ccd8399a".device = "/dev/disk/by-uuid/511f83db-a000-4258-91fd-bf13ccd8399a";
  boot.initrd.luks.devices."luks-511f83db-a000-4258-91fd-bf13ccd8399a".keyFile = "/crypto_keyfile.bin";

  boot.kernelParams = [
   "tuxedo_keyboard.mode=0"
   "tuxedo_keyboard.brightness=255"
   "tuxedo_keyboard.color_left=0xffffff"
  ];

  networking.hostName = "intl"; # Define your hostname.

  # Configuring Nvidia PRIME
  hardware.nvidia.nvidiaSettings = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.prime = {
    offload.enable = true;
    # sync.enable = true; # Keeps GPU always on
    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:1:0:0";

    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    intelBusId = "PCI:0:2:0";
  };
  hardware.opengl.driSupport32Bit = true;
  hardware.nvidia.powerManagement.enable = true;
  
  # Optionally, you may need to select the appropriate driver version for your specific GPU.
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;


}