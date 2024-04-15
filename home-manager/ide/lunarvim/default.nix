{ pkgs, ... }:

{
  home = {
    file = {
      ".config/lvim/config.lua"={
        source = ./config.lua;
      };
    };
    packages = with pkgs; [
      tree-sitter
      ripgrep
      gcc
      lunarvim
    ];
  };
}
