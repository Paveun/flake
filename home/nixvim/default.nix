{ config, pkgs, user, lib, nixvim, ... }:

{
  programs.nixvim = {
    enable = true;
    clipboard.providers.wl-copy.enable = true;
    colorschemes.catppuccin.enable = true;
    plugins.lightline.enable = true;
  };
}
