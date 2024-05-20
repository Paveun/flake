{
  config,
  pkgs,
  lib,
  user,
  catppuccin,
  ...
}: {
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting
        krabby random --no-title
      '';
      shellAliases = {
        ssh = "TERM=xterm-256color command ssh";
      };
      plugins = [
        {
          name = "z";
          src = pkgs.fishPlugins.z.src;
        }
        {
          name = "autopair";
          src = pkgs.fishPlugins.autopair.src;
        }
      ];
      # catppuccin.enable = true;
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      # catppuccin.enable = true;
    };
  };
}
