{ config, pkgs, user, lib, ... }:

{
  home-manager.sharedModules = [
    ./home.nix
  ];
  programs.waybar.enable = true;
  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
  environment.systemPackages = with pkgs; [
    pavucontrol
    networkmanagerapplet
  ];
}
