{inputs, ... }:
{
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
        };
        languages.nix.enable = true;
      };
    };
  };
}
