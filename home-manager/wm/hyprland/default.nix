{pkgs, ...}: {
  imports = [
    ./wofi
    ./waybar.nix
    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./dunst.nix
    ../../themes
  ];

  home = {
    file = {
      # ".config/hypr/hyprland.conf"={
      #   source = ./hypr/hyprland.conf;
      # };
      #".config/hypr/hyprpaper.conf" = {
      #  # source = ./hypr/hyprpaper.conf;
      #  text = ''
      #    preload = $HOME/.config/wallpaper/default.png
      #    wallpaper = ,$HOME/.config/wallpaper/default.png
      #    splash = false
      #  '';
      #};
      # ".config/hypr/hyprlock.conf" = {
      #   source = ./hypr/hyprlock.conf;
      # };
    };
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    packages = with pkgs; [
      hyprpaper
      hyprcursor
      # hyprlock
      wl-clipboard
      nwg-look
      pavucontrol
      playerctl
      # kdePackages.breeze
      # kdePackages.qtwayland
      # qt6Packages.qt6ct
      # libsForQt5.qt5.qtgraphicaleffects
      feh
    ];
  };

  xdg = {
    enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
      xdgOpenUsePortal = true;
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
      };
    };
  };

  # qt = {
  #   enable = true;
  #   #  platformTheme.name = "gtk";
  # };

  services = {
    network-manager-applet.enable = true;
    playerctld.enable = true;
    cliphist.enable = true;
    udiskie = {
      enable = true;
      automount = true;
      tray = "never";
    };
  };
}
