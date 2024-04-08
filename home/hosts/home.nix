{ config, pkgs, lib, user, ... }:

{
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    krabby
    neofetch
    subversionClient
    kate
    vscode
    winbox
    google-chrome
    openssl
    haruna
    deluge
    protonvpn-gui
    protonvpn-cli
    conda
    keepassxc
    google-drive-ocamlfuse
    remmina
    openfortivpn
    distrobox
    openconnect
    openvpn
    flameshot
    jq
    gh
    # lazygit
    ncspot
    slack
    gdu
    # bottom
  ];
  
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
          src = pkgs.fetchFromGitHub {
            owner = "jethrokuan";
            repo = "z";
            rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
            sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
          };
        }
        {
          name = "autopair";
          src = pkgs.fetchFromGitHub {
            owner = "jorgebucaran";
            repo = "autopair.fish";
            rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
            sha256 = "qt3t1iKRRNuiLWiVoiAYOu+9E7jsyECyIqZJ/oRIT1A=";
          };
        }
      ];
    };
    
    alacritty = {
      enable = true;
    }; 
    
    tmux = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    bottom = {
      enable = true;
    };

    btop = {
      enable = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };

    git = {
      enable = true;
      userName = "paveun";
      userEmail = "a.tresierrajansen@gmail.com";
      lfs.enable = true;
    };

    gh = {
      enable = true;
      gitCredentialHelper = {
        enable = true;
      };
    };

    home-manager = {
      enable = true;
    };
  };
  # programs.neovim = {
  #   enable = true;
  #   withNodeJs = true;
  # };

  home.file = {
    ".config/wallpaper/default.png"={
      source = ../wallpaper/default.png;
    };
  };

  home.sessionVariables = {
    # TERMINAL = "alacritty";
  };

  xresources.properties  = {
    "Xft.dpi" = 96;
  };

  # programs.home-manager.enable = true;

  # programs.git = {
  #   enable = true;
  #   userName  = "paveun";
  #   userEmail = "a.tresierrajansen@gmail.com";
  # };
  # programs.git-credential-oauth.enable = true;
}
