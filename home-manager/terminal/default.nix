{
  config,
  pkgs,
  lib,
  user,
  catppuccin,
  ...
}: {
  imports = [
    ./alacritty.nix
    # ./fish.nix
    ./zsh.nix
    ./starship.nix
    ./git.nix
    ./tmux.nix
    ./utils.nix
  ];
}
