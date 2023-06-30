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

  # Configuring Nvidia PRIME
  services.xserver.videoDrivers = ["nvidia"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = [ pkgs.cifs-utils ];
  fileSystems."/mnt/qnas" = {
      device = "//10.1.0.8/qnas";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };
}