{inputs, ...}: {
  imports = [
    inputs.stylix.homeModules.stylix
    ../../sops
    ../../terminal
    ../../packages
    # ../../themes
    # ../../ide/lunarvim
    # ../../ide/nixvim
    ../../ide/nvf
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
