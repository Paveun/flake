{pkgs, ... }:
{
  imports = [
    ./gtk.nix
    ./stylix.nix
    ./wallpaper
  ];
  stylix.targets.kitty.enable = false;
  programs.kitty = {
    font = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetbrainsMono Nerd Font Mono";
      size = 10;
    };
    themeFile = "Catppuccin-Mocha";
  };
}
