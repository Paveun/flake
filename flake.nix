{
  description = "A flake of Paveun";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
      user = "paveun";
    in 
    {
      nixosConfigurations = (
        import ./home/hosts {
          inherit (nixpkgs) lib;
          inherit inputs user system home-manager;
        }
      );
    };
}
