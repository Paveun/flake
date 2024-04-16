{
  description = "A flake of Paveun";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    catppuccin.url = "github:catppuccin/nix";
  };
  outputs = { self, nixpkgs, home-manager, nix-flatpak, nixvim, catppuccin, ... } @ inputs:
  let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "x86_64-linux"
    ];
    user = "paveun";
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in 
  {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit user inputs outputs; };
        modules = [
          ./hosts/laptop
          catppuccin.nixosModules.catppuccin
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager {
            home-manager = { 
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit user inputs outputs; };
              users.${user} = {
                imports = [
                  ./hosts/laptop/home.nix
                  catppuccin.homeManagerModules.catppuccin
                  nixvim.homeManagerModules.nixvim
                ];
              };
            };
          }
        ];
      };
      fishtank = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit user inputs outputs; };
        modules = [
          ./hosts/fishtank
          catppuccin.nixosModules.catppuccin
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit user inputs outputs; };
              users.${user} = {
                imports = [
                  ./hosts/fishtank/home.nix
                  catppuccin.homeManagerModules.catppuccin
                  nixvim.homeManagerModules.nixvim
                ];
              };
            };
          }
        ];
      };
    };
  };
}
