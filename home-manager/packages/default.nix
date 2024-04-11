{ pkgs, ... }:

{
  home.packages = with pkgs; [
    krabby
    neofetch
    subversionClient
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
    ncspot
    slack
    gdu
  ];
}
