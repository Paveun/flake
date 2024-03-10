{ lib, inputs, system, home-manager, nix-flatpak, nixvim, user, ... }:

{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      ./laptop
      ./configuration.nix
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {inherit user; };
        home-manager.users.${user} = {
          imports = [(import ./home.nix )] ++ [(import ./laptop/home.nix)];
        };
      }
      nix-flatpak.nixosModules.nix-flatpak
      nixvim.nixosModules.nixvim
    ];
  };
  fishtank = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      ./fishtank
      ./configuration.nix
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {inherit user; };
        home-manager.users.${user} = {
          imports = [(import ./home.nix )] ++ [(import ./fishtank/home.nix)];
        };
      }
      nix-flatpak.nixosModules.nix-flatpak
      nixvim.nixosModules.nixvim
    ];
  };
}
