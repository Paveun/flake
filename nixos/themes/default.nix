{
  config,
  lib,
  catppuccin,
  pkgs,
  ...
}: {
  # catppuccin.flavour = "frappe";
  # console.catppuccin.enable = true;
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
  };
}
