{pkgs, ...}: {
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };
}
