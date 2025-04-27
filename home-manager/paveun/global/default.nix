{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../sops
    ../../terminal
    ../../packages
    # ../../themes
    # ../../ide/lunarvim
    ../../ide/nixvim
    # ../../ide/nvf
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
