{
  config,
  lib,
  ...
}: {
  boot.kernelParams = [
    "nvidia-drm.fbdev=1"
  ];
  services.xserver.videoDrivers = ["nvidia"];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware = {
    graphics = {
      enable = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
