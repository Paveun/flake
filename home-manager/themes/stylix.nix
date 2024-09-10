{pkgs, ...}: {
  stylix = {
    # targets.hyprland.enable = false;
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    polarity = "dark";
    image = ./wallpaper/default.png;
    cursor = {
      package = pkgs.catppuccin-cursors.frappeRosewater;
      name = "Catppuccin-Frappe-Rosewater-Cursors";
      # package = pkgs.rose-pine-cursor;
      # name = "BreezeX-RosePine-Linux";
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
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetbrainsMono Nerd Font Mono";
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
    opacity.terminal = 0.95;
  };
}
