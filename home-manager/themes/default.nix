{
  imports = [
    ./gtk.nix
    ./stylix.nix
    ./wallpaper
  ];
  stylix.targets.kitty.enable = false;
  programs.kitty.themeFile = "Catppuccin-Mocha";
}
