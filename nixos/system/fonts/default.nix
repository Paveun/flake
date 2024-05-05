{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      roboto
      jetbrains-mono
      # nerdfonts
      (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
    ];
  };
}
