{
  config,
  lib,
  catppuccin,
  pkgs,
  ...
}: {
  imports = [
    ./stylix.nix
  ];
  # catppuccin.flavour = "frappe";
  # console.catppuccin.enable = true;
  
}
