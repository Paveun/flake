{pkgs, ...}: {
  stylix = {
    # targets.hyprland.enable = false;
    # targets.mako.enable = false;
    targets.nvf.enable = false;
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    polarity = "dark";
    image = ./wallpaper/chibi_g5.jpeg;
    cursor = {
      # package = pkgs.catppuccin-cursors.mochaRosewater;
      # name = "catppuccin-mocha-rosewater-cursors";
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 24;
    };
    fonts = {
      serif = {
        package = pkgs.roboto-serif;
        name = "Roboto Serif";
      };
      sansSerif = {
        package = pkgs.roboto;
        name = "Roboto";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        terminal = 10;
        applications = 10;
        desktop = 10;
        popups = 10;
      };
    };
    # opacity.terminal = 0.99;
  };
}
