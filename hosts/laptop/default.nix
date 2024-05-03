{
  config,
  pkgs,
  user,
  lib,
  nixvim,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../nixos/system/nvidia
    ../../nixos/wm/hyprland
  ];

  # home-manager.users.${user}.imports = [
  #   ./home.nix
  # ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  networking.hostName = "laptop";

  hardware = {
    tuxedo-rs = {
      enable = true;
      tailor-gui.enable = true;
    };
    tuxedo-keyboard.enable = true;
    nvidia.prime = {
      # offload.enable = true;
      # offload.enableOffloadCmd = true;
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };
  };
}
