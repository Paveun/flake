{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
