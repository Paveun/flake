{ lib, inputs, system, home-manager, nix-flatpak, nixvim, catppuccin, user, ... }:

{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit user inputs; };
    modules = [
      ./laptop
      ./configuration.nix
      catppuccin.nixosModules.catppuccin
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {inherit user; };
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            ./laptop/home.nix
            catppuccin.homeManagerModules.catppuccin
          ];
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
      catppuccin.nixosModules.catppuccin
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {inherit user; };
        home-manager.users.${user} = {
          imports = [
            ./home.nix
            ./fishtank/home.nix
            catppuccin.homeManagerModules.catppuccin
          ];
        };
      }
      nix-flatpak.nixosModules.nix-flatpak
      nixvim.nixosModules.nixvim
    ];
  };
}
