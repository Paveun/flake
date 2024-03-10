# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, user, ... }:

{
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Apply GTK themes to wayland apps
  programs.dconf.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "Paveun";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  environment = {
    # variables = {
    #   TERMINAL = "alacritty";
    # };
    systemPackages = with pkgs; [
      wget
      subversionClient
      alacritty
      neofetch
      nitch
      btop
      tmux
      cifs-utils
      fishPlugins.z
      fishPlugins.autopair
      fishPlugins.puffer
      linuxHeaders
      krabby
    ];
  };

  #nixpkgs.config.permittedInsecurePackages = [
  #  "openssl-1.1.1v"
  #  "openssl-1.1.1w"
  #];

  fonts.packages = with pkgs; [
    source-code-pro
    font-awesome
    corefonts
    roboto
    jetbrains-mono
    roboto-mono
    meslo-lgs-nf
    nerdfonts
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = "krabby random --no-title";
  };
  
  programs.starship.enable = true;

  programs.steam.enable = true;

  services.flatpak = {
    enable = true;
    update.onActivation = true;
    uninstallUnmanagedPackages = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "com.brave.Browser"
      "com.obsproject.Studio"
      "com.discordapp.Discord"
      "org.polymc.PolyMC"
      "com.spotify.Client"
      # "com.valvesoftware.Steam"
      "dev.goats.xivlauncher"
    ];
  };

  # programs.git = {
  #   enable = true;
  #   package = pkgs.gitFull;
  #   config.credential.helper = "libsecret";
  # };

  # Docker
  # virtualisation.docker = {
  #   enable = true;
  #   # enableNvidia = true;
  #   rootless = {
  #     enable = true;
  #     setSocketVariable = true;
  #   };
  # };

  virtualisation = {
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings = {
       dns_enabled = true;
      };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
