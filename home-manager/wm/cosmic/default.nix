{pkgs, ...}: {
  imports = [
    ../../themes
  ];
  home.packages = with pkgs; [
    wl-clipboard
  ];
}
