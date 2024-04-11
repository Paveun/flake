{ config, pkgs, user, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    lutris
    (lutris.override {
      extraLibraries =  pkgs: [
        # List library dependencies here
        #libjansson
      ];
    })
  ];
}
