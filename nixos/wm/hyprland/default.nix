{ config, pkgs, user, lib, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services = {
    udisks2.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      displayManager = {
        sddm = {
          enable = true;
          theme = "${(pkgs.fetchFromGitHub {
            owner = "rototrash";
            repo = "tokyo-night-sddm";
            rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
            sha256 = "JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
          })}";
        };
        defaultSession = "hyprland";
      };
    };
  };

  security.pam.services = {
    sddm.enableKwallet = true;
    swaylock = {};
  };
  
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      libsForQt5.qt5.qtgraphicaleffects
    ];
  # sessionVariables.NIXOS_OZONE_WL = "1";
  };
}