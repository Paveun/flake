{
  config,
  pkgs,
  user,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common
    ../../nixos/system/nvidia
    ../../nixos/wm/plasma
  ];

  # home-manager.users.${user}.imports = [
  #   ./home.nix
  # ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "fishtank";

  fileSystems."/vault" = {
    device = "UUID=1d3eed88-e24d-48a1-b5d6-dd94b17ed6db";
    fsType = "ext4";
    options = ["noatime"];
  };

  hardware.openrazer.enable = true;
  users.users.${user}.extraGroups = [
    "openrazer"
    "plugdev"
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
