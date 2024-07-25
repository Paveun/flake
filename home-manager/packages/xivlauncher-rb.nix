{
  config,
  pkgs,
  inputs,
  ...
}:
# Check https://github.com/drakon64/nixos-xivlauncher-rb for updates
# let
#   rb = import (pkgs.fetchFromGitHub {
#     owner = "drakon64";
#     repo = "nixos-xivlauncher-rb";
#     rev = "11039ab07535a2cd4e525b301e5c20619de26050";
#     hash = "sha256-vUZCidluStsh1xB7GiGYbvfHTpVxuDeYy5cGLCALfhQ=";
#   }) {inherit pkgs;};
# in {
#   # environment.systemPackages = [
#   home.packages = [
#     rb.xivlauncher-rb
#   ];
# }
{
  home.packages = [
    inputs.nixos-xivlauncher-rb.packages.x86_64-linux.xivlauncher-rb
  ];
}
