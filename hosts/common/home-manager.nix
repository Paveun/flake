{inputs, outputs, user, ...}:

{
  inputs = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit user inputs outputs;};
  };
}
