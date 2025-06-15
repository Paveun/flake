{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./firefox.nix
    # inputs.self.homeManagerModules.zen-browser
  ];
  home.packages = with pkgs; [
    fastfetch
    devenv
    vscode
    winbox
    google-chrome
    openssl
    tree
    haruna
    deluge
    protonvpn-gui
    keepassxc
    mpv
    # google-drive-ocamlfuse
    # openfortivpn
    # openvpn
    # distrobox
    # openconnect
    # jq
    gh
    # ncspot
    slack
    gdu
    xarchiver
    vesktop
    brave
    # spotify
    xivlauncher
    # inputs.nixos-xivlauncher-rb.packages.${pkgs.system}.xivlauncher-rb
    inputs.zen-browser.packages.${pkgs.system}.default
    prismlauncher
    # obsidian
    fflogs
    # asdf-vm
    ani-cli
    # cbonsai
    glow
    # floorp
    tidal-hifi
    # ventoy
  ];
  # nixpkgs.config.permittedInsecurePackages = ["ventoy-1.1.05"];
}
