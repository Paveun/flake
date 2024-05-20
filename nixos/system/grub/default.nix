{
  config,
  catppuccin,
  ...
}: {
  boot.loader = {
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
      # catppuccin.enable = true;
    };
    efi.canTouchEfiVariables = true;
  };
}
