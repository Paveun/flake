{ config, pkgs, user, lib, nixvim, ... }:

{
  programs.nixvim = {
    enable = true;
    clipboard.providers.wl-copy.enable = true;
    options = {
      updatetime = 100;
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      smartindent = true;
      # tabstop = 2;
      ignorecase = true;
      smartcase = true;
      swapfile = false;
      undofile = true;
    };
    globals.mapleader = " ";
    colorschemes.catppuccin.enable = true;
    plugins = {
      treesitter = {
        enable = true;
        nixGrammars = true;
        indent = true;
      };
      treesitter-context.enable = true;
      rainbow-delimiters.enable = true;
      which-key = {
	enable = true;
        showKeys = true;
      };
      lsp = {
	enable = true;
	servers = {
	  bashls.enable = true;
	  nixd.enable = true;
	  ruff-lsp.enable = true;
          pyright.enable = true;
	};
	keymaps.lspBuf = {
	  "gd" = "definition";
	  "gD" = "references";
	  "gt" = "type_definition";
	  "gi" = "implementation";
	  "K" = "hover";
	};
      };
      toggleterm = {
        enable = true;
	openMapping = "<C-t>";
        direction = "horizontal";
      };
      autoclose = {
	enable = true;
      };
      wilder = {
	enable = true;
	modes = [ ":" "/" "?" ];
      };
      lightline.enable = true;
      bufferline.enable = true;
    };
  };
  nixpkgs.config.permittedInsecurePackages = [
    "nix-2.16.2"
  ];
}
