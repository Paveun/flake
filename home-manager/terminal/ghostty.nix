{ pkgs, ... }: {
  programs = {
    ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        theme = "rose-pine-moon";
        # font-size = 10;
        font-family = "JetBrainsMono Nerd Font Mono";
      };
    };
  };
  # home.packages = with pkgs; [
  #   nerd-fonts.jetbrains-mono
  # ];
}
