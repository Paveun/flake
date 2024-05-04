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
    inputs.chaotic.nixosModules.default
    ./hardware-configuration.nix
    ../common
    ../../nixos/system/nvidia
    ../../nixos/wm/hyprland
  ];

  # home-manager.users.${user}.imports = [
  #   ./home.nix
  # ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  environment.systemPackages = [pkgs.scx];
  systemd.services.scx = {
    description = "scx_rusty daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.scx}/bin/scx_rusty";
      Restart = "always";
      StandardError = "journal";
      LogNamespace = "sched-ext";
    };
    wantedBy = ["multi-user.target"];
  };
  systemd.services.scx.enable = true;

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
