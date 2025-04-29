{
  config,
  pkgs,
  user,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.chaotic.nixosModules.default
    ./hardware-configuration.nix
    ../common
    ../../nixos/system/amdgpu
    # ../../nixos/wm/plasma
    ../../nixos/wm/gnome
    # ../../nixos/wm/cosmic
  ];

  # home-manager.users.${user}.imports = [
  #   ./home.nix
  # ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  services.scx = {
    enable = true;
    # scheduler = "scx_rusty";
  };

  boot.kernelParams = ["preempt=full"];

  networking.hostName = "aion";

  fileSystems."/vault" = {
    device = "UUID=1d3eed88-e24d-48a1-b5d6-dd94b17ed6db";
    fsType = "ext4";
    options = ["noatime"];
  };

  hardware = {
    cpu.amd.updateMicrocode = true;
    xpadneo.enable = true;
    # xone.enable = true;
    # openrazer = {
    #   enable = true;
    #   # users = ["${user}"];
    # };
  };

  users.users.${user}.extraGroups = [
    "plugdev"
    "openrazer"
  ];

  environment.systemPackages = with pkgs; [
    # linuxKernel.packages.linux_zen.xone
    # openrazer-daemon
    # polychromatic
    amdgpu_top
  ];

  # hardware.nvidia.prime = {
  #   sync.enable = true;
  #   nvidiaBusId = "PCI:1:0:0";
  #   amdgpuBusId = "PCI:12:0:0";
  # };
}
