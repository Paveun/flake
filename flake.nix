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

  outputs = inputs @ { self, nixpkgs, home-manager, nix-flatpak, nixvim, catppuccin, ... }:
  let
    system = "x86_64-linux";
    # pkgs = import nixpkgs {
    #   inherit system;
    #   config.allowUnfree = true;
    # };
    lib = nixpkgs.lib;
    user = "paveun";
  in 
  {
    nixosConfigurations = {
      # import ./home/hosts {
      #   inherit (nixpkgs) lib;
      #   inherit inputs user system home-manager nix-flatpak nixvim catppuccin;

      laptop = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit user inputs; };
        modules = [
          ./hosts/laptop
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit user; };
            home-manager.users.${user} = {
              imports = [
                ./hosts/laptop/home.nix
                catppuccin.homeManagerModules.catppuccin
                nixvim.homeManagerModules.nixvim
              ];
            };
          }
          nix-flatpak.nixosModules.nix-flatpak
          # nixvim.nixosModules.nixvim
        ];
      };
      fishtank = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit user inputs; };
        modules = [
          ./hosts/fishtank
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit user; };
            home-manager.users.${user} = {
              imports = [
                ./hosts/fishtank/home.nix
                 catppuccin.homeManagerModules.catppuccin
                 nixvim.homeManagerModules.nixvim
              ];
            };
          }
          nix-flatpak.nixosModules.nix-flatpak
          # nixvim.nixosModules.nixvim
        ];
      };
    };
  };
}
