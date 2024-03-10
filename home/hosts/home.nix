{ config, pkgs, lib, user, ... }:

{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    kate
    vscode
    winbox
    google-chrome
    openssl
    haruna
    deluge
    protonvpn-gui
    protonvpn-cli
    conda
    keepassxc
    google-drive-ocamlfuse
    remmina
    openfortivpn
    distrobox
    openconnect
    openvpn
    flameshot
    jq
    gh
    lazygit
  ];

  home.file = {
    ".config/wallpaper/default.png"={
      source = ../wallpaper/default.png;
    };
  };

  home.sessionVariables = {
    # TERMINAL = "alacritty";
  };

  xresources.properties  = {
    "Xft.dpi" = 96;
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName  = "paveun";
    userEmail = "a.tresierrajansen@gmail.com";
  };
  programs.git-credential-oauth.enable = true;
}
