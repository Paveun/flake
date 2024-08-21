{pkgs, ...}: {
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };
  hardware = {
    # graphics.driSupport32Bit = true;
    graphics = {
      enable32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
      ];
    };
  };
}
