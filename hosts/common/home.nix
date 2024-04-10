{ config, pkgs, lib, user, catppuccin, ... }:

{
  imports = [
    # ../alacritty/home.nix
  ];

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
    ncspot
    slack
    gdu
  ];

  catppuccin.flavour = "frappe";
  catppuccin.accent = "rosewater";

  xdg.enable = true;

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
      catppuccin.enable = true;
    };
    alacritty = {
      enable = true;
      catppuccin.enable = true;
      settings = {
        env = {
          TERM = "alacritty";
          WINIT_X11_SCALE_FACTOR = "1.0";
        };
        window = {
          dynamic_padding = true;
          opacity = 0.95;
          title = "Alacritty";
          dimensions = {
            columns = 110;
            lines = 30;
          };
          padding = {
            x = 6;
            y = 6;
          };
          class = {
            general = "Alacritty";
            instance = "Alacritty";
          };
        };
        font = {
          size = 10;
          offset = {
            x = 0;
            y = 1;
          };
          normal = {
            family = "JetBrains Mono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "JetBrains Mono Nerd Font";
            style = "Bold";
          };
          bold_italic = {
            family = "JetBrains Mono Nerd Font";
            style = "Bold Italic";
          };
          italic = {
            family = "JetBrains Mono Nerd Font";
            style = "Italic";
          };
        };
      };
    }; 
    tmux = {
      enable = true;
      catppuccin.enable = true;
    };
    lazygit = {
      enable = true;
      catppuccin.enable = true;
    };
    bottom = {
      enable = true;
      catppuccin.enable = true;
    };
    btop = {
      enable = true;
      catppuccin.enable = true;
    };
    ranger = {
      enable = true;
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      catppuccin.enable = true;
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

  gtk = {
    enable = true;
    font = {
      name = "Roboto";
      package = pkgs.roboto;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
      # name = "catppuccin-papirus-folders";
      # package = pkgs.catppuccin-papirus-folders;
    };
    catppuccin = {
      enable = true;
      size = "compact";
      cursor.enable = true;
    };
  };

  home.file = {
    ".config/wallpaper/default.png"={
      source = ../hosts/wallpaper/default.png;
    };
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
  };

  xresources.properties  = {
    "Xft.dpi" = 96;
  };
}
