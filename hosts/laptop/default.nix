{ config, pkgs, user, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-511f83db-a000-4258-91fd-bf13ccd8399a".device = "/dev/disk/by-uuid/511f83db-a000-4258-91fd-bf13ccd8399a";
  boot.initrd.luks.devices."luks-511f83db-a000-4258-91fd-bf13ccd8399a".keyFile = "/crypto_keyfile.bin";

  boot = {
    kernelParams =
      [
        "acpi_rev_override"
        "mem_sleep_default=deep"
        "intel_iommu=igfx_off"
      ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  # Configure X11
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    #desktopManager.plasma5.enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "hyprland";
    };
  };

  services.xserver.libinput.enable = true;

  networking.hostName = "intl"; # Define your hostname.
  
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.udisks2.enable = true;

  #environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  programs.waybar.enable = true;
  qt.platformTheme = "qt5ct";
  
  environment.variables = {
        # This will become a global environment variable
       "QT_QPA_PLATFORMTHEME"="qt5ct";
     };

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    pavucontrol
    networkmanagerapplet
    wofi
    hyprpaper
    dunst
    udiskie
    libsForQt5.dolphin
    libsForQt5.qt5ct
  ];

  users.users.${user}.extraGroups = [
    "input"
  ];

  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
  ];

  # Configuring Nvidia PRIME
  services.xserver.videoDrivers = ["nvidia"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    prime = {
      offload.enable = true;
      # sync.enable = true; # Keeps GPU always on
      # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
      nvidiaBusId = "PCI:1:0:0";

      # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
      intelBusId = "PCI:0:2:0";
    };
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
