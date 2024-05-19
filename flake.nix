{
  description = "A flake of Paveun";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # nix-flatpak.url = "github:gmodena/nix-flatpak";
    catppuccin.url = "github:catppuccin/nix";
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-colors.url = "github:misterio77/nix-colors";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    systems = [
      "aarch64-linux"
      "x86_64-linux"
    ];
    user = "paveun";
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
  in {
    formatter = forEachSystem (pkgs: pkgs.alejandra);
    nixosModules = import ./modules/nixos;
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        modules = [./hosts/laptop];
        specialArgs = {
          inherit user inputs outputs;
        };
      };
      fishtank = nixpkgs.lib.nixosSystem {
        modules = [./hosts/fishtank];
        specialArgs = {
          inherit user inputs outputs;
        };
      };
    };
    homeConfigurations = {
      "${user}@laptop" = lib.homeManagerConfiguration {
        modules = [./home-manager/paveun/laptop.nix];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {
          inherit user inputs outputs;
        };
      };
      "${user}@fishtank" = lib.homeManagerConfiguration {
        modules = [./home-manager/paveun/fishtank.nix];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {
          inherit user inputs outputs;
        };
      };
    };
  };
}
