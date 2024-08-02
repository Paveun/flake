{pkgs, ...}: {
  imports = [
    ./cmp.nix
  ];

  programs = {
    neovim.defaultEditor = true;
    nixvim = {
      enable = true;
      clipboard.register = "unnamedplus";
      # clipboard.providers.wl-copy.enable = true;
      opts = {
        updatetime = 100;
        number = true;
        relativenumber = true;
        shiftwidth = 2;
        wrap = false;
        cmdheight = 1;
        expandtab = true;
        autoindent = true;
        tabstop = 2;
        ignorecase = true;
        smartcase = true;
        swapfile = false;
        undofile = true;
      };
      globals.mapleader = " ";
      plugins = {
        treesitter = {
          enable = true;
          nixGrammars = true;
          settings.indent.enable = true;
        };
        treesitter-context.enable = true;
        rainbow-delimiters.enable = true;
        which-key = {
          enable = true;
          showKeys = true;
        };
        gitsigns = {
          enable = true;
          settings.current_line_blame = true;
        };
        nvim-tree = {
          enable = true;
          openOnSetupFile = true;
          autoReloadOnWrite = true;
        };
        alpha = {
          enable = true;
          theme = "startify";
        };
        nvim-autopairs.enable = true;
        vim-css-color.enable = true;
        comment.enable = true;
        # cmp = {
        #   enable = true;
        #   settings.sources = [
        #     {name = "nvim_lsp";}
        #   ];
        # };
        # cmp-nvim-lsp.enable = true;
        telescope = {
          enable = true;
          keymaps = {
            "<leader>ff" = {
              action = "live_grep";
              options = {
                desc = "Telescope Files";
              };
            };
            "<leader>fg" = {
              action = "git_files";
              options = {
                desc = "Telescope Git Files";
              };
            };
          };
          extensions.fzf-native = {enable = true;};
        };
        lsp = {
          enable = true;
          servers = {
            bashls.enable = true;
            nil-ls = {
              enable = true;
              autostart = true;
              filetypes = ["nix"];
              settings.nix.flake.autoArchive = true;
            };
            ruff-lsp.enable = true;
            pyright = {
              enable = true;
              autostart = true;
              filetypes = ["python"];
            };
          };
          keymaps.lspBuf = {
            "gd" = "definition";
            "gD" = "references";
            "gt" = "type_definition";
            "gi" = "implementation";
            "K" = "hover";
          };
        };
        none-ls = {
          enable = true;
          sources = {
            diagnostics = {
              golangci_lint.enable = true;
              ktlint.enable = true;
              statix.enable = true;
            };
            formatting = {
              alejandra.enable = true;
              black.enable = true;
              markdownlint.enable = true;
              shellharden.enable = true;
              shfmt.enable = true;
              prettier.enable = true;
              stylua.enable = true;
            };
          };
        };
        toggleterm = {
          enable = true;
          # openMapping = "<C-t>";
          settings.direction = "horizontal";
        };
        autoclose = {
          enable = true;
        };
        wilder = {
          enable = true;
          modes = [":" "/" "?"];
        };
        illuminate.enable = true;
        lualine.enable = true;
        bufferline.enable = true;
      };

      extraPlugins = with pkgs.vimPlugins; [
        neoformat
      ];

      keymaps = [
        {
          # Toggle NvimTree
          key = "<leader>e";
          action = "<CMD>NvimTreeToggle<CR>";
          mode = "n";
          options = {
            desc = "Toggle Tree View.";
          };
        }
        {
          key = "<leader>t";
          action = "<CMD>ToggleTerm<CR>";
          mode = ["n"];
          options = {
            desc = "open terminal";
          };
        }
        {
          # Escape terminal mode using ESC
          mode = "t";
          key = "<esc>";
          action = "<C-\\><C-n>";
        }
        {
          action = "<cmd>lua vim.lsp.buf.hover()<CR>";
          key = "<space>k"; # this line is changed
          mode = "n";
          options = {
            desc = "info about things";
          };
        }
        {
          action = "<cmd>Neoformat<CR>";
          key = "<space>="; # this line is changed
          mode = ["n"];
          options = {
            desc = "formatting";
          };
        }
      ];
    };
  };

  home.packages = [
    pkgs.ripgrep
  ];
}
