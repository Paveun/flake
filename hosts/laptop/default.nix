{ config, pkgs, user, lib, nixvim, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../nixos/system/nvidia
    # ../../alacritty
    # ../../plasma
    ../../home/hyprland
    ../../home/lunarvim
    ../../home/nixvim
    ../../home/lutris
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "intl";

  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  }; 

  hardware.nvidia.prime = {
    # offload.enable = true;
    # offload.enableOffloadCmd = true;
    sync.enable = true;
    nvidiaBusId = "PCI:1:0:0";
    intelBusId = "PCI:0:2:0";
  };
}
