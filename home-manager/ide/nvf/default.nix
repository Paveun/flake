{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "rose-pine";
          style = "moon";
          transparent = false;
        };
        languages = {
          enableLSP = true;
          enableTreesitter = true;
          enableFormat = true;

          nix.enable = true;
          markdown.enable = true;
          ts.enable = true;
          rust.enable = true;
          # python.enable = true;
        };
        statusline.lualine = {
          enable = true;
          # theme = "rose-pine";
        };
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;
        autopairs.nvim-autopairs.enable = true;
        filetree = {
          neo-tree.enable = true;
        };
        tabline.nvimBufferline.enable = true;
        treesitter.context.enable = true;
        projects.project-nvim.enable = true;
        dashboard = {
          dashboard-nvim.enable = true;
          alpha.enable = true;
        };
        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };
        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = true;
        };
        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };
        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          modes-nvim.enable = false; # the theme looks terrible with catppuccin
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };
          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              # this is a freeform module, it's `buftype = int;` for configuring column position
              nix = "110";
              ruby = "120";
              java = "130";
              go = ["90" "130"];
            };
          };
          fastaction.enable = true;
        };
        visuals = {
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;
          rainbow-delimiters.enable = true;
          highlight-undo.enable = true;
          indent-blankline.enable = true;

          # Fun
          cellular-automaton.enable = false;
        };
        utility = {
          ccc.enable = false;
          vim-wakatime.enable = false;
          icon-picker.enable = true;
          surround.enable = true;
          diffview-nvim.enable = true;
          motion = {
            hop.enable = true;
            leap.enable = true;
            precognition = {
              enable = true;
              setupOpts.startVisible = false;
            };
          };

          images = {
            image-nvim.enable = false;
          };
        };
        assistant = {
          chatgpt.enable = false;
          copilot = {
            enable = true;
            cmp.enable = true;
          };
        };
        options = {
          tabstop = 2;
          shiftwidth = 2;
          softtabstop = 2;
          expandtab = true;
        };
      };
    };
  };
}
