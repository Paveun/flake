{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      roboto
      jetbrains-mono
      nerdfonts
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
    ];
  };
}
