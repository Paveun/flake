{
  inputs,
  pkgs,
  config,
  user,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
    # ./home-manager.nix
    ../../nixos/system/cachix
    ../../nixos/system/grub
    ../../nixos/system/audio
    ../../nixos/terminal/shell
    ../../nixos/sops
    ../../nixos/themes
    ../../nixos/containers
    ../../nixos/packages
    ../../nixos/system/fonts
    ../../nixos/gaming/steam
    ../../nixos/gaming/lutris
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    # Garbage collection
    settings.auto-optimise-store = true;
    # gc = {
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 7d";
    # };
  };

  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  time = {
    timeZone = "America/Toronto";
    hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_CA.UTF-8";

  programs.dconf.enable = true;

  services = {
    printing.enable = true;
    cloudflare-warp.enable = true;
    # flatpak.enable = true;
  };

  environment.variables = {
    EDITOR = "nvim";
    SYSTEMD_EDITOR = "nvim";
    VISUAL = "nvim";
  };

  sops.secrets.paveun-password.neededForUsers = true;
  users.mutableUsers = false;

  users.users.${user} = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.paveun-password.path;
    description = "Paveun";
    extraGroups = ["networkmanager" "wheel" "audio"];
  };

  system.stateVersion = "23.11";
}
