{pkgs, ...}: {
  imports = [
    ./nh.nix
    ./cloudflare-warp.nix
  ];
  environment = {
    systemPackages = with pkgs; [
      wget
      cifs-utils
      nix-output-monitor
      nvd
    ];
  };
}
