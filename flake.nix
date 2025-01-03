{
  description = "A flake of Paveun";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default-linux";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:mic92/sops-nix";
    nixvim.url = "github:nix-community/nixvim";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-xivlauncher-rb = {
      url = "github:drakon64/nixos-xivlauncher-rb";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    ghostty.url = "github:ghostty-org/ghostty";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    systems,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    user = "paveun";
    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
  in {
    formatter = forEachSystem (pkgs: pkgs.alejandra);
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;
    nixosConfigurations = {
      laptop = lib.nixosSystem {
        modules = [./hosts/laptop];
        specialArgs = {
          inherit user inputs outputs;
        };
      };
      fishtank = lib.nixosSystem {
        modules = [./hosts/fishtank];
        specialArgs = {
          inherit user inputs outputs;
        };
      };
      aion = lib.nixosSystem {
        modules = [./hosts/aion];
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
      "${user}@aion" = lib.homeManagerConfiguration {
        modules = [./home-manager/paveun/aion.nix];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {
          inherit user inputs outputs;
        };
      };
    };
  };
}
