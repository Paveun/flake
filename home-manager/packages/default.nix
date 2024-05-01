{pkgs, ...}: {
  home.packages = with pkgs; [
    krabby
    fastfetch
    devenv
    kate
    vscode
    winbox
    # google-chrome
    (google-chrome.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
      ];
    })
    openssl
    tree
    haruna
    deluge
    protonvpn-gui
    conda
    keepassxc
    google-drive-ocamlfuse
    # remmina
    openfortivpn
    # distrobox
    openconnect
    openvpn
    flameshot
    jq
    gh
    ncspot
    slack
    gdu
    xarchiver
    vesktop
    brave
    spotify
    xivlauncher
    prismlauncher
  ];
}
