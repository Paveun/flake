{inputs, ...}: {
  imports = [
    inputs.stylix.homeManagerModules.stylix
    inputs.nixvim.homeManagerModules.nixvim
    ../../sops
    ../../terminal
    ../../packages
    # ../../themes
    ../../ide/lunarvim
    ../../ide/nixvim
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
