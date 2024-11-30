{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      roboto
      jetbrains-mono
      # nerdfonts
      # (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
    ];
  };
}
