{ config, pkgs, lib, ... }:

let
  zenBrowser = pkgs.stdenv.mkDerivation {
    pname = "zen-browser";
    version = "1.0.1-a.6";

    src = pkgs.fetchTarball {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-generic.tar.bz2";
      sha256 = "sha256:17c1ayxjdn8c28c5xvj3f94zjyiiwn8fihm3nq440b9dhkg01qcz"; # Change as needed
    };

    nativeBuildInputs = [ pkgs.makeWrapper pkgs.copyDesktopItems pkgs.wrapGAppsHook ];

    installPhase = ''
      mkdir -p $out/bin
      cp -r $src/* $out/bin
      install -D ./zen.desktop $out/share/applications/zen.desktop
      install -D $src/browser/chrome/icons/default/default128.png $out/share/icons/hicolor/128x128/apps/zen.png
    '';

    # Add additional phases or modifications here as needed.
  };
in

{
  options.myModule.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Zen Browser";
  };

  config = lib.mkIf config.myModule.enable {
    environment.systemPackages = [ zenBrowser ];
  };
}
