{ config, lib, pkgs, user, ... }:

{
  # Flatpak setup
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    uninstallUnmanaged = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "com.brave.Browser"
      # "com.slack.Slack"
      "com.obsproject.Studio"
      "com.discordapp.Discord"
      "io.github.spacingbat3.webcord"
      "org.polymc.PolyMC"
      "com.spotify.Client"
      "dev.goats.xivlauncher"
    ];
  };

  system.fsPackages = [ pkgs.bindfs ];
  fileSystems = let
    mkRoSymBind = path: {
      device = path;
      fsType = "fuse.bindfs";
      options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
    };
    aggregatedIcons = pkgs.buildEnv {
      name = "system-icons";
      paths = with pkgs; [
        catppuccin-cursors.frappeRosewater
        # libsForQt5.breeze-qt5  # for plasma
        # gnome.gnome-themes-extra
      ];
      pathsToLink = [ "/share/icons" ];
    };
    aggregatedFonts = pkgs.buildEnv {
      name = "system-fonts";
      paths = config.fonts.packages;
      pathsToLink = [ "/share/fonts" ];
    };
  in {
    "/usr/share/icons" = mkRoSymBind "${aggregatedIcons}/share/icons";
    "/usr/local/share/fonts" = mkRoSymBind "${aggregatedFonts}/share/fonts";
    # "/home/${user}/.local/share/icons" = mkRoSymBind "${aggregatedIcons}/share/icons";
  };
}
