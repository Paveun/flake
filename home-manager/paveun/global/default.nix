{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.nixvim.homeManagerModules.nixvim
    ../../terminal
    ../../packages
    # ../../themes
    ../../ide/lunarvim
    ../../ide/nixvim
    ../../packages/firefox.nix
    ../../themes/nix-colors.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };
}
