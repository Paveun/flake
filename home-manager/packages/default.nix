{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    # inputs.self.homeManagerModules.zen-browser
  ];
  home.packages = with pkgs; [
    # krabby
    fastfetch
    devenv
    kate
    vscode
    winbox
    google-chrome
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
    distrobox
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
    inputs.zen-browser.packages.${pkgs.system}.default
    prismlauncher
    # obsidian
    fflogs
    asdf-vm
    ani-cli
    cbonsai
    glow
    floorp
    tidal-hifi
    ollama
  ];
}
