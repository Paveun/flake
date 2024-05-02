{
  inputs,
  pkgs,
  config,
  user,
  ...
}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    inputs.nix-flatpak.nixosModules.nix-flatpak
    # ./home-manager.nix
    ../../nixos/system/grub
    ../../nixos/system/audio
    ../../nixos/terminal/shell
    ../../nixos/sops
    ../../nixos/themes
    ../../nixos/flatpak
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
    settings = {
      extra-substituters = [
        "https://nixpkgs-python.cachix.org"
        "https://devenv.cachix.org"
        "https://nix-gaming.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nixpkgs-python.cachix.org-1:hxjI7pFxTyuTHn2NkvWCrAUcNZLNS3ZAvfYNuYifcEU="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
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

  services.printing.enable = true;

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
