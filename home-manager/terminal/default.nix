{ config, pkgs, lib, user, catppuccin, ... }:

{
  imports = [
    ./alacritty.nix
    ./fish.nix
    ./git.nix
    ./tmux.nix
    ./utils.nix
  ];
}
