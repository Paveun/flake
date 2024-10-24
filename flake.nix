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
      # url = "github:Mic92/sops-nix/a4c33bfecb93458d90f9eb26f1cf695b47285243";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-xivlauncher-rb = {
      url = "github:drakon64/nixos-xivlauncher-rb";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";
    # zen-browser.url = "github:MarceColl/zen-browser-flake";
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
    homeManagerModules = import ./modules/home-manager;
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
      aion = nixpkgs.lib.nixosSystem {
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
