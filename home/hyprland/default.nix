{ config, pkgs, user, lib, ... }:

{
  home-manager.sharedModules = [
    ./home.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # xwayland.hidpi = true;
  };

  programs.waybar.enable = true;
  # nixpkgs.overlays = [
  #   (self: super: {
  #     waybar = super.waybar.overrideAttrs (oldAttrs: {
  #       mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  #     });
  #   })
  # ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Configure X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    # xkb.variant = "";
    displayManager = {
      sddm = {
        enable = true;
        theme = "${(pkgs.fetchFromGitHub {
          owner = "rototrash";
          repo = "tokyo-night-sddm";
          rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
          sha256 = "JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
        })}";
      };
      defaultSession = "hyprland";
    };
  };

  qt.style = "breeze";
  qt.platformTheme = "qt6ct";
  
  # security.polkit.enable = true;
  # security.pam.services.${user}.enableGnomeKeyring = true;
  # services.gnome.gnome-keyring.enable = true;
  # programs.seahorse.enable = true;
  # security.pam.services.sddm.enableGnomeKeyring = true;
  security.pam.services.sddm.enableKwallet = true;
  security.pam.services.swaylock = {};
  # services.udisks2.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
  # services.gvfs.enable = true; # Mount, trash, and other functionalities
  # services.tumbler.enable = true; # Thumbnail support for images

  environment = {
    systemPackages = with pkgs; [
      wofi
      hyprpaper
      hyprcursor
      # dunst
      nwg-look
      pavucontrol
      networkmanagerapplet
      playerctl
      # (catppuccin-gtk.override {
      #   accents = [ "rosewater" ]; # You can specify multiple accents here to output multiple themes
      #   size = "compact";
      #   tweaks = [ "rimless" ]; # You can also specify multiple tweaks here
      #   variant = "frappe";
      # })
      # ranger
      # libsecret
      # libgnome-keyring
      swaylock-effects
      udiskie
      kdePackages.dolphin
      kdePackages.breeze
      # xsettingsd
      # lxappearance
      libsForQt5.qt5.qtgraphicaleffects
      qt6Packages.qt6ct
      qt6.qtwayland
      # libsForQt5.ark
      # glxinfo
      fluent-icon-theme
      kora-icon-theme
    ];
  sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
