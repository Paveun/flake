{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.self.homeManagerModules.zen-browser
  ];
  home.packages = with pkgs; [
    # krabby
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
    # conda
    keepassxc
    mpv
    google-drive-ocamlfuse
    # remmina
    openfortivpn
    openvpn
    # distrobox
    openconnect
    openvpn
    jq
    gh
    ncspot
    slack
    gdu
    xarchiver
    vesktop
    brave
    spotify
    # xivlauncher
    inputs.nixos-xivlauncher-rb.packages.x86_64-linux.xivlauncher-rb
    # inputs.zen-browser.packages."${system}".specific
    prismlauncher
    obsidian
    fflogs
    asdf-vm
    ani-cli
    cbonsai
    glow
  ];
}
