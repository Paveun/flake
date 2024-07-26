{pkgs, ...}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      remember_window_size = "no";
      initial_window_width = "1280";
      initial_window_height = "800";
    };
  };
}
