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
    nvf.url = "github:notashelf/nvf";
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
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    mutter-triple-buffering-src = {
      url = "gitlab:vanvugt/mutter?ref=triple-buffering-v4-47&host=gitlab.gnome.org";
      flake = false;
    };
    gvdb-src = {
      url = "gitlab:GNOME/gvdb?ref=main&host=gitlab.gnome.org";
      flake = false;
    };
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    systems,
    treefmt-nix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    user = "paveun";
    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
    treefmtEval = forEachSystem (pkgs: treefmt-nix.lib.evalModule pkgs ./nixos/system/treefmt.nix);
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
    );
  in {
    formatter = forEachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);
    checks = forEachSystem (pkgs: {
      formatting = treefmtEval.${pkgs.system}.config.build.check self;
    });
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
