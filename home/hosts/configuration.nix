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
 
  programs.git.enable = true;

  programs.starship.enable = true;

  programs.steam.enable = true;

  services.flatpak = {
    enable = true;
    update.onActivation = true;
    uninstallUnmanagedPackages = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "com.brave.Browser"
      "com.slack.Slack"
      "com.obsproject.Studio"
      "com.discordapp.Discord"
      "org.polymc.PolyMC"
      "com.spotify.Client"
      "dev.goats.xivlauncher"
    ];
  };

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

  system.stateVersion = "23.11";

}
