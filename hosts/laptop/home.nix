{ config, pkgs, lib, user, ... }:

{
  home.packages = with pkgs; [
    vscode
    google-chrome
    heroic
    steam
    lutris
    mangohud
    xivlauncher
    protonup-qt
    prismlauncher
    slack
    tidal-hifi
    cider
    postman
    openssl
    telegram-desktop
    discord
    haruna
    deluge
    protonvpn-gui
    conda
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  home.file = {
    ".config/hypr/hyprland.conf"={
      source = ../../config/hyprland.conf;
    };
    ".config/hypr/hyprpaper.conf"={
      source = ../../config/hyprpaper.conf;
    };
    ".config/waybar/config"={
      source = ../../config/waybar/config;
    };
    ".config/waybar/style.css"={
      source = ../../config/waybar/style.css;
    };
    ".config/wallpapers/mountain.jpg"={
      source = ../../resources/mountain.jpg;
    };
    ".config/wallpapers/mountain.jpg"={
      source = ../../resources/mountain2.jpg;
    };
  };
  xdg.desktopEntries = {
    chrome = {
      comment = "Google Chrome web browser";
      exec = "google-chrome-stable --enable-accelerated-video-decode --enable-features=UseOzonePlatform --ozone-platform=wayland";
      genericName = "Google Chrome";
      icon = "google-chrome-stable";
      name = "Google Chrome";
      type = "Application";
    };
  };
}