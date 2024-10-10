{pkgs, ...}:
{
  stylix.targets.kitty.enable = false;
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      remember_window_size = "no";
      initial_window_width = "900";
      initial_window_height = "600";
      dynamic_background_opacity = true;
      background_opacity = 0.85;
      background_blur = 5;
    };
    font = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetbrainsMono Nerd Font Mono";
      size = 10;
    };
    themeFile = "Catppuccin-Mocha";
  };
}
