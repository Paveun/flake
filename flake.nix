{
  description = "A flake of Paveun";

  nixConfig = {
    extra-substituters = [
      "https://nixpkgs-python.cachix.org"
      "https://devenv.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixpkgs-python.cachix.org-1:hxjI7pFxTyuTHn2NkvWCrAUcNZLNS3ZAvfYNuYifcEU="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];
  };

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
  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    nixvim,
    catppuccin,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "x86_64-linux"
    ];
    user = "paveun";
    forAllSystems = nixpkgs.lib.genAttrs systems;
    nixos-modules = [
      catppuccin.nixosModules.catppuccin
      nix-flatpak.nixosModules.nix-flatpak
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit user inputs outputs;};
        };
      }
    ];
    home-modules = [
      catppuccin.homeManagerModules.catppuccin
      nixvim.homeManagerModules.nixvim
    ];
  in {
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit user inputs outputs;};
        modules =
          nixos-modules
          ++ [
            ./hosts/laptop
            {
              home-manager.users.${user}.imports =
                home-modules
                ++ [
                  ./hosts/laptop/home.nix
                ];
            }
          ];
      };
      fishtank = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit user inputs outputs;};
        modules =
          nixos-modules
          ++ [
            ./hosts/fishtank
            {
              home-manager.users.${user}.imports =
                home-modules
                ++ [
                  ./hosts/fishtank/home.nix
                ];
            }
          ];
      };
    };
  };
}
