{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../sops
    ../../terminal
    ../../terminal/ghostty.nix
    ../../packages
    # ../../themes
    # ../../ide/lunarvim
    # ../../ide/nixvim
    ../../ide/nvf
    ../../packages/firefox.nix
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
