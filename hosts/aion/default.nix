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
    ../../nixos/system/nvidia
    # ../../nixos/wm/plasma
    ../../nixos/wm/gnome
  ];

  # home-manager.users.${user}.imports = [
  #   ./home.nix
  # ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
  # chaotic.scx = {
  #   enable = true;
  #   scheduler = "scx_rusty";
  # };

  networking.hostName = "aion";

  fileSystems."/vault" = {
    device = "UUID=1d3eed88-e24d-48a1-b5d6-dd94b17ed6db";
    fsType = "ext4";
    options = ["noatime"];
  };

  # hardware.openrazer = {
  #   enable = true;
  #   users = ["${user}"];
  # };
  users.users.${user}.extraGroups = [
    "plugdev"
  ];
  # hardware.nvidia.prime = {
  #   sync.enable = true;
  #   nvidiaBusId = "PCI:0:1:0";
  #   amdgpuBusId = "PCI:12:0:0";
  # };
}
