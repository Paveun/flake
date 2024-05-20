{
  config,
  lib,
  catppuccin,
  pkgs,
  ...
}: {
  imports = [
    ../../home-manager/themes/stylix.nix
  ];
  # catppuccin.flavour = "frappe";
  # console.catppuccin.enable = true;
  
}
