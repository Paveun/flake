{pkgs, ...}: {
  imports = [
    ./nh.nix
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
