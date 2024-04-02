{ lib, inputs, system, pkgs, home-manager, nix-flatpak, nixvim, user, tuxedo-nixos, ... }:

{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit user inputs pkgs; };
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
      tuxedo-nixos.nixosModules.default
    ];
  };
  fishtank = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit user inputs pkgs; };
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
