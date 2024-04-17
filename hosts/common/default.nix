{
  config,
  pkgs,
  lib,
  user,
  catppuccin,
  ...
}: {
  imports = [
    ../../nixos/system/grub
    ../../nixos/system/audio
    ../../nixos/terminal/shell
    ../../nixos/themes
    ../../nixos/flatpak
    ../../nixos/containers
    ../../nixos/packages
    ../../nixos/system/fonts
    ../../nixos/gaming/steam
    ../../nixos/gaming/lutris
    ../../nixos/cachix
  ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    # Garbage collection
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";

  i18n.defaultLocale = "en_CA.UTF-8";

  programs.dconf.enable = true;

  services.printing.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    description = "Paveun";
    extraGroups = ["networkmanager" "wheel" "audio"];
  };

  system.stateVersion = "23.11";
}
