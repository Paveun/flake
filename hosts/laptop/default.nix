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
    # inputs.chaotic.nixosModules.default
    ./hardware-configuration.nix
    ../common
    ../../nixos/system/nvidia
    # ../../nixos/wm/hyprland
    # ../../nixos/wm/gnome
    ../../nixos/wm/cosmic
    # ../../nixos/wm/plasma
  ];

  # home-manager.users.${user}.imports = [
  #   ./home.nix
  # ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
  # chaotic.scx = {
  #   enable = true;
  #   scheduler = "scx_rusty";
  # };

  networking.hostName = "laptop";

  hardware = {
    # tuxedo-rs = {
    #   enable = true;
    #   tailor-gui.enable = true;
    # };
    # tuxedo-keyboard.enable = true;
    nvidia.prime = {
      # offload.enable = true;
      # offload.enableOffloadCmd = true;
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };
  };
}
